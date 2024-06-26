//
//  File.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 16.06.2024.
//

import SwiftUI

class ViewModel: ObservableObject{
    
    @Published private (set) var model: MemoryGame<String>
    
    init (){
        let newMemoryGame: MemoryGameBuilderProtocol = MemoryGameBuilder()
        model = newMemoryGame.makeMemoryGame()
        }
    
    private protocol MemoryGameBuilderProtocol {
        func makeMemoryGame<String>() -> MemoryGame<String>
    }
    
    private struct MemoryGameBuilder : MemoryGameBuilderProtocol{
        func makeMemoryGame<String>() -> MemoryGame<String>{
            let theme = makeTheme()
            
            func checkNumberOfCard(pairs: Int) -> Int{
                if pairs > theme.emojisOfTheme.count{
                    return theme.emojisOfTheme.count
                }
                else{
                    return theme.numberOfPairs
                }
            }
            return MemoryGame<String>(numberOfPairsCards: checkNumberOfCard(pairs: theme.numberOfPairs), theme){pairIndex in theme.emojisOfTheme[pairIndex] as! String }
        }
        private func makeTheme() -> Themes{
            Themes(Int.random(in: 0...2))
        }
        
    }
    
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func startNewGame(){
        let newGame: MemoryGameBuilderProtocol = MemoryGameBuilder()
        model = newGame.makeMemoryGame()
    }
}
