//
//  MyTableViewCell.swift
//  TableViewExample
//
//  Created by 김종권 on 2021/09/16.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    var model: String? {
        didSet { bind() }
    }

    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8.0

        return view
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)

        return label
    }()

    lazy var label2: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.isHidden = false
        label.text = "보조"

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(label2)

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
        ])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        update(selected)
    }

    private func update(_ selected: Bool) {
        label2.isHidden = !selected
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func bind() {
        label.text = model
    }
}
