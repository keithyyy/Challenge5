//
//  DetailViewController.swift
//  Challenge5
//
//  Created by Keith Crooc on 2021-10-09.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    var webView: WKWebView!
    var countryFacts: Country?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let countryFacts = countryFacts else { return }
        
        self.title = "\(countryFacts.name)"
//        this changes the title to be the country selected
        
        let html = """
            <html>
            <head>
                <meta name="viewport" content="width-device-width, initial-scale=1">
                <style> body { font-size: 150%; background-color: black; color: white } </style>
            <body>
            <h1> \(countryFacts.name) </h1>
            <h3>Capital: \(countryFacts.capital) </h3>
            
            <p style={font=size: 120%; color: blue}> \(countryFacts.fact1) </p>
            
            
            </body>
            
            </head>
            </html>
            
            """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
}
