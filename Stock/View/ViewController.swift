//
//  ViewController.swift
//  Stock
//
//  Created by ctsuser on 5/15/19.
//  Copyright © 2019 ctsuser. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
	
	
	var buttonArray: [UIButton] = []
	var cellWidth: CGFloat = 0
	let SegueArray = ["stocksBoughtSegue", "seguesold", "finalResultsSegue"]
	let HeaderArray = ["Stocks Bought", "Stocks Sold", "Final Results"]
	@IBOutlet weak var collectionView: UICollectionView!
	
	
	let viewModel = ViewModel()
    var fResult = finalResult()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		cellWidth = self.collectionView.frame.width/1.5
//		for index in 0...array.count-1{
//			let button = UIButton(frame: CGRect(x: 0, y: 0, width: cellWidth, height: self.collectionView.frame.height))
//			if index == 0 {
//				button.backgroundColor = UIColor(red: 0.12, green: 0.38, blue: 0.97, alpha: 1.0)
//				button.addTarget(self, action:#selector(self.stocksBoughtButtonTapped), for: .touchUpInside)
//			} else if index == 1 {
//                button.backgroundColor = UIColor(red: 0.29, green: 0.28, blue: 0.28, alpha: 1.0)
//				button.addTarget(self, action:#selector(self.stocksSoldButtonTapped), for: .touchUpInside)
//			} else {
//				button.backgroundColor = UIColor.blue
//                button.addTarget(self, action: #selector(self.finalResultsButtonTapped), for: .touchUpInside)
//			}
//			button.setTitle(array[index], for: .normal)
//            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
////            button.titleLabel?.adjustsFontSizeToFitWidth = true
//			buttonArray += [button]
//		}
        
//        viewModel.getFinalResults { fResult in
//            self.fResult = fResult!
//        }
		
    }
	
//	@objc func stocksBoughtButtonTapped(sender : UIButton) {
////		let destination = StocksBoughtTableViewController()
////		present(destination, animated: true, completion: nil)
//		performSegue(withIdentifier: "stocksBoughtSegue", sender: nil)
//	}
//
//	@objc func stocksSoldButtonTapped(sender : UIButton) {
//		performSegue(withIdentifier: "seguesold", sender: nil)
//	}
//
//	@objc func finalResultsButtonTapped(sender : UIButton) {
//		performSegue(withIdentifier: "finalResultsSegue", sender: nil)
//	}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FinalResultsViewController {
            destination.fresult = self.fResult
        }
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return SegueArray.count
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: cellWidth, height: self.collectionView.frame.height
		)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let numberOfCells = floor(self.collectionView.frame.size.width / cellWidth)
        let edgeInsets = (self.collectionView.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)

		return UIEdgeInsets(top: 10, left: edgeInsets, bottom: 10, right: edgeInsets)
    }
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: SegueArray[indexPath.row], sender: nil)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20;
    }
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CelliD", for: indexPath) as! MainScreenCollectionViewCell
		cell.headerLabel.text = HeaderArray[indexPath.row]
		cell.headerLabel.lineBreakMode = .byWordWrapping
		cell.headerLabel.numberOfLines = 2
		cell.backgroundColor = UIColor(red: 0.13, green: 0.85, blue: 0.95, alpha: 1)
//		let butt = buttonArray[indexPath.row]
		cell.layer.cornerRadius = cell.frame.size.height/20
//		cell.addSubview(butt)
		
		return cell
	}
}

