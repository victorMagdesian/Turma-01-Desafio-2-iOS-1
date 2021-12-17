//
//  WebViewController.swift
//  TesteIosModal
//
//  Created by VICTOR FELIPPE MAGDESIAN on 17/12/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var coordinator: MainCoordinator?
    var url: URL?

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
        
    }
    



}
