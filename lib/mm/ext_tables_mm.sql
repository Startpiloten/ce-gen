
#
# Table structure for table 'tt_content'
#
CREATE TABLE tt_content (
	tx_${extname}_${mmtitleLower} VARCHAR(255) DEFAULT '' NOT NULL,
);

#
# Table structure for table 'tx_${extname}_${mmtitleLower}'
#
CREATE TABLE tx_${extname}_${mmtitleLower} (
    tt_content int(11) unsigned DEFAULT '0',
    header varchar(255) DEFAULT '' NOT NULL,
);

#
# Table structure for table 'tx_${extname}_${mmtitleLower}'
#
CREATE TABLE tt_content_tx_${mmtitleLower}_mm (
   uid_local int(11) unsigned DEFAULT '0' NOT NULL,
   uid_foreign int(11) unsigned DEFAULT '0' NOT NULL,
   tablenames varchar(30) NOT NULL,
   sorting int(11) unsigned DEFAULT '0' NOT NULL,
   KEY uid_local (uid_local),
   KEY uid_foreign (uid_foreign)
);
