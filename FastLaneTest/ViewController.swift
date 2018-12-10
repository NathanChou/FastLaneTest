//
//  ViewController.swift
//  FastLaneTest
//
//  Created by 周彥宏 on 2018/12/4.
//  Copyright © 2018 周彥宏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images: UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.darkGray;
        
        images = UIImageView();
        self.view.addSubview(images);
        
        images.contentMode = .scaleAspectFit;
        images.image = UIImage(named: "test");
        
        images.translatesAutoresizingMaskIntoConstraints = false;
        images.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true;
        images.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true;
        images.widthAnchor.constraint(equalToConstant: 150).isActive = true;
        images.heightAnchor.constraint(equalToConstant: 150).isActive = true;
        
    }


}

