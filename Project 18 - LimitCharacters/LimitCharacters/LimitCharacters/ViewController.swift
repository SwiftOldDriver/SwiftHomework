//
//  ViewController.swift
//  LimitCharacters
//
//  Created by Damon on 2016/11/29.
//  Copyright © 2016年 swiftdrive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - view & variable
	@IBOutlet weak var bottomUIView: UIView!
	@IBOutlet weak var characterCountLabel: UILabel!
	fileprivate let maxTweetCount = 140
	
	// MARK: - life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		registerKeyBoardObserver()
	}
	
	override var preferredStatusBarStyle : UIStatusBarStyle {
		return UIStatusBarStyle.lightContent
	}
	
	// MARK: - event response
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
	
	@IBAction func closeButtonClick() {
		// cancel KeyBoardObserver after dismiss
		cancelKeyBoardObserver()
	}
	
	@IBAction func tweetButtonClick() {
		// cancel KeyBoardObserver after dismiss
		cancelKeyBoardObserver()
	}
}

// MARK: - UITextViewDelegate
extension ViewController: UITextViewDelegate {
	
	func textViewDidChange(_ textView: UITextView) {
		characterCountLabel.text = "\(maxTweetCount - (textView.text ?? "").characters.count)"
	}
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		return ((textView.text ?? "").characters.count + (text.characters.count - range.length)) <= maxTweetCount
	}
}

// MARK: - KeyboardNotification
extension ViewController {
	
	fileprivate func registerKeyBoardObserver(){
		NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	fileprivate func cancelKeyBoardObserver(){
		view.endEditing(true)
		NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardWillHide, object: nil)
	}
	
	func keyboardWillShow(_ notification:Notification) {
		guard let userInfo  = notification.userInfo else { return }
		guard let keyBoardBounds = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
			let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber,
			let optionRawValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
			else { return }
		
		UIView.animate(withDuration: duration.doubleValue,delay: 0,options:UIViewAnimationOptions(rawValue: UInt(optionRawValue.intValue << 16)),animations: {
			self.bottomUIView.transform = CGAffineTransform(translationX: 0,y: -keyBoardBounds.cgRectValue.size.height)
		},completion: nil)
	}
	
	func keyboardWillHide(_ notification:Notification) {
		guard let userInfo  = notification.userInfo else { return }
		guard let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber,
			let optionRawValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
			else { return }
		
		UIView.animate(withDuration: duration.doubleValue,delay: 0,options:UIViewAnimationOptions(rawValue: UInt(optionRawValue.intValue << 16)),animations: {
			self.bottomUIView.transform = CGAffineTransform.identity
		},completion: nil)
	}
}

