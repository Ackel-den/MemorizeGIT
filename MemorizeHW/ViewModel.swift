//
//  File.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 16.06.2024.
//

import SwiftUI

class ViewModel: ObservableObject{
    
    var cards: Array<MemoryGame<String>.Card>{
            return model.cards
        }
    
    @Published private (set) var model: MemoryGame<String>
    
    init (newMemoryGame: MemoryGameBuilderProtocol = MemoryGameBuilder()){
        model = newMemoryGame.makeMemoryGame()
        }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func startNewGame(){
        let newGame: MemoryGameBuilderProtocol = MemoryGameBuilder()
        model = newGame.makeMemoryGame()
    }
}
