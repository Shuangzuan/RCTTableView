# RCTTableView
A table view component for react native.

```javascript
'use strict';

var React = require('react-native');
var TableView = require('RCTTableView');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var RCTTableViewDemo = React.createClass({
  render: function() {
    return (
      <TableView
        style={styles.tableView}
        tableViewStyle={TableView.Style.Grouped}
        tableViewCellStyle={TableView.CellStyle.Value1}
        cellForRowAtIndexPath={
          [
            [
              {
                textLabel: {
                  text: 'Section 1: A',
                  // textColor: 'red'
                },
                detailTextLabel: {
                  text: 'This is detail'
                }
              },
              {
                textLabel: {
                  text: 'Section 1: B'
                },
                detailTextLabel: {
                  text: 'This is detail'
                }
              },
            ],
            [
              {
                textLabel: {
                  text: 'Section 2: C'
                },
                detailTextLabel: {
                  text: 'This is detail'
                }
              },
              {
                textLabel: {
                  text: 'Section 2: D'
                },
                detailTextLabel: {
                  text: 'This is detail'
                }
              },
            ],
            [
              {
                textLabel: {
                  text: 'Section 3: E'
                },
                detailTextLabel: {
                  text: 'This is detail'
                }
              },
              {
                textLabel: {
                  text: 'Section 3: F'
                },
                detailTextLabel: {
                  text: 'This is detail'
                }
              },
            ]
          ]
        }
        onPress={(event) => console.log(event.nativeEvent.indexPath)}
      />
    );
  }
});

var styles = StyleSheet.create({
  tableView: {
    flex: 1
  }
});

AppRegistry.registerComponent('RCTTableViewDemo', () => RCTTableViewDemo);
```
