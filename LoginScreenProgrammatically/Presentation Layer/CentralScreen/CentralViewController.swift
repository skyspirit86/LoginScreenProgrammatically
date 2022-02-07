//
//  CentralViewController.swift
//  LoginScreenProgrammatically
//
//  Created by Zolt Varga on 02/06/22.
//

import UIKit

class CentralViewController: UIViewController {
    
    // MARK: - Holder UI
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = .green
        return view
    }()
    
    lazy var infoLabelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Some cool starting screen for the User"
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        styleUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}

private extension CentralViewController {
    func setupUI() {
        view.backgroundColor = .magenta
        
        view.addSubview(containerView)
        containerView.addSubview(infoLabelView)
        
        // 1. Holder of the Constraints
        var viewConstraints = [NSLayoutConstraint]()

        // 2. Create list of View Elements
        let viewsDict: [String: Any] = [
            "containerView": containerView,
            "infoLabelView": infoLabelView]
        
        // 3. Create Metrics if needed
        let metrics = [
            "horPadding": 16,
            "containerViewHeight": 300]
        
        // 4a. Vertical Constraints 'containerView'
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[containerView(200)]",
                                                                 options: [],
                                                                 metrics: nil,
                                                                 views: viewsDict)
        viewConstraints += verticalConstraints
        
        // 4b. Horizontal Constraints 'containerView'
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-horPadding-[containerView]-horPadding-|",
                                                                   options: [],
                                                                   metrics: metrics,
                                                                   views: viewsDict)
        viewConstraints += horizontalConstraints
        
        // 5a. Horizontal Constraints 'label'
        let horLabelConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[infoLabelView]-|",
                                                                   options: [],
                                                                   metrics: metrics,
                                                                   views: viewsDict)
        viewConstraints += horLabelConstraints
        
        // 5b. Horizontal Constraints 'label'
        let verLabelConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[infoLabelView(80)]",
                                                                 options: [],
                                                                 metrics: metrics,
                                                                 views: viewsDict)
        viewConstraints += verLabelConstraints

        // 6. Activate Constraints
        NSLayoutConstraint.activate(viewConstraints)
        
    }
    
    func styleUI() {
        view.backgroundColor = .lightGray
        containerView.backgroundColor = .gray
        infoLabelView.backgroundColor = .clear
    }
}
