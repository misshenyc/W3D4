# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord 
    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: { in: %w(pending approved denied) }

    belongs_to :cat,
        foreign_key: :cat_id,
        class_name: :cat 

    def overlapping_requests
        CatRentalRequest
            .select(**)
            .where(r1.cat = r2.cat)
            .where(r2.start_date < r1.end_date or r2.end_date > r1.start_date )
    end

    # r1 = 2020/4/10 - 2020/4/15
    # r2 = 2020/4/14 - 2020/4/18 OR  #r2.start_date < r1.end_date
    #   2020/4/6 - 2020/4/11 OR  # r2.end_date > r1.start_date
    #   2020/4/11 - 2020/4/13 # combinator


    # CatRentalRequest.all.select do |request|
        cat_id == request.cat_id && date_range

end
