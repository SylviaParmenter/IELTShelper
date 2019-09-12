import UIKit
class MenuCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var goImg: UIImageView!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var line: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        title.font = UIFont.lightFont(15)
        info.font = UIFont.semiboldFont(13)
        goImg.image = #imageLiteral(resourceName: "go")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
