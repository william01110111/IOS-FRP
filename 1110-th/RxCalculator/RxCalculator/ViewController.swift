//
//  ViewController.swift
//  RxCalculator
//
//  Created by Nikolas Burk on 09/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	@IBOutlet weak var operationSegmentedControl: UISegmentedControl!
	let operationClosure = Variable<((Int, Int) -> Int)?>(nil)
	@IBOutlet weak var firstValueTextField: UITextField!
	@IBOutlet weak var secondValueTextField: UITextField!
	@IBOutlet weak var operationLabel: UILabel!
	@IBOutlet weak var resultLabel: UILabel!
	
	
	// MARK: View Controller Lifecycle
	
	let bag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let opOb = operationSegmentedControl.rx.value.map {
			switch $0 {
			case 0:
				self.operationClosure.value={return $0+$1}
				
			case 1:
				self.operationClosure.value={return $0-$1}
			}
		}
		
		let ob1 = firstValueTextField.rx.text.asObservable()
		let ob2 = secondValueTextField.rx.text.asObservable()
		
		let valOb = Observable.combineLatest(ob1, ob2, operationClosure) {
			let out: Int = ($2?($0, $1) ?? 0)
			return 7
		}
		
		valOb.subscribe{print($0.element)}.addDisposableTo(bag)
	}
	
}

