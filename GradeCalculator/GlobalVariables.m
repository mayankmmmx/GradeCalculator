//
//  GlobalVariables.m
//  GradeCalculator
//
//  Created by Mayank Makwana on 1/24/14.
//  Copyright (c) 2014 Mayank Makwana. All rights reserved.
//

#import "GlobalVariables.h"

@implementation GlobalVariables

@synthesize mpWeightValue;
@synthesize midWeightValue;
@synthesize finalWeightValue;
@synthesize mp1GradeValue;
@synthesize mp2GradeValue;
@synthesize mp3GradeValue;
@synthesize mp4GradeValue;
@synthesize desiredGradeValue;
@synthesize midtermGradeValue;
@synthesize finalGradeValue;


#pragma mark Singleton Methods

+ (id)sharedVariables {
    static GlobalVariables *sharedGlobalVariables = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGlobalVariables = [[self alloc] init];
    });
    return sharedGlobalVariables;
}

- (id)init {
    if (self = [super init]) {
        mpWeightValue = 0;
        midWeightValue = 0;
        finalWeightValue = 0;
        mp1GradeValue = 0;
        mp2GradeValue = 0;
        mp3GradeValue = 0;
        mp4GradeValue = 0;
        desiredGradeValue = 0;
        midtermGradeValue = 0;
        finalGradeValue = 0;
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
