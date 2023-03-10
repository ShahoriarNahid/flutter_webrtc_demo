// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' as Get;
import 'package:socket_io_client/socket_io_client.dart';
import '../helper/log.dart';
import '../model/pc_config_model.dart';

abstract class RTCPeerConnectionCalling extends RTCPeerConnection {
  late String _id;
  String get id => _id;
  set id(String id) {
    _id = id;
  }
}

class SocketService extends Get.GetxService {
  final _dio = Dio();

  late Socket socket;

  final userName = Get.RxString('');
  final room = Get.RxString('');
  // MediaStream? _localStream;
  final pcConfig = Get.Rx<PcConfigModel?>(null);
  final peerConnections = Map<String, RTCPeerConnection>();
  final remoteRenderer = RTCVideoRenderer();
  final localRenderer = RTCVideoRenderer();

  final SIGNALING_SERVER_URL = 'https://signaling.thecitizen.support:9443';

  // final pcConfig = {
  //   'signaling_server': 'signaling.thecitizen.support:9443',
  //   'ice_urls': [
  //     'stun:signaling.thecitizen.support:3478',
  //     'turn:signaling.thecitizen.support:3478',
  //     'turns:signaling.thecitizen.support:5349'
  //   ],
  //   'ice_username': '1674550999:citizen',
  //   'ice_credential': 'Q3Cr6SFpbvocw2MSHbQLHY9sx1M=',
  // };

  getPcConfig() async {
    try {
      final res = await _dio.get(
        'https://telecom.thecitizen.support:9443/get-ice',
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (res.statusCode == 200) {
        kLog(res.data);
        final pcConfigData =
            PcConfigModel.fromJson(res.data as Map<String, dynamic>);

        if (pcConfigData != null) {
          pcConfig.value = pcConfigData;
          kLog(pcConfig.value!.iceUsername);
        }
      }
    } on DioError catch (e) {
      kLog(e.message);
    }
  }

  @override
  void onInit() async {
    await initRenderer();
    // initializeSocket();
    super.onInit();
  }

  initRenderer() async {
    await localRenderer.initialize();
    await remoteRenderer.initialize();

    // localRenderer.srcObject =
    //     await navigator.mediaDevices.getUserMedia(mediaConstraints);
  }

  void initializeSocket() {
    socket = io(
        SIGNALING_SERVER_URL,
        OptionBuilder()
            .setQuery({
              'user': '${userName.value}',
            })
            // .setQuery({'user': 'nahid', 'room': '1234'})
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());

//     .setQuery({'user': '${userName.value}', 'room': '${room.value}'})

    // Connect event
    socket.onConnect((_) async {
      kLog('Socket connected: ${socket.id}');

      // localRenderer.srcObject =
      //     await navigator.mediaDevices.getUserMedia(mediaConstraints);
    });

    //On ready
    socket.on('ready', (data) async {
      var offerTo = data['sid'].toString();
      kLog('$offerTo : joined');
      final pc = await createNewPeerConnection(offerTo);
      if (pc != null) {
        sendOffer(pc, offerTo);
      }
    });
    // Online
    socket.on('online', (data) async {
      var sid = data['sid'].toString();
      var user = data['user'].toString();
      kLog('$user : Online');
    });

    // offline
    socket.on('offline', (data) async {
      var sid = data['sid'].toString();
      var user = data['user'].toString();
      kLog('$user : offline');
    });

    //receive call
    socket.on('receive_ring', (data) async {
      var from = data['sid'].toString();
      var user = data['user'].toString();
      var fromUser = data['fromUser'].toString();
      var toUser = data['toUser'].toString();
      kLog('$user : offline');
    });

    // Disconnect Event
    socket.onDisconnect((data) {
      kLog('disconnect');
      // for (final pc in peerConnections) {
      //   if (pc != null) {
      //     // pc.close();
      //     kLog('Peer connection closed');
      //   }
      // }
    });

    socket.on('signalling_data', (data) {
      kLog('from data');

      kLog(data);

      handleSignalingData(data);
    });
    // Error Event
    socket.onError((error) => kLog(error));

    sendRing(toSid, user) {
      socket.emit('send_ring', {
        'from': socket.id,
        'to': toSid,
        'fromUser': userName.value,
        'toUser': user,
      });
    }

    acceptCall(toSid, user) {
      socket.emit('accept_call', {
        'from': socket.id,
        'to': toSid,
        'fromUser': userName.value,
        'toUser': user,
      });
    }

    kLog('Socket initialized');
    socket.connect();
  }

//  String get sdpSemantics => 'unified-plan';

  var configuration = <String, dynamic>{
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'},
    ],
    'sdpSemantics': 'unified-plan'
  };

