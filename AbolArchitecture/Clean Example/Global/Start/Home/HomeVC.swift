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
        var buttonView: UIView
        var titleNameView: UIView
        // Здесь описываются все внутренние View
        // и остальные нужные для ViewController параметры
        
        public init(
            accessibilityId: String = "HomeScreenController",
            buttonView: UIView = .init(),
            titleNameView: UIView = .init()
        ) {
            self.accessibilityId = accessibilityId
            self.buttonView = buttonView
            self.titleNameView = titleNameView
        }
    }
    
    // MARK: Properties
    // Здесь хранятся свойства вью, чтобы вызывать экшены
    var viewProperties: ViewProperties
    
    // MARK: Init
    public init(viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .systemCyan
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
        setupTitleView(with: viewProperties)
        sutupButtonView(with: viewProperties)
    }
    
    private func setupTitleView(with: ViewProperties) {
        let title = viewProperties.titleNameView
        guard title.superview != view else { return }
        view.addSubview(title)
        title.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-60)
            $0.leading.equalToSuperview().offset(16)
        }
    }
    
    private func sutupButtonView(with: ViewProperties) {
        let button = viewProperties.buttonView
        guard button.superview != view else { return }
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(viewProperties.titleNameView.snp.bottom).offset(26)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func setupAccessibilityId() {
        view.isAccessibilityElement = true
        view.accessibilityIdentifier = viewProperties.accessibilityId
    }
}
