//
//  ViewController.swift
//  LockDownPractise
//
//  Created by Saket Kumar on 29/04/20.
//  Copyright © 2020 Saket Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var downloadButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf") else{return}
        
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        
        let downloadTask = urlSession.downloadTask(with:url)
        downloadTask.resume()
        
        
        
    }
    
}

extension ViewController:URLSessionDownloadDelegate{
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        print("Download Location:",location)
        
        guard let url = downloadTask.originalRequest?.url else { return }
        
        print("last component:",url.lastPathComponent)
        
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
        // delete original copy
        try? FileManager.default.removeItem(at: destinationURL)
        // copy from temp to Document
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            print("Destination URL:",destinationURL)
            //self.pdfURL = destinationURL
        } catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }
    }
    
    
}

