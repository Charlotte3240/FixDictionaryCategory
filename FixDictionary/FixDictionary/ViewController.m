//
//  ViewController.m
//  FixDictionary
//
//  Created by 刘春奇 on 16/8/29.
//  Copyright © 2016年 com.hc-nsqk.Charlotte. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *string = nil;
    NSDictionary *dic = @{
                          string:@"first key",
                          @"testkey":@"testObject",
                          @"last object":string
                          };
    NSLog(@"dic is %@",dic);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
