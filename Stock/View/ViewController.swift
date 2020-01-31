//
//  ViewController.swift
//  Stock
//
//  Created by ctsuser on 5/15/19.
//  Copyright © 2019 ctsuser. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, alertDelegate{
    
    var weewoo: alert?
    
    func displayAlert(message: String) {
        print(message)
    }
	
	var buttonArray: [UIButton] = []
	var cellWidth: CGFloat = 0
	let SegueArray = ["stocksBoughtSegue", "seguesold", "finalResultsSegue"]
	let HeaderArray = ["Stocks Bought", "Stocks Sold", "Final Results"]
	@IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cashForDayLabel: UILabel!
    
	let viewModel = ViewModel()
    var fResult = finalResult()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weewoo = alert()
        weewoo?.delegate = self
        weewoo?.printStuff()
        
		cellWidth = self.collectionView.frame.width/1.5
        viewModel.getFinalResults { fResult in
            if fResult == nil {
				let alertController = UIAlertController(title: "Error", message: "Couldn't get stock data at this time :(", preferredStyle: .alert)
				alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
				self.present(alertController, animated: true, completion: nil)
                return
            }
            self.fResult = fResult!
            self.cashForDayLabel.text = self.fResult.beginningAmountOfMoney
        }
        
    }
    
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
        cell.backgroundColor = UIColor.systemBlue
		cell.layer.cornerRadius = cell.frame.size.height/20
		
		return cell
	}
    
    
}

