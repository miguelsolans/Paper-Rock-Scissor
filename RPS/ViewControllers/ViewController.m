//
//  ViewController.m
//  RPS
//
//  Created by Miguel Solans on 29/12/2020.
//

#import "ViewController.h"
#import "GameChoices.h"
#import "GameViewModel.h"

@interface ViewController ()

@property (nonatomic, strong) GameViewModel *gameViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gameViewModel = [[GameViewModel alloc] initWithUserName:@"User"];
    
    [self initNotifcations];
    [self updateView];
    
}

- (void) updateView {
    // TODO: update view - score, change player names to methods
    [self.adversaryName setText:@"Machine"];
    [self.userName setText:@"User"];
}

- (void) updateAdversaryChoice: (NSInteger) number {
    GameChoice choice = number;
    switch (choice) {
        case ROCK:
            // Update to rock
            [self.adversaryChoice setText:@"✊🏼"];
            break;
        case SCISSOR:
            [self.adversaryChoice setText:@"✌🏼"];
            // Update to scissor
            break;
        case PAPER:
            [self.adversaryChoice setText:@"✋🏼"];
            // Update to paper
            break;
    }
}
#pragma mark - Actions
- (IBAction)rockTapped:(id)sender {
    NSLog(@"Rocked Pressed");
    [self.myChoice setText:@"✊🏼"];
    [self.gameViewModel playGame:ROCK];
}

- (IBAction)paperTapped:(id)sender {
    NSLog(@"Paper Pressed");
    [self.myChoice setText:@"✋🏼"];
    [self.gameViewModel playGame:PAPER];
}

- (IBAction)scissorTapped:(id)sender {
    NSLog(@"Scissor Pressed");
    [self.myChoice setText:@"✌🏼"];
    [self.gameViewModel playGame:SCISSOR];
}

#pragma mark - Notifcations
- (void) initNotifcations {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameEnded:) name:@"userWon" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameEnded:) name:@"machineWone" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gameEnded:) name:@"aTie" object:nil];
}

- (void) gameEnded: (NSNotification *) notification {
    NSLog(@"Game has come to an end");
    if([[notification name] isEqualToString:@"userWon"]) {
        [self winAlert];
        NSNumber *number = notification.object;
        [self updateAdversaryChoice:[number intValue]];
        
    } else if([[notification name] isEqualToString:@"machineWon"]) {
        [self lostAlert];
        NSNumber *number = notification.object;
        [self updateAdversaryChoice:[number intValue]];
        
    } else {
        [self tieAlert];
        NSNumber *number = notification.object;
        [self updateAdversaryChoice:[number intValue]];
    }
}

#pragma mark - Alerts

- (void) winAlert {
    UIAlertController * alert = [UIAlertController
                    alertControllerWithTitle:@"You Won!"
                                     message:@"Congratulations, you won this match!"
                              preferredStyle:UIAlertControllerStyleAlert];



    UIAlertAction *closeButton = [UIAlertAction
                        actionWithTitle:@"Sweet!"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * action) {
                            NSLog(@"Play again pressed");
                        }];
    

    [alert addAction:closeButton];

    [self presentViewController:alert animated:YES completion:nil];
}

- (void) lostAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"You Lost..." message:@"Don't give up, try again!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *closeButton = [UIAlertAction
                        actionWithTitle:@"Dang!"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * _Nonnull action) {
                            NSLog(@"Play again pressed");
                        }];
    
    [alert addAction:closeButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) tieAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"It's a tie!" message:@"Shall we go for another row?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *closeButton = [UIAlertAction
                        actionWithTitle:@"Yes!!"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * _Nonnull action) {
                            NSLog(@"Play again pressed");
                        }];
    
    [alert addAction:closeButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}
@end
