// 
//  HomeVC.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import Architecture
import UIKit

public final class HomeVC: UIViewController, ViewProtocol {
    
    deinit {
        print("💀 удалился HomeScreenController")
    }
    
    public struct ViewProperties {
        var accessibilityId = "HomeScreenController"
        // var someView: UIView
        // Здесь описываются все внутренние View
        // и остальные нужные для ViewController параметры
        
        public init(
            accessibilityId: String = "HomeScreenController"
            // someView: UIView = .init()
        ) {
            self.accessibilityId = accessibilityId
            // self.someView = someView
        }
    }
    
    // MARK: Properties
    // Здесь хранятся свойства вью, чтобы вызывать экшены
    var viewProperties: ViewProperties
    
    // MARK: Init
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
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: ViewProtocol
    public func update(with viewProperties: ViewProperties) {
        // Здесь обновляем все свойства вью
        self.viewProperties = viewProperties
        setupSubviews()
        setupAccessibilityId()
    }
}

// MARK: Private funcs
extension HomeVC {
    
    private func setupSubviews() {
        // Здесь мы добавляем вьюхи и настраиваем констрейнты
        // sutupSomeView(with: viewProperties)
    }
    
        // MARK: Пример
    // private func sutupSomeView(with: ViewProperties) {
        // let some = viewProperties.somelogoView
        // guard some.superview != view else { return }
        // view.addSubview(some)
        // some.snp.makeConstraints {
        //     $0.centerX.equalToSuperview()
        //}
    // }
    
    private func setupAccessibilityId() {
        view.isAccessibilityElement = true
        view.accessibilityIdentifier = viewProperties.accessibilityId
    }
}
