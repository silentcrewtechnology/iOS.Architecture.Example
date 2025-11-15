// 
//  BannersSecondVC.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import Architecture
import UIKit

public final class BannersSecondVC: UIViewController, ViewProtocol {
    
    deinit {
        print("💀 удалился BannersSecondScreenController")
    }
    
    public struct ViewProperties {
        var accessibilityId = "BannersSecondScreenController"
        var buttonView: UIView
        // Здесь описываются все внутренние View
        // и остальные нужные для ViewController параметры
        
        public init(
            accessibilityId: String = "BannersSecondScreenController",
            buttonView: UIView = .init()
        ) {
            self.accessibilityId = accessibilityId
            self.buttonView = buttonView
        }
    }
    
    // MARK: Properties
    // Здесь хранятся свойства вью, чтобы вызывать экшены
    var viewProperties: ViewProperties
    
    // MARK: Init
    public init(viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .systemMint
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
extension BannersSecondVC {
    
    private func setupSubviews() {
        // Здесь мы добавляем вьюхи и настраиваем констрейнты
        sutupButtonView(with: viewProperties)
    }
    
        // MARK: Пример
    private func sutupButtonView(with: ViewProperties) {
        let button = viewProperties.buttonView
        guard button.superview != view else { return }
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func setupAccessibilityId() {
        view.isAccessibilityElement = true
        view.accessibilityIdentifier = viewProperties.accessibilityId
    }
}
