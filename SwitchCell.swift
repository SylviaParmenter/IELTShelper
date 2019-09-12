import UIKit
class SwitchCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        title.font = UIFont.lightFont(15)
        switchBtn.onTintColor = UIColor.appYellow
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
