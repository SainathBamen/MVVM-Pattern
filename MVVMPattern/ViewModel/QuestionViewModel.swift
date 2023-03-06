//
//  QuestionViewModel.swift
//  MVVMPattern
//
//  Created by sainath bamen on 10/02/23.
//

import Foundation

class QuestionViewModel{
    
    var sourceURL = URL(string: "https://quiz-68112-default-rtdb.firebaseio.com/quiz.json")!
    var questionModel:DataModel?
    
    func getAllTheQuestions(completion:@escaping () -> ()){
        URLSession.shared.dataTask(with: sourceURL) { [weak self] data, url, error in
            if let data = data{
                let jsonDecoder = JSONDecoder()
                let finalMo = try! jsonDecoder.decode(DataModel.self, from: data)
                self?.questionModel = finalMo
                print(finalMo)
                completion()
            }
            
        }
        .resume()
        
    }
    
}
