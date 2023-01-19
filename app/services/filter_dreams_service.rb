class FilterDreamsService

  def initialize(regions)
    @dreams = Dream.all
    @regions = regions
  end

  def call
    filter_by_regions
  end

  def filter_by_regions
    # return "no region " unless @regions.present?
    puts "test2"
    puts @regions
    @dreams = @dreams.where(regions: @regions)
  end
end
