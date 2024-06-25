//
//  ContentView.swift
//  MemorizeHW
//
//  Created by Денис Никитин on 09.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack{
            NameOfTheme(name: viewModel.nameOfTheme)
            Score(score: viewModel.model.score)
        }
        Spacer()
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(viewModel.cards){card in
                    CardView(card: card, color: viewModel.colorOfTheme)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .padding(.all)
        }
        NewGameButton(color: viewModel.colorOfTheme)
                .onTapGesture {
                    viewModel.startNewGame()
                }
    }
}

struct Score: View {
    var score: Int
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 50)
            shape.strokeBorder(lineWidth: 3)
                .frame(width: 120, height: 60)
            Text("Score: \(score)")
                .font(.title)
        }
    }
}

struct NameOfTheme: View{
    let name: String
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 50)
            shape.strokeBorder(lineWidth: 3)
                .frame(width: 190, height: 60)
            Text("Theme: \(name)")
                .font(.title2)
        }
    }
}

struct NewGameButton: View {
    let color: Color
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 50)
            shape.frame(width: 150.0, height: 50.0)
                .foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3)
                 .frame(width: 150.0, height: 50.0)
            Text("New game")
                .foregroundColor(.black)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

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

#Preview {
    let game = ViewModel()
    return ContentView(viewModel: game)
}
