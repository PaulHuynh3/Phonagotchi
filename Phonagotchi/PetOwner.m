//
//  PetOwner.m
//  Phonagotchi
//
//  Created by Paul on 2017-09-14.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "PetOwner.h"

@implementation PetOwner

-(instancetype)init{

    if (self = [super init]){
        _petOne = [[Pet alloc]initWithPet:@"rocky" weight:20 grumpy:NO];
        _petTwo = [[Pet alloc]initWithPet:@"lucky" weight:30 grumpy:YES];
    
    }
    return self;
}

/* 
 Create a pan gesture recognizer that will allow you to pet the phonagotchi. Have it so that if the user pets too fast, it gets grumpy. Use your own judgement about how fast is too fast, and have a method on the model that represents the petting and takes a velocity. Add a readonly property that says if the pet is grumpy or not.
 
 */

//-(Pet *)touchingPet{
//
//    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
//  
//}



@end
