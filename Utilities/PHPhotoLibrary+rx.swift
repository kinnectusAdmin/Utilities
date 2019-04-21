////
////  PHPhotoLibrary+rx.swift
////  Journey
////
////  Created by blakerogers on 11/25/18.
////  Copyright © 2018 Blake Rogers. All rights reserved.
////
//
//import Foundation
//import Photos
//import RxSwift
//
//extension PHPhotoLibrary {
//    static var authorized: Observable<Bool> {
//        return Observable.create { observer in
//            DispatchQueue.main.async {
//                if authorizationStatus() == .authorized {
//                    observer.onNext(true)
//                    observer.onCompleted()
//                } else {
//                    observer.onNext(false)
//                    requestAuthorization { newStatus in
//                        observer.onNext(newStatus == .authorized)
//                        observer.onCompleted()
//                    }
//                }
//            }
//            return Disposables.create()
//        }
//    }
//}
//
////Excerpt From: By Marin Todorov. “RxSwift - Reactive Programming with Swift.” Apple Books.
