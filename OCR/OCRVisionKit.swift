//
//  OCRVisionKit.swift
//  OCR
//
//  Created by Juno Jobin on 2023-11-07.
//

import VisionKit
import SwiftUI


struct VisionKitScannerView: View {
    @Binding var scannedText: String?
    
    var body: some View {
        DocumentScannerViewControllerRepresentable(scannedText: $scannedText)
    }
    
}

struct DocumentScannerViewControllerRepresentable: UIViewControllerRepresentable {
    @Binding var scannedText: String?
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = context.coordinator
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        // Update the UI or handle any changes, if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannedText: $scannedText)
    }
}


class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
    @Binding var scannedText: String?
    
    init(scannedText: Binding<String?>) {
            _scannedText = scannedText
        }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        let recognizer = OCRTextRecognizer(cameraScan: scan)
        recognizer.recognizeText { recognizedText in
            print("Recognized Text:", recognizedText)
            self.scannedText = recognizedText
            controller.dismiss(animated: true)
        }
    }

}
