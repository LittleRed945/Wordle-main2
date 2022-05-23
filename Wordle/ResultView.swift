//
//  ResultView.swift
//  Wordle
//
//  Created by  Erwin on 2022/5/19.
//

import Foundation
import SwiftUI
import AVFoundation
struct ResultView:View{
    let player=AVPlayer()
    @Binding var game:game_variable
    var body:some View{
        VStack{
            if game.iscorrect{
                
                
                Text("Congratulations!").font(.largeTitle)
                Text("you're correct!")
                    .onAppear {
                        //bgm
                        let fileUrl = Bundle.main.url(forResource: "win", withExtension: "mp3")!
                        let playerItem = AVPlayerItem(url: fileUrl)
                        self.player.replaceCurrentItem(with: playerItem)
                        self.player.play()
                        //
                    }
                
                
            }else{
                
                
                Text("Game Over").font(.largeTitle)
                Text("you're wrong,the answer is \(game.topic)")
                    .onAppear {
                        //bgm
                        let fileUrl = Bundle.main.url(forResource: "lose", withExtension: "mp3")!
                        let playerItem = AVPlayerItem(url: fileUrl)
                        self.player.replaceCurrentItem(with: playerItem)
                        self.player.play()
                        //
                    }
                
                
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
                
            }, label: {
                Image(systemName:"house.circle")
            })
        }
    }
}
