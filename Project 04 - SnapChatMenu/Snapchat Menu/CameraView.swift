//
//  CameraView.swift
//  Snapchat Menu
//
//  Created by Jiar on 2016/11/24.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet private weak var cameraView: UIView!
    @IBOutlet private weak var tempImageView: UIImageView!
    
    private var captureSession: AVCaptureSession?
    private var stillImageOutput: AVCaptureStillImageOutput? //New Api: AVCapturePhotoOutput
    private var previewLayer: AVCaptureVideoPreviewLayer?
    
    private var didTakePhoto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configCamera()
    }
    
    private func configRecognizer() {
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(didPressTakeAnother))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    private func configCamera() {
        
        if !isCameraAvailable() {
            print("该设备没有摄像头")
            return
        }
        if !isRearCameraAvailable() {
            print("该设备后摄像头无法使用")
            return
        }
        if !isFrontCameraAvailable() {
            print("该设备前摄像头无法使用")
            return
        }
        
        captureSession = AVCaptureSession()
        captureSession!.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var input: AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error {
            print("error: \(error)")
            return
        }
        
        if captureSession!.canAddInput(input) {
            captureSession!.addInput(input)
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput!.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
            
            if captureSession!.canAddOutput(stillImageOutput) {
                captureSession!.addOutput(stillImageOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer!.frame = cameraView.bounds
                previewLayer!.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer!.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureSession!.startRunning()
            }
            
        }
    }
    
    private func didPressTakePhoto() {
        
        if let stillImageOutput = stillImageOutput {
            if let videoConnection = stillImageOutput.connection(withMediaType: AVMediaTypeVideo) {
                videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
                stillImageOutput.captureStillImageAsynchronously(from: videoConnection, completionHandler: {
                    (sampleBuffer, error) in
                    
                    if let sampleBuffer = sampleBuffer {
                        let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                        if let dataProvider  = CGDataProvider(data: imageData as! CFData) {
                            if let cgImageRef = CGImage(jpegDataProviderSource: dataProvider, decode: nil, shouldInterpolate: true, intent: .relativeColorimetric) {
                                let image = UIImage(cgImage: cgImageRef, scale: 1.0, orientation: .right)
                                self.tempImageView.image = image
                                self.tempImageView.isHidden = false
                                self.saveImageToPhotosAlbum(image)
                            }
                        }
                    }
                    
                })
            }
        }
        
    }
    
    @objc private func didPressTakeAnother() {
        
        if didTakePhoto {
            tempImageView.isHidden = true
            didTakePhoto = false
        } else {
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
        }
        
    }
    
    private func saveImageToPhotosAlbum(_ image: UIImage) {
        
        let alert = UIAlertController(title: "温馨提示", message: "您需要保存该照片到相册吗？", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "保存", style: .default, handler: { (action) in
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            self.didPressTakeAnother()
        })
        let cancelAction = UIAlertAction(title: "不了", style: .cancel, handler: { (action) in
            self.didPressTakeAnother()
        })
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func isCameraAvailable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    private func isFrontCameraAvailable() -> Bool {
        return UIImagePickerController.isCameraDeviceAvailable(.front)
    }
    
    private func isRearCameraAvailable() -> Bool {
        return UIImagePickerController.isCameraDeviceAvailable(.rear)
    }
    
}
