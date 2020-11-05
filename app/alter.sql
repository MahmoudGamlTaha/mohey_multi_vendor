ALTER TABLE `shop_category` ADD `Home_Page` INT NOT NULL DEFAULT '0' AFTER `company_id`;
ALTER TABLE `shop_category` CHANGE `Home_Page` `home_page` TINYINT(4) NOT NULL DEFAULT '0';
ALTER TABLE `shop_category` ADD `common` BOOLEAN NOT NULL DEFAULT FALSE AFTER `home_page`;
CREATE TABLE `banner_type` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(250) NOT NULL,
  `name_en` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

ALTER TABLE `banner_type`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `banner_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
ALTER TABLE `banner` CHANGE `type` `type_id` SMALLINT(4) NULL DEFAULT '0';
ALTER TABLE `banner` ADD `path` VARCHAR(255) NULL AFTER `url`;
-- update set 1 image to  be home page
INSERT INTO `banner_type` (`id`, `name_ar`, `name_en`, `created_at`) VALUES (NULL, 'home slider', 'home slider', current_timestamp());
INSERT INTO `banner_type` (`id`, `name_ar`, `name_en`, `created_at`) VALUES (NULL, 'home 3 ads', 'home 3 ads', current_timestamp());
INSERT INTO `banner_type` (`id`, `name_ar`, `name_en`, `created_at`) VALUES (NULL, 'product detail ads', 'product detail ads', current_timestamp());
INSERT INTO `banner_type` (`id`, `name_ar`, `name_en`, `created_at`) VALUES (NULL, 'home beside slider img', 'home beside slider img', current_timestamp());
INSERT INTO `banner_type` (`id`, `name_ar`, `name_en`, `created_at`) VALUES (NULL, 'profile up img', 'profile up img', current_timestamp());
INSERT INTO `banner_type` (`id`, `name_ar`, `name_en`, `created_at`) VALUES (NULL, 'profile down img', 'profile down img', current_timestamp());
INSERT INTO `banner_type` (`id`, `name_ar`, `name_en`, `created_at`) VALUES (NULL, 'profile left img', 'profile down img', current_timestamp());
----------
ALTER TABLE `shop_category` ADD `four_best_product` TINYINT NOT NULL DEFAULT '4' AFTER `parent`;
UPDATE `shop_category` SET `four_best_product` = '1' WHERE `shop_category`.`id` = 11;
 ALTER TABLE `admin_roles` ADD `is_register_type` INT NOT NULL DEFAULT '0' AFTER `company_id`;

INSERT INTO `admin_roles` (`id`, `company_id`, `is_register_type`, `name`, `slug`, `created_at`, `updated_at`) VALUES (NULL, NULL, '1', 'company', 'company', NULL, NULL);
INSERT INTO `admin_permissions` (`id`, `company_id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES (NULL, NULL, 'company-role', 'company-role', 'GET,PUT,DELETE', '/shop_category\r\n/process/productImport\r\n/shop_order\r\n/shop_customer\r\n/shop_order/create', NULL, NULL);
UPDATE `admin_permissions` SET `http_path` = '/\r\n/Medical-company\r\n/auth/users\r\n/shop_category\r\n/shop_product\r\n/shop_special_price\r\n/process/productImport\r\n/shop_order\r\n/shop_customer\r\n/shop_order/create\r\n/shop_order_edit*\r\n', `created_at` = NULL, `updated_at` = NULL WHERE `admin_permissions`.`id` = 11;
ALTER TABLE `shop_users` CHANGE `phone` `mobile` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;
update shop_category set home_page = 1 where id in (7,8,9,10,11);
UPDATE `admin_menu` SET `active` = '1' WHERE `admin_menu`.`id` = 62;
UPDATE `admin_menu` SET `active` = '0' WHERE `admin_menu`.`id` = 63;


