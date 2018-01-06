require 'csv'
require 'pry'

class Cryptotype
  def initialize(type,hash,amount,rate,currentvalue,difference)
    @type = type
    @hash = hash.to_f
    @amount = amount.to_f
    @rate = rate.to_f
    @currentvalue = currentvalue.to_f
    @difference = difference.to_f
  end
  def display_crypttype
    puts "------------------- #@type"
    puts "hash: #@hash"
    puts "amount: #@amount"
    puts "rate: #@rate"
    puts "currentvalue: #@currentvalue"
     puts "difference: #@difference"
  end
end

class Member
#  def initialize(name,email,notes,refrow,type,datein,medium,high,amount,usd,iou,iouusd,hashbtc,amountbtc,ratebtc,currentvaluebtc,differencebtc,hasheth,amounteth,rateeth,currentvalueeth,differenceeth,hashans,amountans,rateans,currentvalueans,differenceans,cumold,cumcur,percdifference,diff)
#    @name = name 
#    @email = email
#    @notes = notes
#    @refrow = refrow
#    @type = type
#    @datein = datein
#    @medium = medium.to_i
#    @high = high.to_f
#    @amount = amount
#    @usd = usd.to_f
#    @iou = iou.to_f
    # @iouusd = iouusd.to_f

  #   @cryptos = []
  #   @cryptos.push(Cryptotype.new("BTC",hashbtc,amountbtc,ratebtc,currentvaluebtc,differencebtc))
  #   @cryptos.push(Cryptotype.new("ETH",hasheth,amounteth,rateeth,currentvalueeth,differenceeth))
  #   @cryptos.push(Cryptotype.new("ANS",hashans,amountans,rateans,currentvalueans,differenceans))
  #
  #   @cumold = cumold.to_f
  #   @cumcur = cumcur.to_f
  #   @percdifference = percdifference.to_f
  #   @diff = diff.to_f
  # end
  def initialize(args = {})
    args.each do |k,v|
      instance_variable_set(:"@#{k}", v)
    end
  end
  def display_member()
    puts "-----------------------------------------"
    puts "name: #@name"
    puts "email: #@email"
    puts "notes: #@notes"
    puts "ref row: #@ref_row"
    puts "type: #@type"
    puts "date in: #@date_in"
    puts "medium: #@medium"
    puts "high: #@high"
    puts "amount: #@amount"
    puts "usd: #@usd"
    puts "iou: #@iou"
    puts "iouusd: #@iouusd"
    #@cryptos[0].display_crypttype
    # @cryptos[1].display_crypttype
    # @cryptos[2].display_crypttype
    puts "cumold: #@cumold"
    puts "cumcur: #@cumcur"
    puts "percdifference: #@perc_difference"
    puts "diff: #@diff"
  end
end

data = CSV.read('mmt_sample.csv')
columns = data.first


member_columns = columns[0..11]+columns[30..33]



data = data.drop(1)
members = []
data.each do |row|
  select_params = row[0..11]+row[30..33]
  params = member_columns.zip(select_params).to_h
  members.push(Member.new(params))

  
end

members[0].display_member()


#name,email,notes,ref_row,type,date_in,medium,high,amount,usd,iou,iouusd,crypto1,btchash,btcamount,btcrate,btccurrent_value,btc_perc_difference,crypto2,ethhash,ethamount,ethrate,eth_current_value,eth_perc_difference,crypto 3,neohash,neo_amount,neo_rate,neo_current_value,neo_perc_difference,CUMOLD,CUMCUR,perc_difference,diff

