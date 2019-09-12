import Foundation
struct QuestionList {
    var qustopic: String!
    var qustCd: String!
    var question: [Question]!
    init() {
    }
}
struct Question {
    var quesNo: String!
    var Hint: String!
    var question: String!
    var qustopic: String!
    init() {
    }
}
