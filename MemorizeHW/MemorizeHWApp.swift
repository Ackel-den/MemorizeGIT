//
//  MemorizeHWApp.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 09.05.2024.
//

import SwiftUI

@main
struct MemorizeHWApp: App {
    let game = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
