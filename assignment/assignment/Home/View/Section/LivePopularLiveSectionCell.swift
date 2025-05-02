//
//  TodayTvingItemCell.swift
//  assignment
//
//  Created by 조휘원 on 5/1/25.
//

// MARK: - TodayTvingSectionCell

import UIKit
import SnapKit

final class TodayTvingSectionCell: UICollectionViewCell {
    static let identifier = "TodayTvingSectionCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 티빙 TOP 20"
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

    private var items: [TodayTving] = []

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setLayout()
        setupCollectionView()
    }

    func configure(with items: [TodayTving]) {
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
            TodayTvingItemCell.self,
            forCellWithReuseIdentifier: TodayTvingItemCell.identifier
        )
    }
}

extension TodayTvingSectionCell: UICollectionViewDataSource,
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
                withReuseIdentifier: TodayTvingItemCell.identifier,
                for: indexPath
            ) as? TodayTvingItemCell
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
