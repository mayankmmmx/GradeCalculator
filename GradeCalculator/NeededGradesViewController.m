//
//  NeededGradesViewController.m
//  GradeCalculator
//
//  Created by Mayank Makwana on 1/24/14.
//  Copyright (c) 2014 Mayank Makwana. All rights reserved.
//

#import "NeededGradesViewController.h"
#import "GlobalVariables.h"

@interface NeededGradesViewController ()

@end

@implementation NeededGradesViewController

@synthesize closeButton = _closeButton;
@synthesize cDesiredGrade = _cDesiredGrade;
@synthesize cMidtermGrade = _cMidtermGrade;
@synthesize cFinalGrade = _cFinalGrade;
@synthesize cMp1Grade = _cMp1Grade;
@synthesize cMp2Grade = _cMp2Grade;
@synthesize cMp3Grade = _cMp3Grade;
@synthesize cMp4Grade = _cMp4Grade;

double desiredGradeValue;
double midtermGradeValue;
double finalGradeValue;
double mp1GradeValue;
double mp2GradeValue;
double mp3GradeValue;
double mp4GradeValue;

double mpNeededValue;
double examNeededValue;
double mpDesiredGradeValue;
double examDesiredGradeValue;

double mpWeight;
double midtermWeight;
double finalWeight;

double allGrades[6];

int counter;
int counterStarter = 0;

double sumGrade;
double needGrade;
double needGrade1;

double mpNeedGrade;

double examNeedGrade;
double examNeedGrade1;

NSMutableArray *nonZeroArray;

//double calculatedGrade;

- (void) loadVariables
{
    //Loads all variables from Global Variables
    GlobalVariables *sharedVariables = [GlobalVariables sharedVariables];
    desiredGradeValue = sharedVariables.desiredGradeValue;
    midtermGradeValue = sharedVariables.midtermGradeValue;
    finalGradeValue = sharedVariables.finalGradeValue;
    mp1GradeValue = sharedVariables.mp1GradeValue;
    mp2GradeValue = sharedVariables.mp2GradeValue;
    mp3GradeValue = sharedVariables.mp3GradeValue;
    mp4GradeValue = sharedVariables.mp4GradeValue;
    mpWeight = sharedVariables.mpWeightValue / 100;
    midtermWeight = sharedVariables.midWeightValue / 100;
    finalWeight = sharedVariables.finalWeightValue / 100;
    
    //Creates value need for achieving desired grade for MP and Final/Midterm
    mpDesiredGradeValue = desiredGradeValue;
    examDesiredGradeValue = desiredGradeValue;
    
    mpNeededValue = mpDesiredGradeValue * (mpWeight * 4);
    examNeededValue = examDesiredGradeValue * (midtermWeight + finalWeight);

    //Assigns MP grades to array
    allGrades[0] = mp1GradeValue;
    allGrades[1] = mp2GradeValue;
    allGrades[2] = mp3GradeValue;
    allGrades[3] = mp4GradeValue;
    
    //Assigns Final/Midterm grades to array
    allGrades[4] = midtermGradeValue;
    allGrades[5] = finalGradeValue;
    
    nonZeroArray = [[NSMutableArray alloc] initWithCapacity:0]; //creates array to take in non zero numbers
    
    _cDesiredGrade.text = [NSString stringWithFormat:@"%.2f",desiredGradeValue]; //sets Desired text logo to desired grade from Global Variables
    
    counter = 0;
    sumGrade = 0;
    mpNeedGrade = 0;
    
    examNeedGrade = 0;
    examNeedGrade1 = 0;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadVariables]; //loads variables

    [_closeButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside]; //adds done button to close ViewController

    [self calculateMPGrades]; //calculate marking period grades
    
    [self calculateMidtermAndFinalGrades]; //calculates midterm and final grades
    
    if(examNeedGrade > 100)
    {
        mpDesiredGradeValue = desiredGradeValue + (examNeedGrade - 100);
        examDesiredGradeValue = desiredGradeValue - (examNeedGrade - 100);
        
        mpNeededValue = mpDesiredGradeValue * (mpWeight * 4);
        examNeededValue = examDesiredGradeValue * (midtermWeight + finalWeight);
        
        for(int x = 0; x < 4; x++)
        {
            allGrades[x] = 0;
        }
        
        [self calculateMPGrades];
        [self calculateMidtermAndFinalGrades];
    }
    
    if(examNeedGrade1 > 100)
    {
        mpNeededValue = mpNeededValue + (needGrade1 - 100);
        examNeededValue = examNeededValue - (needGrade1 - 100); 
    }
    
    [self finalAssign]; //assings calculations to labels
}

