class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    # we prepare the data for the charts
    @histogram_1_data = {}
    for item in Item.all
      next if item.order.archived_at == nil  # we don't count items in unarchived orders
      day = item.order.archived_at.strftime("%Y %m %d")
      if @histogram_1_data[day] == nil  # we set the counter to 0 for that day
        @histogram_1_data[day] = 0
      end
      @histogram_1_data[day] += item.price
    end
    @histogram_1_data = Hash[@histogram_1_data.sort]  # we sort the hash

    @pie_chart_1_data = []
    for category in Category.all
      @pie_chart_1_data << [category.name, category.article.count]
    end

    @pie_chart_2_data = []
    for category in Category.all
      counter = 0
      for article in category.article
        counter += article.items.count
      end
      @pie_chart_2_data << [category.name, counter]
    end

    @most_ordered_articles = []
    for article in Article.all
      @most_ordered_articles << [article.name, article.items.count]
    end
    @most_ordered_articles.sort_by { |article| article[1] }
    @most_ordered_articles = @most_ordered_articles[0..30]
  end
end
