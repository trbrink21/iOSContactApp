//
//  CustomerPicCollectionViewController.swift
//  ContactPrototype
//
//  Created by Tyler Brink on 12/13/16.
//  Copyright © 2016 Tyler Brink. All rights reserved.
//

import UIKit
import Photos
//import AVFoundation

private let reuseIdentifier = "Cell"

class CustomerPicCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var custFirstName: String = ""
    var custLastName: String = ""
    var custEmail: String = ""
    var custAddress: String = ""
    var custCity: String = ""
    var custState: String = ""
    var custZip: Int = 0
    var custPics: [UIImage] = []
    var newImage: UIImage?
    
    var selectedCustomer: Customer?
    var IndexPath: IndexPath? = []
    
    var imagePicked: UIImageView!
    //let captureSession = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(generateAlert))
        
        if let customers = selectedCustomer {
            navigationItem.title = customers.firstName + " Pictures"
            custFirstName = customers.firstName
            custLastName = customers.lastName
            custEmail = customers.email
            custAddress = customers.address
            custCity = customers.city
            custState = customers.state
            custZip = customers.zip
            custPics = customers.images as! [UIImage]
        }
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        let alert = UIAlertController(title: "Customer Updated", message: "Total number of pics in array: " + String(custPics.count), preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
            //Send user back to customer list
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateAlert() {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let cameraOption = UIAlertAction(title: "Take Picture", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //Open camera
            if UIImagePickerController.isSourceTypeAvailable( .camera) {
                let cameraImagePicker = UIImagePickerController()
                cameraImagePicker.delegate = self
                cameraImagePicker.sourceType =  .camera;
                cameraImagePicker.allowsEditing = false
                self.present(cameraImagePicker, animated: true, completion: nil)
            }
            //If above condition is not met, user should be alerted of an error
        })
        let galleryOption = UIAlertAction(title: "Select a Picture", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //Open camera pictures
            if UIImagePickerController.isSourceTypeAvailable( .photoLibrary) {
                let libraryImagePicker = UIImagePickerController()
                libraryImagePicker.delegate = self
                libraryImagePicker.sourceType =  .photoLibrary;
                libraryImagePicker.delegate = self
                libraryImagePicker.allowsEditing = true
                self.present(libraryImagePicker, animated: true, completion: nil)
                
                //let pickImg = UIImagePickerControllerEditedImage as? UIImage
                //self.custPics.append(pickImg!)
                
                //self.dismiss(animated: true, completion: nil)
                //self.addPic()
            }
            //If above condition is not met, user should be alerted of an error
        })
        let cancelOption = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        optionMenu.addAction(cameraOption)
        optionMenu.addAction(galleryOption)
        optionMenu.addAction(cancelOption)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        /*let lastChosenMediaType = UIImagePickerControllerMediaType as? String
        if lastChosenMediaType != nil{
            let pickImg = UIImagePickerControllerEditedImage as? UIImage
            custPics.append(pickImg!)
                //imageView.image = pickImg //set the imageView image.
            /*else if mediaType == kUTTypeMovie as NSString{
                movieURL = info[UIImagePickerControllerMediaURL] as? NSURL
            }*/
        }*/
        if let pickImg = (UIImagePickerControllerEditedImage as? UIImage) {
            custPics.append(pickImg)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return custPics.count
        //return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomerPicCollectionViewCell", for: indexPath) as! CustomerPicCollectionViewCell
    
        // Configure the cell
    
        //let image = UIImage(named: custPics[indexPath.row])
        cell.testLabel.text = "test"
        cell.backgroundColor = UIColor.blue
        //cell.imageView.image = custPics[indexPath.row]
        
        return cell
    }

    /*func addPic() {
        let pickImg = UIImagePickerControllerEditedImage as? UIImage
        self.custPics.append(pickImg!)
        
        self.dismiss(animated: true, completion: nil)
    }*/
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
