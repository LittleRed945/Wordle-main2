import SwiftUI
func readFile(topic_len:Double)->String{
    
    if let asset = NSDataAsset(name: "topic"+String(Int(topic_len))), let content = String(data: asset.data, encoding: .utf8) {
        return content
    }else{
        return ""
    }
}
