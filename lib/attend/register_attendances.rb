# frozen_string_literal: true

module Attend
  class RegisterAttendances
    attr_reader :zoho, :dry_run

    def initialize(zoho:, dry_run: true)
      @zoho = zoho
      @dry_run = dry_run
    end

    def call(attendances)
      attendances.each do |attendance|
        if dry_run
          puts "DRY RUN: Committing #{attendance}"
          next
        end

        zoho.post_attendance(attendance)

        puts "Successfully registered #{attendance}"
      end
    end
  end
end
