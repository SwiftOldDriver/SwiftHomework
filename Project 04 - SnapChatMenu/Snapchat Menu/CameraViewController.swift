//
//  CameraViewController.swift
//  Snapchat Menu
//
//  Created by Jiar on 2016/11/24.
//  Copyright © 2016年 Jiar. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet private weak var cameraView: UIView!
    @IBOutlet private weak var tempImageView: UIImageView!
    
    private var captureSession: AVCaptureSession = AVCaptureSession()
    private var stillImageOutput: AVCaptureStillImageOutput = AVCaptureStillImageOutput()
    private var previewLayer: AVCaptureVideoPreviewLayer!
    
    private var didTakePhoto = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRecognizer()
        configCamera()
    }
    
    private func configRecognizer() {
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(didPressTakeAnother))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    func didPressTakeAnother() {
        if !isCameraAvailable() {
            return
        }
        if didTakePhoto {
            tempImageView.isHidden = true
            didTakePhoto = false
        } else {
            captureSession.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
        }
    }
    
    private func configCamera() {
        if !isCameraAvailable() {
            print("该设备没有摄像头或摄像头无法使用")
            return
        }
        captureSession.sessionPreset = AVCaptureSessionPreset1920x1080
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {
            return
        }
        guard captureSession.canAddInput(input) else {
            return
        }
        captureSession.addInput(input)
        stillImageOutput.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
        guard captureSession.canAddOutput(stillImageOutput) else {
            return
        }
        captureSession.addOutput(stillImageOutput)
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = cameraView.bounds
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspect
        previewLayer.connection.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraView.layer.addSublayer(previewLayer)
        captureSession.startRunning()
    }
    
    private func didPressTakePhoto() {
        guard let videoConnection = stillImageOutput.connection(withMediaType: AVMediaTypeVideo) else {
            return
        }
        videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
        stillImageOutput.captureStillImageAsynchronously(from: videoConnection, completionHandler: {
            (sampleBuffer, error) in
            guard let sampleBuffer = sampleBuffer else {
                return
            }
            let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
            guard let dataProvider = CGDataProvider(data: imageData as! CFData) else {
                return
            }
            guard let cgImageRef = CGImage(jpegDataProviderSource: dataProvider, decode: nil, shouldInterpolate: true, intent: .relativeColorimetric) else {
                return
            }
            self.tempImageView.image = UIImage(cgImage: cgImageRef, scale: 1.0, orientation: .right)
            self.tempImageView.isHidden = false
        })
    }
    
    private func isCameraAvailable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera) && UIImagePickerController.isCameraDeviceAvailable(.rear)
    }
    
}