-(void)calculateMPGrades //calculates marking period grades
{
    
    for(int x = 0; x < 4; x++) //looks to see how many empty spaces there are
    {
        if(allGrades[x] == 0)
            counter++;
    }
    
    for(int x = 0; x < 4; x++) //adds all filled spaces to nonZeroArray
    {
        NSNumber *tempObj = [NSNumber numberWithDouble:allGrades[x]];
        if(allGrades[x] != 0)
            [nonZeroArray addObject:tempObj];
    }
    
    for(int y = 0; y < [nonZeroArray count]; y++) //adds together all values of nonZeroArray by multiplying them with weight
    {
        sumGrade += ([nonZeroArray[y] doubleValue]*mpWeight);
    }
    
    mpNeedGrade= mpNeededValue - sumGrade; //calculates the remaining points needed
    mpNeedGrade = mpNeedGrade/mpWeight; //converts points to grade
    mpNeedGrade = mpNeedGrade/counter; //divides to allocate between marking periods
    
    for (int y = 0; y < 4; y++) { //adds needed grade back to array
        if(allGrades[y] == 0)
            allGrades[y] = mpNeedGrade;
    }
    
    [nonZeroArray removeAllObjects]; // clears array
}

-(void)calculateMidtermAndFinalGrades // calculates midterm and final grade
{
    if(allGrades[4] == 0 && allGrades[5] != 0) //checks to see if midterm field is blank
    {
        examNeedGrade = examNeededValue - (allGrades[5]*finalWeight);
        examNeedGrade = examNeedGrade/midtermWeight;
    }
    
    if(allGrades[4] != 0 && allGrades[5] == 0) //cehcks to see if final field is blank
    {
        examNeedGrade = examNeededValue - (allGrades[4]*midtermWeight);
        examNeedGrade = examNeedGrade/finalWeight;
    }
    
    if(allGrades[4] == 0 && allGrades[5] == 0 )
    {
        examNeedGrade = desiredGradeValue;
        examNeedGrade1 = desiredGradeValue;
    }
}

-(void) finalAssign // assigns final values before printing them to screen
{
    mp1GradeValue = allGrades[0];
    mp2GradeValue = allGrades[1];
    mp3GradeValue = allGrades[2];
    mp4GradeValue = allGrades[3];
    
    midtermGradeValue = allGrades[4];
    finalGradeValue = allGrades[5];
    
    _cMp1Grade.text = [NSString stringWithFormat:@"%.2f", mp1GradeValue];
    _cMp2Grade.text = [NSString stringWithFormat:@"%.2f", mp2GradeValue];
    _cMp3Grade.text = [NSString stringWithFormat:@"%.2f", mp3GradeValue];
    _cMp4Grade.text = [NSString stringWithFormat:@"%.2f", mp4GradeValue];
    
    _cMidtermGrade.text = [NSString stringWithFormat:@"%.2f", midtermGradeValue];
    _cFinalGrade.text = [NSString stringWithFormat:@"%.2f", finalGradeValue];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonPressed
{
        [self dismissViewControllerAnimated:YES completion:nil];
}


-(double) getGrade: (double)mpWeight : (double)midWeight : (double)midGrade : (double)finalGrade :(double)finalWeight : (double)mpGrade1 : (double)mpGrade2 : (double)mpGrade3 : (double)mpGrade4 : (double)desiredGrade
{
    double grade = (midGrade * midWeight) + (finalGrade *finalWeight) + (mpGrade1 * mpWeight) + (mpGrade2 * mpWeight) + (mpGrade3 * mpWeight) + (mpGrade4 * mpWeight);
    return grade;
}



@end
