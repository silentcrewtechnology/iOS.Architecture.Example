//
//  StartVC.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//

import Architecture
import UIKit

public final class StartVC: UIViewController, ViewProtocol {
    
    deinit {
        print("💀 удалился StartVC")
    }
    
    public struct ViewProperties {
        var accessibilityId = "AuthScreenController"
        
        public init(
            accessibilityId: String = "AuthScreenController"
        ) {
            self.accessibilityId = accessibilityId
        }
    }
    
    private var viewProperties: ViewProperties
    
    public init(viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func update(with viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        setupSubview()
        setupAccessibilityId()
    }
    
    // MARK: Private funcs
    private func setupSubview() { }
    
    private func setupAccessibilityId() {
        view.isAccessibilityElement = true
        view.accessibilityIdentifier = viewProperties.accessibilityId
    }
}
