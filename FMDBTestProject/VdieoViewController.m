//
//  VdieoViewController.m
//  FMDBTestProject
//
//  Created by Weilian on 27/12/18.
//  Copyright © 2018年 Weilian. All rights reserved.
//

#import "VdieoViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface VdieoViewController ()

@end

@implementation VdieoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //capture  捕获 录制  capture video
    AVPlayer *player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@""]];
    if (player.status == AVPlayerStatusReadyToPlay) {
        
        [self addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    }
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"name"]) {
        
        NSString *new = change[NSKeyValueChangeNewKey];
        NSString *old = change[NSKeyValueChangeOldKey];
        NSLog(@"新的值%@_旧的值%@",new,old);
    }
    else {
    
       
    }
    
}

- (void)createBlock:(void(^)(id resultd , NSString *string))result {
    
    NSDictionary *dic = [NSDictionary dictionary];
    NSString *string = [NSString string];
    result(dic,string);
    
}

- (void)cacheData {
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [path firstObject];
    cachePath = [cachePath stringByAppendingPathComponent:@"MyAppCache"];
    
    [NSKeyedArchiver archivedDataWithRootObject:[NSString stringWithFormat:@"$"] requiringSecureCoding:YES error:nil];
    //
//    @throw expression 表情 脸色
    [NSKeyedArchiver archivedDataWithRootObject:[NSDictionary dictionary]];
    //list view controller
    
}



- (void)dealloc {
    
    [self removeObserver:self forKeyPath:@"name"];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
