<?php
/**
 * ${extname} Content Element | ${extname}_${cename}
 */

/***************
 * Register fields
 */
$${extname}_${cename}_fields = array(
    'tx_${cename}' => Array(
        'label' => 'Relation',
        'config' => Array(
            'type' => 'group',
            'internal_type' => 'db',
            'allowed' => 'tx_${cename}',
            'MM' => 'tt_content_tx_${cename}_mm',
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
 * Add content element to seletor list
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
$GLOBALS['TCA']['tt_content']['types']['${extname}_${cename}'] = array_replace_recursive(
    $GLOBALS['TCA']['tt_content']['types']['${extname}_${cename}'],
    [
        'showitem' => $showitem_default_01 . '
        header,
        tx_${cename},
        ' . $showitem_default_02,
    ]
);
