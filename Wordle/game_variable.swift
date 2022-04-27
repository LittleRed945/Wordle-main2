import SwiftUI
struct board{
    var id=UUID()
    var word=Substring("")
    var color=Color(.white)
}
struct game_variable{
    
    var isplaying=false
    
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
    var input_board=Array(repeating: Array(repeating:board(),count:8), count: 5)
//the color of not correct.correct,not exist
    var correct_color = Color(.sRGB, red: 0, green: 1,blue: 0)
    var incorrect_color = Color(.sRGB, red: 1, green: 1,blue: 1)
    var wrong_pos_color = Color(.sRGB, red: 1, green: 0,blue: 0)
//
//the pos of not correct.correct,not exist
    //the array of the correct pos,correct char
    var correct=[Substring]()
    //the array of the wrong pos,correct char
    var wrong_pos=[Substring]()
    //the array of the char never existed in the topic
    var never_exist=[Substring]()
//
    mutating func reset(){
        isplaying=false
        opensetting=false
        show_instruction=false
        topic_len=5
        topics = [Substring]()
        topic=""
        wrong_count=0
        decided_len=0
        correct_color = Color(.sRGB, red: 0, green: 1,blue: 0)
        incorrect_color = Color(.sRGB, red: 1, green: 1,blue: 1)
        wrong_pos_color = Color(.sRGB, red: 1, green: 0,blue: 0)
        iscorrect=false
        inputs = [Substring]()
        correct=[Substring]()
        wrong_pos=[Substring]()
        never_exist=[Substring]()
    
    }
    mutating func board_init(){
        input_board=Array(repeating: Array(repeating:board(),count:8), count: 5)
        inputs=[Substring]()
    }
    mutating func input_to_board(){
        
        for i in inputs.indices{
            input_board[wrong_count][i].word=inputs[i]
        }
    }
}
