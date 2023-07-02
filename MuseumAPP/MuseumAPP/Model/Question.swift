
import Foundation

struct Response: Codable {
    let succes: Bool?
    let message: String?
    let question: [Question]?
}

struct Question: Codable {
    let museum: String?
    let questionText: String?
    let choiceA: String?
    let choiceB: String?
    let choiceC: String?
    let choiceD: String?

    
    init(museum: String?, questionText: String?, choiceA: String?, choiceB: String?, choiceC: String?, choiceD: String?){
        self.museum = museum
        self.questionText = questionText
        self.choiceA = choiceA
        self.choiceB = choiceB
        self.choiceC = choiceC
        self.choiceD = choiceD
    }
}
