//
//  LoaderView.m
//  Loader
//
//  Created by Shivam Jaiswal on 10/9/16.
//  Copyright © 2016 AppStreet Software Pvt. Ltd. All rights reserved.
//

#import "LoaderView.h"

#define kLoaderW 75.0
#define kPixelW 12.0
#define LOCenteredOrigin(x, y) floor((x - y)/2.0)


@interface LoaderView ()
@property (nonatomic, strong) UIView *px_1;
@property (nonatomic, strong) UIView *px_2;
@property (nonatomic, strong) UIView *px_3;
@property (nonatomic, strong) UIView *px_4;

@end

@implementation LoaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(animate)
                                                     name: UIApplicationWillEnterForegroundNotification
                                                   object: nil];
        
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5.0;
        
        self.bounds = (CGRect){0,0, kLoaderW , kLoaderW};
        
        self.px_1 = [[UIView alloc]initWithFrame:CGRectZero];
        self.px_2 = [[UIView alloc]initWithFrame:CGRectZero];
        self.px_3 = [[UIView alloc]initWithFrame:CGRectZero];
        self.px_4 = [[UIView alloc]initWithFrame:CGRectZero];
        
        self.px_1.backgroundColor = [UIColor orangeColor];
        self.px_2.backgroundColor = [UIColor orangeColor];
        self.px_3.backgroundColor = [UIColor orangeColor];
        self.px_4.backgroundColor = [UIColor orangeColor];
        
        [self addSubview:self.px_1];
        [self addSubview:self.px_2];
        [self addSubview:self.px_3];
        [self addSubview:self.px_4];
        
        [self animate];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    CGRect rect = self.bounds;
    CGSize pixelSize = CGSizeMake(kPixelW, kPixelW);
    float x,y;
    
    x = rect.size.width/2.0 - kPixelW;
    y = rect.size.height/2.0 - kPixelW;
    self.px_1.frame = (CGRect){x,y,pixelSize};
    
    x = rect.size.width/2.0;
    y = rect.size.height/2.0 - kPixelW;
    self.px_2.frame = (CGRect){x,y,pixelSize};
    
    x = rect.size.width/2.0 - kPixelW;
    y = rect.size.height/2.0;
    self.px_3.frame = (CGRect){x,y,pixelSize};
    
    x = rect.size.width/2.0;
    y = rect.size.height/2.0;
    self.px_4.frame = (CGRect){x,y,pixelSize};
}

- (void)animate
{
    [self layoutIfNeeded];
    [self setNeedsLayout];
    
    float duration = 3.0;
    
    CABasicAnimation *rotation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation1.fromValue = [NSNumber numberWithFloat:0];
    rotation1.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation1.duration = duration; // Speed
    rotation1.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
    [self.px_1.layer addAnimation:rotation1 forKey:@"rotation1"];
    
    CABasicAnimation *rotation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation2.fromValue = [NSNumber numberWithFloat:0];
    rotation2.toValue = [NSNumber numberWithFloat:( - 2*M_PI)];
    rotation2.duration = duration; // Speed
    rotation2.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
    [self.px_2.layer addAnimation:rotation2 forKey:@"rotation2"];
    
    CABasicAnimation *rotation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation3.fromValue = [NSNumber numberWithFloat:0];
    rotation3.toValue = [NSNumber numberWithFloat:( - 2*M_PI)];
    rotation3.duration = duration; // Speed
    rotation3.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
    [self.px_3.layer addAnimation:rotation3 forKey:@"rotation3"];
    
    CABasicAnimation *rotation4 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation4.fromValue = [NSNumber numberWithFloat:0];
    rotation4.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation4.duration = duration; // Speed
    rotation4.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
    [self.px_4.layer addAnimation:rotation4 forKey:@"rotation4"];
    
    float factor = 20;
    
    [UIView animateWithDuration:1
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse
                     animations:^{
                         CGRect rect = self.bounds;
                         CGSize pixelSize = CGSizeMake(kPixelW, kPixelW);
                         float x,y;

                         x = rect.size.width/2.0 - kPixelW - factor;
                         y = rect.size.height/2.0 - kPixelW  - factor;
                         self.px_1.frame = (CGRect){x,y,pixelSize};
                         
                         x = rect.size.width/2.0 + factor;
                         y = rect.size.height/2.0 - kPixelW - factor;
                         self.px_2.frame = (CGRect){x,y,pixelSize};
                         
                         x = rect.size.width/2.0 - kPixelW - factor;
                         y = rect.size.height/2.0 + factor;
                         self.px_3.frame = (CGRect){x,y,pixelSize};
                         
                         x = rect.size.width/2.0 + factor;
                         y = rect.size.height/2.0 + factor;
                         self.px_4.frame = (CGRect){x,y,pixelSize};
                     }
                     completion:^(BOOL finished){}];
}


@end
