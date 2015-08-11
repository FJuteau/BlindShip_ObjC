//
//  MenuController.m
//  WarShips
//
//  Created by François Juteau on 10/08/2015.
//  Copyright (c) 2015 Thibault Le Cornec. All rights reserved.
//

#import "MenuController.h"
#import "ViewController.h"
#import "DataManager.h"

@interface MenuController () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *pickerData;
}
@property DataManager *sharedDataManager;
@end

@implementation MenuController


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
         self.sharedDataManager = [DataManager sharedDataManager];
    }
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    // init picker data
    pickerData = @[@"1", @"2", @"3", @"4", @"5"];
    
    self.LevelPicker.dataSource = self;
    self.LevelPicker.delegate = self;
    
    [self.HeadshotSwitch setOn:NO];
    [self.HeadshotSwitch setEnabled:NO];
    
    [self.LevelPicker setHidden:YES];
}

#pragma mark - Picker methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [pickerData count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return pickerData[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.sharedDataManager setLevel:row+1];
}

#pragma mark - Switch methods

- (IBAction)switchHeadshot:(id)sender
{
    [self.sharedDataManager setIsHeadshotEnable:self.HeadshotSwitch.on];
}

- (IBAction)shitchVisibility:(UISwitch *)sender
{
    [self.HeadshotSwitch setEnabled:!sender.on];
    [self.HeadshotSwitch setOn:!sender.on animated:YES];
    [self.LevelPicker setHidden:sender.on];
    [self.sharedDataManager setIsMoveEnable:!sender.on];
    [self.sharedDataManager setIsHeadshotEnable:!sender.on];
}

#pragma mark - Segue methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController *destination = [segue destinationViewController];
    
    [destination setSharedDataManager:self.sharedDataManager];
}

-(IBAction)exits:(UIStoryboardSegue *)sender
{
    
}

@end
