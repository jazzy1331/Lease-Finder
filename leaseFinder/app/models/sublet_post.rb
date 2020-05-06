=begin
    Edited by Daniel Lim: add association and validate statements
    Edited 4/20/2020 by Juhee Park: add filterrific and scope statements

=end
class SubletPost < ApplicationRecord
    belongs_to :student
    belongs_to :property

    validates :housemates_num, :presence => true
	validates :monthly_rent, :presence => true
	validates :water_flag, inclusion: { in: [true, false] }
    validates :gas_flag, inclusion: { in: [true, false] }
    validates :electric_flag, inclusion: { in: [true, false] }
    validates :internet_flag, inclusion: { in: [true, false] }
    validates :start_date, :presence => true
    validates :end_date, :presence => true
    validates :bedroom_num, :presence => true
    validates :furnished_flag, inclusion: { in: [true, false] }
    validates :parking_flag, inclusion: { in: [true, false] }
    validates :taken, inclusion: { in: [true, false] }

=begin
    Enable filterrific for this class
    Make default sorting by most recently created post
    Create filters
=end
    filterrific(
        default_filter_params: {sorted_by: "created_at_desc"},
        available_filters: [
            :sorted_by,
            :with_housemates_num,
            :with_min_monthly_rent,
            :with_max_monthly_rent,
            :with_start_date,
            :with_end_date,
            :with_bedroom_num,
            :with_furnished,
            :with_parking,
            :with_pet_friendly,
        ],
    )

    # Scope definitions
    scope :sorted_by, -> (sort_option) {
        direction = /desc$/.match?(sort_option) ? "desc" : "asc"
        case sort_option.to_s
        when /^created_at_/
            order("sublet_posts.created_at #{direction}")
        when /^monthly_rent_/
            order("sublet_posts.monthly_rent #{direction}")
        when /^start_date_/
            order("sublet_posts.start_date #{direction}")
        when /^housemates_num_/
            order("sublet_posts.housemates_num #{direction}")
        else
            raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
        end
    }

    scope :with_housemates_num, -> (num) { where(housemates_num: num) }
    scope :with_min_monthly_rent, -> (min) { where("monthly_rent >= ?", min)}
    scope :with_max_monthly_rent, -> (max) { where("monthly_rent <= ?", max)}
    scope :with_start_date, -> (date) {where("start_date <= ? AND end_date >= ?", Date.parse(date), Date.parse(date))}
    scope :with_end_date, -> (date) {where("end_date >= ?", Date.parse(date))}
    scope :with_bedroom_num, -> (num) {where bedroom_num: num}
    scope :with_furnished, -> (pref) {where furnished_flag: pref}
    scope :with_parking, -> (pref) {where parking_flag: pref}
    scope :with_pet_friendly, -> (pref) { joins(:property).merge(Property.pet_friendly(pref))}

=begin
    Provide select options for the sorted_by filter select input
    Called in controller as part of 'initialize_filterrific'
=end
    def self.options_for_sorted_by
        [
            ["Registration date (newest first)", "created_at_desc"],
            ["Registration date (oldest first)", "created_at_asc"],
            ["Monthly rent (low to high)", "monthly_rent_asc"],
            ["Monthly rent (high to low", "monthly_rent_desc"],
            ["Start date (earliest first)", "start_date_asc"],
            ["Start date (latest first)", "start_date_desc"],
            ["Number of housemates (low to high)", "housemates_num_asc"],
            ["Number of housemates (high to low)", "housemates_num_desc"]
        ]
    end

    def self.options_for_flags
        [
            ["Yes", true],
            ["No", false]
        ]
    end

end
