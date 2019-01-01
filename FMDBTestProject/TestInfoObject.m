//
//  TestInfoObject.m
//  FMDBTestProject
//
//  Created by Weilian on 31/12/18.
//  Copyright © 2018年 Weilian. All rights reserved.
//

#import "TestInfoObject.h"
#import <UIKit/UIKit.h>

@implementation TestInfoObject


- (void)setupCamera
{
    NSError *error = nil;
    
    // Create the session
    _session = [[AVCaptureSession alloc] init];
    
    // Configure the session to produce lower resolution video frames, if your
    // processing algorithm can cope. We'll specify medium quality for the
    // chosen device.
    _session.sessionPreset = AVCaptureSessionPresetMedium;
    
    // Find a suitable AVCaptureDevice
    AVCaptureDevice *device = [AVCaptureDevice
                               defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Create a device input with the device and add it to the session.
    _input = [AVCaptureDeviceInput deviceInputWithDevice:device
                                                   error:&error];
    if (!_input) {
        // Handling the error appropriately.
    }
    [_session addInput:_input];
    
    // Create a VideoDataOutput and add it to the session
    _output = [[AVCaptureVideoDataOutput alloc] init];
    [_session addOutput:_output];
    
    // Configure your output.
    dispatch_queue_t queue = dispatch_queue_create("myQueue", NULL);
    [_output setSampleBufferDelegate:self queue:queue];
    
    // Specify the pixel format
    _output.videoSettings =
    [NSDictionary dictionaryWithObject:
     [NSNumber numberWithInt:kCVPixelFormatType_32BGRA]
                                forKey:(id)kCVPixelBufferPixelFormatTypeKey];
    
    
    // If you wish to cap the frame rate to a known value, such as 15 fps, set
    // minFrameDuration.
    _output.minFrameDuration = CMTimeMake(1, 15);
    
    // Start the session running to start the flow of data
    [_session startRunning];
    
    // Assign session to an ivar.
    [self setSession:_session];
}

- (void)contentOperation {
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        //
        
        NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = image;
        }];
        NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(clickAction) object:nil];
        
    }];
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        //
    }];
    
    NSURLCache *cache = [NSURLCache sharedURLCache];
    
}

// Delegate routine that is called when a sample buffer was written
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection
{
    // Create a UIImage from the sample buffer data
    UIImage *img = [self imageFromSampleBuffer:sampleBuffer];
    /*
     dispatch_async(dispatch_get_main_queue(), ^{
     self.catchview.image=img;
     });
     */
    NSURLRequest *request = [[NSURLRequest alloc] init];
    NSInteger policy = request.cachePolicy;
    //
//    NSURLCache *cache = [NSURLCache alloc] initWithMemoryCapacity:<#(NSUInteger)#> diskCapacity:<#(NSUInteger)#> diskPath:<#(nullable NSString *)#>
}
//从CMSampleBufferRef类里获取数据创建一个图片
// Create a UIImage from sample buffer data
- (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer
{
    
    // Get a CMSampleBuffer's Core Video image buffer for the media data
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the base address of the pixel buffer
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    
    // Get the number of bytes per row for the pixel buffer
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // Get the pixel buffer width and height
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    
    // Get the number of bytes per row for the pixel buffer
    u_int8_t *baseAddress = (u_int8_t *)malloc(bytesPerRow*height);
    memcpy( baseAddress, CVPixelBufferGetBaseAddress(imageBuffer), bytesPerRow * height     );
    
    // size_t bufferSize = CVPixelBufferGetDataSize(imageBuffer);
    
    // Create a device-dependent RGB color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // Create a bitmap graphics context with the sample buffer data
    
    //The context draws into a bitmap which is `width'
    //  pixels wide and `height' pixels high. The number of components for each
    //      pixel is specified by `space' 像素由space提供
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8,
                                                 bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst);
    
    // Create a Quartz image from the pixel data in the bitmap graphics context
    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
    
    // Unlock the pixel buffer
    CVPixelBufferUnlockBaseAddress(imageBuffer,0);
    
    // Free up the context and color space
    CGContextRelease(context);
    //CGColorSpaceRelease(colorSpace);
    
    // Create an image object from the Quartz image
    UIImage *image = [UIImage imageWithCGImage:quartzImage scale:1.0 orientation:UIImageOrientationRight];
    free(baseAddress);
    // Release the Quartz image
    CGImageRelease(quartzImage);
    return (image);
}

@end
