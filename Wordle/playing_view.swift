import SwiftUI
import AVFoundation
struct playing_view:View{
    @Binding var game:game_variable
    let player=AVPlayer()
    var body: some View {
        VStack {
            if game.topics.isEmpty != true {
                HStack{
                    Button(action:  {game.isplaying=false
                        game.reset()
                    }, label: {
                        Image(systemName:"house.circle")
                    })
                    Text("RPG Wordle").font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.red)
                        .onAppear {
                            //bgm
                            let fileUrl = Bundle.main.url(forResource: "battle", withExtension: "mp3")!
                            let playerItem = AVPlayerItem(url: fileUrl)
                            self.player.replaceCurrentItem(with: playerItem)
                            self.player.play()
                            //
                        }
                    Button(action: {game.opensetting=true}, label: {
                        Image(systemName: "gearshape.fill")
                    }).sheet(isPresented: $game.opensetting, content: {
                        settingView(game: $game)
                    })
                }
        
                

                Slider(value: $game.topic_len, in: 3...8,step:1).onChange(of: game.topic_len, perform: {newValue in
                    let content = readFile(topic_len: game.topic_len)
                    game.topics = content.split(separator: "\r\n")
                    game.topic=String(game.topics.randomElement()!)
                    game.board_init()
                    
                }).disabled(game.disable_setting)
                Text("len:"+String(Int(game.topic_len)))
                generate_board(game: game)
                keyboard(game:$game)
                
            }
            
        }
        .background(Image("Wordle_background").resizable().scaledToFill())
        .onAppear {
            
            let content = readFile(topic_len: game.topic_len)
            game.topics = content.split(separator: "\r\n")
            game.topic=String(game.topics.randomElement()!)
            print(game.topics)
            game.board_init()
            game.keyboard_init()
        }
    }
    
}


