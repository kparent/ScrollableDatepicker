//
//  Created by Dmitry Ivanenko on 01.10.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


public class LoadableFromXibView: UIView {
  
  @IBOutlet public weak var view: UIView!
  
  
  // MARK: - Inits
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    xibSetup()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    xibSetup()
  }
  
  
  // MARK: - Setup
  
  func xibSetup() {
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
    view = nib.instantiate(withOwner: self, options: nil).first as! UIView
    addSubview(view)
    
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["view": view]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["view": view]))
  }
  
}
