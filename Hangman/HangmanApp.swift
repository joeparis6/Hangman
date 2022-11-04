//
//  HangmanApp.swift
//  Hangman
//
//  Created by Joe Paris on 6/14/22.
//

import SwiftUI

@main
struct HangmanApp: App {
    let game = HangmanVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: game)
        }
    }
}
