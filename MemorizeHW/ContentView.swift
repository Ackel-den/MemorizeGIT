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
            infShape(name: viewModel.model.theme.nameOfTheme, number: nil)
            infShape(name: nil, number: viewModel.model.score)
        }
        Spacer()
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(viewModel.cards){card in
                    CardView(card: card, color: viewModel.model.theme.colorForPrint)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .padding(.all)
        }
        NewGameButton(color: viewModel.model.theme.colorForPrint)
                .onTapGesture {
                    viewModel.startNewGame()
                }
    }
}

struct infShape: View {
    let name: String?
    let number: Int?
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .strokeBorder(lineWidth: 3)
                .frame(width: 160, height: 60)
            if number != nil {
                Text("Score: \(number!)")
            }
            else {
                Text("Theme: \(name!)")
            }
            
        }
    }
}

struct NewGameButton: View {
    let color: Color
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .strokeBorder(lineWidth: 3).foregroundColor(.black)
                .frame(width: 180.0, height: 50.0)
                .foregroundColor(.white)
            Text("New game")
                .foregroundColor(.black)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}


#Preview {
    let game = ViewModel()
    return ContentView(viewModel: game)
}
