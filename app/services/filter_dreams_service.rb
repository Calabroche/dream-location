class FilterDreamsService

  def initialize(regions)
    @regions = regions
  end

  def call
    filter_by_regions
  end

  def filter_by_regions
    puts @regions
    @dreams = Dream.where(regions: @regions)
  end
end
