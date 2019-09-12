import UIKit
class QizCell: UICollectionViewCell {
    @IBOutlet weak var qizLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 5
        bgView.layer.masksToBounds = true
        countLabel.layer.cornerRadius = 20
        countLabel.layer.masksToBounds = true
        qizLabel.font = UIFont.semiboldFont(Utl.fontSize(size: 22))
        countLabel.font = UIFont.semiboldFont(Utl.fontSize(size: 15))
    }
}
