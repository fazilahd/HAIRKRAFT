create database haircare1;
CREATE TABLE shampoo (
    s_id INT PRIMARY KEY,
    s_brand VARCHAR(255),
    s_name VARCHAR(255),
    hair_type VARCHAR(255),
    sulphate_shampoo VARCHAR(20),
    paraben_shampoo VARCHAR(20),
    s_price VARCHAR(20),
    s_rating DECIMAL(3, 2),
    image_name VARCHAR(255)
);
CREATE INDEX idx_hair_type ON shampoo (hair_type);
CREATE TABLE conditioner (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(255),
    c_brand VARCHAR(255),
    hair_type VARCHAR(255),
    c_price VARCHAR(20),
    c_rating DECIMAL(3, 2),
    image_name VARCHAR(255),
    FOREIGN KEY (hair_type) REFERENCES shampoo(hair_type)
);
CREATE TABLE cream (
    cr_id INT PRIMARY KEY,
    cr_name VARCHAR(255),
    cr_brand VARCHAR(255),
    hair_type VARCHAR(255),
    cr_price VARCHAR(20),
    cr_rating DECIMAL(3, 2),
    image_name VARCHAR(255),
    FOREIGN KEY (hair_type) REFERENCES conditioner(hair_type)
);

CREATE TABLE oil (
    o_id INT PRIMARY KEY,
    o_brand VARCHAR(255),
    o_name VARCHAR(255),
    hair_type VARCHAR(255),
    o_price VARCHAR(20),
    o_rating DECIMAL(3, 2),
    image_name VARCHAR(255),
    FOREIGN KEY (hair_type) REFERENCES cream(hair_type)
);
CREATE TABLE gel (
    g_id INT PRIMARY KEY,
    g_brand VARCHAR(255),
    g_name VARCHAR(255),
    hair_type VARCHAR(255),
    g_price VARCHAR(20),
    g_rating DECIMAL(3, 2),
    image_name VARCHAR(255),
    FOREIGN KEY (hair_type) REFERENCES oil(hair_type)
);
CREATE TABLE serum (
    se_id INT PRIMARY KEY,
    se_brand VARCHAR(255),
    se_name VARCHAR(255),
    hair_type VARCHAR(255),
    se_price VARCHAR(20),
    se_rating DECIMAL(3, 2),
    image_name VARCHAR(255),
    FOREIGN KEY (hair_type) REFERENCES gel(hair_type)
);

INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4000', 'Naturali', 'Naturali Shampoo', 'curly', 'yes', 'yes', 'Rs 239', '4.5', 'naturali_curl.jpeg');
INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4001', 'BBlunt', 'BBlunt Curly Hair Shampoo ', 'curly', 'yes', 'yes', 'Rs 399', '5', 'bblunt_curl.jpeg');
INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4002', 'Shea', 'Shea Moisture Curl & Shine Shampoo ', 'curly', 'yes', 'yes', 'Rs 1290', '4.4', 'shea_curl.jpeg');
INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4003', 'Dove', 'Dove Beautiful Curls Shampoo', 'wavy', 'yes', 'yes', 'Rs 819', '4.6', 'dove_wavy.jpeg');
INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4004', 'Curlvana', 'Curlvana Shampoo for Curly & Wavy Hair', 'wavy', 'yes', 'yes', 'Rs 299', '5', 'curlvana_wavy.jpeg');
INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4005', 'Plum', 'Plum Avocado & Argon Frizz Control Shampoo', 'wavy', 'yes', 'yes', 'Rs 800', '4', 'plum_wavy.jpeg');
INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4006', 'Loreal', 'Loreal Paris Dream Lengths Shampoo', 'straight', 'no', 'yes', 'Rs 175', '4.9', 'loreal_stra.jpeg');
INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4007', 'Himalaya', 'Himalaya Gentle Daily Care Protein Shampoo', 'straight', 'yes', 'yes', 'Rs 329', '5', 'himalaya_stra.jpeg');
INSERT INTO `haircare`.`shampoo` (`s_id`, `s_brand`, `s_name`, `hair_type`, `sulphate_shampoo`, `paraben_shampoo`, `s_price`, `s_rating`, `image_name`) VALUES ('4008', 'Sunsilk', 'Sunsilk Nourishing Soft & Smooth Shampoo', 'straight', 'no', 'no', 'Rs 540', '4.5', 'sunsilk_stra.jpeg');

INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2000', 'Re\'equil Damage Repair Hair Conditioner', 'Re\'equil', 'curly', 'Rs 295', '5', 'reequil_curl.webp');
INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2001', 'Plum Plant Keratin Conditioner', 'Plum ', 'curly', 'Rs 100', '4', 'plum_curl.jpeg');
INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2002', 'Dove Beautiful Curls Detangling Conditioner', 'Dove', 'curly', 'Rs 539', '4.7', 'dove_curl.jpeg');
INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2003', 'Bare Anatomy Anti-frizz Leave In Conditioner', 'Bare Anatomy', 'wavy', 'Rs 599', '5', 'bare_wavy.jpeg');
INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2004', 'Tresemme Keratin Smooth Conditioner', 'Tresemme', 'wavy', 'Rs 500', '4.8', 'tresemme_wavy.jpeg');
INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2005', 'Earth Rhythm Phytocurls Deep Conditioner', 'Earth Rhythm', 'wavy', 'Rs 699', '4.9', 'earth_wavy.jpeg');
INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2006', 'Streax Glossy Serum Shine Conditioner', 'Streax', 'straight', 'Rs 275', '5', 'streax_stra.jpeg');
INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2007', 'OGX Brazilian Keratin Smooth Conditioner', 'OGX', 'straight', 'Rs 304', '4.3', 'ogx_stra.jpeg');
INSERT INTO `haircare`.`conditioner` (`c_id`, `c_name`, `c_brand`, `hair_type`, `c_price`, `c_rating`, `image_name`) VALUES ('2008', 'Matrix Opti.Care Smooth Conditioner', 'Matrix Opti.Care', 'straight', 'Rs 565', '5', 'matrix_stra.jpeg');

INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1000', 'Manetain', 'Manetain Curl Cream', 'curly', 'Rs 466', '5', 'manetain_curl.jpeg');
INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1001', 'Curlvana', 'Curlvana Curl Cream', 'curly', 'Rs 499', '4.5', 'curlvana_curl.jpeg');
INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1002', 'Arata', 'Arata Curly Hair Cream', 'curly', 'Rs 419', '4.7', 'arata_curl.jpeg');
INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1003', 'Moxie', 'Moxie Super defining Curl Cream', 'wavy', 'Rs 625', '5', 'moxy_wavy.jpeg');
INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1004', 'Ashba', 'Ashba Curl Moisture Milk', 'wavy', 'Rs 330', '5', 'ashba_wavy.jpeg');
INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1005', 'Himalaya', 'Himalaya Protein Hair Cream', 'wavy', 'Rs 150', '4.1', 'himalaya_wavy.jpeg');
INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1006', 'Arata', 'Arata Styling Hair Cream', 'straight', 'Rs 299', '4.7', 'arata_stra.jpeg');
INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1007', 'Wellocare', 'Wellocare Hair Straightening Cream', 'straight', 'Rs 205', '3.9', 'wellocare_stra.jpeg');
INSERT INTO `haircare`.`cream` (`cr_id`, `cr_brand`, `cr_name`, `hair_type`, `cr_price`, `cr_rating`, `image_name`) VALUES ('1008', 'Parachute', 'Parachute Aftershower Hair Cream', 'straight', 'Rs 252', '4.2', 'parachute_stra.jpeg');

INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5000', 'Brillare', 'Brillare Anti-Frizz Hair Oil for Curly Hair', 'curly', 'Rs 149', '4.5', 'brillare_curl.jpeg');
INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5001', 'Bajaj', 'Bajaj Almond Drops Hair Oil', 'curly', 'Rs 259', '4.3', 'bajaj_curl.jpeg');
INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5002', 'Arata ', 'Arata Deep Nourishing Hair Oil', 'curly', 'Rs 349', '4.6', 'aratas_curl.jpeg');
INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5003', 'Love Beauty & Planet', 'Love Beauty & Planet Argon Oil', 'wavy', 'Rs 300', '4.2', 'love_wavy.jpeg');
INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5004', 'Mamaearth', 'Mamaearth 100% Cold Presses Castor Oil', 'wavy', 'Rs 272', '4.8', 'mama_wavy.jpeg');
INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5005', 'Fix my Curls', 'Fix my Curls Scalp & Strands Elixir', 'wavy', 'Rs 770', '5', 'elixir_wavy.jpeg');
INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5006', 'Pilgrim Patua', 'Pilgrim Patua Strengthening Hair Oil', 'straight', 'Rs 360', '4.1', 'pilgrim_stra.jpeg');
INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5007', 'Soulflower', 'Soulflower Healthy Hair Oil', 'straight', 'Rs 379', '4.8', 'soulflower_stra.jpeg');
INSERT INTO `haircare`.`oil` (`o_id`, `o_brand`, `o_name`, `hair_type`, `o_price`, `o_rating`, `image_name`) VALUES ('5008', 'Mielle', 'Mielle Rosemary Hair Oil', 'straight', 'Rs 499', '4.7', 'mielle_stra.jpeg');


INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3000', 'Kayos', 'Kayos Flaxseed Hair Gel', 'curly', 'Rs 299', '5', 'kayos_curl.jpeg');
INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3001', 'Curl Up ', 'Curl Up Ultra Defining Hair Gel', 'curly', 'Rs 711', '4.6', 'curlup_curl.jpeg');
INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3002', 'True Frog', 'True Frog Styling Gel For Curls', 'curly', 'Rs 505', '4.1', 'truefrog_curl.jpeg');
INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3003', 'Best Life', 'Best Life Style Gel', 'wavy', 'Rs 519', '4.3', 'bestlife_wavy.jpeg');
INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3004', 'Alldoer', 'Alldoer Super Hold Jelly Gel', 'wavy', 'Rs 399', '3.9', 'alldoer_wavy.jpeg');
INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3005', 'Parachute', 'Parachute Coconut Water Hydrating Gel', 'wavy', 'Rs 209', '5', 'parachute_wavy.jpeg');
INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3006', 'Livon', 'Livon Styling Gel', 'straight', 'Rs 399', '5', 'livon_stra.jpeg');
INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3007', 'Staft ', 'Staft Styling Gel', 'straight', 'Rs 375', '4.3', 'taft_stra.jpeg');
INSERT INTO `haircare`.`gel` (`g_id`, `g_brand`, `g_name`, `hair_type`, `g_price`, `g_rating`, `image_name`) VALUES ('3008', 'Arata', 'Arata Styling Hair Gel', 'straight', 'Rs 454', '4.5', 'aratas_stra.jpeg');

INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6000', 'The Ordinary', 'The Ordinary Multi-Peptide Hair Serum', 'curly', 'Rs 1935', '4.4', 'ordinary_curl.jpeg');
INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6001', 'Minimalist', 'Minimalist Maleic Bond Repair', 'curly', 'Rs 495', '5', 'minimalist_curl.jpeg');
INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6002', 'Tresemme', 'Tresemme Keratin Smooth Infusing Hair Serum', 'curly', 'Rs 950', '4.5', 'tresemme_curl.jpeg');
INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6003', 'Streax ', 'Streax Professional Gloss Hair Serum', 'wavy', 'Rs 299', '4.5', 'streax_wavy.jpeg');
INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6004', 'L\'Oreal', 'L\'Oreal Paris Extraordinary Hair Oil Serum', 'wavy', 'Rs 309', '4.9', 'loreal_wavy.jpeg');
INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6005', 'Livon', 'Livon Hair Serum', 'wavy', 'Rs 204', '4.3', 'livon_wavy.jpeg');
INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6006', 'Bare Anatomy', 'Bare Anatomy Ultra Smoothing Hair Serum', 'straight', 'Rs 327', '4.2', 'bare_stra.jpeg');
INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6007', 'Kerastase', 'Kerastase Shine Enhancing Hair Serum', 'straight', 'Rs 2100', '5', 'kerastase_stra.jpeg');
INSERT INTO `haircare`.`serum` (`se_id`, `se_brand`, `se_name`, `hair_type`, `se_price`, `se_rating`, `image_name`) VALUES ('6008', 'Moody', 'Moody Hyaluronic & Keratin Hair Gloss Serum', 'straight', 'Rs 339', '4.7', 'moody_stra.jpeg');






