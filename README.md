<div align="center">
  <a href="https://github.com/filippofinke/BashNVR">
    <img src="assets/robot.png" alt="Logo" height="100">
  </a>

  <br />
  <h3 align="center">BashNVR</h3>

  <p align="center">
    A basic Network Video Recorder written in Bash.
    <br />
    <a href="https://github.com/filippofinke/BashNVR"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/filippofinke/BashNVR/issues">Report Bug</a>
    ·
    <a href="https://github.com/filippofinke/BashNVR/issues">Request Feature</a>
  </p>

</div>

## About The Project

BashNVR is a basic Network Video Recorder written in Bash. It uses [FFmpeg](https://ffmpeg.org/) to record the rtsp stream from your IP camera.

## Features

- [x] Record rtsp stream
- [x] Support multiple cameras
- [x] Record to local storage
- [x] Specify chunk size
- [x] Delete old recordings

## Getting Started

### Prerequisites

- [FFmpeg](https://ffmpeg.org/)

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/filippofinke/BashNVR
   ```
2. Copy the example config

   ```sh
    cp config.sample.sh config.sh
   ```

3. Edit the config file

4. Give the script execution permissions

   ```sh
   chmod +x recorder.sh
   chmod +x nvr.sh
   ```

### Usage

```sh
./nvr.sh
```

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

BashNVR is released under the MIT License. See the LICENSE file for more details.

## Author

👤 **Filippo Finke**

- Website: https://filippofinke.ch
- Github: [@filippofinke](https://github.com/filippofinke)
- LinkedIn: [@filippofinke](https://linkedin.com/in/filippofinke)

## Show your support

Give a ⭐️ if this project helped you!

<a href="https://www.buymeacoffee.com/filippofinke">
  <img src="https://github.com/filippofinke/filippofinke/raw/main/images/buymeacoffe.png" alt="Buy Me A McFlurry">
</a>
