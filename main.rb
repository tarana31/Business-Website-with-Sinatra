require 'sinatra'
require'sendgrid-ruby'


get '/' do
    erb :home, layout: :layout
end

get '/about' do 
    erb :about, layout: :layout
end


get '/contact-us' do
    erb :contact, layout: :layout
end 

post '/contact-us' do
    puts params.inspect
    @name =params[:name]
    @inquiry =params[:inquiry]

    # set the from, subject and to addresses
    from = SendGrid::Email.new(email:'bryan.king@nycda.com')
    subject = 'You are getting this email becoz you r special'

    to = SendGrid::Email.new(email:'tarana3121@gmail.com')

    # set the content to send in the email
    content = SendGrid::Content.new(type:'text/plain', value:'Thank you for contacting us.')

    # set the mail attribute values
    mail = SendGrid::Mail.new(from, subject, to, content)

    # pass in the sendgrid api key
    sg = SendGrid::API.new(api_key:ENV['SENDGRID_API_KEY'])

    # send the email
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # display the response status code and body
    puts response.status_code
    puts response.body
        erb :contact, layout: :layout
end