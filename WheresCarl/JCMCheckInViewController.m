//
//  JCMCheckInViewController.m
//  WheresCarl
//
//  Created by Noah Carnahan on 4/13/14.
//
//

#import "JCMCheckInViewController.h"

@interface JCMCheckInViewController ()
// Private, since declared in .m file. These came from dragging the input boxes in the storyboard here
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *messageField;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
