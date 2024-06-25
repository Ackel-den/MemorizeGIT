//  MemoryGame.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 16.06.2024.
//

import Foundation


struct MemoryGame <CardContent> where CardContent: Equatable {
    var cards: Array <Card>
    var score: Int
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: (pairIndex * 2)))
            cards.append(Card(content: content, id: (pairIndex * 2 + 1)))
        }
        cards.shuffle()
        score = 0
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isMatched,
           !cards[chosenIndex].isFaceUp{
            
            if let potentialIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialIndex].isMatched = true
                    score += 2
                }
                if cards[chosenIndex].viewed == true && cards[chosenIndex].isMatched == false{
                    score -= 1
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                    for index in 0..<cards.count{
                        cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
            cards[chosenIndex].viewed = true
        }
    }
    
struct Card: Identifiable{
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var viewed: Bool = false
    var content: CardContent

    var id: Int
    }
}

struct Themes{
    var emojisOfTheme: Array<String>
    var numberOfPairs: Int = Int.random(in: 3...10)
    var colorForPrint: Colors?
    var nameOfTheme: String = "Nothing"
    
    static let randomTheme = Int.random(in: 0...2)
    init (_ rand: Int){
        emojisOfTheme = Array<String>()
        switch rand{
        case 0:
            emojisOfTheme = ["😀","☺️","🧐","😎","🙂","🤪","🙁","🥺","🤬","😘","🤯","🥶","🤣","😇"]
            nameOfTheme = "Faces"
            colorForPrint = .red
        case 1:
            emojisOfTheme = ["🕷️","🕸️","🌑","☠️","👻","💀","👺","👹","🎃","👀"]
            nameOfTheme = "Halloween"
            colorForPrint = .orange
        case 2:
            emojisOfTheme = ["🚗","🚙","🚎","🚃","🚜","🛵","🚖","🏍️","🚈","✈️","🚂","⛵️","🚀","🛰️","🚔","🚢"]
            nameOfTheme = "Vehicles"
            colorForPrint = .blue
        default:
            break
        }
        emojisOfTheme.shuffle()
    }
    
    enum Colors {
        case red
        case orange
        case blue
        case nothing
    }
    
}
