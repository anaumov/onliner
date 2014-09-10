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

  def local_user
    @local_user ||= User.find_by_username params[:username]
  end

  def self_profile?
    local_user == current_user
  end

  def app_online_path online
    online_path(username: online.user.username, id: online.id)
  end

  def edit_online_link online
    if self_profile?
      link = link_to 'Редактировать', edit_online_path(username: online.user.username, id: online.id)
      content_tag :small, link, style: "position: relative; bottom: 20px;"
    end
  end

  def app_update_online_path online
    update_online_path(username: @online.user.username, id: @online.id)
  end

  def event_path(event)
    event_date_slug_path(date: event.created_at.strftime("%d-%m-%Y"), slug: event.slug)
  end
end
