//
//  HomeScreen.swift
//  RxSwiftMVVMSample
//
//  Created by The Ngoc on 2022/06/11.
//

import UIKit
import RxSwift
import RxCocoa

class HomeScreen: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var bookTableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        
        fetchData()
        bindData()
    }

    // MARK: - Private functions
    private func fetchData() {
        homeViewModel.getListBook()
    }

    private func bindData() {
        bookTableView.register(UINib(nibName: "BookCell", bundle: nil), forCellReuseIdentifier: "BookCell")
        homeViewModel.books
            .bind(to: bookTableView.rx.items(cellIdentifier: "BookCell", cellType: BookCell.self)) { index, elemennt, cell in
                cell.bindData(elemennt)
            }
            .disposed(by: disposeBag)
    }
}
