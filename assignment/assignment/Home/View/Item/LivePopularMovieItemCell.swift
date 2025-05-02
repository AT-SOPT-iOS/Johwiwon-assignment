//
//  LivePopularLiveItemCell.swift
//  assignment
//
//  Created by 조휘원 on 5/2/25.
//

// MARK: - LivePopularMovieItemCell

import UIKit
import SnapKit

final class LivePopularMovieItemCell: UICollectionViewCell {
    static let identifier = "LivePopularMovieItemCell"

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: LivePopularMovie) {
        imageView.image = item.image
    }

    private func setupView() {
        [imageView].forEach{
            contentView.addSubview($0)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }

    private func setLayout() {
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
