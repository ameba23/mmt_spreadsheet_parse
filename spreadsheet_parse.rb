require 'csv'

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
  def initialize(name,email,notes,refrow,type,datein,medium,high,amount,usd,iou,iouusd,hashbtc,amountbtc,ratebtc,currentvaluebtc,differencebtc,hasheth,amounteth,rateeth,currentvalueeth,differenceeth,hashans,amountans,rateans,currentvalueans,differenceans,cumold,cumcur,percdifference,diff)
    @name = name 
    @email = email
    @notes = notes
    @refrow = refrow
    @type = type
    @datein = datein
    @medium = medium.to_i
    @high = high.to_f
    @amount = amount
    @usd = usd.to_f
    @iou = iou.to_f
    @iouusd = iouusd.to_f

    @cryptos = []
    @cryptos.push(Cryptotype.new("BTC",hashbtc,amountbtc,ratebtc,currentvaluebtc,differencebtc))
    @cryptos.push(Cryptotype.new("ETH",hasheth,amounteth,rateeth,currentvalueeth,differenceeth))
    @cryptos.push(Cryptotype.new("ANS",hashans,amountans,rateans,currentvalueans,differenceans))

    @cumold = cumold.to_f
    @cumcur = cumcur.to_f
    @percdifference = percdifference.to_f
    @diff = diff.to_f
  end
  def display_member()
    puts "-----------------------------------------"
    puts "name: #@name"
    puts "email: #@email"
    puts "notes: #@notes"
    puts "ref row: #@refrow"
    puts "type: #@type"
    puts "date in: #@datein"
    puts "medium: #@medium"
    puts "high: #@high"
    puts "amount: #@amount"
    puts "usd: #@usd"
    puts "iou: #@iou"
    puts "iouusd: #@iouusd"
    @cryptos[0].display_crypttype
    @cryptos[1].display_crypttype
    @cryptos[2].display_crypttype
    puts "cumold: #@cumold"
    puts "cumcur: #@cumcur"
    puts "percdifference: #@percdifference"
    puts "diff: #@diff"
  end
end

data = CSV.read('mmt_sample.csv')
data = data.drop(1)
members = []
data.each do |row|
  members.push(Member.new(row[0], row[1], row[2], row[3],row[4],row[5],row[6],row[7],row[8],row[9],row[10],row[11],row[13],row[14],row[15],row[16],row[17],row[19],row[20],row[21],row[22],row[23],row[25],row[26],row[27],row[28],row[29],row[30],row[31],row[32],row[33]))
end

members.each do |rowmember|
  rowmember.display_member()
end
