# frozen_string_literal: true

require 'http'

require_relative './attendance_report'

module Zoho
  module People
    class API
      URL = 'https://people.zoho.com/people/api'

      attr_reader :auth_token

      def initialize(auth_token: ENV['ZOHO_PEOPLE_ROOT_TOKEN'])
        raise 'You must provide Zoho People authorization token' unless auth_token

        @auth_token = auth_token
      end

      def post_attendance(attendance)
        params = {
          'authtoken' => auth_token,
          'dateFormat' => 'dd/MM/yyyy HH:mm:ss',
          'emailId' => attendance.email,
          'checkIn' => attendance.check_in.strftime('%d/%m/%Y %H:%M:%S'),
          'checkOut' => attendance.check_out.strftime('%d/%m/%Y %H:%M:%S')
        }

        request(:post, 'attendance', params: params)
      end

      def get_attendance_report(email:, from:, to:)
        params = {
          'authtoken' => auth_token,
          'dateFormat' => 'yyyy-MM-dd',
          'emailId' => email,
          'sdate' => from.strftime('%Y-%m-%d'),
          'edate' => to.strftime('%Y-%m-%d')
        }

        data = request(:get, 'attendance/getUserReport', params: params)

        AttendanceReport.parse(data)
      end

      private

      def request(method, endpoint, options)
        response = HTTP.method(method).call("#{URL}/#{endpoint}", options)

        if response.status.success?
          response.parse
        elsif response
          raise "Failed to #{method.to_s.upcase} #{endpoint}. Error: #{response.body}"
        else
          raise 'Failed to request Zoho API'
        end
      end
    end
  end
end
