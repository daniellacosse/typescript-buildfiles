module.exports = {
  // TODO - 
  // moduleNameMapper: {
  //   "^components[/](.+)[.]base": "<rootDir>/components/$1/$1.base.js",
  //   "^components[/](.+)[.]story": "<rootDir>/components/$1/$1.story.jsx",
  //   "^components[/](.+)": "<rootDir>/components/$1/$1.component.jsx"
  // },
  notify: true,
  notifyMode: "failure-change",
  prettierPath: "<rootDir>/node_modules/prettier/",
  roots: ["<rootDir>/apps/", "<rootDir>/library/"],
  watchPathIgnorePatterns: ["<rootDir>/node_modules/"],
  collectCoverage: true,
  collectCoverageFrom: ["<rootDir>/apps/**/*.{ts,vue}", "<rootDir>/library/**/*.{ts,vue}"],
  coverageDirectory: "<rootDir>/.make/coverage",
  coverageThreshold: {
    global: {
      /*
       * The rationale for this threshold is as follows -
       *
       * O
       * | - - - - - \
       * O           O               > first-level if statement
       * | - - \     | - - \
       * O     O     O     O         > second-level condition(s)
       * | - \ | - \ | - \ | - \
       * O   O O   O O   O O ((X))   > terniaries. (7/8 = 87.5)
       *
       * Individual functions shouldn't have more branches than this
       * unless it's in very extreme cases. Oftern terniaries at this level
       * of depth are for simple type-checking.
       *
       * As our default debugging solution is in the tests, this will give us ample entry points
       * into the inspector
       */
      branches: 87.5
    }
  }
};
