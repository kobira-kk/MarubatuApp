//
//  ViewController.swift
//  MarubatuApp
//
//  Created by 作成者名 on 2019/06/13.
//  Copyright © 2019 kk-project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // クイズラベルの紐付け
    @IBOutlet weak var questionLabel: UILabel!

    // 現在のクイズ番号を管理
    var currentQuestionNum: Int = 0

    // 問題を管理
    let questions: [[String: Any]] = [
        [ "question": "iPhoneアプリを開発する統合環境はZcodeである",
          "answer": false
        ],
        [ "question": "Xcode画面の右側にはユーティリティーズがある",
          "answer": true
        ],
        [ "question": "UILabelは文字列を表示する際に利用する",
          "answer": true
        ],
        [ "question": "ドラえもんは常に地面から浮いている",
          "answer": true
        ],
    ]

    // 問題を表示する関数
    func showQuestion() {
        let question = questions[currentQuestionNum]

        if let que = question["question"] as? String {
            questionLabel.text = que
        }
    }

    // 回答をチェックする関数
    // 正解なら次の問題を表示します
    func checkAnswer(yourAnswer: Bool) {

        let question = questions[currentQuestionNum]

        if let ans = question["answer"] as? Bool {

            if yourAnswer == ans {
                // 正解
                // currentQuestionNumを1足して次の問題に進む
                currentQuestionNum += 1
                showAlert(message: "正解！")
            } else {
                // 不正解
                showAlert(message: "不正解...")

            }
        }else{
            print("答えが入ってません")
            return
        }

        // currentQuestionNumの値が問題数以上だったら最初の問題に戻す
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }

        // 問題を表示します。
        // 正解であれば次の問題が、不正解であれば同じ問題が再表示されます。
        showQuestion()
    }

    // アラートを表示する関数
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showQuestion()
    }

    // ◯ボタンの紐付け
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }

    // xボタンの紐付け
    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }

}

