import base64
import hashlib
import hmac
import json
import ssl
from datetime import datetime, timedelta
from urllib.parse import parse_qsl

import socketio
from aiohttp import web

import config




###########################################################
############# Client saving in memory
##[{'username': username1, 'device': device1, 'group': group1, 'sid': sid1, 't': t1}, {'username': username2, 'device': device2, 'group': group2, 'sid': sid2, 't': t2}]


clients = []

def lookup_client(**kw):
    result = []
    for row in clients:
        for k, v in kw.items():
            if row[k] != v:
                break
        else:
            result.append(row)
    return result


def get_client(sid):
    res = lookup_client(sid=sid)
    return res[0] if len(res) == 1 else None


def add_client(sid, username, device, group, type, t):
    clients.append({'username': username, 'device': device, 'group': group, 'sid': sid, 't': t})


def remove_client(sid):
    c = get_client(sid)
    if c is not None:
        clients.remove(c)


def get_username(sid):
    c = get_client(sid)
    return c['username'] if c is not None else None


def get_user_room(sid):
    c = get_client(sid)
    return c['group'] if c is not None else None


def get_occupants(sid):
    username = get_username(sid)
    return lookup_client(username=username)


def validate_token(user, token):
#return the username if token is valid otherwise None
    return user
###########################################################


###########################################################
#############  Signaling web server initialization
sio = socketio.AsyncServer(cors_allowed_origins='*', ping_timeout=35)
routes = web.RouteTableDef()
app = web.Application()
sio.attach(app)
###########################################################


###########################################################
#############  Socket event handlers
@sio.event
async def connect(sid, env):
    params = dict(parse_qsl(env.get('QUERY_STRING')))
    user = params.get('user')
    token = params.get('token')
   # room = params.get('room')
    t = params.get('t')
    validated_user = validate_token(user, token)
    if validated_user is None:
        await sio.emit('data', {'type': 'error', 'msg': 'no_user'}, to=sid)
    else:
        add_client(sid, validated_user, 'device', '', 'web', t)
        await sio.emit('online', {"sid": sid,"user": user}, skip_sid=sid)
     #   user_room = get_user_room(sid)
     #   sio.enter_room(sid, user_room)
     #   await sio.emit('ready', {"sid": sid}, room=user_room, skip_sid=sid)


@sio.event
def disconnect(sid):
    user=  get_username(sid)
    remove_client(sid)
    sio.emit('offline', {"sid": sid,"user": user}, skip_sid=sid)
    room = get_user_room(sid)
    if	room:	
    	sio.leave_room(sid, room=room)


@sio.event
async def client_data(sid, data):
    if data.get('to'):
        await sio.emit('signalling_data', data, to=data.get('to'))
    else:
        await sio.emit('signalling_data', data, room=get_user_room(sid), skip_sid=sid)
        

@sio.event
async def send_ring(sid, data):
    if data.get('to'):
        await sio.emit('receive_ring', data, to=data.get('to'))

@sio.event
async def accept_call(sid, data):
    if data.get('to'):
    	 user_room= f'{data["from"]}-{data["to"]}'
	 sio.enter_room(sid, user_room)
     	 await sio.emit('ready', {"sid": sid}, room=user_room, skip_sid=sid)

def generate_turn_token():
    tm = int((datetime.utcnow() + timedelta(days=1)).timestamp())
    msg = f'{tm}:{config.ice_username}'.encode()
    key = config.ice_password.encode()
    token_digest = hmac.new(key, msg, hashlib.sha1).digest()
    token = base64.b64encode(token_digest).decode()
    return {
        'user': f'{tm}:{config.ice_username}',
        'token': token
    }
###########################################################


#############  Auth function for turn server, move to main application
@routes.get('/get-ice')
async def get_ice(request):
    turn_token = generate_turn_token()
    data = {
        'signaling_server': config.signaling_server,
        'ice_urls': config.ice_urls,
        'ice_username': turn_token.get('user'),
        'ice_credential': turn_token.get('token'),
    }
    return web.json_response(data)


############# entrypoint
if __name__ == '__main__':
    ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    ssl_context.load_cert_chain('/ctrends/cert/cert.crt', '/ctrends/cert/cert.key')
    app.add_routes(routes)
    web.run_app(app, port=9443, ssl_context=ssl_context)