CREATE TABLE `company_subscriber` (
  `id` bigint(20) NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

CREATE TABLE `shop_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `subtotal` int(11) DEFAULT 0,
  `shipping` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `payment_status` tinyint(4) DEFAULT 0 COMMENT '0-not send 1-pp send 2-sent',
  `shipping_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-notship 1-sending 2-pp send 3-shipped',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-new 1-processing 2-hold 3-cancel 4-Completed',
  `tax` tinyint(4) DEFAULT 0 COMMENT '%',
  `total` int(11) DEFAULT 0,
  `currency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `paid` int(11) DEFAULT 0,
  `balance` int(11) DEFAULT 0,
  `toname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` int(3) DEFAULT NULL,
  `phone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shop_return`
--
ALTER TABLE `shop_return`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shop_return`
--
ALTER TABLE `shop_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

CREATE TABLE `shop_return_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `return_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT 0 COMMENT 'Price: price of product or type',
  `qty` int(11) DEFAULT 0,
  `total_price` int(11) DEFAULT 0,
  `sku` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Attributes',
  `currency` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `attribute` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Attributes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE `cities` ( `id` INT NOT NULL AUTO_INCREMENT ,
 `name` VARCHAR(200) NOT NULL , 
 PRIMARY KEY (`id`)
 ) ENGINE = InnoDB;
INSERT INTO `cities` (`id`, `name`) VALUES (NULL, 'القاهرة');
INSERT INTO `cities` (`id`, `name`) VALUES (NULL, 'الجيزة');
INSERT INTO `cities` (`id`, `name`) VALUES (NULL, 'اسوان');
INSERT INTO `cities` (`id`, `name`) VALUES (NULL, 'الاسكندرية');
INSERT INTO `cities` (`id`, `name`) VALUES (NULL, 'اكتوبر');

ALTER TABLE `shop_return_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shop_return_detail`
--
ALTER TABLE `shop_return_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

  ALTER TABLE `admin_users` ADD `country` VARCHAR(150)  NULL AFTER `mobile`, ADD `city` VARCHAR(150)  NULL AFTER `country`, ADD `street` VARCHAR(250)  NULL AFTER `city`;
  ALTER TABLE `shipping_standard` ADD `company_id` INT NULL AFTER `shipping_free`;
  ALTER TABLE `shop_order_detail` ADD `status` INT NOT NULL AFTER `sku` DEFAULT '0';
  ALTER TABLE `admin_users` ADD `path` VARCHAR(255) NULL AFTER `avatar`;
  ALTER TABLE `uofms` ADD `company_id` INT NULL AFTER `amount_in_base`;

  DELETE FROM `layout_url` WHERE `layout_url`.`id` = 3

  --//

  ALTER TABLE `customer_payment_term` ADD `company_id` INT NULL AFTER `rate`;
ALTER TABLE `customer_payment_term` CHANGE `updated_at` `updated_at` TIMESTAMP NULL;
ALTER TABLE `customer_payment_term` CHANGE `created_at` `created_at` TIMESTAMP NULL;
--//
INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `active`, `created_at`, `updated_at`) VALUES (NULL, '113', '55', 'PaymentTerm', 'fas fa-align-justify', 'payment_term', NULL, '1', '2018-11-08 01:01:21', '2019-03-23 10:28:54');
INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `active`, `created_at`, `updated_at`) VALUES (NULL, '113', '56', 'PaymentCustomerTerm', 'fas fa-align-justify', 'customer_payment_term', NULL, '1', '2018-11-08 01:01:21', '2019-03-23 10:28:54');
ALTER TABLE `payment_terms` ADD `company_id` INT NULL AFTER `name`;
ALTER TABLE `admin_users` ADD `active` TINYINT NOT NULL DEFAULT '1' AFTER `seller_type`;
ALTER TABLE `customer_payment_term` CHANGE `id` `id` BIGINT(20) NOT NULL AUTO_INCREMENT, add PRIMARY KEY (`id`);
ALTER TABLE `shop_order` ADD `payment_term_id` INT NULL DEFAULT NULL AFTER `payment_method`;

--//
ALTER TABLE `company_work_time` ADD `update_at` DATE ;
ALTER TABLE `company_work_time` ADD `created_at` DATE CURRENT_TIMESTAMP AFTER `update_at`;