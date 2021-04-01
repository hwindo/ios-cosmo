//
//  ViewController.swift
//  ios-cosmo-app
//
//  Created by Herwindo Artono on 27/03/21.
//

import UIKit

struct Slide {
    let label: String
    let animationName: String
    let buttonLabel: String
    let buttonColor: UIColor
    
    // create collection
    static let collections: [Slide] = [
        .init(label: "Earn points auto-magically every time you order from your favorite restaurants.", animationName: "", buttonLabel: "Next", buttonColor: .white),
        .init(label: "Redeem your points for tasty rewards.", animationName: "", buttonLabel: "Next", buttonColor: .white),
        .init(label: "All your rewards and promotions stay in one place!", animationName: "", buttonLabel: "Next", buttonColor: .systemYellow)
    ]
}

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let slides: [Slide] = Slide.collections
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initCollectionView()
    }
    
    private func initCollectionView() {
        // set layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! OnboardingCollectionViewCell
        let slide = slides[indexPath.item]
        cell.configure(slide)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = collectionView.bounds.height
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideLabel: UILabel!
    @IBOutlet weak var slideAnimationPicture: UIView!
    @IBOutlet weak var actionButton: UIButton!
    
    func configure(_ with: Slide) {
        slideLabel.text = with.label
        actionButton.setTitle(with.buttonLabel, for: .normal)
        actionButton.backgroundColor = with.buttonColor
    }
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        print("actionButtonPressed")
    }
}
