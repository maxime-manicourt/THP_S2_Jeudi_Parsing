require 'nokogiri'
require 'open-uri'

#Création d'une méthode deputes
def deputes
#Création de deux tableau 1 pour les noms l'autre pour les e-mails
noms = []
final = []


#Ouverture de l'url de la liste des députés
  page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
#Scrapping des noms des députer
  page.css('ul.col3 li a').each do |nom|
  #On met les noms dans notre tableau créer plus haut
    noms << nom.text
  end

  noms.each do |mail|
  #On enleve Mr et Mlle
    mails = mail.split(' ')[1..-1].join(' ').downcase
  #On converti en string et on met en minuscule
    new_mail = mails.split(",")
  #On replace les espaces par un point.
    new_mails = new_mail.map { |word| word.gsub(' ','.')}
  #On rajoute @assemblee-nationale.fr
    star_mail = new_mails.map { |i| i + "@assemblee-nationale.fr"}
  #On met les mails dans le tabelau final créer plus haut
    final << star_mail
  end

#On créer un nouveaux hash qui à pour clef les noms des députer et pour valeur leur adresse mail
  mon_hash = Hash[noms.zip(final)]

  mon_hash.each do |k,v|
    puts "Nom: #{k} Email: #{v.join("','")}"
  end

end

deputes
