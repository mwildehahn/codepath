codepath
========

TipCalculator Project
----------------------

Breaking out TipCalculator was probably overkill. I wanted an easy way to start playing around with XCTestCases though. Overall cool starter project :).

UI Additions:
- Activate the billTextField when the app is opened. This makes it easy for the
  user to quickly enter in a total without having to select the field.
- Update the totals as the user types so they don't have to tap outside to view
  the total (useful if they're always using the same tip settings).
- Display current tip percent next to "Tip Amount" label in case keyboard is
  open and covering segmented selector.

Experiments:
- CocoaPods
- XCTestCase
- OCMock (seems like using this with CocoaPods makes it so this can't be opened
  as a project, but only a workspace?)

Questions:
- What is the reasoning behind xibs instead of storyboards?
- What is the threshold on what can be stored for an app's NSUserDefaults?
- Is there an equivalent to HTML5 LocalStorage?
