//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Maxim on 22.12.15.
//  Copyright © 2015 Maxim. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField! // weak означает, что объект может иметь значение nil
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    // MARK: Class methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field’s user input through delegate callbacks
        
        nameTextField.delegate = self // кто будет выполнять роль делегата для обработки событий из текстовой строки? текущий экземпляр View Controller (self)
        
        checkValidMealName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate 
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder() // hide the keyboard
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false // кнопка Save неактивна во время ввода текста
    }
    
    func checkValidMealName () {
        
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty // кнопка Save активируется только после заполнения поля name
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Navigation
    
   
    @IBAction func goingBackToMealList(sender: UIBarButtonItem) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? "" // ?? - это бинарный оператор Optional, который выдает или значение, или пустую строку в поле
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating) // если Save нажата, то перед возвратом в лист Meals объект meal инициализируется введенными значениями 
        }
    }

    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder() // This code ensures that if the user taps the image view while typing in the text field, the keyboard is dismissed properly.
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil) // метод просит ViewController передать управление imagePickerController, по завершении (completion) не делать ничего (просто вернуть управление) - поэтому nil
        
    }
}

