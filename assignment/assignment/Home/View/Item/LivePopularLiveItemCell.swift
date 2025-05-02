//
//  LivePopularLiveItemCell.swift
//  assignment
//
//  Created by 조휘원 on 5/2/25.
//

// MARK: - LivePopularLiveItemCell

import UIKit
import SnapKit

final class LivePopularLiveItemCell: UICollectionViewCell {
    static let identifier = "LivePopularLiveItemCell"

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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let viewRateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
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

    func configure(with item: LivePopularLive) {
        imageView.image = item.image
        numLabel.text = "\(item.number)"
        titleLabel.text = item.title
        episodeLabel.text = item.episode
        viewRateLabel.text = item.episode
    }

    private func setupView() {
        [imageView, numLabel, titleLabel, episodeLabel, viewRateLabel].forEach{
            contentView.addSubview($0)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }

    private func setLayout() {
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        numLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(4)
            $0.height.equalTo(80)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.height.equalTo(80)
        }
        episodeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.height.equalTo(80)
        }
        viewRateLabel.snp.makeConstraints {
            $0.top.equalTo(episodeLabel.snp.bottom).offset(10)
            $0.height.equalTo(80)
        }
        
    }
}
