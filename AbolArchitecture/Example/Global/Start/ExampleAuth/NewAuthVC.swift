// 
//  NewAuthVC.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 28.02.2025.
//

import Architecture
import UIKit

public final class NewAuthVC: UIViewController, ViewProtocol {
    
    deinit {
        print("💀 удалился NewAuthScreenController")
    }
    
    let logo = UIImageView(image: UIImage(named: "Ak Bars Logotype") ?? UIImage())
    
    public struct ViewProperties {
        var accessibilityId = "NewAuthScreenController"
        var imageView: UIView
        var inputAddCardView: UIView
        var buttonView: UIView
        var scanButtonView: UIView
        // Здесь описываются все внутренние View
        // и остальные нужные для ViewController параметры
        
        public init(
            accessibilityId: String = "NewAuthScreenController",
            imageView: UIView = .init(),
            inputAddCardView: UIView = .init(),
            buttonView: UIView = .init(),
            scanButtonView: UIView = .init()
        ) {
            self.accessibilityId = accessibilityId
            self.imageView = imageView
            self.inputAddCardView = inputAddCardView
            self.buttonView = buttonView
            self.scanButtonView = scanButtonView
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
        view.backgroundColor = .white
        setupSubviews()
        setupAccessibilityId()
    }
}

// MARK: Private funcs
extension NewAuthVC {
    
    private func setupSubviews() {
        // Здесь мы добавляем вьюхи и настраиваем констрейнты
        setuplogoView(with: viewProperties)
        setuploginViews(with: viewProperties)
        setupButtonView(with: viewProperties)
        setupScanButtonView(with: viewProperties)
    }
    
    private func setuplogoView(with viewProperties: ViewProperties) {
        view.addSubview(logo)
        logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(36)
            $0.width.equalTo(123)
            $0.height.equalTo(24)
        }
    }
    
    private func setuploginViews(with viewProperties: ViewProperties) {
        let inputAddCardView = viewProperties.inputAddCardView
        guard inputAddCardView.superview != view
        else { return }
        
        view.addSubview(inputAddCardView)
        inputAddCardView.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-4)
        }
    }
    
    private func setupButtonView(with viewProperties: ViewProperties) {
        let buttonView = viewProperties.buttonView
        guard buttonView.superview != view
        else { return }
        
        view.addSubview(buttonView)
        buttonView.snp.makeConstraints {
            $0.top.equalTo(viewProperties.inputAddCardView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupScanButtonView(with viewProperties: ViewProperties) {
        let scanButtonView = viewProperties.scanButtonView
        guard scanButtonView.superview != view
        else { return }
        
        view.addSubview(scanButtonView)
        scanButtonView.snp.makeConstraints {
            $0.top.equalTo(viewProperties.buttonView.snp.bottom).offset(80)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func setupAccessibilityId() {
        view.isAccessibilityElement = true
        view.accessibilityIdentifier = viewProperties.accessibilityId
    }
}
