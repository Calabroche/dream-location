class FilterDreamsService

  def initialize(regions)
    @dreams = Dream.all
    @regions = regions
  end

  def call
    filter_by_regions
  end

  def filter_by_regions
    return unless @regions.present?
    @dreams = @dreams.where(regions: @regions)
  end
end
