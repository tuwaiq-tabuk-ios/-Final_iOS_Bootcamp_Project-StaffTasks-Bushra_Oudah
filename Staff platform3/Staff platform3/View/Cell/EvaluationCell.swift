import UIKit

class EvaluationCell: UITableViewCell {

    @IBOutlet weak var evaluationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        conerReduis()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }



}
