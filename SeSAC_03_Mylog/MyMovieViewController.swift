//
//  MyMovieViewController.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/15.
//

import UIKit

class MyMovieViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let pickerList:[String] = ["감자","고구마","배추","양파","당근"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleTextfield.text = pickerList[row]
        print(row)
    }

    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var overViewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        overViewTextView.delegate = self
      
        //textField InputView
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        titleTextfield.inputView = pickerView
        
        overViewTextView.text = "이곳에 줄거리를 남겨보세요"
        overViewTextView.textColor = .lightGray
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == .lightGray{
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "이 곳에 줄거리를 남겨보세요"
            textView.textColor = .black
        }
    }


}
