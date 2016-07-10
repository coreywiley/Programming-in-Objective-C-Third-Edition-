//
//  MusicCollection.h
//  prog1
//
//  Created by Corey Wiley on 7/6/16.
//  Copyright © 2016 Corey Wiley. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PlayList;
@class Song;

@interface MusicCollection : NSObject
{
    PlayList *library;
    NSMutableArray *musicCollection;
    NSString *name;
}

@property (copy, nonatomic) NSMutableArray *musicCollection;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) PlayList *library;


-(id) init;
-(id) initWithName: (NSString*) theName;
-(void) removePlayList: (NSString*) thePlaylist;
-(NSUInteger) searchForPlaylist: (NSString *) playListName;
-(NSUInteger) searchForSong: (NSString *) songName;
-(void) listPlayLists;
-(void) listSongsInLibrary;
-(void) listSongsInPlaylist: (NSString*) thePlaylist;
-(void) addSong:(NSString*) theSong toPlaylist:(NSString*) thePlaylist;
-(void) removeSong:(NSString*) theSong fromPlaylist:(NSString*) thePlaylist;
-(void) removeSongFromLibrary: (NSString*) theSong;
-(void) createPlayListWithName: (NSString*) theName;
-(void) createSongWithTitle: (NSString*) theTitle andArtist: (NSString*) theArtist andAlbum: (NSString*) theAlbum andDuration: (NSString*) theDuration inPlayList: (NSString*) thePlaylist;

@end
