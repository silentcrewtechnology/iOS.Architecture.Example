// 
//  HomeVC.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 14.11.2024.
//

import Architecture
import UIKit

public final class HomeVC: UIViewController, ViewProtocol {
   
    deinit {
        print("💀 удалился HomeScreenController")
    }
    
    public struct ViewProperties {
        var accessibilityId = "HomeScreenController"
        var logoView: UIView
        var loginLabelView: UIView
        var loginInputView: UIView
        var passwordLabelView: UIView
        var passwordInputView: UIView
        var buttonView: UIView
        // Здесь описываются свойства вью
        // и остальные нужные для ViewController параметры
        
        public init(
            accessibilityId: String = "HomeScreenController",
            logoView: UIView = .init(),
            loginLabelView: UIView = .init(),
            loginInputView: UIView = .init(),
            passwordLabelView: UIView = .init(),
            passwordInputView: UIView = .init(),
            buttonView: UIView = .init()
        ) {
            self.accessibilityId = accessibilityId
            self.logoView = logoView
            self.loginLabelView = loginLabelView
            self.loginInputView = loginInputView
            self.passwordLabelView = passwordLabelView
            self.passwordInputView = passwordInputView
            self.buttonView = buttonView
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
        view.backgroundColor = .systemCyan
    }
    
    public func update(with viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        setupSubview()
        setupAccessibilityId()
        // Здесь обновляем все свойства вью
    }
    
    // MARK: Private funcs
    private func setupSubview() {
        // Здесь мы добавляем вьюхи и настраиваем констрейнты
        setuplogoView(with: viewProperties)
        setuploginViews(with: viewProperties)
        setupPasswordViews(with: viewProperties)
        setupButtonView(with: viewProperties)
    }
    
    private func setuplogoView(with viewProperties: ViewProperties) {
        let logo = viewProperties.logoView
        guard logo.superview != view else { return }
        view.addSubview(logo)
        logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(28)
            $0.width.equalTo(160)
            $0.height.equalTo(120)
        }
    }
    
    private func setuploginViews(with viewProperties: ViewProperties) {
        let loginLabelView = viewProperties.loginLabelView
        let loginInputView = viewProperties.loginInputView
        guard loginLabelView.superview != view,
              loginInputView.superview != view else { return }
        
        view.addSubview(loginLabelView)
        loginLabelView.snp.makeConstraints {
            $0.top.equalTo(viewProperties.logoView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(38)
            $0.trailing.equalToSuperview().offset(-38)
        }
        
        view.addSubview(loginInputView)
        loginInputView.snp.makeConstraints {
            $0.top.equalTo(viewProperties.loginLabelView.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupPasswordViews(with viewProperties: ViewProperties) {
        let passwordLabelView = viewProperties.passwordLabelView
        let passwordInputView = viewProperties.passwordInputView
        guard passwordLabelView.superview != view,
              passwordInputView.superview != view else { return }
        
        view.addSubview(passwordLabelView)
        passwordLabelView.snp.makeConstraints {
            $0.top.equalTo(viewProperties.loginInputView.snp.bottom)
            $0.leading.equalToSuperview().offset(38)
            $0.trailing.equalToSuperview().offset(-38)
        }
        
        view.addSubview(passwordInputView)
        passwordInputView.snp.makeConstraints {
            $0.top.equalTo(viewProperties.passwordLabelView.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupButtonView(with viewProperties: ViewProperties) {
        let buttonView = viewProperties.buttonView
        guard buttonView.superview != view else { return }
        view.addSubview(buttonView)
        buttonView.snp.makeConstraints {
            $0.top.equalTo(viewProperties.passwordInputView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
        }
    }
    
    // Заменить в Templates
    private func setupAccessibilityId() {
        view.isAccessibilityElement = true
        view.accessibilityIdentifier = viewProperties.accessibilityId
    }
}
