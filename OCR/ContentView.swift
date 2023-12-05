//
//  ContentView.swift
//  OCR
//
//  Created by Juno Jobin on 2023-11-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showScannerSheet = false
    @ObservedObject var viewModel: OCRDataViewModel
    @State private var scannedText: String?

    var body: some View {
        NavigationView {
//            if viewModel.scannedData.isEmpty {
//                Text("No data Scanned yet. Start scanning by clicking OCR button.")
//                    .font(.title)
//                    .foregroundColor(.gray)
//                    .padding()
//            } else {
                List(viewModel.scannedData) { data in
                    NavigationLink(destination: Text(data.scannedTexts)){
                        Text(data.scannedTexts)
                            .foregroundColor(.blue)
                            .font(.headline)
                            .padding(5)
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                }
            //}
            .navigationTitle("OCR App")
            .toolbar {
                Button(action: {
                    self.showScannerSheet = true
                }) {
                    Image(systemName: "camera.viewfinder")
                        .font(.title)
                }
                .sheet(isPresented: $showScannerSheet, content: {
                    VisionKitScannerView(scannedText: $scannedText)
                })
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel:  OCRDataViewModel())
    }
}

