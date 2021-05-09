//
//  AddViewController.swift
//  original
//
//  Created by AIKA MATSUI on 2021/03/28.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var motionLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var contentsTextField: UITextField!
    @IBOutlet var happybutton: UIButton!
    @IBOutlet var smilebutton: UIButton!
    @IBOutlet var goodbutton: UIButton!
    @IBOutlet var sadbutton: UIButton!
    
    //どの顔文字アイコンが押されたかを番号で格納する変数を宣言
    var feelingNumber: Int = 0
    
    
        
//        let date: String = dateTextField.text!
//        let contents: String = contentsTextField.text!
//
//        let diary: diary? = read()
//
//        if let diary = diary {
//            try! realm.write {
//                diary.date = date
//                diary.contents = contents
//            }
//        } else {
//            let newDiary = diary()
//            newDiary.date = date
//            newDiary.contents = contents
//
//            try! realm.write {
//                realm.add(newDiary)
//            }
            
            
        
//        let diaryDictionary = ["date": dateTextField.text!, "contents": contentsTextField.text!]
//
//        diaryArray.append(diaryDictionary)
//        saveData.set(diaryDictionary, forKey: "diary")
//
//
//        let alert = UIAlertController(
//            title: "保存完了",
//            message: "日記を追加しました",
//            preferredStyle: .alert
//        )
//        alert.addAction(UIAlertAction(
//            title: "OK",
//            style: .default,
//            handler: nil
//        ))
//        present(alert, animated: true, completion: nil)
//        dateTextField.text = ""
//        contentsTextField.text = ""
//
////        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
////                    // 0.5秒後に実行したい処理
////                     self.performSegue(withIdentifier: "セグエのid", sender: nil)
////                    }
        
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 }


    @IBAction func happybuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        
        feelingNumber = 0
        }
    
    @IBAction func smilebuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        
        feelingNumber = 1
        }
    
    @IBAction func goodbuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue2"), for: .normal)
        
        feelingNumber = 2
        }
    
    @IBAction func sadbuttonPush(_ sender: Any) {
        
        happybutton.setImage(UIImage(named: "orange2"), for: .normal)
        smilebutton.setImage(UIImage(named: "pink2"), for: .normal)
        goodbutton.setImage(UIImage(named: "green2"), for: .normal)
        sadbutton.setImage(UIImage(named: "blue"), for: .normal)
        
        feelingNumber = 3
        }
    
    
    @IBAction func savediary() {
        let diary: Diary = Diary() //モデルのインスタンス化
        
        diary.date = self.dateTextField.text!
        diary.feelingNumber = self.feelingNumber
        diary.contents = self.contentsTextField.text!
        
        let realm = try! Realm() //Realmの初期化
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        print (feelingNumber)
        try! realm.write {
            realm.add(diary.self) // Realmに追加
        }
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました", preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            _ in
            self.dismiss(animated:true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)

    }
}
