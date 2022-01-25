


import UIKit
import Firebase


class EvaluationVC: UIViewController{
  
  // MARK: - Properties
  
  let db = Firestore.firestore()
  var evaluation = [Evaluation]()
  
  // MARK: - IBOutlets
  
  @IBOutlet weak var tabelView: UITableView!
  
 
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tabelView.dataSource = self
    tabelView.delegate = self
    readEvaluation()
    overrideUserInterfaceStyle = .light
    
  }
  
  // MARK: - Methods
  
  func readEvaluation(){
    db
      .collection("Evalution")
      .addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("Error fetching documents: \(error!)")
          return
        }
        
        self.evaluation = []
        
        for doc in documents {
          if (doc.data()["UserRef"] as? String == Auth.auth().currentUser?.uid) {
            print("doc.documentID\(doc.documentID)")
            let evaluation = doc.data()["evaluation"] as? String
            let evaluations = Evaluation.init(id: doc.documentID, evaluation:evaluation, user: nil)
            self.evaluation.append(evaluations)
            
          }
        }
        self.tabelView.reloadData()
      }
  }

}
  // MARK: - Table data source

  extension EvaluationVC: UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return evaluation.count
  }
  
  
}

// MARK: - Navigation

extension EvaluationVC: UITableViewDelegate {
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EvaluationCell") as! EvaluationCell
    cell.evaluationLabel.text = evaluation[indexPath.row].evaluation
    return cell
  }
}
