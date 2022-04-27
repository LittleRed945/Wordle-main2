import SwiftUI
struct playing_view:View{
    @Binding var game:game_variable
    
    var body: some View {
        VStack {
            if game.topics.isEmpty != true {
                HStack{
                    Button(action:  {game.isplaying=false}, label: {
                        Image(systemName:"house.circle")
                    })
                    Text("Wordle").font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.red)
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
                })
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
        }
    }
    
}

