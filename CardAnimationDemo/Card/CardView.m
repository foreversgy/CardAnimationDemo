//
//  CardView.m
//  CardAnimationDemo
//
//  Created by ShiMac on 15/10/17.
//  Copyright (c) 2015年 guoyan. All rights reserved.
//

#import "CardView.h"

@interface CardView ()
{
    OverView    *overView;
}
@property(nonatomic,assign)BOOL     isDrayBegin;
@property(nonatomic,assign)BOOL     isDownDirection;
@property(nonatomic,assign)CGFloat  xDistance;
@property(nonatomic,assign)CGFloat  yDistance;
@property(nonatomic,assign)CGPoint  locationPoint;

@end

@implementation CardView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
        [self addGestureRecognizer:panGesture];
        
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
        [self addGestureRecognizer:tapGesture];
        
    }
    
    return self;
}

-(void)addOverView:(OverView *)view
{
    overView=view;
    [self addSubview:overView];
}

- (void)panGestureAction:(UIPanGestureRecognizer *)gesture
{
    //偏移位置
    self.xDistance=[gesture translationInView:self].x;
    self.yDistance=[gesture translationInView:self].y;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.isDownDirection=[gesture locationInView:self].y>self.frame.size.height/2?YES:NO;
            self.isDrayBegin=YES;
            self.locationPoint=self.center;
            
//            如果设置shouldRasterize为YES，记得根据contentsScale设置rasterizationScale
            //旋转时的锯齿问题
            self.layer.shouldRasterize = true;

        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            //旋转
            CGFloat rotatePersent=MIN(fabs(self.xDistance)/self.frame.size.width,1);
            CGFloat rotateAngel=M_PI*rotatePersent/10.0;
            
            //缩小
            CGAffineTransform transform;
            if(self.isDownDirection){
                
                transform=CGAffineTransformMakeRotation(-rotateAngel);
            }
            else{
                
                transform=CGAffineTransformMakeRotation(rotateAngel);
            }
            CGFloat scale=1-(rotatePersent*(1-0.8));
            self.transform=CGAffineTransformScale(transform, scale, scale);
            
            
            self.center=CGPointMake(self.xDistance+self.locationPoint.x, self.yDistance+self.locationPoint.y);
            
            if (self.xDistance>0) {
            
                [overView setRight:YES];
            }
            else{
                
                [overView setRight:NO];
            }
            overView.alpha=rotatePersent;
            
            self.layer.rasterizationScale = scale * [UIScreen mainScreen].scale;

            if (self.delegate && [self.delegate respondsToSelector:@selector(didMoveCardWithPersent:)]) {
                
                [self.delegate didMoveCardWithPersent:rotatePersent];
                
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (self.xDistance>self.frame.size.width/2) {
                
                if (self.delegate && [self.delegate respondsToSelector:@selector(didMoveCard:)]) {
                    
                    [self.delegate didMoveCard:YES];
                }
                
                [self rightAnimation];
            }
            else if(self.xDistance<-self.frame.size.width/2){
                
                if (self.delegate && [self.delegate respondsToSelector:@selector(didMoveCard:)]) {
                    
                    [self.delegate didMoveCard:NO];
                }
                
                [self leftAnimation];
            }
            else{
                
                if (self.delegate && [self.delegate respondsToSelector:@selector(didResetCard)]) {
                    
                    [self.delegate didResetCard];
                }
                
                [self resetAnimation];
            }
            self.layer.shouldRasterize = false;

        }
            break;
        default:
            break;
    }
}

-(void)rightAnimation
{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.center=CGPointMake([[UIScreen mainScreen] bounds].size.width*2, self.locationPoint.y+self.yDistance);
        
    } completion:^(BOOL finish) {
    
        [self removeFromSuperview];
    }];
}

-(void)leftAnimation
{
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.center=CGPointMake(-[[UIScreen mainScreen] bounds].size.width*2, self.locationPoint.y+self.yDistance);
        
    } completion:^(BOOL finish) {
        
        [self removeFromSuperview];
    }];
}

-(void)resetAnimation
{
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.center=self.locationPoint;
        overView.alpha=0;


    } completion:^(BOOL finished) {
        
        
    }];
    
    [UIView animateWithDuration:0.4 animations:^{
        
        self.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)tapGestureAction:(UITapGestureRecognizer *)gesture
{
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
