//
//  ScannerView.swift
// SCANNER CONTROLLER
//

import SwiftUI
import AVFoundation
import Vision

struct ScannerView: UIViewControllerRepresentable {

    @Binding var scannedString: String

    let captureSession = AVCaptureSession()

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()

        // preview layer
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = viewController.view.bounds
        viewController.view.layer.addSublayer(previewLayer)

        // all camera setup will run in the background
        DispatchQueue.global(qos: .userInitiated).async {
            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video),
                  let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else {
                return
            }
            captureSession.addInput(videoInput)

            let videoOutput = AVCaptureVideoDataOutput()

            if captureSession.canAddOutput(videoOutput) {
                videoOutput.setSampleBufferDelegate(context.coordinator, queue: DispatchQueue(label: "videoQueue"))
                captureSession.addOutput(videoOutput)
            }
                captureSession.startRunning()
        }
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
        var parent: ScannerView
        private var requests = [VNRequest]()

        init(_ parent: ScannerView) {
            self.parent = parent
            super.init()
            setupVision()
        }

        private func setupVision() {
                  let barcodeRequest = VNDetectBarcodesRequest(completionHandler: self.handleBarcodes)

                  //BARCODE TYPES
                barcodeRequest.symbologies = [.ean13, .ean8, .code39, .code93, .code128, .code93i, .upce]

                  self.requests = [barcodeRequest]
              }

              func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
                  guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

                  let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
                  do {
                      try imageRequestHandler.perform(self.requests)
                  } catch {
                      print("Failed to perform barcode detection: \(error)")
                  }
              }

              private func handleBarcodes(request: VNRequest, error: Error?) {
                  if let error = error {
                      print("Barcode detection error: \(error)")
                      return
                  }

                  guard let results = request.results as? [VNBarcodeObservation] else { return }
                  for barcode in results {
                      if let payload = barcode.payloadStringValue {
                          DispatchQueue.global().async {
                              AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                              self.parent.scannedString = payload
                              self.parent.captureSession.stopRunning()
                          }

                          // stop scanning after detection
                          DispatchQueue.global().async {
                              if self.parent.captureSession.isRunning {
                                  self.parent.captureSession.stopRunning()
                              }
                          }
                          // Optionally, stop scanning after first detection
                          // self.parent.captureSession?.stopRunning()
                      }
                  }
              }
          }
      }

#Preview {
    ScannerView(scannedString: .constant("111175948"))
}
