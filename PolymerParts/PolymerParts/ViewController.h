//
//  ViewController.h
//  PolymerParts
//
//  Created by Jacob Warren on 5/10/15.
//  Copyright (c) 2015 Jacob Warren. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
@import AppKit;

@interface ViewController : NSViewController
{
IBOutlet NSTableView *tableView;
IBOutlet NSDictionaryController *dictController;
IBOutlet NSArrayController *partList;
//IBOutlet NSArrayController *workCenter;
NSDictionary *currentPart;
    IBOutlet NSArrayController *workCenter;
}



@property (retain) NSDictionary *currentPart;

-(NSArray *)sortDesc;
- (IBAction)heartButton:(id)sender;


@end

