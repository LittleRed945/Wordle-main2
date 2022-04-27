//
//  ContentView.swift
//  Wordle
//
//  Created by User04 on 2022/3/21.
//

import SwiftUI

struct ContentView: View {
    @State private var game = game_variable()
    var body:some View{
        if game.isplaying == false {
            main_interface_view(game:$game)
                
        }else{
            playing_view(game:$game)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
