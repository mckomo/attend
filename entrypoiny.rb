require 'httparty'

DATE_FORMAT = 'dd/MM/yyyy HH:mm:ss'
AUTH_TOKEN = 'TOKEN'

attendance_endpoint = "https://people.zoho.com/people/api/attendance"

parameters = {
  'authtoken' => AUTH_TOKEN,
  'dateFormat' => DATE_FORMAT,
  'checkIn' => '23/06/2017 10:00:00',
  'checkOut' => '23/06/2017 18:00:00',
  'empId' => '#53_MK#',
}
options = {
  body: parameters,
  query: {
    authtoken: AUTH_TOKEN
  },
  headers: { 'Content-Type' => 'application/json' }
}

response = HTTParty.post(attendance_endpoint, options)

puts response.body, response.code, response.message, response.headers.inspect
