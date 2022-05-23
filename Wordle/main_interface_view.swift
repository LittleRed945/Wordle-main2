import SwiftUI
struct main_interface_view:View{
    
    @Binding var game:game_variable
    @State var cannotPlay=false
    @State var min=0
    var body:some View{
        VStack{
            Text("RPG Wordle")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.red)
            Spacer()
            HStack{
                Button(action: {
                    
                    let time1 = Date()
                    let time2=Date(timeIntervalSince1970: game.playTime)
                    let components = Calendar.current.dateComponents([.minute], from: time1, to:
                                                                        time2)
                    
                    if let tmp = components.minute{
                        min = tmp
                        if tmp <= 0{
                            game.reset()
                            game.isplaying = true
                            cannotPlay=false
                            
                        }else{
                            cannotPlay=true
                        }
                    }
                    
                }, label: {
                    Image(systemName: "play.fill")
                        .foregroundColor(.black)
                    
                }).alert(isPresented: $cannotPlay, content:{
                    return Alert(title:Text("\(min) minutes left"))
                })
                Button(action: {
                    game.show_instruction = true
                }, label: {
                    Image(systemName: "questionmark")
                        .foregroundColor(.black)
                })
                    .sheet(isPresented: $game.show_instruction, content: {
                        instruction_view(game:$game)
                    })
            }
            
            
            Spacer()
        }.background(Image("Wordle_background").resizable().scaledToFill())
        
        
    }
    
}
