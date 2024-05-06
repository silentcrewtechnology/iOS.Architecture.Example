//
//  StartVC.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import UIKit

final class StartVC: UIViewController, ViewProtocol {
   
    struct ViewProperties {
        
    }
    
    var viewProperties: ViewProperties
    
    public init(viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
    func update(with viewProperties: ViewProperties) {
        
    }
}
