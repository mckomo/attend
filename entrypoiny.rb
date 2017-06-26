# frozen_string_literal: true

require 'httparty'

DATE_FORMAT = 'dd/MM/yyyy HH:mm:ss'
AUTH_TOKEN = 'TOKEN'

attendance_endpoint = 'https://people.zoho.com/people/api/attendance'

parameters = {
  'authtoken' => AUTH_TOKEN,
  'dateFormat' => DATE_FORMAT,
  'checkIn' => '26/06/2017 10:00:00',
  'checkOut' => '26/06/2017 18:00:00',
  'emailId' => 'krzysztof.kucharski@codete.com'
}

response = HTTParty.post(attendance_endpoint, query: parameters)

puts response.body, response.code, response.message, response.headers.inspect
