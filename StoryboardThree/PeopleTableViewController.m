#import "PeopleTableViewController.h"
#import "NameViewController.h"

@interface PeopleTableViewController ()

@end

@implementation PeopleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:style];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.persons = @[@"Rahul", @"Sachin", @"Anil", @"Saurav", @"Laxman"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.persons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"aPeopleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];        
    }
    
    cell.textLabel.text = self.persons[indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"nameSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        
        NameViewController *nvc = [segue destinationViewController];
        nvc.name = self.persons[indexPath.row];
    }
    
}

@end
