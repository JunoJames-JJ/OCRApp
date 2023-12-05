//
//  OCRApp.swift
//  OCR
//
//  Created by Juno Jobin on 2023-11-06.
//

import SwiftUI

@main
struct OCRApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: OCRDataViewModel())
        }
    }
}
