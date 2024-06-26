//
//  CardView.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 26.06.2024.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    let color: Color

    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if card.isFaceUp{
                shape.fill()
                shape.foregroundColor(color)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }
            else if card.isMatched{
                shape.opacity(0)
            }
            else{
                shape.fill()
                shape.foregroundColor(color)
                shape.strokeBorder(lineWidth: 3)
            }
            
        }
    }
}

//#Preview {
//    CardView()
//}
