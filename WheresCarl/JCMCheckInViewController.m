//
//  JCMCheckInViewController.m
//  WheresCarl
//
//  Created by  on 4/11/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "JCMCheckInViewController.h"

@interface JCMCheckInViewController ()
// Private, since declared in .m file. These came from dragging the input boxes in the storyboard here
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation JCMCheckInViewController

// Parse out user's input and set currentCheckIn to be a CheckIn object using said input
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    // If nameField or messageField is blank, don't create a checkin
    if (self.nameField.text.length < 1 || self.messageField.text.length < 1) return;
    
    self.currentCheckIn = [[JCMCheckIn alloc] init];
    self.currentCheckIn.name = self.nameField.text;
    self.currentCheckIn.message = self.messageField.text;
    self.currentCheckIn.time = [NSDate date];
//    self.currentCheckIn.location = CLLocationCoordinate2DMake(23.1, 431.2);
    
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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
