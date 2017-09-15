//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "PetOwner.h"
#import "Pet.h"

@interface LPGViewController ()

@property (nonatomic, strong) UIImageView *petImageView;
@property (nonatomic,strong) Pet *pet;
@property (nonatomic, strong) UIImageView *apple;



@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
  

    
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.pet = [[Pet alloc]init];
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.petImageView.userInteractionEnabled = YES;//by default the image interaction is no....
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    //has to be on the bottom as the code loads my gesture will be next.. only these 3 methods have to be added under didLoad b/c they contain the other methods in the selector()
    [self petGesture];
    UIImageView *bucket =[self addBucket];
    [self addAppleToBucket:bucket];
    
}

-(void)petGesture{

    UIPanGestureRecognizer *petGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    self.petImageView.image = [UIImage imageNamed:@"default"];
    [self.petImageView addGestureRecognizer:petGesture];
    self.petImageView.userInteractionEnabled = YES;
    
}

-(void)handlePan:(UIPanGestureRecognizer *)pan {
    CGPoint velocity = [pan velocityInView:self.view];
    NSInteger speed = fabs(velocity.x + velocity.y);
    [self.pet pet:speed];
    
    if (self.pet.isGrumpy){
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
    } else {
        self.petImageView.image = [UIImage imageNamed:@"default"];
    }

}

//adds the bucket.
-(UIImageView*)addBucket {

    UIImageView *bucketImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bucket"]];
    CGRect frame = CGRectMake(0, 0, 100, 100);
    //origin lets us manipulate the x,y coordinates
    frame.origin.x = 20;
    frame.origin.y = CGRectGetMaxY(self.view.frame) - frame.size.height; // .size .view .heigh all built in CGPOINT
    bucketImage.frame = frame; //has to equal the new frames
    [self.view addSubview:bucketImage];
    return bucketImage;

}

-(UIImageView*)addAppleToBucket:(UIImageView*)bucket {
    UIImageView *appleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"apple"]];
    CGRect frame = CGRectMake(0, 0, 50, 50);
    //our apple's x value is relative to the bucket
    frame.origin.x = 20 + bucket.frame.size.width/2;
    frame.origin.y = CGRectGetMaxY(self.view.frame) - bucket.frame.size.height/2 - frame.size.height;
    //make the two new origins equal to the new frame
    appleImage.frame = frame;
    
    UIPinchGestureRecognizer *pinch =[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];//uses method handlepinch
    [appleImage addGestureRecognizer:pinch];
    appleImage.userInteractionEnabled = YES;
    [self.view addSubview:appleImage];
    
    return appleImage;
}

-(void)handlePinch:(UIPinchGestureRecognizer*)pinch {
    UIImageView *apple = (UIImageView*)pinch.view;
    UIImageView *otherApple = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"apple"]];
    CGRect frame = apple.frame;
    frame.origin.x = frame.origin.x + 5;
    frame.origin.y = frame.origin.y - 5;
    otherApple.frame = frame;
    otherApple.userInteractionEnabled = true;
    [self.view addSubview:otherApple];
    self.apple = otherApple;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleMoveApple:)]; //this has the method handlemove apple
    [self.apple addGestureRecognizer:pan];
}

-(void)handleMoveApple:(UIPanGestureRecognizer*)pan {
    CGRect frame = self.apple.frame;
    frame.origin = [pan locationInView:self.view];
    self.apple.frame = frame;
    if (pan.state == UIGestureRecognizerStateEnded) {
        CGRect frame = self.apple.frame;
        if (frame.origin.y < CGRectGetMaxY(self.petImageView.frame)) {
            [self.apple removeFromSuperview];
        } else {
            [UIView animateWithDuration:500 animations:^{
                CGRect frame = self.apple.frame;
                frame.origin.y = CGRectGetMaxY(self.view.frame) + 100;
                self.apple.frame = frame;
                [self.apple removeFromSuperview];
            }];
            
        }
    }
}


@end
