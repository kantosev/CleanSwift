//
//  TableViewCell.swift
//  ManagerOfTasksCleanSwift
//
//  Created by Аркадий Варежкин on 27.10.2024.
//

import UIKit

protocol CellProtocol {
    var cellModel: TaskViewModelProtocol? { get set }
}

class TableViewCell: UITableViewCell, CellProtocol {
    
    var cellModel: TaskViewModelProtocol? {
        didSet {
            updateViews()
        }
    }

    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - init()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        setLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    private func setLabel() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    private func updateViews() {
        guard let cellModel = cellModel as? TableModel.ViewModel.TaskViewModel else { return }
//        var content = defaultContentConfiguration()
//        content.text = cellModel.title
//        contentConfiguration = content
        label.text = cellModel.title
    }

}
