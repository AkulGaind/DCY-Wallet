// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRScanner extends StatefulWidget {
//   const QRScanner({super.key});

//   @override
//   State<StatefulWidget> createState() => _QRScannerState();
// }

// class _QRScannerState extends State<QRScanner> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool _isScanning = true;

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (controller != null) {
//       controller!.pauseCamera();
//       controller!.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Scanner'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: _isScanning
//                   ? Text('Scanning...')
//                   : Text('QR Code Result: '),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });

//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         _isScanning = false;
//       });

//       // Handle the scanned QR code data
//       print('Scanned Data: ${scanData.code}');
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
