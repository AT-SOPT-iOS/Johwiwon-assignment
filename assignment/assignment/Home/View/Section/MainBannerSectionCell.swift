//
//  TodayTvingItemCell.swift
//  assignment
//
//  Created by 조휘원 on 5/1/25.
//

// MARK: - MainBannerSectionCell

import UIKit
import SnapKit

final class MainBannerSectionCell: UICollectionViewCell {
    static let identifier = "MainBannerSectionCell"

    private let imageView: UIImageView = {
        let imageView=UIImageView()
        imageView.image = UIImage(named: "image 13")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLayout()
    }

    private func setupView() {
        [imageView].forEach {
            contentView.addSubview($0)
        }
    }

    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
