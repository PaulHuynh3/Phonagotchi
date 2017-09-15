//
//  Pet.m
//  Phonagotchi
//
//  Created by Paul on 2017-09-14.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet

NSInteger const GrumpyVelocity = 100;

-(instancetype)initWithPet:(NSString *)name weight:(NSInteger)weight grumpy:(bool)grumpy{

    if (self = [super init]){
    
        _name = name;
        _weight = weight;
    }
    return self;
}


-(void)pet:(NSInteger)velocity{

//    if (velocity >= GrumpyVelocity) {
//        _isGrumpy = YES;
//    }

    
    _isGrumpy = velocity >= GrumpyVelocity;
}

@end
