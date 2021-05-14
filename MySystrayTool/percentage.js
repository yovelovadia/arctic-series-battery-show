#!/usr/bin/env node
const { readdirSync, rename } = require("fs");
const { resolve } = require("path");
const getHeadphones = require("arctis-usb-finder").default;

function getPercentage(callback) {
  getHeadphones().forEach(callback);
}

getPercentage((device) => {
  let percentage = device.batteryPercent;
  percentage = percentage > 100 ? 100 : percentage < 0 ? 0 : percentage;
  // Get path to image directory
  const imageDirPath = resolve(__dirname, "storedValue");
  // Get an array of the files inside the folder
  const file = readdirSync(imageDirPath)[0];
  console.log(imageDirPath);

  rename(imageDirPath + `/${file}`, imageDirPath + `/${percentage}`, (err) => console.log(err));

  process.exit();
});
