//
//  Untitled.swift
//  assignment
//
//  Created by 조휘원 on 5/2/25.
//

import UIKit

final class HomeHeaderView: UIView {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image 94")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ic_search"), for: .normal)
        return button
    }()

    private let iconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "image 113"), for: .normal)
        return button
    }()

    private let categoryStackView: UIStackView = {
        let titles = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
        let labels = titles.map { title -> UILabel in
            let label = UILabel()
            label.text = title
            label.textColor = .white
            label.font = .systemFont(ofSize: 14)
            return label
        }
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tvBlack
        setupView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        [logoImageView, searchButton, iconButton, categoryStackView].forEach {
            addSubview($0)
        }
    }

    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalToSuperview()
            $0.height.equalTo(78)
        }
        
        iconButton.snp.makeConstraints{
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalToSuperview().inset(11)
            $0.size.equalTo(30)
        }
        
        searchButton.snp.makeConstraints{
            $0.centerY.equalTo(logoImageView)
            $0.trailing.equalTo(iconButton.snp.leading).offset(-10)
            $0.size.equalTo(30)
        }
        
        categoryStackView.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }

}
