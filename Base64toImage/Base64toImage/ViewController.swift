//
//  ViewController.swift
//  Base64toImage
//
//  Created by Admin on 02/07/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var detailData: Weather!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDatafromAPI()
    }

    func getDatafromAPI(){
        DataService.shareIntance.getData{data in
            self.detailData = data
            self.display()
        }
    }
    
    func display(){
        
       let setupURL = "https:" + detailData.current.condition.icon
        print(setupURL)
        DispatchQueue.main.async {
            if let url = URL(string: setupURL) {
                if let data = NSData(contentsOf: url) {
                    self.image.image = UIImage(data: data as Data)
                }
            }
        }
        
        label.text = detailData.location.localtime
       
    }
    
    func formartDate(astring: String) {
        let date1 = DateFormatter()
        date1.dateFormat = "yyyy-MM-dd HH:mm"
        date1.timeStyle = .full
        date1.date(from: astring)
    }
}


