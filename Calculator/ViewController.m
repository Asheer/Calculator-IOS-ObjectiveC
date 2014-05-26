//
//  ViewController.m
//  Calculator
//
//  Created by Final on 5/25/14.
//  Copyright (c) 2014 final. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    float result;             // hold result of calculations, converted to int if needed
    NSString *operation;      // holds string values of arithmetic operations
    NSMutableArray *storage;  // holds numbers for calculations
    NSMutableArray *numbers;
    NSString *number;
    float num;
    BOOL dec;
    UIAlertView *view;
}
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (IBAction)button1:(id)sender {
    
    self.textField.text = [self.textField.text stringByAppendingString:@"1"];

}
- (IBAction)button2:(id)sender {
 self.textField.text = [self.textField.text stringByAppendingString:@"2"];
}
- (IBAction)button3:(id)sender {
 self.textField.text = [self.textField.text stringByAppendingString:@"3"];
    
}
- (IBAction)button4:(id)sender {
 self.textField.text = [self.textField.text stringByAppendingString:@"4"];
}
- (IBAction)button5:(id)sender{
 self.textField.text = [self.textField.text stringByAppendingString:@"5"];
}
- (IBAction)button6:(id)sender {
 self.textField.text = [self.textField.text stringByAppendingString:@"6"];
}
- (IBAction)button7:(id)sender {
     self.textField.text = [self.textField.text stringByAppendingString:@"7"];
}
- (IBAction)button8:(id)sender {
 self.textField.text = [self.textField.text stringByAppendingString:@"8"];
}
- (IBAction)button9:(id)sender {
    self.textField.text = [self.textField.text stringByAppendingString:@"9"];
}
- (IBAction)button0:(id)sender {
     self.textField.text = [self.textField.text stringByAppendingString:@"0"];
}

- (IBAction)decimal:(id)sender {
    self.textField.text = [self.textField.text stringByAppendingString:@"."];
    dec = YES;
}

- (IBAction)plusButton:(id)sender {
    operation = @"Plus";
    [storage addObject:self.textField.text];
     NSLog(@"# of objects: %lu",(unsigned long)[storage count]);
    self.textField.text = @"";
    }

- (IBAction)minusButton:(id)sender {
    operation = @"Minus";
    [storage addObject:self.textField.text];
    self.textField.text = @"";
}
- (IBAction)timesButton:(id)sender {
    operation = @"Multiply";
    [storage addObject:self.textField.text];
     self.textField.text = @"";
}
- (IBAction)divideButton:(id)sender {
    operation = @"Divide";
    [storage addObject:self.textField.text];
    self.textField.text = @"";
}

- (IBAction)equals:(id)sender {
    
    if([storage count] == 1	) {
        NSLog(@"BOOL VAL %hhd", dec);
   
        [storage addObject:	self.textField.text];
        NSLog(@"Object at index 1 %@", [storage objectAtIndex:1]);
        
        for(NSInteger i = 0; i < 2; i++) {
            if([operation isEqualToString:@"Plus"] && dec == YES) {
                NSLog(@"BOOL VAL IN LOOP %hhd", dec);
                result+= [[storage objectAtIndex:i] floatValue];
                number = [NSString stringWithFormat:@"%.3f",result];
                
                self.textField.text = number;

            }
            else if([operation isEqualToString:@"Plus"] && dec == NO) {
                result = (int) result;
                result+= [[storage objectAtIndex:i] intValue];
                
                number = [NSString stringWithFormat:@"%i",(int)result];
                
                self.textField.text = number;

            }
            
            if([operation isEqualToString:@"Minus"] && dec == YES) {
                result = [[storage objectAtIndex:0] floatValue] - [[storage objectAtIndex:1] floatValue];
                number = [NSString stringWithFormat:@"%.3f",result];
                self.textField.text = number;
                
            }
            else if([operation isEqualToString:@"Minus"] && dec == NO) {
                result = [[storage objectAtIndex:0] intValue] - [[storage objectAtIndex:1]intValue];
                number = [NSString stringWithFormat:@"%i",(int)result];
                self.textField.text = number;
            }

        
            if([operation isEqualToString:@"Multiply"] && dec == YES) {
                result = [[storage objectAtIndex:0] floatValue] * [[storage objectAtIndex:1] floatValue];
                number = [NSString stringWithFormat:@"%.3f",result];
                
                self.textField.text = number;
            }
            else if([operation isEqualToString:@"Multiply"] && dec == NO) {
                result = [[storage objectAtIndex:0] intValue] * [[storage objectAtIndex:1] intValue];
                number = [NSString stringWithFormat:@"%i",(int)result];
                self.textField.text = number;
            }
        
            if([operation isEqualToString:@"Divide"]) {
                if([self.textField.text floatValue] == 0) {
                    self.textField.text = @"";
                    [view show];
                }
            
                else
                    result = [[storage objectAtIndex:0] floatValue] / [[storage objectAtIndex:1] floatValue];
            }
        }
    }

    if([storage count] > 2) {
        
        [storage removeObjectsInRange:(NSRange) {0,[storage count] -1 }];
        
        NSLog(@"%lu", (unsigned long)storage.count);
        number = [NSString stringWithFormat:@"%@",[storage firstObject]];
        num = [number floatValue];
    
        
        if([operation isEqualToString:@"Plus"] && dec == YES) {
            result = num + [self.textField.text floatValue];
              number = [NSString stringWithFormat:@"%3f",result];
              self.textField.text = number;
        }
        else if([operation isEqualToString:@"Plus"] && dec == NO) {
            result = num + [self.textField.text intValue];
            number = [NSString stringWithFormat:@"%i",(int)result];
            self.textField.text = number;
        }
        
        if([operation isEqualToString:@"Minus"] && dec == YES) {
            result = num - [self.textField.text floatValue];
            number = [NSString stringWithFormat:@"%3f",result];
            self.textField.text = number;
        }
        else if([operation isEqualToString:@"Minus"] && dec == NO) {
            result = num - [self.textField.text intValue];
            number = [NSString stringWithFormat:@"%i",(int)result];
            self.textField.text = number;
        }
        
        if([operation isEqualToString:@"Multiply"] && dec == YES) {
            result = num * [self.textField.text floatValue];
            number = [NSString stringWithFormat:@"%3f",result];
            self.textField.text = number;
        }
        else if([operation isEqualToString:@"Multiply"] && dec == NO) {
            result = num * [self.textField.text intValue];
            number = [NSString stringWithFormat:@"%i",(int)result];
            self.textField.text = number;
        }	
        
        else if([operation isEqualToString:@"Divide"]) {
            if([self.textField.text floatValue] == 0) {
                [storage removeLastObject];
                self.textField.text = @"";
                [view show];
            }
            else {
                result = num / [self.textField.text floatValue];
                number = [NSString stringWithFormat:@"%.3f",result];
                self.textField.text = number;
                
            }
        }

        [storage addObject:number];
       
    }
}

- (IBAction)clear:(id)sender {
    self.textField.text = @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    storage = [[NSMutableArray alloc]init];
    numbers = [[NSMutableArray alloc]init];
    self.textField.delegate = self;
    self.textField.text = @"";
    view = [[UIAlertView alloc] initWithTitle:@"ERROR!" message:@"Division By 0 Not Allowed" delegate:nil cancelButtonTitle:@"Ok, sorry -_-" otherButtonTitles:nil, nil];
    
    dec = NO;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
