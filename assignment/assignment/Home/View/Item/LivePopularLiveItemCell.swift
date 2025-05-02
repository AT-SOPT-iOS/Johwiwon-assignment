//
//  LivePopularLiveItemCell.swift
//  assignment
//
//  Created by 조휘원 on 5/2/25.
//

// MARK: - LivePopularLiveItemCell

import SnapKit
import UIKit

final class LivePopularLiveItemCell: UICollectionViewCell {
    static let identifier = "LivePopularLiveItemCell"

    private let imageView = UIImageView()

    private let numLabel: UILabel = {
        let label = UILabel()
        let descriptor =
            UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
            .withSymbolicTraits(.traitItalic) ?? UIFontDescriptor()
        label.font = UIFont(descriptor: descriptor, size: 19)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .tvGray3
        label.textAlignment = .center
        return label
    }()

    private let viewRateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .tvGray3
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

    func configure(with item: LivePopularLive) {
        imageView.image = item.image
        numLabel.text = "\(item.number)"
        titleLabel.text = "\(item.title)"
        episodeLabel.text = "\(item.episode)"
        viewRateLabel.text = "\(item.viewRate)"
    }

    private func setupView() {
        [imageView, numLabel, titleLabel, episodeLabel, viewRateLabel].forEach {
            contentView.addSubview($0)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }

    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        numLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.leading.equalTo(imageView).inset(6)
            $0.height.equalTo(30)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(numLabel.snp.top)
            $0.leading.equalTo(numLabel.snp.trailing).offset(5)
            $0.height.equalTo(16)
        }
        episodeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(numLabel.snp.trailing).offset(5)
            $0.height.equalTo(16)
        }
        viewRateLabel.snp.makeConstraints {
            $0.top.equalTo(episodeLabel.snp.bottom)
            $0.leading.equalTo(numLabel.snp.trailing).offset(5)
            $0.height.equalTo(16)
            $0.bottom.lessThanOrEqualToSuperview().inset(4)
        }

    }
}
