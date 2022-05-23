import SwiftUI
struct board_view:View{
    let tile:board
    var body:some View{
        ZStack{
            Rectangle()
            .stroke(Color.black, lineWidth: 3)
            .frame(width: 30, height:40)
            Rectangle()
                .fill(tile.color)
            .frame(width: 30, height:40)
            if(tile.word == ""){
                Text("").frame(width: 30, height:40)
            }else{
                Text(tile.word).frame(width: 30, height:40)
            }
            
        }
        

    }
    
}
