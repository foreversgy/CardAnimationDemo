//
//  CardView.h
//  CardAnimationDemo
//
//  Created by ShiMac on 15/10/17.
//  Copyright (c) 2015年 guoyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OverView.h"
@protocol CardAniamtionDelegate <NSObject>

-(void)didMoveCard: (BOOL)isRight;
-(void)didMoveCardWithPersent:(float)persent;
-(void)didResetCard;

@end

@interface CardView : UIView

@property(nonatomic,assign)id<CardAniamtionDelegate>delegate;
-(void)addOverView:(OverView *)view;
@end
