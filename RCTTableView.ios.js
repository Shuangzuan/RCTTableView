/**
 * @providesModule RCTTableView
 * @flow
 */
'use strict';

var React = require('react-native');
var NativeRCTTableViewManager = require('NativeModules').TableViewManager;
var invariant = require('invariant');
var {
  requireNativeComponent
} = React;

/**
 * High-level docs for the RCTTableView iOS API can be written here.
 */

var RCTTableView = requireNativeComponent('RCTTableView', null);

var TableView = React.createClass({
  render: function() {
    return (
      <RCTTableView
        {...this.props}
      />
    );
  }
});

TableView.Style = NativeRCTTableViewManager.Style;
TableView.CellStyle = NativeRCTTableViewManager.CellStyle;

module.exports = TableView;
