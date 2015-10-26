//
//  GlobalVariables.h
//  GradeCalculator
//
//  Created by Mayank Makwana on 1/24/14.
//  Copyright (c) 2014 Mayank Makwana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVariables : NSObject {

NSString *someProperty;

}

@property (nonatomic) double mpWeightValue;

@property double midWeightValue;

@property double finalWeightValue;

@property double mp1GradeValue;

@property double mp2GradeValue;

@property double mp3GradeValue;

@property double mp4GradeValue;

@property double desiredGradeValue;

@property double finalGradeValue;

@property double midtermGradeValue;



//@property (nonatomic, retain) NSString *someProperty;

+ (id)sharedVariables;

@end
