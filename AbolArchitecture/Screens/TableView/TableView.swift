//
//  TableView.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import UIKit

public final class TableView: UITableView, ViewProtocol {
	
	public struct ViewProperties {
		public let allowsSelection: Bool
		public let separatorColor: UIColor
		public let backgroundColor: UIColor
		public let separatorInset: UIEdgeInsets
		public let dataSources: UITableViewDataSource
		public let delegate: UITableViewDelegate
		public var didTapGesture: ClosureEmpty = {}

		public init(
			allowsSelection: Bool = true,
			separatorColor: UIColor = .clear,
			backgroundColor: UIColor = .clear,
			separatorInset: UIEdgeInsets = .zero,
			dataSources: UITableViewDataSource,
			delegate: UITableViewDelegate,
			didTapGesture: @escaping ClosureEmpty = {}
		) {
			self.allowsSelection = allowsSelection
			self.separatorInset = separatorInset
			self.separatorColor = separatorColor
			self.backgroundColor = backgroundColor
			self.dataSources = dataSources
			self.delegate = delegate
			self.didTapGesture = didTapGesture
		}
	}
    
    var viewProperties: ViewProperties?
    
    init(viewProperties: ViewProperties, style: UITableView.Style) {
        self.viewProperties = viewProperties
        super.init(frame: .zero, style: style)
        setupTableView(with: viewProperties)
        addGesture()
    }
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func update(with viewProperties: ViewProperties) {
		self.viewProperties = viewProperties
		self.reloadData()
	}
	
	private func setupTableView(with viewProperties: ViewProperties) {
		self.delegate = viewProperties.delegate
		self.dataSource = viewProperties.dataSources
		self.reloadData()
		self.backgroundColor = viewProperties.backgroundColor
		self.separatorColor = viewProperties.separatorColor
		self.separatorInset = viewProperties.separatorInset
		self.allowsSelection = viewProperties.allowsSelection
		self.showsVerticalScrollIndicator = false
//		self.cornerRadius(
//			radius: 10,
//			direction: .allCorners,
//			clipsToBounds: true
//		)
		if #available(iOS 15.0, *) {
			sectionHeaderTopPadding = 0
		}
	}
	
	private func addGesture() {
		let hideGuest = UITapGestureRecognizer(
			target: self,
			action: #selector(didTapGesture)
		)
		hideGuest.cancelsTouchesInView = false
		self.addGestureRecognizer(hideGuest)
	}
	
	@objc 
	private func didTapGesture() {
		self.viewProperties?.didTapGesture()
	}
}
