//
//  CookDonenessView.m
//  VicsMeats
//
//  Created by Toan Quach on 1/4/13.
//  Copyright (c) 2013 iPhoneDev. All rights reserved.
//

#import "CookDonenessView.h"

#define kSlider_MinY        18
#define kSlider_Center_X    238.5

@implementation CookDonenessView

@synthesize parentScrollView;

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

- (void)setupView
{
    donenessIndex = kCookDoneness_Blue_Tag;
    sliderImageView.center = CGPointMake(kSlider_Center_X, kSlider_MinY);
    [self setSelectedDoneness:kCookDoneness_Blue_Tag];
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

- (IBAction)blueButtonTouchUp:(id)sender
{
    [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kSlider_MinY )];
    [self setSelectedDoneness:kCookDoneness_Blue_Tag];
}

- (IBAction)rareButtonTouchUp:(id)sender
{
    [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_Rare_Height )];
    [self setSelectedDoneness:kCookDoneness_Rare_Tag];
}

- (IBAction)mediumRareButtonTouchUp:(id)sender
{
    [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_MediumRare_Height )];
    [self setSelectedDoneness:kCookDoneness_MediumRare_Tag];
}

- (IBAction)mediumButtonTouchUp:(id)sender
{
    [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_Medium_Height )];
    [self setSelectedDoneness:kCookDoneness_Medium_Tag];
}

- (IBAction)mediumWellButtonTouchUp:(id)sender
{
    [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_MediumWell_Height )];
    [self setSelectedDoneness:kCookDoneness_MediumWell_Tag];
}

- (IBAction)wellDoneButtonTouchUp:(id)sender
{
    [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_WellDone_Height )];
    [self setSelectedDoneness:kCookDoneness_WellDone_Tag];
}

- (void)setSelectedDoneness:(int)tag
{
    blueButton.selected = NO;
    rareButton.selected = NO;
    mediumRareButton.selected = NO;
    mediumButton.selected = NO;
    mediumWellButton.selected = NO;
    wellDoneButton.selected = NO;
    switch (tag)
    {
        case kCookDoneness_Blue_Tag:
            blueButton.selected = YES;
            break;
        case kCookDoneness_Rare_Tag:
            rareButton.selected = YES;
            break;
        case kCookDoneness_MediumRare_Tag:
            mediumRareButton.selected = YES;
            break;
        case kCookDoneness_Medium_Tag:
            mediumButton.selected = YES;
            break;
        case kCookDoneness_MediumWell_Tag:
            mediumWellButton.selected = YES;
            break;
        case kCookDoneness_WellDone_Tag:
            wellDoneButton.selected = YES;
            break;
        default:
            break;
    }
    
    donenessIndex = tag;
}

#pragma mark - Touch event

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint locationPoint = [touch locationInView:self];
    CGPoint viewPoint = [sliderImageView convertPoint:locationPoint fromView:self];
    
    if ([sliderImageView pointInside:viewPoint withEvent:event])
    {
        NSLog(@"In Slider View Began");
        sliderImageView.center = CGPointMake(kSlider_Center_X, locationPoint.y);;
        isTouchInSlider = YES;
        
        self.parentScrollView.scrollEnabled = NO;
    }
    else
    {
        isTouchInSlider = NO;
        self.parentScrollView.scrollEnabled = YES;
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint locationPoint = [touch locationInView:self];
    
    NSLog(@"%@",NSStringFromCGPoint(locationPoint));
    if (isTouchInSlider)
    {
        NSLog(@"In Slider View Move");
        if (locationPoint.y >= kSlider_MinY && locationPoint.y <= kSlider_MinY + 200)
        {
            [self updateDonenessIndex:locationPoint andType:NO];
        }
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint locationPoint = [touch locationInView:self];
    if (isTouchInSlider)
    {
        if (locationPoint.y >= kSlider_MinY && locationPoint.y <= (kSlider_MinY + 200))
        {
            [self updateDonenessIndex:locationPoint andType:YES];
        }
        else
        {
            if (donenessIndex == kCookDoneness_Blue_Tag)
            {
                [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kSlider_MinY )];
            }
            else if(donenessIndex == kCookDoneness_Rare_Tag)
            {
                [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_Rare_Height )];
            }
            else if(donenessIndex == kCookDoneness_MediumRare_Tag)
            {
                [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_MediumRare_Height )];
            }
            else if(donenessIndex == kCookDoneness_Medium_Tag)
            {
                [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_Medium_Height )];
            }
            else if(donenessIndex == kCookDoneness_MediumWell_Tag)
            {
                [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_MediumWell_Height )];
            }
            else if(donenessIndex == kCookDoneness_WellDone_Tag)
            {
                [self sliderAnimationWithPoint: CGPointMake(kSlider_Center_X, kCookDoneness_WellDone_Height )];
            }
        }
    }
    
    self.parentScrollView.scrollEnabled = YES;
}

- (void)updateDonenessIndex:(CGPoint) locationPoint andType:(BOOL)flag
{
    int indexTag = 0;
    [UIView beginAnimations:@"Move Slider" context:nil];
    [UIView setAnimationDuration:0.001];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    if (locationPoint.y >= kSlider_MinY && locationPoint.y < kSlider_MinY + 34/2) //value Blue
    {
        indexTag = kCookDoneness_Blue_Tag;
        if (flag)
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, kSlider_MinY);
        }
        else
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, locationPoint.y);
        }
    }
    else if(locationPoint.y >= (kCookDoneness_Rare_Height - 34/2) && locationPoint.y < (kCookDoneness_Rare_Height + 40/2)) // value Rare
    {
        indexTag = kCookDoneness_Rare_Tag;
        if (flag)
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, kCookDoneness_Rare_Height);
        }
        else
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, locationPoint.y);
        }
    }
    else if(locationPoint.y >= (kCookDoneness_MediumRare_Height - 40/2) && locationPoint.y < (kCookDoneness_MediumRare_Height + 36/2)) // value Medium Rare
    {
        indexTag = kCookDoneness_MediumRare_Tag;
        if (flag)
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, kCookDoneness_MediumRare_Height);
        }
        else
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, locationPoint.y);
        }
    }
    else if(locationPoint.y >= (kCookDoneness_Medium_Height - 36/2) && locationPoint.y < (kCookDoneness_Medium_Height + 38/2))// value Medium
    {
        indexTag = kCookDoneness_Medium_Tag;
        if (flag)
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, kCookDoneness_Medium_Height);
        }
        else
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, locationPoint.y);
        }
    }
    else if(locationPoint.y >= (kCookDoneness_MediumWell_Height - 38/2) && locationPoint.y < (kCookDoneness_MediumWell_Height + 34/2)) // value Medium Well
    {
        indexTag = kCookDoneness_MediumWell_Tag;
        if (flag)
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, kCookDoneness_MediumWell_Height);
        }
        else
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, locationPoint.y);
        }
    }
    else if(locationPoint.y >= (kCookDoneness_WellDone_Height - 34/2) && locationPoint.y < (kCookDoneness_WellDone_Height + 18)) // value WellDone
    {
        indexTag = kCookDoneness_WellDone_Tag;
        if (flag)
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, kCookDoneness_WellDone_Height);
        }
        else
        {
            sliderImageView.center = CGPointMake(kSlider_Center_X, locationPoint.y);
        }
    }
    
    [UIView commitAnimations];
    
    [self setSelectedDoneness:indexTag];
}

@end
