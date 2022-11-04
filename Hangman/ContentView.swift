//
//  ContentView.swift
//  Hangman
//
//  Created by Joe Paris on 6/14/22.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var vm: HangmanVM
    
    @State private var guessInput: String = ""
    
    var body: some View {
        VStack {
            Text("Play Hangman")
            TextField(
                    "Guess",
                    text: $guessInput
            ).frame(minWidth: 40, idealWidth: 45, maxWidth: 50, minHeight: 20, idealHeight: 30, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
                
            Button(action: makeguess, label: {
                Text("Guess")
            })
        }
    }
    
    func makeguess() {
        
        let guess = guessInput.first!
        print("guess: ", guess as Any)
        let result = guessLetter(letter: guess)
        print(result)
        //open keyboard
    }
    
    func guessLetter(letter: Character) -> String {
        return vm.guessIntent(Letter: letter)
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = HangmanVM()
        ContentView(vm: game).preferredColorScheme(.dark)
    }
}
