//
//  TodayTvingItemCell.swift
//  assignment
//
//  Created by 조휘원 on 5/1/25.
//

// MARK: - TodayTvingItemCell

import UIKit
import SnapKit

final class TodayTvingItemCell: UICollectionViewCell {
    static let identifier = "TodayTvingItemCell"

    private let imageView = UIImageView()

    private let numLabel: UILabel = {
        let label = UILabel()
        let descriptor =
            UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
            .withSymbolicTraits(.traitItalic) ?? UIFontDescriptor()
        label.font = UIFont(descriptor: descriptor, size: 50)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: TodayTving) {
        imageView.image = item.image
        numLabel.text = "\(item.number)"
    }

    private func setupView() {
        [imageView, numLabel].forEach{
            contentView.addSubview($0)
        }
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }

    private func setLayout() {
        imageView.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(146)
        }
        numLabel.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.trailing.equalTo(imageView.snp.leading).offset(5)
            $0.height.equalTo(80)
        }
    }
}
