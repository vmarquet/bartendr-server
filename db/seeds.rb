# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Bières')
Category.create(name: 'Alcools')
Category.create(name: 'Cocktails')
Category.create(name: 'Cocktails sans alcool')
Category.create(name: 'Vins')
Category.create(name: 'Digestifs')
Category.create(name: 'Jus de fruits')
Category.create(name: 'Boissons chaudes')
Category.create(name: 'Boissons fraîches')

# Bières
Article.create(name: 'Galopin', price: '1.30', description: '12,5 cl', category_id: '1')
Article.create(name: 'Amstel 25cl', price: '2.50', description: 'Demi pression 25 cl', category_id: '1')
Article.create(name: 'Affligem 25cl', price: '3.40', description: 'Demi pression 25 cl', category_id: '1')
Article.create(name: 'Amstel 50cl', price: '4.50', description: 'Pinte pression 50 cl', category_id: '1')
Article.create(name: 'Affligem 50cl', price: '5.50', description: 'Pinte pression 50 cl', category_id: '1')
Article.create(name: 'Desperados', price: '5.00', description: 'Bouteille 33 cl', category_id: '1')
Article.create(name: 'Bière blanche', price: '3.00', description: 'Bouteille 25 cl', category_id: '1')
Article.create(name: '1664 blonde', price: '2.90', description: 'Bouteille 25 cl', category_id: '1')
Article.create(name: 'Panaché', price: '2.50', description: 'Bière et limonade', category_id: '1')
Article.create(name: 'Buckler', price: '2.50', description: 'Bière sans alcool', category_id: '1')

