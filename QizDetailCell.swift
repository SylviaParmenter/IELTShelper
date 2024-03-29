import UIKit
class QizDetailCell: UITableViewCell {
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var qizLabel: UILabel!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        circleView.backgroundColor = UIColor.appGreen
        line.backgroundColor = UIColor.appGreen
        qizLabel.font = UIFont.lightFont(17)
        countLabel.font = UIFont.lightFont(13)
        countLabel.layer.cornerRadius = 10
        countLabel.layer.masksToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
