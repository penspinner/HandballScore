//
//  ScoreTableViewController.m
//  HandballScore
//
//  Created by Steven Liao on 11/29/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import "ScoreTableViewController.h"

@interface ScoreTableViewController ()

@end

@implementation ScoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.objects = [[NSMutableArray alloc]init];
//    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self loadData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData
{
    NSString *path = [self getPath];
    self.objects = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

- (NSString *)getPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if ([fileManager fileExistsAtPath:documentsDirectory] == NO)
    {
        [fileManager createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Match Data"];
    
    return documentsDirectory;
}

- (void)removeScoreObjectAtIndex:(NSInteger)index
{
    NSString *path = [self getPath];
    [self.objects removeObjectAtIndex:index];
    [NSKeyedArchiver archiveRootObject:self.objects toFile:path];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"match" forIndexPath:indexPath];

    ScoreObject *currentObject = self.objects[indexPath.row];
    NSString *textLabel = [NSString stringWithFormat:@"%@ VS %@", currentObject.player1Name, currentObject.player2Name];
    
    cell.textLabel.text = textLabel;
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self removeScoreObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ScoreObject *currentObject = self.objects[indexPath.row];
        
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.currentObject = currentObject;
        detailViewController.title = [NSString stringWithFormat:@"%@ VS %@", currentObject.player1Name, currentObject.player2Name];
    }
}


@end
