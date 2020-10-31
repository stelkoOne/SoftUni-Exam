//
//  TextField.swift
//  QuoteQuiz
//
//  Created by Stelio on 29.10.20.
//

import UIKit

class TextField: UITextField {
    
    // MARK: - Variables
    
    private var clearTextImage: UIImage?
    private var bottomBorder: CALayer?
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        customInit()
    }
    
    // MARK: - View Base Methods
    
    override func draw(_ rect: CGRect) {
        let borderFrame = CGRect(x: rect.origin.x,
                                 y: rect.height - Constants.TextField.Border.height,
                                 width: rect.width,
                                 height: Constants.TextField.Border.height)

        if bottomBorder != nil {
            bottomBorder?.frame = borderFrame
            return
        }
        
        bottomBorder = CALayer()
        bottomBorder?.frame = borderFrame
        bottomBorder?.borderColor = Constants.TextField.Border.color.cgColor
        bottomBorder?.borderWidth = Constants.TextField.Border.height
        
        layer.addSublayer(bottomBorder!)
        layer.masksToBounds = true
        
        super.draw(rect)
    }
    
    override func drawPlaceholder(in rect: CGRect) {
        guard let placeholder = self.placeholder as NSString? else {
            return
        }
        
        let attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : Constants.TextField.Placeholder.color,
            .font            : Constants.TextField.Placeholder.font
        ]
        
        placeholder.draw(in: rect.insetBy(dx: 4.0, dy: .zero), withAttributes: attributes)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for view in subviews {
            if let clearButton = view as? UIButton, let clearImage = clearButton.image(for: .normal) {
                clearTextImage = clearImage.withRenderingMode(.alwaysTemplate)
                clearButton.tintColor = Constants.TextField.Border.color
                clearButton.setImage(clearTextImage, for: .normal)
                clearButton.setImage(clearTextImage, for: .highlighted)
            }
        }
    }
    
    
    // MARK: - Private Methods
    
    private func customInit() {
        font = Constants.TextField.font
        textColor = .white
        tintColor = .white
        borderStyle = .none
        clearButtonMode = .whileEditing
        inputAccessoryView = UIView()
        autocorrectionType = .no
    }
}
