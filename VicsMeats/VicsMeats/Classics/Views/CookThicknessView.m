//
//  CookThicknessView.m
//  VicsMeats
//
//  Created by Toan Quach on 1/3/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import "CookThicknessView.h"

#define kSlider_MinY            48
@implementation CookThicknessView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//- 254 - 64 - 48

- (void)setupView
{
    centerPoint = thicknessNumberImageView.center;
    thicknessNumber = 1.0;
    sliderImageView.center = CGPointMake(240, kSlider_MinY + 32*6);
    [self setThickNessImageView:@"1cm-b.png"];
}

- (float)getThicknessNumber
{
    return thicknessNumber;
}

- (void)sliderAnimationWithPoint:(CGPoint)point
{
    [UIView beginAnimations:@"Move Slider" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    sliderImageView.center = point;
    
    [UIView commitAnimations];
}

#pragma mark - Button Event

-(IBAction)button1CMTouchUp:(id)sender
{
    [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*6)];
    [self setThickNessImageView:@"1cm-b.png"];
}

- (IBAction)button2CMTouchUp:(id)sender
{
    [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*4)];
    [self setThickNessImageView:@"2cm-b.png"];
}

- (IBAction)button3CMTouchUp:(id)sender
{
    [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*2)];
    [self setThickNessImageView:@"3cm-b.png"];
}

- (IBAction)button4CMTouchUp:(id)sender
{
    [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY)];
    [self setThickNessImageView:@"4cm-b.png"];
}

- (void)setThickNessImageView:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    thicknessNumberImageView.image = image;
    CGRect rect = thicknessNumberImageView.frame;
    rect.size.width   = (int)(image.size.width/2 + 0.5);
    rect.size.height  = (int)(image.size.height/2 + 0.5);
    thicknessNumberImageView.frame = rect;
    thicknessNumberImageView.center = centerPoint;
}

// touch and move
#pragma mark - Touch event

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];    
    CGPoint locationPoint = [touch locationInView:self];
    CGPoint viewPoint = [sliderImageView convertPoint:locationPoint fromView:self];

    if ([sliderImageView pointInside:viewPoint withEvent:event])
    {
        NSLog(@"In Slider View Began");
        sliderImageView.center = CGPointMake(240, locationPoint.y);;
        isTouchInSlider = YES;
    }
    else
    {
        isTouchInSlider = NO;
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint locationPoint = [touch locationInView:self];
    
    if (isTouchInSlider)
    {
        NSLog(@"In Slider View Move");
        if (locationPoint.y >= kSlider_MinY && locationPoint.y <= (kSlider_MinY + 32*8))
        {
            [self updateThicknessNumber:locationPoint andType:NO];
        }
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint locationPoint = [touch locationInView:self];
    if (isTouchInSlider)
    {
        if (locationPoint.y >= kSlider_MinY && locationPoint.y <= (kSlider_MinY + 32*8))
        {
            [self updateThicknessNumber:locationPoint andType:YES];
        }
        else
        {
            if (thicknessNumber == 0.5)
            {
               [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*7)];
            }
            else if(thicknessNumber == 1.0)
            {
                [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*6)];
            }
            else if(thicknessNumber == 1.5)
            {
                [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*5)];
            }
            else if(thicknessNumber == 2.0)
            {
                [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*4)];
            }
            else if(thicknessNumber == 2.5)
            {
                [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*3)];
            }
            else if(thicknessNumber == 3.0)
            {
                [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*2)];
            }
            else if(thicknessNumber == 3.5)
            {
                [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY + 32*1)];
            }
            else if(thicknessNumber == 4.0)
            {
                [self sliderAnimationWithPoint:CGPointMake(240, kSlider_MinY)];
            }
        }
    }
}

- (void)updateThicknessNumber:(CGPoint) locationPoint  andType:(BOOL)flag
{
    NSString *imageName = @"";
    [UIView beginAnimations:@"Move Slider" context:nil];
    [UIView setAnimationDuration:0.001];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    if (locationPoint.y >= kSlider_MinY && locationPoint.y < kSlider_MinY + 32) //value 4CM
    {
        thicknessNumber = 4.0;
        if (flag)
        {
            sliderImageView.center = CGPointMake(240, kSlider_MinY);
        }
        else
        {
            sliderImageView.center = CGPointMake(240, locationPoint.y);
        }
        imageName = @"4cm-b.png";
    }
    else if(locationPoint.y >= (kSlider_MinY + 32) && locationPoint.y < (kSlider_MinY + 32*2)) // value 3.5CM
    {
        thicknessNumber = 3.5;
        if (flag)
        {
            sliderImageView.center = CGPointMake(240, kSlider_MinY + 32);
        }
        else
        {
            sliderImageView.center = CGPointMake(240, locationPoint.y);
        }
        imageName = @"3.5cm-b.png";
    }
    else if(locationPoint.y >= (kSlider_MinY + 32*2) && locationPoint.y < (kSlider_MinY + 32*3)) // value 3CM
    {
        thicknessNumber = 3;
        if (flag)
        {
            sliderImageView.center = CGPointMake(240, kSlider_MinY + 32*2);
        }
        else
        {
            sliderImageView.center = CGPointMake(240, locationPoint.y);
        }
        imageName = @"3cm-b.png";
    }
    else if(locationPoint.y >= (kSlider_MinY + 32*3) && locationPoint.y < (kSlider_MinY + 32*4))// value 2.5
    {
        thicknessNumber = 2.5;
        if (flag)
        {
            sliderImageView.center = CGPointMake(240, kSlider_MinY + 32*3);
        }
        else
        {
            sliderImageView.center = CGPointMake(240, locationPoint.y);
        }
        imageName = @"2.5cm-b.png";
    }
    else if(locationPoint.y >= (kSlider_MinY + 32*4) && locationPoint.y < (kSlider_MinY + 32*5)) // value 2
    {
        thicknessNumber = 2;
        if (flag)
        {
            sliderImageView.center = CGPointMake(240, kSlider_MinY + 32*4);
        }
        else
        {
            sliderImageView.center = CGPointMake(240, locationPoint.y);
        }
        imageName = @"2cm-b.png";
    }
    else if(locationPoint.y >= (kSlider_MinY + 32*5) && locationPoint.y < (kSlider_MinY + 32*6)) // value 1.5
    {
        thicknessNumber = 1.5;
        if (flag)
        {
            sliderImageView.center = CGPointMake(240, kSlider_MinY + 32*5);
        }
        else
        {
            sliderImageView.center = CGPointMake(240, locationPoint.y);
        }
        imageName = @"1.5cm-b.png";
    }
    else if(locationPoint.y >= (kSlider_MinY + 32*6) && locationPoint.y < (kSlider_MinY + 32*7)) // value 1
    {
        thicknessNumber = 1;
        if (flag)
        {
            sliderImageView.center = CGPointMake(240, kSlider_MinY + 32*6);
        }
        else
        {
            sliderImageView.center = CGPointMake(240, locationPoint.y);
        }
        imageName = @"1cm-b.png";
    }
    else if(locationPoint.y >= (kSlider_MinY + 32*7) && locationPoint.y < (kSlider_MinY + 32*8))
    {
        thicknessNumber = 0.5;
        if (flag)
        {
            sliderImageView.center = CGPointMake(240, kSlider_MinY + 32*7);
        }
        else
        {
            sliderImageView.center = CGPointMake(240, locationPoint.y);
        }
        imageName = @"0.5cm-b.png";
    }
    
    [UIView commitAnimations];
    [self setThickNessImageView:imageName];
}

@end
