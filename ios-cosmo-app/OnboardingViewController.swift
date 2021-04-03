//
//  ViewController.swift
//  ios-cosmo-app
//
//  Created by Herwindo Artono on 27/03/21.
//

import UIKit
import Lottie

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
    
    private func handleActionButtonTap(at indexPath: IndexPath) {
        // go to next slide
        if indexPath.item == slides.count - 1 {
            // this is the last slide
            print("We're in last slide")
        } else {
            let nextIndex = indexPath.item + 1
            collectionView.scrollToItem(at: IndexPath(item: nextIndex, section: 0), at: .right, animated: true)
        }
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
        cell.actionButtonDidTap = {
            print(indexPath.item)
            self.handleActionButtonTap(at: indexPath)
        }
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
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var actionButton: UIButton!
    
    var actionButtonDidTap: (() -> Void)?
    
    func configure(_ with: Slide) {
        slideLabel.text = with.label
        actionButton.setTitle(with.buttonLabel, for: .normal)
        actionButton.backgroundColor = with.buttonColor
        
        let animation = Animation.named(with.animationName)
            
        animationView.animation = animation
        animationView.loopMode = .loop
        
        if !animationView.isAnimationPlaying {
            animationView.play()
        }
    }
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        actionButtonDidTap?()
    }
}
