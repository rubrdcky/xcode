//
//  ViewController.m
//  PolymerParts
//
//  Created by Jacob Warren on 5/10/15.
//  Copyright (c) 2015 Jacob Warren. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize currentPart;

//The keys to our array controller to be displayed in the table view
#define KEY_PART @"partNumber"
#define KEY_LAYOUT @"Layout"
#define KEY_WORKCENTER @"Workcenter"



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"LayoutList" ofType:@"plist"];
    NSArray *listFromFile = [NSMutableArray arrayWithContentsOfFile:path];
    
    [tableView setSortDescriptors:[NSArray arrayWithObjects:[[NSSortDescriptor alloc] initWithKey:KEY_PART ascending:YES], nil]];
    
    //[tableView setSortDescriptors:[NSArray arrayWithObjects:[[NSSortDescriptor alloc] initWithKey:KEY_WORKCENTER ascending:YES], nil]];
    
    [partList addObserver:self forKeyPath:@"selectionIndexes" options:NSKeyValueObservingOptionNew context:nil];
    
    if (listFromFile != nil)
    {
        [partList addObjects:listFromFile];
    }
    
    //Select the first part in the table
    [partList setSelectionIndex:0];
    
    //Bind the "currentPart" dictionary to our dictionary controller
    [dictController bind:NSContentDictionaryBinding toObject:self withKeyPath:@"currentPart" options:nil];
    
    NSString *partNumberLocalizedKey = NSLocalizedString(KEY_PART, @"");
    NSString *workcenterLocalizedKey = NSLocalizedString(KEY_WORKCENTER, @"");
    [dictController setLocalizedKeyDictionary:[NSDictionary dictionaryWithObjectsAndKeys:partNumberLocalizedKey,KEY_PART, workcenterLocalizedKey, KEY_WORKCENTER, nil]];
    
    [self getDate];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  if (object == partList)
  {
      if ([[object selectedObjects] count] >0)
      {
          //Update our current part and reflect the change to our dictionary controller
          [self setCurrentPart:[[object selectedObjects]objectAtIndex:0]];
          [dictController bind:NSContentDictionaryBinding toObject:self withKeyPath:@"currentPart" options:nil];
      }
  }
  else
  {
      [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
  }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(NSArray *)sortDesc
{
    return [tableView sortDescriptors];
}

-(int)getDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSLog(@"The day of the week is: %@", [dateFormatter stringFromDate:[NSDate date]]);
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    int weekday = (int)[comps weekday];
    
    NSLog(@"The week day number: %d", weekday);
    
    return weekday;
}

- (IBAction)heartButton:(id)sender {
    
    if ([self getDate] == 1){
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"Cancel"];
        [alert addButtonWithTitle:@"I love You Too"];
        [alert setMessageText:@""];
        [alert runModal];
    }else{
    
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"Cancel"];
    [alert addButtonWithTitle:@"I love You Too"];
    [alert setMessageText:@"I love you babycakes! \nYou are lookin' hot today"];
    [alert runModal];
    }
}

@end
