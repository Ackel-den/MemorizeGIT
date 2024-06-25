//
//  File.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 16.06.2024.
//

import SwiftUI

class ViewModel: ObservableObject{
    
    @Published private (set) var model: MemoryGame<String>
    var theme: Themes
    var nameOfTheme: String
    var colorOfTheme: Color
    
    init (){
        func chooseColorOfTheme(color: Themes.Colors) -> Color{
            switch color{
                case .red: Color.red
                case .blue: Color.blue
                case .orange: Color.orange
                default: Color.black
            }
        }
        theme = ViewModel.chooseTheme()
        model = ViewModel.createMemoryGame(theme)
        nameOfTheme = theme.nameOfTheme
        colorOfTheme = chooseColorOfTheme(color: theme.colorForPrint!)
    }

    static func chooseTheme() -> Themes{
        Themes(Int.random(in: 0...2))
    }
    static func createMemoryGame(_ theme: Themes) -> MemoryGame<String>{
                func checkNumberOfCard(pairs: Int) -> Int{
            if pairs > theme.emojisOfTheme.count{
                return theme.emojisOfTheme.count
            }
            else{
                return theme.numberOfPairs
            }
        }
        return MemoryGame<String>(numberOfPairsCards: checkNumberOfCard(pairs: theme.numberOfPairs)){pairIndex in theme.emojisOfTheme[pairIndex]}
    }
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func startNewGame(){
        ViewModel.init()
        theme = ViewModel.chooseTheme()
        model = ViewModel.createMemoryGame(theme)
        
    }
}
