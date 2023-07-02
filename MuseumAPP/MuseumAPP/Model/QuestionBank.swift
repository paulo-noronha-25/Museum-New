
import Foundation

class QuestionBank{
    var list = [Question]()
    
    init() {
        list.append(Question(museum:"easy", questionText: "A que cultura pertenece la ceramica que se muestre en la foto", choiceA: "A. Chavin", choiceB: "B. Chimu", choiceC: "C. Paracas", choiceD: "D. Nazca"))
        
        list.append(Question(museum:"easy", questionText: "Como se llama la siguiente pintura", choiceA: "A. La última cena", choiceB: "B. Doña Manuela Tupa Amaro", choiceC: "C. El Matrimonio de la Ñusta", choiceD: "José Olaya"))
        
    
    }
}
