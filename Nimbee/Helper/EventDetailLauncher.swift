//
//  EventDetailLauncher.swift
//  Nimbee
//
//  Created by iMac on 01/08/23.
//

import ECWeekView
import Foundation
import UIKit

class EventDetailLauncher {
    
    lazy var eventView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(self.dismiss))
        view.addGestureRecognizer(tapGuesture)
        return view
    }()
    
    var event: ECWeekViewEvent?
    
    @objc func present() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        let height: CGFloat = 100
        let buffer: CGFloat = 64
        
        blackView.frame = window.frame
        blackView.alpha = 0
        window.addSubview(blackView)

        eventView.frame = CGRect(x: buffer, y: window.frame.height, width: window.frame.width - (buffer * 2), height: height)
        let eventLabel = UILabel(frame: CGRect(x: 16, y: 16, width: eventView.frame.width - 32, height: (eventView.frame.height / 2) - 16))
        eventLabel.text = event!.title
        eventLabel.font = UIFont.systemFont(ofSize: 20)
        eventLabel.textAlignment = .center
        let idLabel = UILabel(frame: CGRect(x: 16, y: eventView.frame.height / 2, width: eventView.frame.width - 32, height: eventView.frame.height / 2))
        idLabel.text = event!.uuid
        idLabel.font = UIFont.systemFont(ofSize: 10)
        idLabel.textAlignment = .center
        eventView.addSubview(eventLabel)
        eventView.addSubview(idLabel)
        window.addSubview(eventView)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.eventView.frame.origin.y = (window.frame.height / 2) - (height / 2)
            self.blackView.alpha = 0.6
        })
    }
    
    @objc func dismiss() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.eventView.frame.origin.y = window.frame.height
            self.blackView.alpha = 0
        }) { (animationComplete) in
            self.eventView.removeFromSuperview()
            for subview in self.eventView.subviews {
                subview.removeFromSuperview()
            }
            self.blackView.removeFromSuperview()
        }
    }
}
