//
//  OCRDataViewModel.swift
//  OCR
//
//  Created by Juno Jobin on 2023-11-06.
//

import Foundation

class OCRDataViewModel: ObservableObject {
    @Published var scannedData: [OCRDataModel] = []
    
    func addScannedText(scannedTexts: String){
        let newData = OCRDataModel(scannedTexts: scannedTexts)
        scannedData.append(newData)
    }
   
}
