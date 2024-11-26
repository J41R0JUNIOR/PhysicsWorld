//
//  PhysicsScene.swift
//  PhysicsWorld
//
//  Created by Jairo Júnior on 26/11/24.
//

import UIKit

class PhysicsScene: UIViewController {
    var text: String
    let label = UILabel()
    
    init(text: String) {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

       setupStyle()
        addViews()
        addContrains()
        
    }
}

extension PhysicsScene: ViewCode {
    func addViews() {
        view.addSubview(label)
    }
    
    func addContrains() {
        
    }
    
    func setupStyle() {
      
        label.text = text
        label.textAlignment = .center
        label.frame = view.bounds
       
    }
    
    
}
