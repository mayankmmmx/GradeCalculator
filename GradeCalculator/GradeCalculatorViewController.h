//
//  GradeCalculatorViewController.h
//  GradeCalculator
//
//  Created by Mayank Makwana on 1/24/14.
//  Copyright (c) 2014 Mayank Makwana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalVariables.h"

@interface GradeCalculatorViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *mpWeight;

@property (strong, nonatomic) IBOutlet UITextField *midWeight;

@property (strong, nonatomic) IBOutlet UITextField *finalWeight;

@property (strong, nonatomic) IBOutlet UITextField *mp1Grade;

@property (strong, nonatomic) IBOutlet UITextField *mp2Grade;

@property (strong, nonatomic) IBOutlet UITextField *mp3Grade;

@property (strong, nonatomic) IBOutlet UITextField *mp4Grade;

@property (strong, nonatomic) IBOutlet UITextField *desiredGrade;

@property (strong, nonatomic) IBOutlet UITextField *midtermGrade;

@property (strong, nonatomic) IBOutlet UITextField *finalGrade;

@end
