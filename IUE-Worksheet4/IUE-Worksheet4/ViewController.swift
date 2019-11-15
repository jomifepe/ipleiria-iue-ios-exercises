//
//  ViewController.swift
//  IUE-Worksheet4
//
//  Created by José Pereira on 11/6/19.
//  Copyright © 2019 José Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: CustomButton!
    @IBOutlet weak var minusButton: CustomButton!
    @IBOutlet weak var topButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // plusButton: is placed on the left;
        plusButton.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        // minusButton: is placed on the right;
        minusButton.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)
        // counterView: is placed on the top;
        counterView.transform = CGAffineTransform(translationX: 0, y: -view.bounds.height)
        // counterLabel: is placed on the bottom;
        counterLabel.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
        // counterLabel: is placed on the bottom;
        topButton.transform = CGAffineTransform(translationX: 0, y: -view.bounds.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {[weak self] in
                self?.plusButton.transform = CGAffineTransform.identity
                self?.minusButton.transform = CGAffineTransform.identity
                self?.counterView.transform = CGAffineTransform.identity
                self?.counterLabel.transform = CGAffineTransform.identity
                self?.topButton.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    @IBAction func plusButtonClick(_ sender: Any) {
        UIView.animate(withDuration: 0.5,
                animations: {[weak self] in
                    self?.plusButton.transform =
                        CGAffineTransform(rotationAngle: CGFloat.pi)
                    self?.plusButton.transform =
                        CGAffineTransform.identity
            })
        counterView.currentNumber += 1
        updateCounterLabel()
    }
    
    @IBAction func minusButtonClick(_ sender: Any) {
        UIView.animate(withDuration: 0.25,
                animations: {[weak self] in
                    self?.minusButton.transform =
                        CGAffineTransform(scaleX: 2, y: 2)
                    self?.minusButton.transform =
                        CGAffineTransform(scaleX: 1, y: 1)
            })
        counterView.currentNumber -= 1
        updateCounterLabel()
    }
    
    private func updateCounterLabel() {
        UIView.transition(with: counterLabel,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            guard let self = self else { return }
                            self.counterLabel.text =
                                String(self.counterView.currentNumber)
        }, completion: nil)
    }
}

