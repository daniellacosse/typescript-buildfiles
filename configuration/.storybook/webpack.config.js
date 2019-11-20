const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");
const merge = require("webpack-merge");

module.exports = ({ config }) => {
  config.resolve.extensions.push(".ts", ".tsx", ".vue", ".css", ".html");

  config.module.rules.push({
    test: /\.tsx?$/,
    exclude: /node_modules/,
    use: [
      {
        loader: "ts-loader",
        options: {
          appendTsSuffixTo: [/\.vue$/],
          transpileOnly: true
        }
      }
    ]
  });

  config.plugins.push(new ForkTsCheckerWebpackPlugin());

  return merge(config, require("../vue.config").configureWebpack);
};