  final loopbackConstraints = <String, dynamic>{
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': false},
    ],
  };

  Future<RTCPeerConnection?> createNewPeerConnection(String id) async {
    try {
      kLog('Creating PeerConnection for : $id');
      final RTCPeerConnection peerConnection =
          await createPeerConnection(configuration, loopbackConstraints)
              as RTCPeerConnection;
      peerConnection.getConfiguration['id'] = id;
      peerConnections[id] = peerConnection;
      peerConnection.onIceCandidate = (candidate) {
        socket.emit('client_data', {
          'from': socket.id,
          'to': id,
          'data': {'type': 'ice-candidate', 'candidate': candidate.toMap()}
        });
      };

      peerConnection.onAddStream = (stream) {
        kLog('addStream: ' + stream.id);
        remoteRenderer.srcObject = stream;
      };
      // peerConnection.onTrack = (RTCTrackEvent event) {
      //   kLog('Track received from : $id');
      //   kLog('Track received from kind: ${event.track.kind}');
      //   if (event.track.kind == 'video') {
      //     remoteRenderer.srcObject = event.streams[1];
      //   }
      // };
      peerConnection.onConnectionState = (RTCPeerConnectionState state) {
        // ignore: unrelated_type_equality_checks
        if (state ==
            RTCPeerConnectionState.RTCPeerConnectionStateDisconnected) {
          kLog('PeerConnection $id disconnected');
          peerConnection.close();
        }
      };

      kLog('PeerConnection created for : $id');
      return peerConnection;
    } catch (e) {
      kLog('PeerConnection failed: $e');
    }
  }

  final mediaConstraints = <String, dynamic>{
    'audio': true,
    'video': {
      'mandatory': {
        'minWidth': '640', // Provide your own width, height and frame rate here
        'minHeight': '480',
        'minFrameRate': '30',
      },
      'facingMode': 'user',
      'optional': [],
    }
  };

  List<MediaDeviceInfo>? mediaDevicesList;
  final offerSdpConstraints = <String, dynamic>{
    'mandatory': {
      'OfferToReceiveAudio': true,
      'OfferToReceiveVideo': true,
    },
    'optional': [],
  };

  void sendOffer(RTCPeerConnection pc, String offerTo) async {
    final _localStream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);

    // mediaDevicesList = await navigator.mediaDevices.enumerateDevices();
    localRenderer.srcObject = _localStream;

    _localStream.getTracks().forEach((track) async {
      await pc.addTrack(track, _localStream);
    });

    var offer = await pc.createOffer(offerSdpConstraints);
    await pc.setLocalDescription(offer);
    var localDescription = await pc.getLocalDescription();
    socket.emit('client_data',
        {'from': socket.id, 'to': offerTo, 'data': localDescription?.toMap()});
    kLog('Offer sent  to : $offerTo');
  }

  void sendAnswer(RTCPeerConnection pc, String answerTo, Map data) async {
    try {
      await pc.setRemoteDescription(RTCSessionDescription(
          data['sdp'].toString(), data['type'].toString()));
      final localStream =
          await navigator.mediaDevices.getUserMedia(mediaConstraints);
      localStream.getTracks().forEach((track) async {
        await pc.addTrack(track, localStream);
        final answer = await pc.createAnswer();
        kLog('connection state ${pc.connectionState}');
        if (pc.connectionState !=
            RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
          await pc.setLocalDescription(answer);
        }

        var localDescription = await pc.getLocalDescription();
        socket.emit('client_data', {
          'from': socket.id,
          'to': answerTo,
          'data': localDescription?.toMap(),
        });
        kLog('Answer sent to : $answerTo');
      });
    } catch (e) {
      kLog(e);
    }
  }

  handleSignalingData(sigData) async {
    final data = sigData['data'] as Map;
    String from = sigData['from'].toString();
    switch (data['type']) {
      case 'offer':
        if (peerConnections[from] != null) return;
        kLog('Offer received from  $from');
        final pc = await createNewPeerConnection(from);
        if (pc != null) {
          sendAnswer(pc, from, data);
        }
        break;
      case 'answer':
        kLog('Answer received from  $from');
        RTCPeerConnection? pc = peerConnections[from];
        if (pc != null) {
          pc.setRemoteDescription(RTCSessionDescription(
              data['sdp'].toString(), data['type'].toString()));
        }
        break;
      case 'ice-candidate':
        kLog('ICE received from  $from');
        RTCPeerConnection? pc = peerConnections[from];
        if (pc != null) {
          final candidateData = data['candidate'];
          final candidate = RTCIceCandidate(
              candidateData['candidate'].toString(),
              candidateData['sdpMid'].toString(),
              int.parse(candidateData['sdpMLineIndex'].toString()));
          pc.addCandidate(candidate);
        }
        break;
      case 'error':
        kLog('Error');
        break;
      default:
        kLog(sigData.type);
    }
  }
}
