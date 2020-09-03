module ApplicationHelper
  WEEKDAYS = ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', "Sam"]
  MONTHNAMES = {
    'January' => 'Jan',
    'February' => 'Fev',
    'March' => 'Mar',
    'April' => 'Avr',
    'May' => 'Mai',
    'June' => 'Jui',
    'July' => 'Juil',
    'August' => 'Aoû',
    'September' => 'Sep',
    'October' => 'Oct',
    'November' => 'Nov',
    'December' => 'Dec',
  }
  def translate_date(date)
    week_day = WEEKDAYS[date.wday]
    monthname = MONTHNAMES[date.strftime('%B')]
    return "#{week_day} #{date.day} #{monthname}"
  end
end
