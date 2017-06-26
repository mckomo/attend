# frozen_string_literal: true

module Zoho
  module People
    class Attendance
      DATE_FORMAT = 'dd/MM/yyyy HH:mm:ss'

      attr_reader :check_in, :check_out, :email_id

      def initialize(check_in:, check_out:, email_id:)
        @check_in = check_in
        @check_out = check_out
        @email_id = email_id
      end
    end
  end
end
