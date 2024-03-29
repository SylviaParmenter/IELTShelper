import UIKit
import Foundation
import CoreData
@objc(ExamDB)
public class ExamDB: NSManagedObject {
    static func insert(_ examList:ExamList) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let myEntityName = "ExamDB"
        let examDB: ExamDB = (NSEntityDescription.insertNewObject(forEntityName: myEntityName, into: context)) as! ExamDB
        examDB.createtime = examList.createtime
        examDB.question = examList.question
        examDB.qustopic = examList.qustopic
        examDB.voiceAudio = examList.voiceAudio
        do {
            try context.save()
            return true
        } catch let error as NSError {
            print("JournalDB.insertWithDbName error: \(error.userInfo)")
            return false
        }
    }
    static func getExamList() -> [[String: Any]]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let entityName = "ExamDB"
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.resultType = .dictionaryResultType
        request.returnsDistinctResults = true
        var dics = [[String: Any]]()
        do {
            let result = try context.fetch(request) as! [[String: Any]]
            dics = result
            return dics
        }catch let error as NSError {
            print("dbInsert save error \(error), \(error.userInfo)")
            return dics
        }
    }
    static func delete(_ voiceAudio:String) -> Bool{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let entityName = "ExamDB"
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "voiceAudio = %@", voiceAudio)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest) as! [NSManagedObject]
            for managedObject in results {
                let managedObjectData:NSManagedObject = managedObject as NSManagedObject
                context.delete(managedObjectData)
            }
            appDelegate.saveContext()
            return true
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
            return false
        }
    }
}
