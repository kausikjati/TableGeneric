//
//  ControllerModel.swift
//  jsonDecode
//
//  Created by Kausik Jati on 10/07/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class ControllerModel: NSObject {
    var callBack : (() -> Void)?
    var tuotials = [Tutorial]()
    
    func getDat() {
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else { return  }
        URLClass.sharedInstance.getData(for: url) {[weak self] (tutorial, error) -> (Void) in
            guard error == nil else {
                return
            }
            guard let tutorial = tutorial else { return }
            self?.tuotials = tutorial
            if self?.callBack != nil{
                self?.callBack!()
            }
        }
    }
    
    func numberOfrow(_ section : Int) -> Int {
        return tuotials.count
    }
    func getItem(_ indexpath: IndexPath) -> Tutorial {
        return tuotials[indexpath.row]
    }
}
