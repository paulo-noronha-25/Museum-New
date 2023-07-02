import Foundation

struct Answer: Codable {
    let answer: String?
   
    init(answer: String?){
        self.answer = answer
    }
}

