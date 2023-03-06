//
//  ViewController.swift
//  MVVMPattern
//
//  Created by sainath bamen on 10/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = QuestionViewModel()
    var questions: DataModel?


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAllTheQuestions { [weak self] in
            self?.questions = self?.viewModel.questionModel
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions?.data?.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = questions?.data?.questions[indexPath.row].question
        return cell!
    }
    
   
    
}
