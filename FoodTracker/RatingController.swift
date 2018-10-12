//
//  RatingController.swift
//  FoodTracker
//
//  Created by 株式会社エンジ on 2018/10/10.
//  Copyright © 2018 tam. All rights reserved.
//

import UIKit

@IBDesignable class RatingController: UIStackView {
    @IBInspectable var startSize : CGSize = CGSize(width: 44.5, height: 44.5)
    @IBInspectable var startCount: Int = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Methods
    private var ratingButtons = [UIButton]()
    
    private func setupButtons(){
        
        //clear button old
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for _ in 0..<startCount {
            // Create the button
            let button = UIButton()
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: startSize.width).isActive = true
            button.widthAnchor.constraint(equalToConstant: startSize.height).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingController.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
            
            print("add button ===>>>")
        }
        updateButtonSelectionStates()
    }
    
    private func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
        }
    }
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    @objc func ratingButtonTapped(button : UIButton) {
        print("Button pressed ^^")
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the seleced button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        }else {
            rating = selectedRating
        }
    }
}
