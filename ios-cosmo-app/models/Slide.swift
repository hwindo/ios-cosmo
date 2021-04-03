//
//  Slide.swift
//  ios-cosmo-app
//
//  Created by Herwindo Artono on 03/04/21.
//

import UIKit

struct Slide {
    let label: String
    let animationName: String
    let buttonLabel: String
    let buttonColor: UIColor
    
    // create collection
    static let collections: [Slide] = [
        .init(label: "Earn points auto-magically every time you order from your favorite restaurants.", animationName: "reward-aksorn", buttonLabel: "Next", buttonColor: .white),
        .init(label: "Redeem your points for tasty rewards.", animationName: "time-aksorn", buttonLabel: "Next", buttonColor: .white),
        .init(label: "All your rewards and promotions stay in one place!", animationName: "success-aksorn", buttonLabel: "Next", buttonColor: .systemYellow)
    ]
}


