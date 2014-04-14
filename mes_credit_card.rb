class MesCreditCard
  attr_writer :card_number,
  :card_exp_date,
  :card_exp_date,
  :cvv2,
  :cardholder_street_address,
  :cardholder_zip,
  :transaction_amount,
  :transaction_type,
  :invoice_number,
  :profile_id,
  :profile_key,
  :first_name,
  :last_name,
  :customer_email
  
   attr_reader :card_number,
  :card_exp_date,
  :card_exp_date,
  :cvv2,
  :cardholder_street_address,
  :cardholder_zip,
  :transaction_amount,
  :transaction_type,
  :invoice_number,
  :profile_id,
  :profile_key,
  :first_name,
  :last_name,
  :customer_email
  
  def initialize(type)
       require 'rubygems'
       require 'mechanize'
       require 'money'
       require 'uri'
       require 'cgi'
       case type
          when 'test' 
         @profile_id  = 941000098832
         @profile_key  = '511DA6E00CE243F188AC85B1A66486EE'
         #circulation key
          when 'circulation'
         @profile_id = 11111 
         @profile_key = "EB557266652A4711BA01F77EBA02FE88"
           when 'classifieds'
         @profile_id = 11111 
         @profile_key = "CECF753BC3AE403AA3BA11E9A3D78B2D"   
         when 'retail'
         @profile_id = 11111 
         @profile_key = "4956894A8E8442AD824B8CBE691A7664"
         else
         #misc
         @profile_id = 11111 
         @profile_key = '42A0E8BD1FFC4375A2E471F38486137D'
         end

   end

  def submit
       agent = Mechanize.new
       resp =   agent.get('https://www.payeverywhere.com/api/vtapi.aspx', {
        "profile_id" => @profile_id,
        "profile_key" =>  @profile_key,
        "card_number" => @card_number,
        "card_exp_date" => @card_exp_date,
        "cardholder_street_address" => @cardholder_street_address,
        "cardholder_zip" => @cardholder_zip,
        "first_name" => @first_name,
        "last_name" => @last_name,
        "customer_email" => @customer_email,
        "transaction_amount" => @transaction_amount,
        "invoice_number" => @invoice_number,
        "transaction_type" => @transaction_type,
        "cvv2" => @cvv2
       
       })
       url = resp.body
       my_hash = CGI::parse(url)
       return my_hash
      end

end

