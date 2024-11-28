////
////  TextFieldVC.swift
////  AbolArchitecture
////
////  Created by firdavs on 05.06.2024.
////
//
//import Architecture
//import UIKit
//
//final class TextFieldVC: UIViewController, ViewProtocol {
//   
//    struct ViewProperties {
//        let delegate: UITextFieldDelegate
//        var textFiledText: NSAttributedString
//        var labelText: NSAttributedString
//    }
//    
//    var viewProperties: ViewProperties
//    
//    private let textField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Input"
//        textField.textAlignment = .center
//        return textField
//    }()
//    private let label: UILabel = {
//        let label = UILabel()
//        label.attributedText = "Input result".attributed
//        label.textAlignment = .center
//        return label
//    }()
//    private let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.spacing = 8
//        return stackView
//    }()
//    
//    public init(viewProperties: ViewProperties) {
//        self.viewProperties = viewProperties
//        self.textField.delegate = viewProperties.delegate
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .white
//        addViews()
//    }
//    
//    func update(with viewProperties: ViewProperties) {
//        updateLabel(with: viewProperties)
//    }
//    
//    private func updateTextField(with viewProperties: ViewProperties) {
//        textField.attributedText = viewProperties.textFiledText
//    }
//    
//    private func updateLabel(with viewProperties: ViewProperties) {
//        label.attributedText = viewProperties.labelText
//    }
//    
//    private func addViews() {
//        self.view.addSubview(self.stackView)
//        self.stackView.addArrangedSubview(textField)
//        self.stackView.addArrangedSubview(label)
//        self.stackView.snp.makeConstraints {
//            $0.horizontalEdges.equalToSuperview()
//            $0.centerY.equalToSuperview()
//            $0.height.equalTo(200)
//        }
//    }
//}
//
