//
//  CallAPI.swift
//  RxSwiftMVVMSample
//
//  Created by The Ngoc on 2022/06/11.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol CallAPIDelegate {
    func getListNewBook(completion: @escaping ([Book]) -> Void)
    func getListBook(completion: @escaping ([Book]) -> Void)
}

class CallAPI: CallAPIDelegate {
    
    static let shared = CallAPI()
    
    let HOST_URL = "https://theln-book.herokuapp.com/"
    
    func getListNewBook(completion: @escaping ([Book]) -> Void) {
        request(withPath: "books/new-ebooks", successCompletion: { (response: BookContainer) in
            if let lstBook = response.book {
                completion(lstBook)
            }
        })
    }
    
    func getListBook(completion: @escaping ([Book]) -> Void) {
        request(withPath: "books", successCompletion: { (response: BookContainer) in
            if let lstBook = response.book {
                completion(lstBook)
            }
        })
    }
    
    func request<T: Mappable>(withPath path: String, successCompletion: @escaping (T) -> Void,
                              failCompletion: (() -> Void)? = nil) {
        guard let url = URL(string: "\(HOST_URL)\(path)") else {
            return
        }
        
        Alamofire.request(url).responseObject { (response: DataResponse<T>) in
            switch response.result {
            case .success:
                if let result = response.result.value {
                    successCompletion(result)
                }
            case .failure(_):
                failCompletion?()
            }
        }
    }
}
