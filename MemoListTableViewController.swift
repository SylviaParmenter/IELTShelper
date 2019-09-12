import UIKit
class MemoListTableViewController: UITableViewController {
  let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
  }()
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
      let target = DataManager.shared.memoList[indexPath.row]
      if let vc = segue.destination as? DetailViewController {
        vc.memo = target
      }
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    DataManager.shared.fetchMemo()
    tableView.tableFooterView = UIView.init()
    tableView.reloadData()
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return DataManager.shared.memoList.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let target = DataManager.shared.memoList[indexPath.row]
    cell.textLabel?.text = target.content
    cell.detailTextLabel?.text = formatter.string(for: target.insertDate)
    return cell
  }
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let target = DataManager.shared.memoList[indexPath.row]
      DataManager.shared.deleteMemo(target)
      DataManager.shared.memoList.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
    }
  }
}