# Alcools
Article.create(name: 'Rhum blanc', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Rhum ambré', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Gin', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'J&B', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Jack Daniel\'s', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Tequila', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Vodka', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Get', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Malibu', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Ricard', price: '2.50', description: '2 cl', category_id: '2')
Article.create(name: 'Pastis', price: '2.50', description: '2 cl', category_id: '2')
Article.create(name: 'Martini rouge', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Martini blanc', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Suze', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Campari', price: '4.50', description: '4 cl', category_id: '2')
Article.create(name: 'Porto', price: '4.50', description: '4 cl', category_id: '2')

# Cocktails
Article.create(name: 'Le yelloh !', price: '6.50', description: 'Rhum ambré, jus d\'orange, sirop de pêche, sirop de fraise.', category_id: '3')
Article.create(name: 'Mojito', price: '6.50', description: 'Rhum ambré, cassonade, citron vert, menthe fraîche, eau gazeuse.', category_id: '3')
Article.create(name: 'Sex on the beach', price: '6.50', description: 'Vodka, liqueur de pêche, jus d\'ananas, jus de cranberry.', category_id: '3')
Article.create(name: 'Long island ice tea', price: '6.50', description: 'Vodka, gin, rhum, tequila, jus de citron, coca.', category_id: '3')
Article.create(name: 'Tequila sunrise', price: '6.50', description: 'Tequila, jus d\'orange, grenadine.', category_id: '3')
Article.create(name: 'Piña colada', price: '6.50', description: 'Rhum blanc, jus d\'ananas, crème de coco.', category_id: '3')
Article.create(name: 'Ti punch', price: '6.50', description: 'Rhum blanc, citron vert, sucre de canne.', category_id: '3')
Article.create(name: 'Caïpirinha', price: '6.50', description: 'Cachaça, cassonade, citron vert.', category_id: '3')

# Cocktails sans alcool
Article.create(name: 'Dolce vita', price: '4.50', description: 'Jus d\'orange, jus d\'ananas, sirop de pêche.', category_id: '4')
Article.create(name: 'Virgin colada', price: '4.50', description: 'Jus d\'ananas, crème de coco.', category_id: '4')

# Vins
Article.create(name: 'Sangria (verre)', price: '3.00', description: 'Le verre.', category_id: '5')
Article.create(name: 'Sangria (pichet)', price: '6.00', description: 'Le pichet', category_id: '5')
Article.create(name: 'Sangria (1L)', price: '9.00', description: 'Le litre', category_id: '5')
Article.create(name: 'Kir royal (Pêche)', price: '3.00', description: '', category_id: '5')
Article.create(name: 'Kir royal (Mûre)', price: '3.00', description: '', category_id: '5')
Article.create(name: 'Kir royal (Cassis)', price: '3.00', description: '', category_id: '5')
Article.create(name: 'Vin rouge', price: '3.00', description: 'Sud-Ouest', category_id: '5')
Article.create(name: 'Vin blanc', price: '3.00', description: 'Chardonnay', category_id: '5')
Article.create(name: 'Vin rosé', price: '3.00', description: 'Sud-Ouest', category_id: '5')

# Digestifs
Article.create(name: 'Bailey\'s', price: '5.50', description: '4 cl', category_id: '6')
Article.create(name: 'Calvados', price: '5.50', description: '4 cl', category_id: '6')
Article.create(name: 'Cognac', price: '5.50', description: '4 cl', category_id: '6')
Article.create(name: 'Armagnac', price: '5.50', description: '4 cl', category_id: '6')
Article.create(name: 'Cointreau', price: '5.50', description: '4 cl', category_id: '6')
Article.create(name: 'Poire Williams', price: '5.50', description: '4 cl', category_id: '6')
Article.create(name: 'Izarra', price: '5.50', description: '4 cl. Liqueur a base de plantes et d\'épices, de brou de noix, de pruneaux et d\'Armagnac.', category_id: '6')
Article.create(name: 'Patxaran', price: '5.50', description: '4 cl. Liqueur basque de prunelles sauvages dans de l\'alcool anisé.', category_id: '6')
Article.create(name: 'Manzana', price: '4.00', description: '4 cl', category_id: '6')
Article.create(name: 'Irish Coffee', price: '6.00', description: '4 cl', category_id: '6')

# Jus de fruits
Article.create(name: 'Ananas', price: '3.00', description: '', category_id: '7')
Article.create(name: 'Orange', price: '3.00', description: '', category_id: '7')
Article.create(name: 'Pomme', price: '3.00', description: '', category_id: '7')
Article.create(name: 'Abricot', price: '3.00', description: '', category_id: '7')
Article.create(name: 'Tomate', price: '3.00', description: '', category_id: '7')

# Boissons chaudes
Article.create(name: 'Expresso', price: '1.30', description: '', category_id: '8')
Article.create(name: 'Décaféiné', price: '1.30', description: '', category_id: '8')
Article.create(name: 'Double expresso', price: '2.50', description: '', category_id: '8')
Article.create(name: 'Grand crème', price: '2.50', description: '', category_id: '8')
Article.create(name: 'Noisette', price: '1.40', description: '', category_id: '8')
Article.create(name: 'Chocolat', price: '2.50', description: '', category_id: '8')
Article.create(name: 'Cappuccino', price: '2.50', description: '', category_id: '8')
Article.create(name: 'Thé', price: '2.00', description: '', category_id: '8')
Article.create(name: 'Café allongé', price: '1.30', description: '', category_id: '8')

# Boissons fraîches
Article.create(name: 'Coca cola', price: '2.50', description: '', category_id: '9')
Article.create(name: 'Coca light', price: '2.50', description: '', category_id: '9')
Article.create(name: 'Orangina', price: '2.50', description: '', category_id: '9')
Article.create(name: 'Ice tea', price: '2.50', description: '', category_id: '9')
Article.create(name: 'Fanta orange', price: '2.50', description: '', category_id: '9')
Article.create(name: 'Fanta citron', price: '2.50', description: '', category_id: '9')
Article.create(name: 'Perrier', price: '2.50', description: '', category_id: '9')
Article.create(name: 'Limonade', price: '1.80', description: '25 cl', category_id: '9')
Article.create(name: 'Eau minérale', price: '1.80', description: '25 cl', category_id: '9')
Article.create(name: 'Diabolo', price: '2.00', description: '25 cl', category_id: '9')
Article.create(name: 'Sirop menthe', price: '1.80', description: '25 cl', category_id: '9')
Article.create(name: 'Sirop grenadine', price: '1.80', description: '25 cl', category_id: '9')
Article.create(name: 'Sirop pêche', price: '1.80', description: '25 cl', category_id: '9')
Article.create(name: 'Sirop fraise', price: '1.80', description: '25 cl', category_id: '9')


# we create 100 orders
for i in 0..100
  table = rand(100) + 1
  order_items = []
  # we affect some items to the order, between 1 and 10
  for i in 1..rand(10)
    article_id = rand(Article.all.size) + 1
    order_items << Item.new(article_id: article_id)
  end
  # we create a random date, during the last month
  archived_at = rand(30).days.ago
  # finally we can create the order
  Order.create table: table, items: order_items, is_paid: true, is_served: true, archived_at: archived_at
end




