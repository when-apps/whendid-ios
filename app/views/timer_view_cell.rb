class TimerViewCell < UITableViewCell
  attr_accessor :primaryLabel
  attr_accessor :secondaryLabel

  def createLabels

    @primaryLabel = UILabel.alloc.init
    @primaryLabel.textAlignment = UITextAlignmentLeft
    @primaryLabel.font = UIFont.systemFontOfSize(18)

    @secondaryLabel = UILabel.alloc.init
    @secondaryLabel.textAlignment = UITextAlignmentRight
    @secondaryLabel.font = UIFont.systemFontOfSize(14)

    self.contentView.addSubview(@primaryLabel)
    self.contentView.addSubview(@secondaryLabel)

    self
  end

  def layoutSubviews
    super

    contentRect = self.contentView.bounds
    boundsX = contentRect.origin.x

    @primaryLabel.frame = CGRectMake(boundsX+10, 5, 200, 35)
    @secondaryLabel.frame = CGRectMake(boundsX+10, 5, 300, 35)
  end
end
