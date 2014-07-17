//
//  ViewController.h
//  GridView
//
//  Created by Darrrrr on 14-7-16.
//  Copyright (c) 2014年 Darrrrr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong,atomic) NSArray * events;
@property (strong, nonatomic) IBOutlet UICollectionView *vc;

@end
