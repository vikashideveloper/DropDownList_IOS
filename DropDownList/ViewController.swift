//
//  ViewController.swift
//  DropDownList
//
//  Created by Vikash Kumar on 22/07/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @IBAction func sizeChange_buttonClicked(_ sender: UIButton) {
        let rect =  self.view.convert(sender.frame, from: sender)
        let listItems = ((0..<5).map({"\($0)"}), "1")
      
        DropDownList.show(in: self.view, listFrame: rect, listData: listItems) { newSelectedItem in
            sender.setTitle("Qty : \(newSelectedItem)", for: .normal)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//MARK: CollectionView DataSource and Delegate
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat.leastNormalMagnitude)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat.leastNormalMagnitude)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return   5
    }
}

//MARK:- Supporting UI Classes
class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var cardView:UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 6
        cardView.clipsToBounds = true
    }
    
}


@IBDesignable class BorderButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidht: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = borderWidht
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.masksToBounds = false
    }
}
