//
//  ViewController.swift
//  UIImageToCameraRole
//
//  Created by KOBAYASHI Jun on 2018/10/03.
//  Copyright © 2018年 KOBAYASHI Jun. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UIImage インスタンスの生成
        let targetImage:UIImage = UIImage(named:"map_pin_shadow.png")!
        
        // UIImage の画像をカメラロールに画像を保存
        UIImageWriteToSavedPhotosAlbum(targetImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

}

