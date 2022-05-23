import SwiftUI
struct keyboard_view:View{
    @Binding var game:game_variable
    let i:Int
    let j:Int
    let len:Int
    @State private var active_alert=false
    @State private var alert_title=""
    @State private var topics=[Substring]()
    var body:some View{
        ZStack{
            Rectangle()
                .fill(game.keyboard[i][j].color)
                .frame(width: CGFloat(len)*15, height:25)
            Button(action: {
                if game.keyboard[i][j].chr.lowercased() == "Delete".lowercased(){
                    if game.inputs.count > 0{
                        game.inputs.popLast()
                    }
                    
                }else if game.keyboard[i][j].chr.lowercased() == "Enter".lowercased(){
                    let inputs = game.inputs.joined()
                    
                    
                    for i in game.topics.indices{
                        topics.append(Substring(game.topics[i].lowercased()))
                    }
                    if game.inputs.endIndex<Int(game.topic_len){
                        active_alert=true
                        alert_title="not enough!"
                    }
                    else if !topics.contains(Substring(inputs.lowercased())){
                        active_alert=true
                        alert_title="not in list!"
                    }
                    else {
                        game.correct_or_not()
                    }
                    
                }else{
                    if Int(game.topic_len)>game.inputs.count{
                        game.inputs.append(game.keyboard[i][j].chr)
                    }
                    
                }
                game.input_to_board()
            }, label: {
                Text(game.keyboard[i][j].chr).font(.system(size: CGFloat(20/len)))
                    .foregroundColor(.black)
            }).alert(isPresented: $active_alert, content:{
                return Alert(title:Text(alert_title))
            }).sheet(isPresented: $game.show_result){
                ResultView(game: $game)
            }
        }
        

    }
    
}
