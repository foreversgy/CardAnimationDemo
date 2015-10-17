//
//  OverView.m
//  CardAnimationDemo
//
//  Created by ShiMac on 15/10/17.
//  Copyright (c) 2015年 guoyan. All rights reserved.
//

#import "OverView.h"
@interface OverView()
{
    UIImage     *rightImage;
    UIImage     *leftImage;
    UIImageView *imageView;
}
@end

@implementation OverView

-(id)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        rightImage=[UIImage imageNamed:@"overlay_like"];
        leftImage=[UIImage imageNamed:@"overlay_skip"];
        
        imageView=[[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageView];
    }
    return self;
}


-(void)setRight:(BOOL)isRight
{
    if (isRight) {
        
        imageView.image=rightImage;
    }
    else{
        
        imageView.image=leftImage;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
