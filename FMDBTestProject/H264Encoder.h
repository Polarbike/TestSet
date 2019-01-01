//
//  H264Encoder.h
//  FMDBTestProject
//
//  Created by Weilian on 31/12/18.
//  Copyright © 2018年 Weilian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <VideoToolbox/VideoToolbox.h>

NS_ASSUME_NONNULL_BEGIN

@interface H264Encoder : NSObject

//初始化配置
- (void) initWithConfiguration;
- (void) initEncode:(int)width height:(int)height;
//CMSampleBufferRef 接受录入设备返回的数据
- (void) encode:(CMSampleBufferRef)sampleBuffer;

@end

NS_ASSUME_NONNULL_END
