import SwiftUI
struct board{
    var id=UUID()
    var word=Substring("")
    var color=Color(.white)
}
struct key:Identifiable{
    var id=UUID()
    var chr=Substring("")
    var color=Color(.white)
}
struct game_variable{
    //when can play again
    @AppStorage("playTime") var playTime = Date().timeIntervalSince1970
    //
    var isplaying=false
    var show_result=false
    var disable_setting=false
    //setting view
    var opensetting=false
    //instruction view
    var show_instruction=false
    
    var topic_len:Double=5
    var topics = [Substring]()
    var topic=""
    var wrong_count=0
    var decided_len=0   
    var iscorrect:Bool=false
    var inputs = [Substring]()
    var input_board=Array(repeating: Array(repeating:board(),count:5), count: 5)
    var keyboard=[Array(repeating:key(),count:10),Array(repeating:key(),count:9),Array(repeating:key(),count:9)]
//the color of not correct.correct,not exist
    var correct_color = Color(.sRGB, red: 0, green: 1,blue: 0)
    var incorrect_color = Color(.sRGB, red: 0.5, green: 0.5,blue: 0.5)
    var wrong_pos_color = Color(.sRGB, red: 1, green: 1,blue: 0)
//
//the pos of not correct.correct,not exist
    //the array of the correct pos,correct char
    var correct=[Substring]()
    //the array of the wrong pos,correct char
    var wrong_pos=[Substring]()
    //the array of the char never existed in the topic
    var never_exist=[Substring]()
//
    //result
    var result_str=[String]()
    var result_row=String()
    //
    mutating func reset(){
        isplaying=false
        show_result=false
        disable_setting=false
        opensetting=false
        show_instruction=false
        topic_len=5
        topics = [Substring]()
        topic=""
        wrong_count=0
        decided_len=0
        correct_color = Color(.sRGB, red: 0, green: 1,blue: 0)
        incorrect_color = Color(.sRGB, red: 0.5, green: 0.5,blue: 0.5)
        wrong_pos_color = Color(.sRGB, red: 1, green: 1,blue: 0)
        iscorrect=false
        inputs = [Substring]()
        correct=[Substring]()
        wrong_pos=[Substring]()
        never_exist=[Substring]()
        result_str=[String]()
        result_row=String()
        keyboard_init()
    }
    mutating func board_init(){
        input_board=Array(repeating: Array(repeating:board(),count:Int(topic_len)), count: 5)
        inputs=[Substring]()
    }
    mutating func keyboard_init(){
        keyboard=[Array(repeating:key(),count:10),Array(repeating:key(),count:9),Array(repeating:key(),count:9)]
        let keyboard_rows=["Q,W,E,R,T,Y,U,I,O,P".split(separator: ","),"A,S,D,F,G,H,J,K,L".split(separator: ","),"Enter,Z,X,C,V,B,N,M,Delete".split(separator: ",")]
        for i in keyboard_rows.indices{
            for j in keyboard_rows[i].indices{
                keyboard[i][j]=key()
                keyboard[i][j].chr=keyboard_rows[i][j]
            }
        }
    }
    mutating func input_to_board(){
        if wrong_count
            < 5{
            input_board[wrong_count]=Array(repeating:board(),count:Int(topic_len))
            for i in inputs.indices{
                input_board[wrong_count][i].word=inputs[i]
            }
        }
       
    }
    mutating func find_letter_from_keyboard(chr:Substring) -> [Int]{
        for i in keyboard.indices{
            for j in keyboard[i].indices{
                if chr == keyboard[i][j].chr.lowercased(){
                    return [i,j]
                }else{
                    print("\(chr):\(keyboard[i][j].chr)")
                }
            }
        }
        return [0,0]
    }
    mutating func correct_or_not(){
        disable_setting=true
        print(topic)
        var topic_arr=Array(topic.lowercased())
        var wrong_letter_count=0
        for i in inputs.indices{
            let chr_index=find_letter_from_keyboard(chr: Substring(inputs[i].lowercased()))
            if topic_arr.contains(Character(inputs[i].lowercased())){
                if inputs[i].lowercased()==topic_arr[i].lowercased(){
                    input_board[wrong_count][i].color=correct_color
                    keyboard[chr_index[0]][chr_index[1]].color=correct_color
                    
                }else{
                    input_board[wrong_count][i].color=wrong_pos_color
                    keyboard[chr_index[0]][chr_index[1]].color=wrong_pos_color
                    wrong_letter_count+=1
                }
            }else{
                input_board[wrong_count][i].color=incorrect_color
                keyboard[chr_index[0]][chr_index[1]].color=incorrect_color
                wrong_letter_count+=1
            }
            print(chr_index)
        }
        if wrong_letter_count==0{
            iscorrect=true
            print("J")
        }else{
            wrong_count+=1
            inputs=[Substring]()
        }
        if wrong_count>=5 || iscorrect{
            for i in input_board.indices{
                result_row=String()
                for j in input_board[i].indices{
                    if input_board[i][j].color == correct_color{
                        result_row+="🟩"
                        
                    }else if input_board[i][j].color == wrong_pos_color{
                        result_row+="🟨"
                    }else{
                        result_row+="⬛️"
                    }
                }
                result_str.append(result_row)
            }
            playTime +=  60 * 5
            show_result=true
        }
    }
}
