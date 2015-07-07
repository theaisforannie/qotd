require 'CSV'

quotes_array_unparsed = CSV.read('goodreads_quotes_export.csv')
keys = quotes_array_unparsed.delete_at(0)

count = 0
quotes_array = []
while quotes_array.length < quotes_array_unparsed.length
	quotes_array_unparsed.each do |quote|
			quotes_array[count] = Hash[keys.zip quote]
			count += 1
	end
end

random_index = rand(quotes_array.length + 1)
@quote_body = quotes_array[random_index]["Quote"]
@quote_author = quotes_array[random_index]["Author"]

def qotd(quote, author)
	puts quote
	puts "   - #{author}"
end

def less_than_512
	if @quote_body.bytesize < 512
		qotd(@quote_body, @quote_author)
	else
		less_than_512
	end
end

less_than_512