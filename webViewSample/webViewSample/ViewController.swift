//
//  ViewController.swift
//  webViewSample
//
//  Created by 西田創 on 2016/03/27.
//  Copyright © 2016年 HajimeNishida. All rights reserved.
//

import UIKit

// twitterなどのSocialへ投稿する際に必要な機能を外部から読み込むための初期化を行います。
import Social

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    //表示したいURLを設定(初期化)
    var targetURL = "http://rakutenqute.herokuapp.com/"
    
    // twitter投稿画面を生成するための初期化
    var myTComposeView : SLComposeViewController!
    // twitter用のボタンを生成するための初期化
    var myTwitterButton: UIButton!
    
    // facebook用のボタンを生成するための初期化
    var myFacebookButton: UIButton!
    // facebook用のボタンを生成するための初期化
    var myFComposeView : SLComposeViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // webViewを表示するためのメソッド呼び出し
        loadAddressURL()
        
        // twitterに似た色合いをコードで生成するための設定。色味のみの設定
        let hex: Int = 0x55ACEE
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        let myColor: UIColor = UIColor( red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(1.0))
        
        
        // twitter用のボタンを設定。ボタンを押された後にtwitter投稿用のメソッド呼び出しまで設定
        myTwitterButton = UIButton()
        myTwitterButton.frame = CGRectMake(0,0,100,100)
        myTwitterButton.backgroundColor = myColor
        myTwitterButton.layer.masksToBounds = true
        myTwitterButton.setTitle("T", forState: UIControlState.Normal)
        myTwitterButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(30))
        myTwitterButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myTwitterButton.layer.cornerRadius = 50.0
        myTwitterButton.layer.position = CGPoint(x: self.view.frame.width - 55, y:self.view.frame.height - 115)
        myTwitterButton.tag = 1
        myTwitterButton.addTarget(self, action: #selector(ViewController.onPostToTwitter(_:)), forControlEvents: .TouchUpInside)
       
        // facebook用のボタンを設定。ボタンを押された後にfacebook投稿用のメソッド呼び出しまで設定
        myFacebookButton = UIButton()
        myFacebookButton.frame = CGRectMake(0,0,100,100)
        myFacebookButton.backgroundColor = UIColor.blueColor()
        myFacebookButton.layer.masksToBounds = true
        myFacebookButton.setTitle("F", forState: UIControlState.Normal)
        myFacebookButton.titleLabel?.font = UIFont.systemFontOfSize(CGFloat(30))
        myFacebookButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        myFacebookButton.layer.cornerRadius = 50.0
        myFacebookButton.layer.position = CGPoint(x: self.view.frame.width - 320, y:self.view.frame.height - 115)
        myFacebookButton.tag = 1
        myFacebookButton.addTarget(self, action: #selector(ViewController.onPostToFacebook(_:)), forControlEvents: .TouchUpInside)
        // twitter用のボタンを画面に表示させるための設定
        self.view.addSubview(myTwitterButton)
        // facebook用のボタンを画面に表示させるための設定
        self.view.addSubview(myFacebookButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadAddressURL(){
        
        // 初期化済みのURLを読み込み
        let requestURL = NSURL(string: targetURL)
        
        // 読み込んだURLの実行結果を取得
        let req = NSURLRequest(URL:requestURL!)
        
        // webvieにデータをロード
        webView.loadRequest(req)
        webView.scalesPageToFit = true
    }
    // twitterボタンが押された時に実行される処理内容
    func onPostToTwitter(sender : AnyObject) {
        myTComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        myTComposeView.setInitialText("アプリ開発中！  #SweetSwift #&Code #スウィスウィ")
        self.presentViewController(myTComposeView, animated: true, completion: nil)
    }
    // facebookボタンが押された時に実行される処理内容
    func onPostToFacebook(sender : AnyObject) {
        myFComposeView = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        myFComposeView.setInitialText("アプリ開発中！  #SweetSwift #&Code #スウィスウィ")
        self.presentViewController(myFComposeView, animated: true, completion: nil)
    }

}

