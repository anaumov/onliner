module ApplicationHelper
  def app_version
    content_tag :span, :data => { :version => Rails4Template.version.to_s } do
      'v' + Rails4Template.version.format( "%M.%m.%p" )
    end
  end

  def icon *classes
    css = classes.map{|c| "icon-#{c}"}.join(' ')
    content_tag :i, '', :class => "icon #{css}"
  end

  def badge count, css_id ='', type = ''
    # Скрываем badge если в нем пусто. JS сам его покажет когда появится информация
    #
    options = {
      :class => "badge badge-#{type}", :id => css_id
    }
    # options[:style] = 'visibility: hidden' if count.to_i == 0
    counter_tag count, options
  end

  def counter_tag count, options={}
    count = '' if count == 0
    content_tag :span, count, options
  end

  def self_profile? user
    @user == current_user
  end

  def app_online_path online
    online_path(username: online.user.username, id: online.id)
  end

  def app_update_online_path online
    update_online_path(username: @online.user.username, id: @online.id)
  end

  def date_format_messages(date)
    today = DateTime.now
    if date >= today.beginning_of_day
      :time
    elsif date < today.beginning_of_day
      :time_date
    elsif date < today.beginning_of_year
      :time_date_year
    end

    :time
  end

end
