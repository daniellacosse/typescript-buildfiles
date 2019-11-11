const rules = {
  "declaration-no-important": true,
  indentation: 2,
  "max-nesting-depth": 1,
  "property-case": "lower",
  "string-quotes": "double",
  "unit-case": "lower"
};

const plugins = [
  "stylelint-declaration-use-variable",
  "stylelint-high-performance-animation",
  "stylelint-no-indistinguishable-colors",
  "stylelint-no-unsupported-browser-features",
  "stylelint-order",
  "stylelint-prettier",
  "stylelint-z-index-value-constraint"
];

const pluginRules = {
  "order/properties-alphabetical-order": true,
  "plugin/no-low-performance-animation-properties": [
    true,
    {
      ignore: "paint-properties"
    }
  ],
  "plugin/no-unsupported-browser-features": [
    true,
    {
      ignore: ["css-appearance"]
    }
  ],
  "plugin/stylelint-no-indistinguishable-colors": true,
  "plugin/z-index-value-constraint": {
    max: 3,
    min: 0
  },
  "prettier/prettier": true,
  // disables raw values for these css properties
  "sh-waqar/declaration-use-variable": [
    [
      "/(background|border-radius|color|font-family|margin|padding|z-index)/",
      { ignoreValues: ["transparent", "sans-serif", "auto", "none", 0] }
    ]
  ]
};

module.exports = {
  extends: "stylelint-config-recommended",
  plugins,
  rules: {
    ...rules,
    ...pluginRules
  }
};
