class TimersController < UIViewController
  def viewDidLoad
    super

    self.title = "When did"
    self.view.addSubview(table)
    table.dataSource = self
    table.delegate = self

    right_button = UIBarButtonItem.alloc.initWithTitle("New", style: UIBarButtonItemStyleBordered, target:self, action:"newTimer")
    self.navigationItem.rightBarButtonItem = right_button
  end

  def table
    @table ||= UITableView.alloc.initWithFrame(self.view.bounds)
  end

  def timers
    @timers ||= Timer.all
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    cell.textLabel.text = timers[indexPath.row].name

    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    Timer.count
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    alert = UIAlertView.alloc.init
    alert.message = "#{timers[indexPath.row].name} tapped!"
    alert.addButtonWithTitle "OK"
    alert.show
  end

  def newTimerForm
    @newTimerForm ||= Formotion::Form.new({
      :sections => [{
        :title => "When did",
        :key   => :primary_values,
        :rows => [{
          :key                 => :name,
          :placeholder         => "I learn to drive?",
          :type                => :string,
          :auto_capitalization => :none
        }]
      }, {
        :rows => [{
          :title => "Start",
          :type  => :submit
        }]
      }]
    })
  end

  def newTimer
    newTimerController = Formotion::FormableController.alloc.initWithForm(newTimerForm)
    newTimerController.form.on_submit do |form|
      name = form.render[:name]
      if name && name != ""
        Timer.create(:name => name)
        @timers = Timer.all if cdq.save
        table.reloadData
      end
      popView
    end
    self.navigationController.pushViewController(newTimerController, animated: true)
  end

  def popView
    self.navigationController.popViewControllerAnimated(true)
  end
end
