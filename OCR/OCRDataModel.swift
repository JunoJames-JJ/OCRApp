//
//  DataScanned.swift
//  OCR
//
//  Created by Juno Jobin on 2023-11-06.
//

import Foundation

struct OCRDataModel: Identifiable {
    var id = UUID()
    let scannedTexts: String
    
    init(scannedTexts: String) {
        self.scannedTexts = scannedTexts
    }
}
