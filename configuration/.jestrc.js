module.exports = {
  collectCoverage: true,
  collectCoverageFrom: [
    "<rootDir>/library/**/*.helper.ts",
    "<rootDir>/library/**/*.vue"
  ],
  coverageDirectory: "<rootDir>/.artifacts/coverage",
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
       * unless it's in very extreme cases. Often terniaries at this level
       * of depth are for simple type-checking.
       *
       * As our default debugging solution is in the tests, this will give us ample entry points
       * into the inspector
       */
      branches: 87.5
    }
  },
  moduleFileExtensions: ["js", "ts", "tsx", "vue", "json"],
  moduleNameMapper: {
    "^components[/](.+)": "<rootDir>/library/components/$1",
    "^helpers[/](.+)": "<rootDir>/library/helpers/$1",
    "^vue$": "vue/dist/vue.common.js"
  },
  notify: true,
  notifyMode: "failure-change",
  prettierPath: "<rootDir>/node_modules/prettier/",
  roots: ["<rootDir>/library/", "<rootDir>/apps/"],
  transform: {
    "^.+\\.js$": "babel-jest",
    "^.+\\.vue$": "vue-jest",
    "^.+\\.ts$": "ts-jest"
  },
  watchPathIgnorePatterns: ["<rootDir>/node_modules/"]
};
