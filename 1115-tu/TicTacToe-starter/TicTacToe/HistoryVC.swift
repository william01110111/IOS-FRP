//
//  HistoryVC.swift
//  TicTacToe
//
//  Created by William Wold on 11/15/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HistoryVC: UIViewController {

	var boards = Variable<[Board]>([])
	var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView = UITableView()
		
		
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if let vc = segue.destination as? ViewController {
			boards.value.append(Board())
			vc.board.value = boards.value[boards.value.count-1]
		}
		
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
