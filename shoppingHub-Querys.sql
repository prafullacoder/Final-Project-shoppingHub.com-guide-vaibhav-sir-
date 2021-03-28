use shoppinghub2;
show tables;
select * from user;
select * from billing_address;
select * from cart_item;
select * from category;
select * from orders;
select * from payment;
select * from product;
select * from shipping_address;
select * from shopping_cart;
select * from user_billing_address;
select * from user_payment;
select * from user_shipping_address;

delete from shipping_address;
delete from orders;
delete from cart_item;
delete from billing_address;
delete from shopping_cart;
delete from user_shipping_address;
delete from user_billing_address;
-- abhi klr try abhi bilkul fresh se hogya

/* ///////////////////////////for category/////////// */
select * from category;
desc category;
insert into category (name) values("Maxi Dress");
insert into category (name) values("Kurtis and Tunics");
insert into category (name) values("Women's Top");
insert into category (name) values("Women's Jeans");
insert into category (name) values("Shirts");
insert into category (name) values("Men's T-shirts");
insert into category (name) values("Men's Jeans");
insert into category (name) values("Jacket");
insert into category (name) values("Trousers");
insert into category (name) values("Kurtas");

/* ///////////////////////////for Product List/////////// */

select * from product;
desc product;

/*  ==== Product Queries ====

    ==Maxi Dress== */

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"Anouk Women Mustard Yellow Solid A-Line Dress",1699,10,1530,"Mustrad&nbsp;yellow printed A-line dress, has a round neck, three-quarter sleeves, flared hem",1000,"women_1.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"SASSAFRAS Women Taupe & Purple Printed A-Line Dress",1799,10,809,"Taupe and purple printed woven midi A-line dress, has a shirt collar, three-quarter sleeves, flared hem",1000,"women_2.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"Global Desi Women Blue Self Design A-Line Dress",2399,60,959,"Taupe and purple printed woven midi A-line dress, has a shirt collar, three-quarter sleeves, flared hem",1000,"women_3.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"GERUA Women Black Floral Print Maxi Dress",1499,60,899,"Black, beige and pink printed woven maxi dress, has a round neck, short sleeves, flared hem",1000,"women_4.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"INDYA Women Beige Printed Maxi Dress",2700,30,1890,"Beige printed woven maxi dress, has a boat neck, three-quarter sleeves, flared hem, has two pockets",1000,"women_5.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"IMARA Women Green & Blue Printed Cold-Shoulder Maxi Dress",2299,5,2184,"Green and blue printed woven maxi dress, has a round neck, short cold-shoulder sleeves, flared hem",1000,"women_6.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"Libas Women Blue Printed High-Low Midi A-Line Dress",1399,25,1049,"Blue, red and mustard yellow printed woven midi A-line dress, has a mandarin collar, three-quarter sleeves, flared hem, button closure",1000,"women_7.jpg");	

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"SASSAFRAS Women Grey & Red Printed A-Line Dress",1599,50,799,"Grey, red and yellow printed woven A-line&nbsp;dress, has a mandarin collar, three-quarter sleeves, button placket, flared hem",1000,"women_8.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"Fabindia Women White & Pink Printed Layered Midi A-Line Dress",2190,50,1095,"White and pink printed woven layered midi A-line dress, has a round neck, sleeveless, an attached lining, flared hem",1000,"women_9.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (1,"GERUA Women Maroon & Beige Printed Midi A-Line Dress",1299,55,584,"Maroon and beige printed woven midi A-line dress, has a keyhole neck, sleeveless, concealed zip closure, flared hemComes with a fabric belt",1000,"women_10.jpg");
    
    
  

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"Libas Women Blue & White Striped Straight Kurta",1299,60,519,"Blue and white striped straight kurta, has a shirt collar with half hook-and-eye placket, long sleeves, high hem, multiple slits",2000,"women_11.jpg");	

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"Libas Women White & Magenta Printed A-Line Kurta",1999,50,999,"White and magenta printed A-line kurta, has a mandarin collar with beads and sequins detail, three-quarter sleeves, flared hem",2000,"women_12.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"Biba Women Green Printed A-Line Kurta",1899,40,1139,"White and magenta printed A-line kurta, has a mandarin collar with beads and sequins detail, three-quarter sleeves, flared hem",2000,"women_13.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"Anouk Women Maroon Kalamkari Print A-Line Kurta",1799,60,719,"Maroon kalamkari print A-line kurta with layered detail, has a round neck, three-quarter sleeves, flared hem",2000,"women_14.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"Anouk Women Black & Gold-Toned Printed A-Line Kurta",1899,70,569,"Black and gold-toned printed A-line kurta, has a round neck, three-quarter sleeves, straight hem, side slits",2000,"women_15.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"Global Desi Women Red & Gold-Toned Printed A-Line Kurta",3599,65,1259,"Red and gold-toned printed A-line kurta, has a round neck, sleeveless, curved hem, front slit",2000,"women_16.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"RARE ROOTS Women Teal Blue Woven Design A-Line Kurta",1699,55,764,"Teal blue woven design A-line kurta, has a high neck, three-quarter sleeves, high-low hem",2000,"women_17.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"INDYA Women Blue & Off-White Printed A-Line Kurta",1950,35,1267,"Blue and off-white checked A-line kurta, has round neck, three-quarter sleeves, asymmetric hem, and tie-up detail at the waist",2000,"women_18.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"IMARA Women Red & White Printed A-Line Kurta",1399,10,1259,"Red and white printed A-line kurta, has a round neck, three-quarter sleeves, flared hem, multiple front slits",2000,"women_19.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (2,"House of Pataudi Women Green & Silver Metallic Print A-Line Kurta",3499,50,1749,"Green A-line kurta with silver-toned metallic print detail, has a V-neck, short sleeves, flared hem",2000,"women_20.jpg");


     

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"Anouk Women Beige Printed A-Line Top",1899,70,569,"Beige printed woven A-line top, has a round neck, three-quarter sleeves, button closure",3000,"women_21.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"Fabindia Women Navy Blue Handblock Print A-Line Top",1890,25,1417,"Navy Blue and maroon handblock print woven A-line top, has a V-neck, short sleeves",3000,"women_22.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"Global Desi Women Black Printed A-Line Top",1599,60,639,"Black printed A-line top, has a round neck, long sleeves, drawstring closure",3000,"women_23.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"IMARA Women Teal Green Printed A-Line Top",1299,20,1039,"Teal green and white printed woven A-line top with printed detail and mirror work, has a round neck, sleeveless",3000,"women_24.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"Rangriti Women Blue Printed Shirt Style Top",899,10,800,"Blue printed woven shirt style top, has a mandarin collar, three-quarter sleeves, button closure",3000,"women_25.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"Fabindia Women White Solid A-Line Top",1490,5,1415,"White solid woven A-line top with embroidered detailing, has a round neck, sleeveless",3000,"women_26.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"RARE ROOTS Women White Self-Design A-Line Top",1499,55,674,"White self-design woven A-line top, has a tie-up neck, three-quarter sleeves",3000,"women_27.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"All About You from Deepika Padukone Women White Embroidered Shirt Style Top",2299,60,919,"White Embroidered woven shirt style top, has a shirt collar, short sleeves, button closure",3000,"women_28.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"AKKRITI BY PANTALOONS Women White Printed Shirt Style Top",699,35,454,"White and blue printed woven shirt style top, has a round neck, three-quarter sleeves, button closure&nbsp;",3000,"women_29.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (3,"Global Desi Women Blue Self Design Blouson Top",1499,60,599,"Blue self-design woven blouson top, has a tie-up neck, short sleeves",3000,"women_30.jpg");


      

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"Roadster Women Blue Skinny Fit Mid-Rise Low Distress Stretchable Crop Jeans",1061,41,599,"Blue medium wash 5-pocket mid-rise crop jeans, low distress with light fade, has a button and zip closure, waistband with belt loops",4000,"women_31.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"DOROTHY PERKINS Women Black Classic Skinny Fit Mid-Rise Clean Look Stretchable Jeans",1990,20,1590,"Black dark wash 5-pocket mid-rise jeans, clean look, no fade, has a button and zip closure, and waistband with belt loops",4000,"women_32.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"Levis Women Blue Skinny Fit High-Rise Clean Look Stretchable Waterless Jeans",3299,25,2474,"Blue medium wash 5-pocket high-rise jeans, clean look, light fade, has a zip fly closure, and waistband with belt loops",4000,"women_33.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"Levis Women Blue 715 Bootcut Mid-Rise Clean Look Stretchable Jeans",3299,10,2969,"Blue medium wash 5-pocket mid-rise jeans, clean look, light fade, has a button and zip closure, and waistband with belt loops",4000,"women_34.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"SASSAFRAS Women Blue Regular Fit High-Rise Clean Look Jeans",1999,41,1179,"Blue dark wash 2-pocket high-rise jeans, clean look, no fade, has a button and zip closure, and paperbag waistband with belt loops",4000,"women_35.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"SASSAFRAS Women Blue Straight Fit Mid-Rise Clean Look Cropped Jeans",1899,41,1120,"Blue light wash two-pocket mid-rise cropped jeans, clean look, no fade, and has a button and zip closure",4000,"women_36.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"Nautica Women Blue Skinny Fit Mid-Rise Clean Look Stretchable Jeans",3699,40,2219,"Blue medium wash 5-pocket mid-rise jeans, clean look, light fade, has a button and zip closure, and waistband with belt loops",4000,"women_37.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"SASSAFRAS Women Black Slim Fit High-Rise Clean Look Stretchable Jeans",1999,41,1179,"Black dark wash 5-pocket high-rise jeans, clean look, no fade, has a button and zip closure, and waistband with belt loops",4000,"women_38.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"HERE&NOW Women White Skinny Fit Mid-Rise Clean Look Stretchable Cropped Jeans",1899,60,759,"White light wash 5-pocket mid-rise jeans, clean look with no fade, has a button and zip closure, waistband with belt loops",4000,"women_39.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (4,"DOROTHY PERKINS Women Black Skinny Fit Mid-Rise Slash Knee Stretchable Jeans",3590,35,2333,"Black dark wash five-pocket mid-rise jeans, slash knee, no fade, has a button and zip closure, and waistband with belt loops",4000,"women_40.jpg");


 

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"HIGHLANDER Highlander Olive Green Slim Fit Casual Shirt",1999,51,979,"Black solid casual shirt, has a spread collar, button placket, long sleeves, curved hem",5000,"men_41.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"Dennis Lingo Men Pink Slim Fit Solid Casual Shirt",1849,66,628,"Pink solid casual shirt, has a spread collar, long sleeves, curved hem, one patch pocke",5000,"men_42.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"Mast & Harbour Men Light Blue Regular Fit Solid Casual Shirt",1899,51,930,"Light blue solid casual shirt, has a spread collar, long sleeves, curved hem, two flap pocket",5000,"men_43.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"Bene Kleed Men Off-White & Blue Slim Fit Printed Casual Shirt",2099,66,799,"Off-White and blue printed casual shirt, has a spread collar, long sleeves, curved hem,",5000,"men_44.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"NEW Levis Men Navy Blue & White Pure Cotton Slim Fit Checked Casua",1699,30,1189,"Blue and beige checked casual shirt, has a spread collar, long sleeves, full button placket, curved hem, one patch pocke",5000,"men_45.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"HIGHLANDER Highlander Black Slim Fit Casual Shirt",999,50,499,"Black casual shirt, has a mandarin collar, a full button packet, a chest pocket, long sleeves with roll-up tab features, a curved hemline",5000,"men_46.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"WROGN Men Green Slim Fit Solid Casual Shirt",2099,40,1259,"Green solid casual shirt, has a spread collar, button placket, 1 pocket, long sleeves, curved hem",5000,"men_47.jpg");	

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"Roadster Time Travlr Men Navy & Grey Regular Fit Checked Casual Shirt",1599,50,799,"Blue and black checked casual shirt, has a spread collar, button placket, 1 pocket, long sleeves with roll-up tabs, curved hem",5000,"men_48.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"HERE&NOW Men Mustard Yellow Regular Fit Solid Casual Shirt",1499,60,599,"Mustard yellow solid casual shirt, has a spread collar, long sleeves, curved hem, two patch pockets",5000,"men_49.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (5,"HERE&NOW Men White Regular Fit Solid Casual Shirt",1599,55,1199,"Blue and black checked casual shirt, has a spread collar, button placket, 1 pocket, long sleeves with roll-up tabs, curved hem",5000,"men_50.jpg");


      

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"Huetrap Men Beige & Black Printed Round Neck T-shirt",1099,64,399,"Beige and Black printed T-shirt, has a round neck, and short sleeves",6000,"men_51.jpg");	

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"HERE&NOW Men Black Printed Round Neck T-shirt",524,0,524,"Black and orange printed T-shirt, has a round neck, short sleeve",6000,"men_52.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"Moda Rapido Men Navy Blue & White Striped Round Neck T-shir",999,60,399,"Navy blue and white striped T-shirt, has a round neck, long sleeves",6000,"men_53.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"Roadster Men Navy Blue & white Striped Polo Collar T-shi",3299,34,2144,"Navy Blue solid T-shirt, has a polo collar, and short sleeves",6000,"men_54.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"Roadster Men Maroon Solid Round Neck T-shir",699,60,279,"Maroon solid T-shirt, has a round neck, and long sleeves with printed details",6000,"men_55.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"HERE&NOW Men Navy Blue Printed Round Neck T-shir",799,60,319,"Navy Blue printed T-shirt, has a round neck, and short sleeves",6000,"men_56.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"Roadster Men Olive Green Solid Pure Cotton V-Neck T-shirt",1049,0,1049,"Black solid T-shirt, has a polo collar, button closure, and short sleeve",6000,"men_57.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"Roadster Men Navy Blue & white Striped Polo Collar T-shirt",1199,55,539,"Navy Blue and White striped T-shirt, has a polo collar, and short sleeves",6000,"men_58.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"DILLINGER Men Navy Blue & Red Striped Round Neck T-shirt",1199,55,539,"Navy blue, red and white striped T-shirt, has a round neck, and long sleeves",6000,"men_59.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (6,"Kook N Keech Marvel Men Black Marvel Printed Round Neck T-shirt",359,0,359,"Black printed T-shirt, has a round neck, short sleeves",6000,"men_60.jpg");


 	

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"Mast & Harbour Men Black Skinny Fit Mid-Rise Clean Look Stretchable Jeans",1819,70,569,"Off-White light wash 5-pocket mid-rise jeans, clean look, no fade, has a button closure and zip fly , and waistband with belt loops",7000,"men_61.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"HIGHLANDER Men Grey Tapered Fit Mid-Rise Clean Look Stretchable Jeans",1849,55,832,"Black medium wash 5-pocket mid-rise jeans, clean look with light fade, has a button and zip closure",7000,"men_62.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"Levis Men Blue 65504 Skinny Fit Mid-Rise Clean Look Stretchable",3199,35,2079,"Black medium wash 5-pocket mid-rise jeans, clean look with light fade, has a button and zip closure",7000,"men_63.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"Roadster Men Navy Blue Skinny Fit Mid-Rise Clean Look Stretchable",1499,51,734,"Navy Blue dark wash 5-pocket mid-rise jeans, clean look with light fade, has a button and zip closure, waistband with belt loops",7000,"men_64.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"Louis Philippe jeans",2999,40,1700,"Grey medium wash 5-pocket low-rise jeans, mildly distressed, light fade, has a button and zip closure, and waistband with belt",7000,"men_65.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"WROGN Men Blue Slim Fit Mid-Rise Clean Look Stretchable Jeans",2599,45,1425,"Blue light wash 5-pocket mid-rise jeans, clean look, heavy fade, has a button and zip closure, and waistband with belt loops",7000,"men_66.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"WROGN Men Grey Slim Fit Mid-Rise Clean Look Jeans",7999,0,7999,"Blue light wash 5-pocket mid-rise jeans, clean look, heavy fade, and has a button and zip closure",7000,"men_67.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"Calvin Klein Jeans Men Navy Blue Slim Fit Mid-Rise Clean Look Stretchable Jeans",5599,0,5599,"Blue dark wash 5-pocket mid-rise jeans, clean look, light fade, has a button and zip closure, and waistband with belt loops",7000,"men_68.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"Levis Men Navy Blue 519 Extreme Skinny Fit Mid-Rise Clean Look",1999,51,979,"Blue dark wash 5-pocket mid-rise jeans, mildly distressed, light fade, and has a button and zip closure",7000,"men_69.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (7,"WROGN Men Black Regular Fit Solid Denim Joggers",2399,55,1079,"Black dark wash 5-pocket mid-rise jeans, clean look, light fade, has a button and zip closure, and waistband with belt loops",7000,"men_70.jpg");


  
insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"Roadster Men Blue Washed Denim Jacket",1999,60,799,"Blue washed denim jacket, has a spread collar, 4 pockets, button closure, long sleeves, straight hem, and unlined",8000,"men_71.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"PERFKT-U Men Navy Blue Solid Insulator Padded Jacket",3333,41,999,"Navy Blue solid jacket, has a mock collar, 2 pockets, zip closure, long sleeves, straight hem, and synthetic lining",8000,"men_72.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"Roadster Men Blue Solid Denim Jacket",1699,40,1019,"Blue solid denim jacket, has a spread collar, long sleeves, four pockets and a button closure.",8000,"men_73.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"HIGHLANDER Men White Solid Denim Jacket",1999,60,799,"White solid jacket, has a stand collar, 2 pockets, button closure, sleeveless, curved hem",8000,"men_74.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"Ecko Unltd Men Olive Green Solid Tailored Jacket",1061,41,599,"Olive Green solid jacket, has a mock collar, 2 pockets, snap button closure, long sleeves, straight hem, and unlined linin",8000,"men_75.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"Ecko Unltd",2299,40,1379,"Olive Green solid jacket, has a mock collar, 2 pockets, snap button closure, long sleeves, straight hem, and unlined lining",8000,"men_76.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"Roadster Men Blue Solid Denim Jacket",1699,40,1019,"Blue solid denim jacket, has a spread collar, long sleeves, four pockets and a button closure.",8000,"men_77.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"Wrong",1061,41,599,"Charcoal solid tailored jacket, has a mock collar, two pockets, zip closure, long sleeves, straight hem, polyester lining",8000,"men_78.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"Roadster Men Blue Washed Denim Jacket",1061,41,599,"Navy Blue washed denim jacket, has a spread collar, 4 pockets, snap button closure, long sleeves, straight hem, and unlined lining",8000,"men_79.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (8,"SINGLE Men Black Solid Slim Fit Jacket",1061,41,599,"Black solid bomber jacket, has a hood with mesh lining detail, 2 pockets, zip closure, long sleeves, straight hem",8000,"men_80.jpg");




insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"HIGHLANDER Men Grey Tapered Fit Solid Chinos",1061,41,599,"Grey solid mid-rise chinos, has a button closure closure, 5 pockets",9000,"men_81.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"GANT Men Off-White Regular Fit Solid Regular Trousers",8999,60,3599,"Khaki solid mid-rise trousers, zip closure, and 4 pockets",9000,"men_82.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"WROGN Men Black Regular Fit Solid Denim Joggers",2299,40,1379,"Black self-design mid-rise trousers, button closure, and 4 pockets",9000,"men_83.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"HIGHLANDER Men Olive Green Tapered Fit Solid Chinos",1999,50,999,"Beige solid mid-rise trousers, button closure, and 4 pocket",9000,"men_84.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"DENNISON Men Grey Smart Tapered Fit Solid Casual Trousers",2499,65,874,"Grey solid mid-rise casual trousers, has a hook and bar closure, zip fly, four pockets",9000,"men_85.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"WROGN Men Black Regular Fit Solid Denim Joggers",2499,64,899,"Black solid mid-rise cropped regular trousers, has a hook and bar closure, four pockets",9000,"men_86.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"HIGHLANDER Men Grey Slim Fit Checked Regular Trousers",1699,48,883,"Grey checked mid-rise regular trousers, has a button closure, four pockets",9000,"men_87.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"Roadster Men Black Regular Fit Solid Regular Trousers",2799,40,2199,"Navy Blue solid mid-rise chinos, button closure, and 4 pockets",9000,"men_88.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"WROGN Men Black Regular Fit Solid Denim Joggers",2799,40,1679,"Charcoal grey and black printed mid-rise joggers, has a drawstring closure, four pocket",9000,"men_89.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (9,"Louis Philippe Sport Men Beige Solid Slim Fit Regular Trousers",2499,15,2124,"Beige solid low-rise trousers, button closure, and 4 pockets",9000,"men_90.jpg");




insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"See Designs Men Blue & White Printed Straight Kurta",2199,60,879,"Blue and white printed straight kurta, has a mandarin collar, button closures, long sleeves, straight hem, and side slits",10000,"men_91.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"Manyavar Men Cream-Coloured Solid Kurta with Churidar",1999,0,1999,"White Solid churidar, has elasticated waistband, drawstring closure",10000,"men_92.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"GRACIT Men Sea Green & White Printed Kurta with Pyjamas",3590,55,1615,"Blue and cream-coloured self design kurta with pyjamas Blue straight knee length kurta, has a mandarin collar,side slits",10000,"men_93.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"Anouk Men Mustard & Red Printed Straight Kurta",1699,40,1019,"Mustard and Red printed straight kurta, has a mandarin collar, long sleeves, curved hem, and side slits",10000,"men_94.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"Hangup Men Black Solid Kurta",1499,40,899,"Navy Blue solid straight kurta, has a mandarin collar, long sleeves, straight hem, and side slits",10000,"men_95.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"Manyavar Men Cream-Coloured Solid Kurta with Churidar & Nehru",2199,60,879,"Cream-Coloured and pink solid kurta with churidar and Nehru jacket",10000,"men_96.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"Manyvar",2999,0,2999,"Brown printed straight kurta, has a round neck, long sleeves, curved hem, and side slits",10000,"men_97.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"Anouk Men Maroon & Black Striped Straight Kurta",1499,55,674,"Blue and White striped straight kurta, has a mandarin collar, long sleeves, curved hem, and side slits",10000,"men_98.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"Anouk Men Black & White Printed Straight Kurta",1499,55,674,"Black and Grey printed straight kurta, has a mandarin collar, long sleeves, and curved hem",10000,"men_99.jpg");

insert into product (category_id,product_name,mrp,discount,selling_price,description,instock_number,image) 
	values (10,"Jompers Men Maroon Woven Design Straight Kurta",2299,40,1379,"Fashion trends may come and go, but Ikat fabrics have always stood the test of time",10000,"men_100.jpg");