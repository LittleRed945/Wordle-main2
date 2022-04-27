//
//  settingView.swift
//  Wordle
//
//  Created by User04 on 2022/4/27.
//

import Foundation
import SwiftUI
struct settingView: View {
    @Binding var game:game_variable
    var body: some View {
        ZStack{
            VStack{
                
                //color picker
                ColorPicker("Correct:", selection: $game.correct_color)
                ColorPicker("Wrong:", selection: $game.incorrect_color)
                ColorPicker("Wrong position:", selection: $game.wrong_pos_color)
                //
            }
            Button(action: {game.opensetting=false}, label: {
                Image(systemName: "xmark")
            }).offset(x:145,y:-250)
        }
        
    }
}
