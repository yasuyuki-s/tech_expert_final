class ActivitiesController < ApplicationController
  before_action :set_user, only: [:index, :following, :followers]

  def index
    set_graph([@user])
  end

  def following
    @users = @user.follows
    set_graph(@users)
  end

  def followers
    @users = @user.followers
    set_graph(@users)
  end

  private

  def set_user
    @user = User.find_by(name: params[:user_name])
    @tweet = Tweet.new
  end

  def set_graph(userlist)
    data_table = []

    userlist.each_with_index do |user,index|
      a_table = []
      for i in 0..30
        date_range = (30-i).day.ago.all_day
        a_data = []
        a_data[0] = Date.today.advance(days: -30+i).to_datetime
        a_data[1] = user.tweets.where(created_at: date_range).count
        a_table << a_data
      end
      data_table << a_table
    end

    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "ここ1ヶ月のツイート数")
      f.chart(zoomType: "x")
      f.global(useUTC: false)
      f.xAxis(type: "datetime")
      f.yAxis(title: {text: "ツイート数"}, allowDecimals: false, min: 0)
      f.plotOptions(area: {

              marker: {
                  radius: 2
              },
              lineWidth: 2,
              states: {
                  hover: {
                      lineWidth: 3
                  }
              },
              threshold: "null"
          })
    userlist.each_with_index do |user,index|
        f.series(name: "#{user.nickname}のツイート数", type: "area", data: data_table[index])
      end
    end
  end

end
