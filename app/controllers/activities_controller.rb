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
    data_table_day = []
    data_table_date = []

    userlist.each_with_index do |user,index|
      a_table_day = []
      a_table_date = []
      for i in 0..6
        a_table_day[i] = 0
      end
      for i in 0..30
        data_range = (30-i).day.ago.all_day
        a_data_date = []
        a_data_date[0] = Date.today.advance(days: -30+i).to_datetime
        a_data_date[1] = user.tweets.where(created_at: data_range).count
        a_table_date << a_data_date
        a_table_day[(30-i).day.ago.wday] += a_data_date[1]
      end
      data_table_date << a_table_date
      data_table_day << a_table_day
    end

    @graph_data_date = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "ここ1ヶ月のツイート数")
      f.chart(zoomType: "x")
      f.global(useUTC: false)
      f.xAxis(type: "datetime")
      f.yAxis(title: {text: "ツイート数"}, allowDecimals: false, min: 0)
      f.plotOptions(spline: {

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
        f.series(name: "#{user.nickname}のツイート数", type: "spline", data: data_table_date[index])
      end
    end

    @graph_data_day = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "曜日別")
      f.chart(type: "spline")
      f.global(useUTC: false)
      f.xAxis(categories: [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
        ],plotBands: [{
            from: -0.5,
            to: 0.5,
            color: 'rgba(68, 170, 213, .2)'
        },{
            from: 5.5,
            to: 6.5,
            color: 'rgba(68, 170, 213, .2)'
        }])
      f.yAxis(title: {text: "ツイート数"}, allowDecimals: false, min: 0)
      userlist.each_with_index do |user,index|
        f.series(name: "#{user.nickname}のツイート数", data: data_table_day[index])
      end
    end

  end

end
