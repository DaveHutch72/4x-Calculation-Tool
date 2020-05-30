class API
    def self.currency_types(base_date:"latest", base_currency:"USD")
        n = FourX.new(base_currency)
        url = "https://api.ratesapi.io/api/#{base_date}?base=#{base_currency}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        n.date = hash["date"]
        n.xchange = hash["rates"]
        n
    end
end