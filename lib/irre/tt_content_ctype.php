<?php
/**
 * ${extname} Content Element | ${extname}_${cename}
 */

/***************
 * Register fields
 */
$${extname}_${cename}_fields = [
    'tx_${extname}_${cename}' => [
        'exclude' => 0,
        'label' => 'Add Item',
        'config' => [
            'type' => 'inline',
            'foreign_table' => 'tx_${extname}_${cename}',
            'foreign_field' => 'tt_content',
            'maxitems' => 999,
            'appearance' => [
                'collapseAll' => true,
                'useSortable' => true,
                'showSynchronizationLink' => false,
                'showAllLocalizationLink' => true,
                'showPossibleLocalizationRecords' => false,
                'showRemovedLocalizationRecords' => false,
                'expandSingle' => true,
                'enabledControls' => [
                    'localize' => true,
                ],
            ],
            'behaviour' => [
                'mode' => 'select',
                'localizeChildrenAtParentLocalization' => true,
            ],
        ],
    ],
];

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
    'tx_${extname}_${cename}',
    '${extname}_${cename}',
    'after:header'
);
