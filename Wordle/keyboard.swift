import SwiftUI
struct keyboard:View{
    @Binding var game:game_variable
    var body: some View{
        VStack(spacing:1){
            ForEach(game.keyboard.indices,id:\.self){i in
                HStack(spacing:1){
                    ForEach(game.keyboard[i].indices,id:\.self){j in
                        if game.keyboard[i][j].chr.count > 1{
                            keyboard_view(game: $game, i: i, j: j, len: 2)
                        }else{
                            keyboard_view(game: $game, i: i, j: j, len: 2)
                        }
                    }
                }
            
            }
        }
        
        
    }
    
}

