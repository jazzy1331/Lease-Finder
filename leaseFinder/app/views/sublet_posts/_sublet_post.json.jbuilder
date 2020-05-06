json.extract! sublet_post, :id, :housemates_num, :monthly_rent, :water_flag, :gas_flag, :electric_flag, :internet_flag, :other_util_flag, :start_date, :end_date, :bedroom_num, :furnished_flag, :parking_flag, :house_rules, :taken, :description, :created_at, :updated_at
json.url sublet_post_url(sublet_post, format: :json)
