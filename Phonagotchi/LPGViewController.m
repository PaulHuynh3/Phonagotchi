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

@property (nonatomic) UIImageView *petImageView;
@property Pet *pet;


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
    
    //has to be on the bottom as the code loads my gesture will be next..
    [self petGesture];
    [self addBucket];
    
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
    //origin is a built in CGPoint property to call with x and y
    frame.origin.x = 20;
    frame.origin.y = CGRectGetMaxY(self.view.frame) - frame.size.height; // .size .view .heigh all built in CGPOINT
    bucketImage.frame = frame; //has to equal the new frames
    [self.view addSubview:bucketImage];
    return bucketImage;

}

-(UIImage)


@end
