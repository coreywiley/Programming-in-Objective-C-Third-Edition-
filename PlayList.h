//
//  PlayList.h
//  prog1
//
//  Created by Corey Wiley on 7/6/16.
//  Copyright © 2016 Corey Wiley. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Song;
@interface PlayList : NSObject
{
    NSMutableArray *playList;
    NSString *name;
    BOOL deletable;
}

@property (copy, nonatomic) NSMutableArray *playList;
@property (copy, nonatomic) NSString  *name;
@property BOOL deletable;

-(BOOL) addSong:(Song*) theSong;
-(void) removeSong: (Song*) theSong;
-(id) initWithName: (NSString *) theName andIsDeletable: (BOOL) isDeletable;
-(id) init;
-(BOOL) search: (Song *) theSearch;
-(void) listAll;
-(int) count;
@end
