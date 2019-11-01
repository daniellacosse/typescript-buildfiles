const path = require("path");
const BrotliPlugin = require("brotli-webpack-plugin");
const VueLoaderPlugin = require("vue-loader/lib/plugin");

module.exports = {
  module: {
    rules: [
      {
        loader: "html-loader",
        test: /\.html$/
      },
      {
        loader: "vue-loader",
        test: /\.vue$/
      },
      {
        loader: "ts-loader",
        test: /\.ts$/
      },
      {
        test: /\.css$/,
        use: [
          "vue-style-loader",
          "css-loader",
          {
            loader: "postcss-loader",
            options: { config: { path: ".postcssrc.js" } }
          }
        ]
      }
    ]
  },
  plugins: [new VueLoaderPlugin(), new BrotliPlugin()]
};
