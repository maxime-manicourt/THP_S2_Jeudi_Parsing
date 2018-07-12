require 'nokogiri'
require 'open-uri'

# On déclare une méthode qui permet de récupérer l'adresse mail de la mairie
def get_the_email_of_a_townhal_from_its_webpage(url)
#Ouverture de l'url du site de la ville
  page = Nokogiri::HTML(open(url))
#Scrapping du mail de la mairie
  @email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

end


# On déclare une méthode qui récupère toutes les url des mairies du d'oise
def get_all_the_urls_of_val_doise_townhalls
#Ouverture de l'url de l'annuaire des mairies
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  page.css(".lientxt").each do |lien|
    #Scrapping de l'url de chaque mairie
    url = "http://annuaire-des-mairies.com" + lien["href"][1..-1]
    #Scrapping du nom de la ville
    ville = lien.text
    #Scrapping de l'adresse mail de la mairie
    email = get_the_email_of_a_townhal_from_its_webpage(url)
    #On met tout dans un hash
    ville = { :name => ville, :email => @email }
    puts ville
  end

end

# Creation d'une methode perform pour lancer toutes les méthodes
def perform

  puts get_the_email_of_a_townhal_from_its_webpage('http://annuaire-des-mairies.com/95/vaureal.html')
  get_all_the_urls_of_val_doise_townhalls

end

perform