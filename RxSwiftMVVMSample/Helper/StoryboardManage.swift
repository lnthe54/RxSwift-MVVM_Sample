//
//  StoryboardManage.swift
//  RxSwiftMVVMSample
//
//  Created by The Ngoc on 2022/06/11.
//

import Foundation
import UIKit

struct StoryboardManage {
    
    static let homeStoryBoard = UIStoryboard(name: "Home", bundle: nil)
    static let HomeScreenIdentity: String = "HomeScreen"
    
    static func instanceHomeScreen() -> HomeScreen {
        return homeStoryBoard.instantiateViewController(withIdentifier: HomeScreenIdentity) as! HomeScreen
    }
}
