require 'nokogiri'
require 'open-uri'

#Création d'une méthode
def crypto
#Création d'une boucle infini
	while 1 == 1 do
#Création de deux tableau pour le nom de la money et leur valeur
		noms = []
		prix = []
#Ouverture de l'url de la cryto money
		page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
#Scrapping des noms
		page.css('a.currency-name-container').each do |nom|
			noms << nom.text
		end
#Scrapping des valeurs des moneys
		page.css('a.price').each do |i|
			prix << i.text
		end

#Création d'un hash qui à pour clef les noms et valeurs leur prix
		crypto_hash = Hash[noms.zip(prix)]

		crypto_hash.each do |k,v|
		  puts "La monnaie: #{k} à pour valeur: #{v}"
		end
#Stop tout pendant pendant 1heure 
		sleep(3600)

	end

end

crypto
