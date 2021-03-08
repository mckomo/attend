# frozen_string_literal: true

require 'attend/version'
require_relative './zoho/people/api'
require_relative './zoho/people/attendance'
require_relative './attend/get_absent_days'
require_relative './attend/register_attendances'

module Attend
  def self.register(email:, from:, to:, check_in:, check_out:, dry_run: true)
    absent_days = GetAbsentDays.new(zoho: zoho_api).call(email: email, from: from, to: to)

    if absent_days.empty?
      puts "No absent days between #{from} and #{to}"
      return
    end

    attendances = absent_days.map do |day|
      day_beginning = day.to_datetime

      Zoho::People::Attendance.new(email: email,
                                   check_in: day_beginning.new_offset("+#{check_in}"),
                                   check_out: day_beginning.new_offset("+#{check_out}"))
    end

    RegisterAttendances.new(zoho: zoho_api, dry_run: dry_run).call(attendances)
  end

  def self.zoho_api
    Zoho::People::API.new
  end

  private_class_method :zoho_api
end
