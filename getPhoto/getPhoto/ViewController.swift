//
//  ViewController.swift
//  getPhoto
//
//  Created by miyazawaryohei on 2020/09/14.
//  Copyright © 2020 miya. All rights reserved.
//

import UIKit

final class ViewController: UIViewController{

    @IBOutlet var imageView: UIImageView!{
        didSet{
            //デフォルトの画像を設定
            imageView.image = UIImage(named: "image")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func getImage(_ sender: Any) {
        
        //カメラロールは利用可能か
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //写真を選ぶビュー
            let pickerView = UIImagePickerController()
            //写真の選択元をカメラロールにする（.cameraにすればカメラを起動する）
            pickerView.sourceType = .photoLibrary
            //デリゲート
            pickerView.delegate = self
            //ビューに表示
            self.present(pickerView,animated: true)
        }
        
    }
    
    
    @IBAction func deleteImage(_ sender: Any) {
        showAlert()
    }
    
    
    
    func showAlert(){
        
        let alert = UIAlertController(title: "確認", message: "画像を削除します", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction) -> Void in
            self.imageView.image = UIImage(named: "image")
        })
        
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    }
    extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        // 写真を選んだ後に呼ばれる処理
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 選択した写真を取得する
            let image = info[.originalImage] as! UIImage
            // ビューに表示する
            imageView.image = image
            // 写真を選ぶビューを引っ込める
            self.dismiss(animated: true)
        }
    }
