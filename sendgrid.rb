require'sendgrid-ruby'

# set the from, subject and to addresses
from = SendGrid::Email.new(email:'bryan.king@nycda.com')
subject = 'Hello World from the SendGrid Ruby Library!'

to = SendGrid::Email.new(email:'tarana3121@gmail.com')

# set the content to send in the email
content = SendGrid::Content.new(type:'text/plain', value:'Hello, Email!')

# set the mail attribute values
mail = SendGrid::Mail.new(from, subject, to, content)

# pass in the sendgrid api key
sg = SendGrid::API.new(api_key:ENV['SENDGRID_API_KEY'])

# send the email
response = sg.client.mail._('send').post(request_body: mail.to_json)
# display the response status code and body
puts response.status_code
puts response.body