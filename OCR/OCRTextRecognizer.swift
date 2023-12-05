//
//  OCRTextRecognizer.swift
//  OCR
//
//  Created by Juno Jobin on 2023-11-07.
//

import Foundation
import Vision
import VisionKit

class OCRTextRecognizer {
    private let cameraScan: VNDocumentCameraScan
    private var completionHandler: ((String) -> Void)?

    init(cameraScan: VNDocumentCameraScan) {
        self.cameraScan = cameraScan
    }

    func recognizeText(withCompletionHandler completionHandler: @escaping (String) -> Void) {
        self.completionHandler = completionHandler
        performOCR()
    }

    private func performOCR() {
        guard let image = cameraScan.imageOfPage(at: 0).cgImage else {
            completionHandler?("")
            return
        }

        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("OCR Error: \(error)")
                self.completionHandler?("")
                return
            }

            if let results = request.results as? [VNRecognizedTextObservation] {
                var recognizedText = ""
                for result in results {
                    if let topCandidate = result.topCandidates(1).first {
                        recognizedText += topCandidate.string + " "
                    }
                }
                self.completionHandler?(recognizedText)
            } else {
                self.completionHandler?("")
            }
        }

        let handler = VNImageRequestHandler(cgImage: image, options: [:])

        do {
            try handler.perform([request])
        } catch {
            print("Request Error: \(error)")
            completionHandler?("")
        }
    }
}



