//
//  Song.h
//  prog1
//
//  Created by Corey Wiley on 7/6/16.
//  Copyright © 2016 Corey Wiley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject
{
    NSString *title;
    NSString *artist;
    NSString *album;
    NSString *duration;
}

@property (copy, nonatomic) NSString *title, *artist, *album, *duration;

-(id) initSongTitle: (NSString *) theTitle andArtist: (NSString *) theArtist andAlbum: (NSString *) theAlbum andDuration: (NSString *) theDuration;
-(id) init;

@end
