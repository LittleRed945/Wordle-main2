//
//  ResultView.swift
//  Wordle
//
//  Created by  Erwin on 2022/5/19.
//

import Foundation
import SwiftUI
struct ResultView:View{
    @Binding var game:game_variable
    var body:some View{
        VStack{
            if game.iscorrect{
                
                
                Text("Congratulations!").font(.largeTitle)
                Text("you're correct!")
                
                
                
            }else{
                
                
                Text("Game Over").font(.largeTitle)
                Text("you're wrong,the answer is \(game.topic)")
                
                
                
            }
            Button(action: {
                UIPasteboard.general.strings=game.result_str
            }, label:{
                ZStack{
                    Rectangle().fill(.green).frame(width: 100, height: 30)
                    HStack{
                        Text("Share").foregroundColor(.white)
                        
                    }
                }
            })
            Button(action:  {game.isplaying=false
                game.reset()
            }, label: {
                Image(systemName:"house.circle")
            })
        }
    }
}
