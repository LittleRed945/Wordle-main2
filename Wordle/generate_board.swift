import SwiftUI
struct generate_board:View{
    let game:game_variable
    
    var body: some View{
        VStack(spacing:5){
            ForEach(Range(0...4)){i in
                HStack(spacing:5){
                    ForEach(game.input_board[i],id:game.input_board[i].id){tile in
                        board_view(tile:tile )
                    }
                }
            
            }
            
        }
    
    }
    
}
