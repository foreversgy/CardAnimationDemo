//
//  CardCollectionView.m
//  CardAnimationDemo
//
//  Created by ShiMac on 15/10/17.
//  Copyright (c) 2015年 guoyan. All rights reserved.
//

#import "CardCollectionView.h"

@interface CardCollectionView ()<CardAniamtionDelegate>



@end

@implementation CardCollectionView


-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        for (NSInteger index=0; index<4; index++) {
            
            CardView *card=[[CardView alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
            card.delegate=self;
            [self addSubview:card];
            
            UIImageView *imageView=[[UIImageView alloc] initWithFrame:card.bounds];
            imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"cards_%ld",(long)index]];
            [card addSubview:imageView];
            
            OverView *view=[[OverView alloc] initWithFrame:card.bounds];
            [card addOverView:view];
        }
        
    }
    return self;
}


-(void)didResetCard
{
    
    
}

-(void)didMoveCard:(BOOL)isRight
{
    
}

-(void)didMoveCardWithPersent:(float)persent
{
    
    
    
}

@end
