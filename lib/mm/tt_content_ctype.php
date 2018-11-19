<?php
/**
 * ${extname} Content Element | ${extname}_${cename}
 */

/***************
 * Register fields
 */
$${extname}_${cename}_fields = array(
    'tx_${extname}_${mmtitleLower}' => Array(
        'label' => 'Relation',
        'config' => Array(
            'type' => 'group',
            'internal_type' => 'db',
            'allowed' => 'tx_${extname}_${mmtitleLower}',
            'MM' => 'tt_content_tx_${mmtitleLower}_mm',
            'size' => '20',
            'maxitems' => '99',
            'show_thumbs' => '1',
            'suggestOptions' => [
                'default' => [
                    'searchWholePhrase' => 1
                ],
                'pages' => [
                    'searchCondition' => 'doktype = 1'
                ]
            ],
        )
    ),
);

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTCAcolumns('tt_content', $${extname}_${cename}_fields);

/***************
 * Add Content Element: ${extname}_${cename}
 */
if (!is_array($GLOBALS['TCA']['tt_content']['types']['${extname}_${cename}'])) {
    $GLOBALS['TCA']['tt_content']['types']['${extname}_${cename}'] = [];
}

/***************
 * Add content element to selector list
 */
\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTcaSelectItem(
    'tt_content',
    'CType',
    [
        '${cetitle}',
        '${extname}_${cename}',
        'EXT:${extname}/ext_icon.png'
    ],
    '--div--',
    'after'
);

/***************
 * Assign Icon
 */
$GLOBALS['TCA']['tt_content']['ctrl']['typeicon_classes']['${extname}_${cename}'] = 'default-icon';

/***************
 * Configure element type
 */
$GLOBALS['TCA']['tt_content']['types']['${extname}_${cename}']['showitem'] = $GLOBALS['TCA']['tt_content']['types']['header']['showitem'];

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addToAllTCAtypes(
    'tt_content',
    'tx_${extname}_${mmtitleLower}',
    '${extname}_${cename}',
    'after:header'
);
