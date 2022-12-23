//
//  QuestionService.swift
//  MuseumAPP
//
//  Created by pnoronha on 7/11/22.
//
import UIKit

final class QuestionManager {

  var questions: [Question] = []
    
  private let domainUrlString = "https://979u1pil6h.execute-api.us-east-1.amazonaws.com/Developer/"
    
  /*  func getQuestions(){
        let url = URL(string: domainUrlString + "museum/")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler:{ data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            var result: QuestionSummary?
            do {
                result = try JSONDecoder().decode(QuestionSummary.self, from: data)
            }
            catch{}
            print("failed to convert \(error?.localizedDescription)")
            
            guard let json = result else {
                return
            }
            
            print(json.status)
            print(json.results ?? "")
        })
        task.resume()
 }*/
 
  
  func fetchFilms(completionHandler: @escaping ([Question]?) -> Void) {
    let url = URL(string: domainUrlString + "museum")!

    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        guard let data = data, error == nil else {
            print("something went wrong")
            return
        }
      
        var result: Response?
        do {
            result = try JSONDecoder().decode(Response.self, from: data)
        }
        catch{
            print("failed to convert \(error.localizedDescription)")
        }
        
        guard let json = result else {
            return
        }
        
        print(json.succes ?? false)
        print(json.question ?? "")

        if data == data,
        let filmSummary = try? JSONDecoder().decode(Response.self, from: data) {
            completionHandler(filmSummary.question)
      }
    })
    task.resume()
  }
}
