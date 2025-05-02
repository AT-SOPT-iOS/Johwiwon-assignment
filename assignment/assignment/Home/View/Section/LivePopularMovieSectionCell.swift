//
//  TodayTvingItemCell.swift
//  assignment
//
//  Created by 조휘원 on 5/1/25.
//

// MARK: - LivePopularMovieSectionCell

import SnapKit
import UIKit

final class LivePopularMovieSectionCell: UICollectionViewCell,
    UICollectionViewDelegate
{
    static let identifier = "LivePopularMovieSectionCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 영화"
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()

    private let horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private var items: [LivePopularMovie] = []

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLayout()
        setupCollectionView()
    }

    func configure(with items: [LivePopularMovie]) {
        self.items = items
        horizontalCollectionView.reloadData()
    }

    private func setupView() {
        [titleLabel, horizontalCollectionView].forEach {
            contentView.addSubview($0)
        }
    }

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.leading.equalToSuperview().inset(12)
        }
        horizontalCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(9)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(170)
        }
    }

    private func setupCollectionView() {
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.register(
            LivePopularMovieItemCell.self,
            forCellWithReuseIdentifier: LivePopularMovieItemCell.identifier
        )
    }
}

extension LivePopularMovieSectionCell: UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return items.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LivePopularMovieItemCell.identifier,
                for: indexPath
            ) as? LivePopularMovieItemCell
        else {
            return UICollectionViewCell()
        }

        let item = items[indexPath.item]
        cell.configure(with: item)

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
}
