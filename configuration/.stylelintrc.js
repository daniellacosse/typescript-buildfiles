const rules = {
  "declaration-no-important": true,
  indentation: 2,
  "max-nesting-depth": 2, // excessive nesting makes css selectors difficult to follow
  "property-case": "lower",
  "string-quotes": "double",
  "unit-case": "lower"
};

const plugins = [
  "stylelint-declaration-use-variable",
  "stylelint-high-performance-animation",
  "stylelint-no-indistinguishable-colors",
  "stylelint-order",
  "stylelint-prettier",
  "stylelint-z-index-value-constraint"
];

const pluginRules = {
  "order/properties-alphabetical-order": true,
  "plugin/no-low-performance-animation-properties": [
    true,
    {
      // see: https://csstriggers.com/
      ignore: "paint-properties"
    }
  ],
  "plugin/stylelint-no-indistinguishable-colors": true,
  // not being conservative with our z-indicies can lead to
  // complications and confusion down the line
  "plugin/z-index-value-constraint": {
    max: 3,
    min: 0
  },
  "prettier/prettier": true,
  // disables raw values for these css properties -  we may come to regret this
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
