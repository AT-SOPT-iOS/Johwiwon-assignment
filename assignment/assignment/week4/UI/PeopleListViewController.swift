//
//  PeopleListViewController.swift
//  assignment
//
//  Created by 조휘원 on 5/13/25.
//

import SnapKit
import Then
import UIKit

final class PeopleListViewController: UIViewController {

    // MARK: - Properties

    private var people: [Person] = []

    private let tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        $0.rowHeight = 60
    }

    private let titleLabel = UILabel().then {
        $0.text = "🎬 영화 인물 리스트 🎬"
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textAlignment = .center
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadData()
        setupLayout()
        setupTableView()

    }

    // MARK: - Load
    private func loadData() {
        Task {
            do {
                self.people = try await PeopleService.shared.fetchPeopleList(
                    apiKey: "",
                    name: nil
                )
                self.tableView.reloadData()
            } catch {
                print("오류:", error)
            }
        }
    }

    // MARK: - Setup

    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension PeopleListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath
        )
        let person = people[indexPath.row]
        cell.textLabel?.text = "\(person.peopleNm) (\(person.repRoleNm))"
        return cell
    }
}
