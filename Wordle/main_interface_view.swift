import SwiftUI
struct main_interface_view:View{
    @Binding var game:game_variable
    
    var body:some View{
        VStack{
            Text("Wordle")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.red)
            Spacer()
            HStack{
                Button(action: {
                    game.isplaying = true
                }, label: {
                    Image(systemName: "play.fill")
                        .foregroundColor(.black)
                })
                Button(action: {
                    game.show_instruction = true
                }, label: {
                    Image(systemName: "play.fill")
                        .foregroundColor(.black)
                })
                .sheet(isPresented: $game.show_instruction, content: {
                    instruction_view(game:$game)
                })
            }
            
            
            Spacer()
        }
        

    }
    
}
