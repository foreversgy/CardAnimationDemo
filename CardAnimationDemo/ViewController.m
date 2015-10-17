//
//  ViewController.m
//  CardAnimationDemo
//
//  Created by ShiMac on 15/10/15.
//  Copyright (c) 2015年 guoyan. All rights reserved.
//

#import "ViewController.h"
#import "CardCollectionView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CardCollectionView *collection=[[CardCollectionView alloc] initWithFrame:CGRectMake(50, 100, 250, 300)];
    [self.view addSubview:collection];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
