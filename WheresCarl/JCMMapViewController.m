//
//  JCMMapViewController.m
//  WheresCarl
//
//  Created by Noah Carnahan on 4/13/14.
//
//

#import "JCMMapViewController.h"

@interface JCMMapViewController ()

@end

@implementation JCMMapViewController

- (NSMutableArray*)getCheckInList
{
    return ((JCMTabBarViewController*) self.parentViewController.parentViewController).checkIns;
}

- (IBAction)unwindToViewAllCheckins:(UIStoryboardSegue *)segue
{
    JCMCheckInViewController *sendingView = [segue sourceViewController];
    if(sendingView.currentCheckIn != nil)
    {
        [[self getCheckInList] addObject:sendingView.currentCheckIn];
    }
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
