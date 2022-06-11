//
//  HomeViewModel.swift
//  RxSwiftMVVMSample
//
//  Created by The Ngoc on 2022/06/11.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    let books: PublishSubject<[Book]> = PublishSubject()
        
    func getListBook() {
        CallAPI.shared.getListBook { [weak self] books in
            guard let self = self else {
                return
            }
            
            self.books.onNext(books)
        }
    }
}
