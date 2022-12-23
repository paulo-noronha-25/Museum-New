
import Foundation

struct Response: Codable {
    let succes: Bool?
    let message: String?
    let question: [Question]?
}

struct Question: Codable {
    let dificulty: String?
    let image: String?
    let questionText: String?
    let choiceA: String?
    let choiceB: String?
    let choiceC: String?
    let choiceD: String?
    let answer: Int?
    
    init(dificulty: String?,image: String?, questionText: String?, choiceA: String?, choiceB: String?, choiceC: String?, choiceD: String?, answer: Int?){
        self.dificulty = dificulty
        self.image = image
        self.questionText = questionText
        self.choiceA = choiceA
        self.choiceB = choiceB
        self.choiceC = choiceC
        self.choiceD = choiceD
        self.answer = answer
    }
}
