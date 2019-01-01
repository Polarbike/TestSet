//
//  TestInfoObject.h
//  FMDBTestProject
//
//  Created by Weilian on 31/12/18.
//  Copyright © 2018年 Weilian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestInfoObject : NSObject<AVCaptureVideoDataOutputSampleBufferDelegate>

@property(nonatomic,strong) AVCaptureSession *session;

@property(nonatomic,strong) AVCaptureDeviceInput *input;

@property(nonatomic,strong) AVCaptureVideoDataOutput *output;

@end

NS_ASSUME_NONNULL_END
