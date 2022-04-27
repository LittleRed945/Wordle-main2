import SwiftUI
struct generate_board:View{
    let game:game_variable
    
    var body: some View{
        VStack(spacing:5){
            ForEach(game.input_board,id:\.self){row in
                HStack(spacing:5){
                    ForEach(row,id:row.i    d){tile in
                        board_view(tile:tile )
                    }
                }
            
            }
            
        }
    
    }
    
}
