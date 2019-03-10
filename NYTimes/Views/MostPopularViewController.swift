//
//  MostPopularViewController.swift
//  NYTimes
//
//  Created by Fathi2 on 3/9/19.
//

import UIKit

class MostPopularViewController: BaseViewController {
    
    var mostPopularViewModel: MostPopularViewModel {
        guard let viewModel = viewModel as? MostPopularViewModel else {
            fatalError("viewModel does not exist")
        }
        return viewModel
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(MostPopularTableCell.self, forCellReuseIdentifier: MostPopularTableCell.identifier)
        return tableView
    }()
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(tableView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    override func setupContentData() {
        super.setupContentData()
        navigationItem.title = mostPopularViewModel.title
        view.showSpinner()
        mostPopularViewModel.getArticles { error in
            self.view.hideSpinner()
            if error != nil {
                UIAlertController.alert(title: "Error", message: error?.localizedDescription).addOk().present(on: self)
            } else {
                self.tableView.reloadData()
            }
        }
    }

}

extension MostPopularViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mostPopularViewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MostPopularTableCell.identifier, for: indexPath) as? MostPopularTableCell else {
            fatalError("MostPopularTableCell cannot be dequeued")
        }
        cell.accessoryType = .disclosureIndicator
        cell.article = mostPopularViewModel.articles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !mostPopularViewModel.animatedCells.contains(indexPath) {
            mostPopularViewModel.animatedCells.append(indexPath)
            cell.transform = CGAffineTransform.identity.translatedBy(x: 0, y: view.frame.height)
            mostPopularViewModel.currentlyAnimatingCells += 1
            let delay = TimeInterval(0.085 * Double(mostPopularViewModel.currentlyAnimatingCells))
            UIView.animate(withDuration: 0.6, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: { _ in
                self.mostPopularViewModel.currentlyAnimatingCells -= 1
            })
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}
