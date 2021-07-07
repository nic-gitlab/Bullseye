//
//  ContentView.swift
//  Bullseye
//
//  Created by Nic Rowe on 6/24/21.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
        VStack {
            Text("🎯🎯🎯\n put the bullseye as close as you can to".uppercased())
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                .bold()

                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                .bold()
            }
            .padding()
            Button(action: {
                alertIsVisible = true
            }) {
                Text("Hit me".uppercased())
                    .bold()
                    .font(.title3)
                    
            }
                .padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    }
                )
                .foregroundColor(Color.white)
                .cornerRadius(21.0)
                .alert(isPresented:$alertIsVisible,
                       content: {
                        let roundedSliderValue = Int(sliderValue.rounded())
                        return Alert(title: Text("Hello there"), message: Text("The sliders value is \(roundedSliderValue).\n" + "You scored \(game.points(sliderValue: roundedSliderValue)) points this round."), dismissButton: .default(Text("Awesome!")))
                })
           
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
