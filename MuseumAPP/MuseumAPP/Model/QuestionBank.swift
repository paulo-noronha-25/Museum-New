
import Foundation

class QuestionBank{
    var list = [Question]()
    
    init() {
        list.append(Question(dificulty:"easy", image: "img1", questionText: "A que cultura pertenece la ceramica que se muestre en la foto", choiceA: "A. Chavin", choiceB: "B. Chimu", choiceC: "C. Paracas", choiceD: "D. Nazca", answer: 4))
        
        list.append(Question(dificulty:"easy",image: "img2", questionText: "Como se llama la siguiente pintura", choiceA: "A. La última cena", choiceB: "B. Doña Manuela Tupa Amaro", choiceC: "C. El Matrimonio de la Ñusta", choiceD: "José Olaya", answer: 3))
        
    
    }
}
