//
//  NeededGradesViewController.h
//  GradeCalculator
//
//  Created by Mayank Makwana on 1/24/14.
//  Copyright (c) 2014 Mayank Makwana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalVariables.h"

@interface NeededGradesViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *closeButton;

@property (strong, nonatomic) IBOutlet UILabel *cDesiredGrade;

@property (strong, nonatomic) IBOutlet UILabel *cMidtermGrade;

@property (strong, nonatomic) IBOutlet UILabel *cFinalGrade;

@property (strong, nonatomic) IBOutlet UILabel *cMp1Grade;

@property (strong, nonatomic) IBOutlet UILabel *cMp2Grade;

@property (strong, nonatomic) IBOutlet UILabel *cMp3Grade;

@property (strong, nonatomic) IBOutlet UILabel *cMp4Grade;

@end
