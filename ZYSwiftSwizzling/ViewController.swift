//
//  ViewController.swift
//  ZYSwiftSwizzling
//
//  Created by zy on 2022/1/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: ZYSwiftLoadFunctionProtocol {
    static func zy_load_function() {
        exchangeSwizzleMethod
    }
    
    private static let exchangeSwizzleMethod: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzled_viewWillAppear(_:))
        ZYSwiftSwizzling.zy_swizzlingForClass(ViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
    
    @objc func swizzled_viewWillAppear(_ animated: Bool) {
        swizzled_viewWillAppear(animated)
        print("swizzled_viewWillAppear")
    }
}

