# NYTimes
The most viewed articles on NYTimes

# Welcome to NYTimes Task
This is task to present a list of most viewed NYTimes articles. The task is very simple due to time limitation.

- The task was done in simple MVVM with no binding (This my first time to write MVVM, so I'm still studying the binding part).
- Using Coordinator pattern for navigation throught the app.
- Building UI using code only.
- Using SnapKit for constraints (constraint with visual format or attaching anchors were another options).
- Some simple animations for cells appearance.
- Using protocols for spinners and empty/noData template (it's just a label here though).
- Using URLSession for the request, (Alamofire was another option).
- Using SwiftLint for linting the code statically.
- Using Codable with CodingKey protocol and JSONDecoder for parsing the models.
- Response contains array of Articles. (It should be generic for different uses).
- Apparently no article banner, only the metadata images. However, for images we could use Kingfisher it handles the aync calls and image caching for us.
- No unit/UI tests applied, I know the concepts, but I haven't write them before.
- No reports with SonarQube.

Thanks for your time.
Hope you like what you see and we can discuss any part of it further and into details.
