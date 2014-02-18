//
//  HNHHEQVisualizer.m
//  HNHH
//
//  Created by Dobango on 9/17/13.
//  Copyright (c) 2013 RC. All rights reserved.
//

#import "PCSEQVisualizer.h"
#import "UIImage+Color.h"

#define kWidth 12
#define kHeight 50
#define kPadding 1


@implementation PCSEQVisualizer
{
    NSTimer* timer;
    NSArray* barArray;
    NSArray* barReflectionArray;
    int height;
}
- (id)initWithNumberOfBars:(int)numberOfBars
{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, kPadding*numberOfBars+(kWidth*numberOfBars), kHeight);
        
        NSMutableArray* tempBarArray = [[NSMutableArray alloc]initWithCapacity:numberOfBars];
        
        for(int i=0;i<numberOfBars;i++){
            
            UIImageView* bar = [[UIImageView alloc]initWithFrame:CGRectMake(i*kWidth+i*kPadding, kHeight/2, kWidth, 1)];
            bar.image = [UIImage imageWithColor:self.barColor];
            [self addSubview:bar];
            [tempBarArray addObject:bar];
            
        }

        barArray = [[NSArray alloc]initWithArray:tempBarArray];
        
        NSMutableArray* tempBarReflectionArray = [[NSMutableArray alloc]initWithCapacity:numberOfBars];
        
        for(int i=0;i<numberOfBars;i++){
            
            UIImageView* barref = [[UIImageView alloc]initWithFrame:CGRectMake(i*kWidth+i*kPadding, kHeight/2, kWidth, 1)];
            barref.image = [UIImage imageWithColor:self.barColor];
            [self addSubview:barref];
            [tempBarReflectionArray addObject:barref];
            
        }
        
        barReflectionArray = [[NSArray alloc]initWithArray:tempBarReflectionArray];
        
        
        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2*2);
        self.transform = transform;
       
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stop) name:@"stopTimer" object:nil];
  
    }
    return self;
}


-(void)start{
    
    self.hidden = NO;
    timer = [NSTimer scheduledTimerWithTimeInterval:.35 target:self selector:@selector(ticker) userInfo:nil repeats:YES];
    
}


-(void)stop{
    
    [timer invalidate];
    timer = nil;
    
}

-(void)updateHeight:(int)ht{
    height=ht;
}

-(void)ticker{

    [UIView animateWithDuration:.35 animations:^{
        
        for (int i=0; i<barArray.count; i++) {
            UIImageView* bar=barArray[i];
            UIImageView* barReflection=barReflectionArray[i];
            
            double tmpheight=arc4random() % kHeight/2 + 1;
            
            CGRect rect = bar.frame;
            rect.size.height = tmpheight;
            bar.frame = rect;
            
            CGRect rectReflect = barReflection.frame;
            rectReflect.size.height = tmpheight;
            rectReflect.origin=CGPointMake(rectReflect.origin.x, bar.frame.origin.y-tmpheight);
            barReflection.frame = rectReflect;
            
        }
    
    }];
}

@end
