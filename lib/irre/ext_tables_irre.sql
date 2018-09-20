
#
# Table structure for table 'tt_content'
#
CREATE TABLE tt_content (
	tx_${extname}_${cename} VARCHAR(255) DEFAULT '' NOT NULL,
);

#
# Table structure for table 'tx_${extname}_${cename}'
#
CREATE TABLE tx_${extname}_${cename} (
    tt_content int(11) unsigned DEFAULT '0',
    header varchar(255) DEFAULT '' NOT NULL,
);
