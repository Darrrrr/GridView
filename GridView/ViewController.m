//
//  ViewController.m
//  GridView
//
//  Created by Darrrrr on 14-7-16.
//  Copyright (c) 2014年 Darrrrr. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    NSString *defalutpath = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"plist"];
    NSLog(@"%@",defalutpath);
    NSString *targetPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"events.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:targetPath])
    {
        
        NSError *error;
        [[NSFileManager defaultManager] copyItemAtPath:defalutpath toPath:targetPath error:&error];
        
    }
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:targetPath];
	self.events = array;
    NSLog(@"ppppppp:%@",array);
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
   
    return ceil((double)[self.events count] / 3);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"section : %ld  count : %lu",(long)section,(unsigned long)ceil((double)[self.events count]/3) );
    if (section<[self.events count] / 3)
    {
        return 3;
    }
    else
    {
        return [self.events count] % 3;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *event = [self.events objectAtIndex:(indexPath.section*3 + indexPath.row)];
    cell.label.text = [event objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:[event objectForKey:@"image"]];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *event = [self.events objectAtIndex:(indexPath.section*3 + indexPath.row)];
    NSLog(@"select event name : %@ event:%@", [event objectForKey:@"name"],indexPath);
    NSString * identifier= [NSString stringWithFormat:@"%@",[event objectForKey:@"name"]];
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 获取故事板中某个View
    
    if([identifier isEqualToString:@"+"])
    {
    //添加
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Default Alert View"
                                                        message:@"Defalut"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"功能1",@"功能2",@"功能3",@"功能4", nil];
    [alertView show];
        
    }
    else
    {
    UIViewController *next = [board instantiateViewControllerWithIdentifier:identifier];
    [self presentViewController:next animated:YES completion:nil];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clickButtonAtIndex:%d",buttonIndex);
    NSString *targetPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"events.plist"];
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:targetPath];
    int loc = data.count - 1;
   NSLog(@"xxxxxxxxxxxxxxxxx%d", loc);
    
    switch (buttonIndex)
    {
        case 1:
        {
            //添加一项内容
            NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"item1.gif", @"image", @"001", @"name", nil];
            [data insertObject:dic1 atIndex:loc];
            [data writeToFile:targetPath atomically:YES];
            self.events = data;
            [_vc reloadData];
            
            break;
        }
        case 2:
        {
            //添加一项内容
            NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"item1.gif", @"image", @"002", @"name", nil];
            [data insertObject:dic2 atIndex:loc];
            [data writeToFile:targetPath atomically:YES];
            self.events = data;
            [_vc reloadData];
            break;
        }
        case 3:
        {
            //添加一项内容
            NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"item1.gif", @"image", @"003", @"name", nil];
            [data insertObject:dic3 atIndex:loc];
            [data writeToFile:targetPath atomically:YES];
            self.events = data;
            [_vc reloadData];
            break;
        }
        case 4:
        {
            //添加一项内容
            NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                                  @"item1.gif", @"image", @"004", @"name", nil];
            [data insertObject:dic4 atIndex:loc];
            [data writeToFile:targetPath atomically:YES];
            self.events = data;
            [_vc reloadData];
            break;
        }
    }
}


@end
