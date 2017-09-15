//
//  Pet.h
//  Phonagotchi
//
//  Created by Paul on 2017-09-14.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property(nonatomic,strong)NSString* name;
@property(nonatomic)NSInteger weight;
@property (readonly)bool isGrumpy;

-(instancetype)initWithPet:(NSString*)name weight:(NSInteger)weight grumpy:(bool)grumpy;

-(void)pet:(NSInteger)isGrumpy;

@end
