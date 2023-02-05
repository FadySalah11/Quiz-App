//
//  Questions.swift
//  Quizz_App
//
//  Created by Fadi Salah on 29/01/2023.
//

import Foundation

struct Question {
    
    let text : String
    let answer : [String]
    let rightAnswer: String
    
    init(q:String,a:[String], correctAnswer: String){
    text = q
    answer  = a
    rightAnswer = correctAnswer
  }
}
