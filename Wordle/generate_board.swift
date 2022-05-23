import SwiftUI
struct generate_board:View{
    let game:game_variable
    
    var body: some View{
        VStack(spacing:5){
            ForEach(game.input_board.indices,id:\.self){i in
                HStack(spacing:5){
                    ForEach(game.input_board[i].indices,id:\.self){j in
                        board_view(tile:game.input_board[i][j] )
                    }
                }
            
            }
            
        }
    
    }
    
}
