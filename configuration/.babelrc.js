const presets = [
  [
    "@babel/preset-env",
    {
      targets: {
        esmodules: true,
        browsers: "> 2% and last 2 versions, not dead"
      },
      useBuiltIns: "usage",
      corejs: 3
    }
  ],
  "@babel/preset-typescript"
];

const plugins = [
  [
    "module-resolver",
    {
      extensions: [".ts", ".tsx", ".vue"],
      root: ".",
      alias: {
        // TODO
      }
    }
  ]
];

module.exports = { presets, plugins };
