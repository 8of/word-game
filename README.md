# Word Game for iOS

How to play:
- Decide if two words are translation of one another;
- Accept if they are;
- Decline if they are not;
- Game over: After 3 user score points.

Time invested:
- 90 minutes

Time distribution:
- idea - 15%, models - 40%, view + animations - 45%

Decisions to solve certain aspects:
- Codable protocol for models for easy parsing
- Animating via constraints priorities (easiest and recommended by Apple at the same time)

Decisions because of time constraints:
- No well-defined architecture
- Robust design
- Just 1 test to prove I know what unit tests is
- No dependency injecting

What to improve first:
- Introduce well-defined architecture (ex: MVVM)
- Create ViewModel, move everything there
- Add RxSwift to project and bind what's possible (80% of ViewController's code)
- Add dependency injecting
- Add unit tests for GameManager (already half-supported because of all dependencies are via protocols)
