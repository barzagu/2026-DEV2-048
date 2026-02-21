# Berlin Clock Kata

[![Swift](https://img.shields.io/badge/Swift-5-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-26.1-blue.svg)](https://www.apple.com/ca/os/ios/)
[![Xcode](https://img.shields.io/badge/Xcode-26.1.1-blue.svg)](https://developer.apple.com/xcode/)
[![Coverage](https://img.shields.io/badge/Coverage-96.6%-green.svg)]()

Implementation of the [Berlin Clock Kata](https://agilekatas.co.uk/katas/BerlinClock-Kata) for iOS using **SwiftUI**, **Combine**, and **SwiftTesting**, following **TDD** and **Clean Architecture** practices.

## Setup

Clone the repository:

```bash
git clone https://github.com/barzagu/2026-DEV2-048.git
```

`cd` into the project root directory:

```bash
cd 2026-DEV2-048
```

Open with Xcode:

```bash
open BerlinClock.xcodeproj
```

## Compile & Run on Simulator

> [!IMPORTANT]
> The very first time you compile the project, Xcode might throw an error to ask you to activate the [SwiftLint](https://github.com/realm/SwiftLint) plugin. Simply tap on the error to activate it and compile again.

1. Choose the `BerlinClock` scheme if it is not already selected for you.
2. Choose an iPhone simulator, like the `iPhone 17 Pro` simulator.
3. Press `cmd+b` to compile or `cmd+r` to run on the selected simulator.
4. Press `cmd+.` whenever you wish to stop the execution on the simulator.

## Testing

> [!NOTE]
> Views are tested via snapshots provided by the popular package [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing).

1. Press `cmd+u` to run all tests in the test plan.
2. Open the `Report Navigator` on the left panel to view statistics and results.
