//
//  ViewController.swift
//  WordGame
//
//  Created by Andrei Konstantinov on 02/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  private let manager: GameManagerType = GameManager()

  @IBOutlet private var originalWordLabel: UILabel! {
    didSet {
      originalWordLabel.layer.opacity = 0
    }
  }
  @IBOutlet private var variantWordLabel: UILabel!
  @IBOutlet private var scoreLabel: UILabel!

  @IBOutlet private var variantStartPositionConstraint: NSLayoutConstraint!
  @IBOutlet private var variantFinishPositionConstraint: NSLayoutConstraint!

  @IBOutlet private var declineButton: UIButton! {
    didSet {
      declineButton.isEnabled = false
    }
  }
  @IBOutlet private var acceptButton: UIButton! {
    didSet {
      acceptButton.isEnabled = false
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    nextChallenge()
  }

  // MARK: - Actions

  @IBAction private func declineAction() {
    solve(accept: false)
  }

  @IBAction private func acceptAction() {
    solve(accept: true)
  }

}

// MARK: - Private

private extension ViewController {

  func nextChallenge() {
    guard !manager.isGameOver() else {
      gameOver()
      return
    }

    variantStartPositionConstraint.priority = UILayoutPriority.defaultHigh
    variantFinishPositionConstraint.priority = UILayoutPriority.defaultLow
    guard let challenge = manager.nextChallenge() else { return }
    originalWordLabel.text = challenge.original
    variantWordLabel.text = challenge.variant

    self.view.layoutIfNeeded()

    self.variantStartPositionConstraint.priority = UILayoutPriority.defaultLow
    self.variantFinishPositionConstraint.priority = UILayoutPriority.defaultHigh

    UIView.animate(
      withDuration: 0.7,
      animations: {
        self.originalWordLabel.layer.opacity = 1
      },
      completion: {
        _ in
        self.declineButton.isEnabled = true
        self.acceptButton.isEnabled = true
      }
    )

    UIView.animate(
      withDuration: 4,
      delay: 0.5,
      options: [.curveEaseInOut],
      animations: {
        self.view.layoutIfNeeded()
      },
      completion: { _ in
        self.originalWordLabel.layer.opacity = 0
        self.nextChallenge()
      }
    )
  }

  func solve(accept: Bool) {
    declineButton.isEnabled = false
    acceptButton.isEnabled = false
    let newScore = accept ? manager.acceptCurrentChallenge() : manager.declineCurrentChallenge()
    scoreLabel.text = "\(newScore)"
  }

  func gameOver() {
    declineButton.isEnabled = false
    acceptButton.isEnabled = false
    declineButton.isHidden = true
    acceptButton.isHidden = true
    variantWordLabel.text = ""
    originalWordLabel.text = "GAME OVER"

    UIView.animate(
      withDuration: 0.5,
      animations: {
        self.originalWordLabel.layer.opacity = 1
    })
  }

}
