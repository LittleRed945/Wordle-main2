import SwiftUI
struct keyboard:View{
    @Binding var game:game_variable
    var body: some View{
        let keyboard_rows=["Q,W,E,R,T,Y,U,I,O,P".split(separator: ","),"A,S,D,F,G,H,J,K,L".split(separator: ","),"Enter,Z,X,C,V,B,N,M,Delete".split(separator: ",")]
        VStack(spacing:1){
            ForEach(keyboard_rows.indices,id:\.self){
                index in
                HStack(spacing:1){
                    ForEach(keyboard_rows[index],id:\.self){
                        key in
                        if key.count>1{
                            keyboard_view(game:$game,str:key,len:2)
                        }else{
                            keyboard_view(game:$game,str:key,len:2)
                        }
                        
                    }
                }
            }
        }
        
        
    }
    
}

