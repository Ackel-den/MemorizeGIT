//
//  MemoryGameBuilder.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 29.06.2024.
//

import Foundation

protocol MemoryGameBuilderProtocol {
    func makeMemoryGame() -> MemoryGame<String>
}

struct MemoryGameBuilder : MemoryGameBuilderProtocol{
    func makeMemoryGame() -> MemoryGame<String>{
        let theme = makeTheme()
        
        func checkNumberOfCard(pairs: Int) -> Int{
            if pairs > theme.emojisOfTheme.count{
                return theme.emojisOfTheme.count
            }
            else{
                return theme.numberOfPairs
            }
        }
        return MemoryGame<String>(numberOfPairsCards: checkNumberOfCard(pairs: theme.numberOfPairs), theme){pairIndex in theme.emojisOfTheme[pairIndex]}
    }
    
    private func makeTheme() -> Themes{
        switch Int.random(in: 0...2)
        {
        case 0:
            return Themes.faces
        case 1:
            return Themes.vehicles
        case 2:
            return Themes.halloween
        default:
            return Themes.faces
        }
    }
}

extension Themes{
    static var faces:Themes{
        Themes(emojisOfTheme: ["😀","☺️","🧐","😎","🙂","🤪","🙁","🥺","🤬","😘","🤯","🥶","🤣","😇"], colorForPrint: .red, nameOfTheme: "Faces")
    }
    static var vehicles: Themes{
        Themes(emojisOfTheme: ["🚗","🚙","🚎","🚃","🚜","🛵","🚖","🏍️","🚈","✈️","🚂","⛵️","🚀","🛰️","🚔","🚢"], colorForPrint: .blue, nameOfTheme: "Vehicles")
    }
    static var halloween: Themes{
        Themes(emojisOfTheme: ["🕷️","🕸️","🌑","☠️","👻","💀","👺","👹","🎃","👀"], colorForPrint: .orange, nameOfTheme: "Halloween")
    }
}
