//
//  JCMMapViewController.m
//  WheresCarl
//
//  Created by Noah Carnahan on 4/13/14.
//
//

#import "JCMMapViewController.h"

@interface JCMMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation JCMMapViewController

- (NSMutableArray*)getCheckInList
{
    return ((JCMTabBarViewController*) self.parentViewController.parentViewController).checkIns;
}

- (void)addAnnotationsToMap
{
    if(nil == self.mapView)
    {
        self.mapView = [[MKMapView alloc] init];
        self.mapView.delegate = self;
    }
    
    // Loop over the CheckIn objects and display them! Grab them from JCMTabBarViewController
    NSMutableArray *checkIns = [self getCheckInList];
    
    NSLog(@"About to loop over checkins");
    
    for (JCMCheckIn *ch in checkIns)
    {
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = ch.location;
        annotation.title = ch.message;
        annotation.subtitle = ch.name;
        [self.mapView addAnnotation:annotation];
        NSLog(@"added an annotation %@", ch.name);
        NSLog([ch description]);
    }
    NSLog(@"--------------------");
}

- (IBAction)unwindToViewAllCheckins:(UIStoryboardSegue *)segue
{
    JCMCheckInViewController *sendingView = [segue sourceViewController];
    if(sendingView.currentCheckIn != nil)
    {
        [[self getCheckInList] addObject:sendingView.currentCheckIn];
    }
    [self addAnnotationsToMap];
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
    if(nil == self.mapView)
    {
        self.mapView = [[MKMapView alloc] init];
    
        // mapView's delegate is this class itself!
        self.mapView.delegate = self;
    }
    
    // Set center to Carleton
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(JCMCarletonLat, JCMCarletonLong);
    MKCoordinateSpan centerSpan = MKCoordinateSpanMake(.3, .3);
    MKCoordinateRegion centerRegion = MKCoordinateRegionMake(centerCoordinate, centerSpan);
    
    [self.mapView setRegion:centerRegion];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addAnnotationsToMap];
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
