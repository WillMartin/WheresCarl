//
//  JCMTabBarViewController.m
//  WheresCarl
//
//  Created by Noah Carnahan, Nick Jones, and Will Martin on 4/13/14.
//
//

#import "JCMTabBarViewController.h"

@interface JCMTabBarViewController ()

@end

@implementation JCMTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadSavedCheckIns
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.checkIns == nil)
    {
        self.checkIns = [[NSMutableArray alloc] init];
    }
    else
    {
        
    }
    
    [self loadSavedCheckIns];
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
