import UIKit
class DetailViewController: UIViewController {
  @IBOutlet weak var memoTableView: UITableView!
  let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .medium
    return formatter
  }()
  var memo: Memo?
  @IBAction func share(_ sender: Any) {
    guard let memo = memo?.content else { return }
    let vc = UIActivityViewController(activityItems: [memo], applicationActivities: nil)
    present(vc, animated: true, completion: nil)
  }
  @IBAction func deleteMemo(_ sender: Any) {
    let alert = UIAlertController(title: "Confirm deletion", message: "Do you want to delete the note?", preferredStyle: .alert)
    let deleteAction = UIAlertAction(title: "delete", style: .destructive) { (action) in
      DataManager.shared.deleteMemo(self.memo)
      self.navigationController?.popViewController(animated: true)
    }
    let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
    alert.addAction(deleteAction)
    alert.addAction(cancelAction)
    present(alert, animated: true, completion: nil)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination.children.first as? ComposeViewController {
      vc.editTarget = memo
    }
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    memoTableView.reloadData()
  }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension DetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
      cell.textLabel?.text = memo?.content
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
      cell.textLabel?.text = formatter.string(for: memo?.insertDate)
      return cell
    default:
      fatalError()
    }
  }
}
