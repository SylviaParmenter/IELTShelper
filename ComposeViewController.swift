import UIKit
class ComposeViewController: UIViewController {
  var editTarget: Memo?
  @IBOutlet weak var memoTextView: UITextView!
  @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  var willShowToken: NSObjectProtocol?
  var willHideToken: NSObjectProtocol?
  deinit {
    if let token = willShowToken {
      NotificationCenter.default.removeObserver(token)
    }
    if let token = willHideToken {
      NotificationCenter.default.removeObserver(token)
    }
  }
  @IBAction func save(_ sender: Any) {
    let memo = memoTextView.text
    if let editTarget = editTarget {
      editTarget.content = memo
      DataManager.shared.saveContext()
    } else {
      DataManager.shared.addNewMemo(memo)
    }
    dismiss(animated: true, completion: nil)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.memoTextView.endEditing(true)
    print("Hi")
  }
    override func viewDidLoad() {
        super.viewDidLoad()
      if let memo = editTarget {
        navigationItem.title = "Edit note"
        memoTextView.text = memo.content
      } else {
        navigationItem.title = "New note"
        memoTextView.text = ""
      }
      willShowToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
        guard let strongSelf = self else { return }
        if let frame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
          let height = frame.cgRectValue.height
          var inset = strongSelf.memoTextView.contentInset
          inset.bottom = height
          strongSelf.memoTextView.contentInset = inset
          inset = strongSelf.memoTextView.scrollIndicatorInsets
          inset.bottom = height
          strongSelf.memoTextView.scrollIndicatorInsets = inset
        }
      })
      willHideToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
        guard let strongSelf = self else { return }
        var inset = strongSelf.memoTextView.contentInset
        inset.bottom = 0
        strongSelf.memoTextView.contentInset = inset
        inset = strongSelf.memoTextView.scrollIndicatorInsets
        inset.bottom = 0
        strongSelf.memoTextView.scrollIndicatorInsets = inset
      })
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    memoTextView.becomeFirstResponder()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    memoTextView.resignFirstResponder()
  }
}
