
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
    uid int(11) NOT NULL auto_increment,
    pid int(11) DEFAULT '0' NOT NULL,
    tt_content int(11) unsigned DEFAULT '0',

    header varchar(255) DEFAULT '' NOT NULL,

    tstamp int(11) unsigned DEFAULT '0' NOT NULL,
    crdate int(11) unsigned DEFAULT '0' NOT NULL,
    cruser_id int(11) unsigned DEFAULT '0' NOT NULL,
    deleted tinyint(4) unsigned DEFAULT '0' NOT NULL,
    hidden tinyint(4) unsigned DEFAULT '0' NOT NULL,
    starttime int(11) unsigned DEFAULT '0' NOT NULL,
    endtime int(11) unsigned DEFAULT '0' NOT NULL,

    t3ver_oid int(11) DEFAULT '0' NOT NULL,
    t3ver_id int(11) DEFAULT '0' NOT NULL,
    t3ver_wsid int(11) DEFAULT '0' NOT NULL,
    t3ver_label varchar(255) DEFAULT '' NOT NULL,
    t3ver_state tinyint(4) DEFAULT '0' NOT NULL,
    t3ver_stage int(11) DEFAULT '0' NOT NULL,
    t3ver_count int(11) DEFAULT '0' NOT NULL,
    t3ver_tstamp int(11) DEFAULT '0' NOT NULL,
    t3ver_move_id int(11) DEFAULT '0' NOT NULL,
    sorting int(11) DEFAULT '0' NOT NULL,
    t3_origuid int(11) DEFAULT '0' NOT NULL,
    sys_language_uid int(11) DEFAULT '0' NOT NULL,
    l10n_parent int(11) DEFAULT '0' NOT NULL,
    l10n_diffsource mediumblob NOT NULL,
    l10n_state text,

    PRIMARY KEY (uid),
    KEY parent (pid),
    KEY t3ver_oid (t3ver_oid,t3ver_wsid),
    KEY language (l10n_parent,sys_language_uid)
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
