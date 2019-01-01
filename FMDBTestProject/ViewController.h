//
//  ViewController.h
//  FMDBTestProject
//
//  Created by Weilian on 20/12/18.
//  Copyright © 2018年 Weilian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^imageComplete)(NSString *string , UIImage *image);

@interface ViewController : UIViewController

@property(nonatomic,copy) imageComplete imageBlock;


@end

