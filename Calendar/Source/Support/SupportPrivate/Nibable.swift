//
//  Nibabale.swift
//  Calendar
//
//  Created by Kyryl Horbushko on 9/2/19.
//  Copyright © 2019 - present. All rights reserved.
//

import UIKit

protocol Nibable {

    var insets: UIEdgeInsets { get }

    func prepareView()
}

extension Nibable where Self: UIView {

    var insets: UIEdgeInsets {
        return .zero
    }

    func prepareView() {
        let nib = Bundle.main.loadNibNamed(
            "CalendarView",
            owner: self,
            options: nil
        )
        if let view = nib?.first as? UIView {
            view.backgroundColor = UIColor.clear
            view.translatesAutoresizingMaskIntoConstraints = false

            let views = [
                "subview": view
            ]
            let metrics = [
                "left": insets.left,
                "right": insets.right,
                "top": insets.top,
                "bottom": insets.bottom
            ]

            addSubview(view)
            var constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-left-[subview]-right-|",
                                                             options: [.alignAllLeading, .alignAllTrailing],
                                                             metrics: metrics,
                                                             views: views)
            constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[subview]-bottom-|",
                                                                          options: [.alignAllTop, .alignAllBottom],
                                                                          metrics: metrics,
                                                                          views: views))
            NSLayoutConstraint.activate(constraints)
        }
    }
}
