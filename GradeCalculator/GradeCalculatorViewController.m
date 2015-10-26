//
//  GradeCalculatorViewController.m
//  GradeCalculator
//
//  Created by Mayank Makwana on 1/24/14.
//  Copyright (c) 2014 Mayank Makwana. All rights reserved.
//

#import "GradeCalculatorViewController.h"
#import "GlobalVariables.h"

@interface GradeCalculatorViewController ()

@end

@implementation GradeCalculatorViewController

@synthesize mpWeight = _mpWeight;
@synthesize midWeight = _midWeight;
@synthesize finalWeight = _finalWeight;
@synthesize mp1Grade = _mp1Grade;
@synthesize mp2Grade = _mp2Grade;
@synthesize mp3Grade = _mp3Grade;
@synthesize mp4Grade = _mp4Grade;
@synthesize desiredGrade = _desiredGrade;
@synthesize midtermGrade = _midtermGrade;
@synthesize finalGrade =_finalGrade;

int check = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSRange range = NSMakeRange(0, 2);
	// Do any additional setup after loading the view, typically from a nib.
    
    //Marking Period Weight Text Field Set-Up
    _mpWeight.borderStyle = UITextBorderStyleRoundedRect;
    _mpWeight.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_mpWeight shouldChangeCharactersInRange:range replacementString:@""];
    
    //Midterm Weight Text Field Set-Up
    _midWeight.borderStyle = UITextBorderStyleRoundedRect;
    _midWeight.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_midWeight shouldChangeCharactersInRange:range replacementString:@""];
    
    //Final Exam Weight Text Field Set-Up
    _finalWeight.borderStyle = UITextBorderStyleRoundedRect;
    _finalWeight.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_finalWeight shouldChangeCharactersInRange:range replacementString:@""];
    
    //Marking Period 1 Grade Text Field Set-Up
    _mp1Grade.borderStyle = UITextBorderStyleRoundedRect;
    _mp1Grade.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_mp1Grade shouldChangeCharactersInRange:range replacementString:@""];
    
    //Marking Period 2 Grade Text Field Set-Up
    _mp2Grade.borderStyle = UITextBorderStyleRoundedRect;
    _mp2Grade.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_mp2Grade shouldChangeCharactersInRange:range replacementString:@""];
    
    //Marking Period 3 Grade Text Field Set-Up
    _mp3Grade.borderStyle = UITextBorderStyleRoundedRect;
    _mp3Grade.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_mp3Grade shouldChangeCharactersInRange:range replacementString:@""];
    
    //Marking Period 4 Grade Text Field Set-Up
    _mp4Grade.borderStyle = UITextBorderStyleRoundedRect;
    _mp4Grade.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_mp4Grade shouldChangeCharactersInRange:range replacementString:@""];
    
    //Desired Grade Text Field Set-Up
    _desiredGrade.borderStyle = UITextBorderStyleRoundedRect;
    _desiredGrade.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_desiredGrade shouldChangeCharactersInRange:range replacementString:@""];
    
    //Midterm Grade Text Field Set-Up
    _midtermGrade.borderStyle = UITextBorderStyleRoundedRect;
    _midtermGrade.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_midtermGrade shouldChangeCharactersInRange:range replacementString:@""];
    
    //Final Grade Text Field Set-Up
    _finalGrade.borderStyle = UITextBorderStyleRoundedRect;
    _finalGrade.keyboardType = UIKeyboardTypeNumberPad;
    [self textField:_desiredGrade shouldChangeCharactersInRange:range replacementString:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    if(newLength > 3)
        return NO;
    else
        return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(_mp3Grade.isEditing || _mp4Grade.isEditing || _desiredGrade.isEditing)
    {
        [self animateTextField: textField up: YES];
        check = 1;
    }
    
    else
        check = 0;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(check == 1)
    {
        [self animateTextField:textField up:NO];
        check = 0;
    }
    
    GlobalVariables *sharedVariables = [GlobalVariables sharedVariables];
    
    sharedVariables.mpWeightValue= [self returnInput:_mpWeight];
    sharedVariables.midWeightValue = [self returnInput:_midWeight];
    sharedVariables.finalWeightValue = [self returnInput:_finalWeight];
    sharedVariables.mp1GradeValue = [self returnInput:_mp1Grade];
    sharedVariables.mp2GradeValue = [self returnInput:_mp2Grade];
    sharedVariables.mp3GradeValue = [self returnInput:_mp3Grade];
    sharedVariables.mp4GradeValue = [self returnInput:_mp4Grade];
    sharedVariables.desiredGradeValue = [self returnInput:_desiredGrade];
    sharedVariables.midtermGradeValue = [self returnInput:_midtermGrade];
    sharedVariables.finalGradeValue = [self returnInput:_finalGrade];
}

- (NSInteger) returnInput: (UITextField *) textField
{
    NSString *text = textField.text;
    NSInteger doubleValue = [text doubleValue];
    return (NSInteger)doubleValue;
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 180; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

//tap screen anywhere to dismiss numpad
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_mpWeight resignFirstResponder];
    [_midWeight resignFirstResponder];
    [_finalWeight resignFirstResponder];
    [_mp1Grade resignFirstResponder];
    [_mp2Grade resignFirstResponder];
    [_mp3Grade resignFirstResponder];
    [_mp4Grade resignFirstResponder];
    [_desiredGrade resignFirstResponder];
}


@end
