// 
//  WelcomeVC.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 26.11.2024.
//

import Architecture
import UIKit

final class WelcomeVC: UIViewController, ViewProtocol {
   
    deinit {
        print("💀 удалился WelcomeScreenController")
    }
    
    struct ViewProperties {
        var accessibilityId: String
        var labelView: UIView
        // Здесь описываются свойства вью
        // и остальные нужные для ViewController параметры
        public init(
            accessibilityId: String = "HomeScreenController",
            labelView: UIView = .init()
        ) {
            self.accessibilityId = accessibilityId
            self.labelView = labelView
        }
    }
    
    // Здесь хранятся свойства вью, чтобы вызывать экшены
    var viewProperties: ViewProperties
    
    // Ниже создаем внутренние вью элементы
    // MARK: UI Elements
    
    // нужно заменить SomeView на твою View
    // var someView: SomeView?
    
    public init(viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setupSubview()
        view.backgroundColor = .systemCyan
    }
    
    // Ниже функции от ViewProtocol'а
    // MARK: ViewProtocol
    
    func update(with viewProperties: ViewProperties) {
        // Здесь обновляем все свойства вью
        self.viewProperties = viewProperties
        setupSubview()
        setupAccessibilityId(with: viewProperties)
    }
    
    // MARK: Private funcs
    
    private func configureViews() {
        // Здесь настраиваем внутренние свойства - то, что не будет меняться
    }
    
    private func setupSubview() {
        // Здесь мы добавляем вьюхи и настраиваем констрейнты
        setupLabelView(with: viewProperties)
    }
    
    private func setupLabelView(with viewProperties: ViewProperties) {
        let labelView = viewProperties.labelView
        guard labelView.superview != view else { return }
        view.addSubview(labelView)
        labelView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-40)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
        }
    }
    
    // Заменить в Templates
    private func setupAccessibilityId(with viewProperties: ViewProperties) {
        view.isAccessibilityElement = true
        view.accessibilityIdentifier = viewProperties.accessibilityId
    }
}
