class TimersController < UIViewController
  def viewDidLoad
    super

    self.title = "When did I"
    self.view.addSubview(table)
    table.dataSource = self
    table.delegate = self
  end

  def table
    @table ||= UITableView.alloc.initWithFrame(self.view.bounds)
  end

  def timers
    @timers ||= [
      {
        :description => "become a dad?",
        :happened_at => Time.mktime("2014-08-12")
      },
      {
        :description => "quit smoking?",
        :happened_at => Time.mktime("2014-01-02")
      },
      {
        :description => "become a programmer?",
        :happened_at => Time.mktime("2010-12-06")
      },
      {
        :description => "get married?",
        :happened_at => Time.mktime("2007-08-02")
      },
      {
        :description => "start my first business?",
        :happened_at => Time.mktime("1996-04-15")
      }
    ]
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    cell.textLabel.text = timers[indexPath.row][:description]

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    timers.count
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{timers[indexPath.row][:description]} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end
end
