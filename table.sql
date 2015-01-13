CREATE TABLE `rate_limit` (
  `client` varchar(255) NOT NULL DEFAULT '',
  `target` varchar(255) NOT NULL DEFAULT '_global',
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`client`,`target`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
