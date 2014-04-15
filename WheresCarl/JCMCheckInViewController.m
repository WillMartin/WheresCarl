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
// weak properties (instead of strong) b/c each property might want to refer back to the storing object
// i.e. the JCMCheckInViewController in this case
//
// A common use case for the weak attribute is parent-child data structures.
// By convention, the parent object should maintain a strong reference with it’s children,
// and the children should store a weak reference back to the parent.
// Weak references are also an inherent part of the delegate design pattern.
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *messageField;

@property CLLocationManager *locationManager;
@property CLLocation *currentLocation;
@end

@implementation JCMCheckInViewController

// Help from http://www.appcoda.com/how-to-get-current-location-iphone-user/
// Called when user has clicked Done button and we need to determine location
- (void)updateLocation
{
    NSLog(@"UPDATING LOCATION?");
    // Create a location manager if one doesn't already exist
    if(nil == self.locationManager)
        self.locationManager = [[CLLocationManager alloc] init];
    
    // locationManager should send updates to this controller class
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Send updates if user wants them
    if([CLLocationManager locationServicesEnabled])
    {
        [self.locationManager startUpdatingLocation];
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    self.currentLocation = newLocation;
    NSLog(@"didUpdateToLocation: %@", self.currentLocation);
    
    // After grabbing location, turn off updates. We'll turn them back on when needed
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
}

// Parse out user's input and set currentCheckIn to be a CheckIn object using said input
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    if (sender != self.doneButton) return;
    // If nameField or messageField is blank, don't create a checkin
    if (self.nameField.text.length < 1 || self.messageField.text.length < 1) return;
    
    _currentCheckIn = [[JCMCheckIn alloc] init];
    self.currentCheckIn.name = self.nameField.text;
    self.currentCheckIn.message = self.messageField.text;
    self.currentCheckIn.time = [NSDate date];
    self.currentCheckIn.location = self.currentLocation.coordinate;
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
    self.locationManager = [[CLLocationManager alloc] init];
    // Is this async? Start the request for location while user enters other data, so that once user has given
    // other input, location will already be ready!
    [self updateLocation];
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
