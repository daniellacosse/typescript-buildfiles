module.exports = {
  moduleNameMapper: {
    "^library[/](.+)[.](.+)[.](.+)": "<rootDir>/library/$1/$1.$2.$3",
    "^library[/](.+)[.](.+)": "<rootDir>/library/$1/$1.$2",
    "^vue$": "vue/dist/vue.common.js"
  },
  moduleFileExtensions: ["js", "ts", "vue", "json"],
  transform: {
    "^.+\\.ts$": "ts-jest",
    ".*\\.(vue)$": "vue-jest"
  },
  notify: true,
  notifyMode: "failure-change",
  prettierPath: "<rootDir>/node_modules/prettier/",
  roots: ["<rootDir>/library/", "<rootDir>/apps/"],
  watchPathIgnorePatterns: ["<rootDir>/node_modules/"],
  collectCoverage: true,
  collectCoverageFrom: [
    "<rootDir>/library/**/*.ts",
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
  }
};
