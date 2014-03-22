class TimerViewCell < UITableViewCell
  attr_accessor :primaryLabel
  attr_accessor :secondaryLabel

  def createLabels

    @primaryLabel = UILabel.alloc.init
    @primaryLabel.textAlignment = UITextAlignmentLeft
    @primaryLabel.font = UIFont.systemFontOfSize(14)

    @secondaryLabel = UILabel.alloc.init
    @secondaryLabel.textAlignment = UITextAlignmentLeft
    @secondaryLabel.font = UIFont.systemFontOfSize(8)

    self.contentView.addSubview(@primaryLabel)
    self.contentView.addSubview(@secondaryLabel)

    self
  end

  def layoutSubviews
    super

    contentRect = self.contentView.bounds
    boundsX = contentRect.origin.x

    @primaryLabel.frame = CGRectMake(boundsX+70, 5, 200, 25)
    @secondaryLabel.frame = CGRectMake(boundsX+70, 30, 100, 15)
  end
end
