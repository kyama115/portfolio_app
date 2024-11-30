Ransack.configure do |config|
    config.add_predicate 'lteq',
                         arel_predicate: 'lteq',
                         formatter: proc { |v| v.to_date.end_of }

     config.add_predicate 'lteq_end_of_day',
                         arel_predicate: 'lteq',
                         formatter: proc { |v| v.end_of_day }
  end