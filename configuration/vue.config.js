const path = require("path");

module.exports = {
  configureWebpack: {
    resolve: {
      alias: {
        components: path.resolve(__dirname, "../../library/components/"),
        helpers: path.resolve(__dirname, "../../library/helpers/")
      }
    }
  }
};
