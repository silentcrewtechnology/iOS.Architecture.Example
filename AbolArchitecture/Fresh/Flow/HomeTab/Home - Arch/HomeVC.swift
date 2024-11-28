// 
//  HomeVC.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 14.11.2024.
//

import Architecture
import UIKit

final class HomeVC: UIViewController, ViewProtocol {
   
    deinit {
        print("💀 удалился HomeScreenController")
    }
    
    struct ViewProperties {
        var accessibilityId = "HomeScreenController"
        var buttonView: UIView
        var inputView: UIView
        var labelView: UIView
        // Здесь описываются свойства вью
        // и остальные нужные для ViewController параметры
        
        public init(
            accessibilityId: String = "HomeScreenController",
            buttonView: UIView = .init(),
            inputView: UIView = .init(),
            labelView: UIView = .init()
        ) {
            self.accessibilityId = accessibilityId
            self.buttonView = buttonView
            self.inputView = inputView
            self.labelView = labelView
        }
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
        view.backgroundColor = .systemCyan
    }
    
// Заменить в Templates
    func update(with viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        setupSubview()
        setupAccessibilityId()
        // Здесь обновляем все свойства вью
    }
    
    // MARK: Private funcs
    
// Заменить в Templates
//    private func configureViews() {
//        // Здесь настраиваем внутренние свойства - то, что не будет меняться
//    }
    
// Заменить в Templates
    private func setupSubview() {
        // Здесь мы добавляем вьюхи и настраиваем констрейнты
        setupInputView(with: viewProperties)
        setupButtonView(with: viewProperties)
        setupLabelView(with: viewProperties)
    }
    
    private func setupInputView(with viewProperties: ViewProperties) {
        let inputView = viewProperties.inputView
        guard inputView.superview != view else { return }
        view.addSubview(inputView)
        inputView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-40)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupButtonView(with viewProperties: ViewProperties) {
        let buttonView = viewProperties.buttonView
        guard buttonView.superview != view else { return }
        view.addSubview(buttonView)
        buttonView.snp.makeConstraints {
            $0.top.equalTo(viewProperties.inputView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
    }
    
    private func setupLabelView(with viewProperties: ViewProperties) {
        let labelView = viewProperties.labelView
        guard labelView.superview != view else { return }
        view.addSubview(labelView)
        labelView.snp.makeConstraints {
            $0.bottom.equalTo(viewProperties.inputView.snp.top).offset(-16)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
        }
    }
    
    // Заменить в Templates
    private func setupAccessibilityId() {
        view.isAccessibilityElement = true
        view.accessibilityIdentifier = viewProperties.accessibilityId
    }
}
