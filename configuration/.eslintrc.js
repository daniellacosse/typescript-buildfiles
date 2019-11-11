const eslintRules = {
  camelcase: "error",
  curly: "error",
  "dot-notation": ["error", { allowPattern: "^[a-z]+(-[a-z]+)+$" }],
  "eol-last": "error",
  eqeqeq: "error",

  "no-await-in-loop": "error", // use Promise.all instead so async calls are fired at once
  "no-eval": "error", // this is an attack vector
  "no-implicit-coercion": "error", // be kind, use `Boolean()` - not `!!`
  "no-return-assign": "error",
  "no-shadow": "error", // inner-scope vars should have names separate from outer-scope vars to minimize confusion
  "no-template-curly-in-string": "error", // backticks are required
  "no-trailing-spaces": "error",
  "no-unneeded-ternary": "error", // forbids `thing ? true : false;`

  // enforce es6 features
  "no-var": "error", // use `let` or `const`
  "prefer-const": "error", // use `const` when the variable doesn't change
  "prefer-destructuring": "error",
  "prefer-object-spread": "error",
  "prefer-rest-params": "error",
  "prefer-spread": "error",
  "prefer-template": "error",

  // sort identifiers so it's easier to find things
  "sort-imports": [
    "error",
    {
      ignoreCase: true,
      memberSyntaxSortOrder: ["none", "single", "multiple", "all"]
    }
  ],
  "sort-keys": ["error", "asc", { caseSensitive: false, natural: true }],
  "sort-vars": "error",

  yoda: "error"
};

const presets = {
  extends: [
    "eslint:recommended",

    "plugin:@typescript-eslint/eslint-recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:@typescript-eslint/recommended-requiring-type-checking",

    "plugin:vue/recommended",

    "prettier",
    "prettier/@typescript-eslint",
    "prettier/vue",
    "plugin:prettier/recommended",

    "plugin:compat/recommended",
    "plugin:jest/recommended"
  ],
  plugins: ["prettier", "vue", "@typescript-eslint", "jest"]
};

const presetRules = {
  "prettier/prettier": "error",

  "@typescript-eslint/array-type": ["error", { default: "array-simple" }],

  "brace-style": "off",
  "@typescript-eslint/brace-style": ["error"],

  "@typescript-eslint/consistent-type-definitions": ["error", "interface"],
  "@typescript-eslint/explicit-member-accessibility": [
    "error",
    { accessibility: "no-public" }
  ],
  "@typescript-eslint/generic-type-naming": ["error", "^[TK][A-Z][a-zA-Z]+$"],

  indent: "off",
  "@typescript-eslint/indent": ["error", 2],

  "@typescript-eslint/member-naming": ["error", { private: "^__" }],
  "@typescript-eslint/member-ordering": "error",

  "no-extra-parens": "off",
  "@typescript-eslint/no-extra-parens": "error",

  "@typescript-eslint/no-extraneous-class": "error",
  "@typescript-eslint/no-floating-promises": ["error", { ignoreVoid: true }],

  "no-magic-numbers": "off",
  "@typescript-eslint/no-magic-numbers": [
    "error",
    { ignoreReadonlyClassProperties: true, ignoreEnums: true }
  ],

  "@typescript-eslint/no-parameter-properties": [
    "error",
    { allows: ["readonly"] }
  ],
  "@typescript-eslint/no-require-imports": "error",
  "@typescript-eslint/no-unnecessary-condition": "error",
  "@typescript-eslint/no-unnecessary-qualifier": "error",
  "@typescript-eslint/no-unnecessary-type-arguments": "error",

  "no-useless-constructor": "off",
  "@typescript-eslint/no-useless-constructor": "error",

  "@typescript-eslint/prefer-for-of": "error",
  "@typescript-eslint/prefer-function-type": "error",
  "@typescript-eslint/prefer-readonly": "error",
  "@typescript-eslint/promise-function-async": "error",
  "@typescript-eslint/strict-boolean-expressions": [
    "error",
    { allowNullable: true, ignoreRhs: true }
  ],

  quotes: "off",
  "@typescript-eslint/quotes": "error",

  semi: "off",
  "@typescript-eslint/semi": "error",

  "@typescript-eslint/restrict-plus-operands": "error",

  // TODO: html-indent & script-indent?
  // TODO: do some of these rules need to be applied to the base `eslint` as well? is this redundant?
  "vue/array-bracket-spacing": "error",
  "vue/arrow-spacing": "error",
  "vue/block-spacing": "error",
  "vue/brace-style": "error",
  "vue/camelcase": "error",
  "vue/comma-dangle": ["error", "never"],
  "vue/component-name-in-template-casing": ["error", "kebab-case"],
  // "vue/dot-location": ["error", "property"],
  "vue/eqeqeq": "error",
  "vue/key-spacing": "error",
  // "vue/keyword-spacing": "error",
  // "vue/no-empty-pattern": "error",

  "vue/no-boolean-default": "error",
  "vue/match-component-file-name": [
    "error",
    {
      extensions: ["vue"],
      shouldMatchCase: true
    }
  ],
  "vue/object-curly-spacing": ["error", "always"],
  "vue/require-direct-export": "error",
  "vue/space-infix-ops": "error",
  "vue/space-unary-ops": ["error", { words: true, nonwords: false }],
  "vue/v-on-function-call": ["error", "always"]

  // "jest/lowercase-name": "warn",
  // "jest/no-empty-title": "error",
  // "jest/no-export": "error",
  // "jest/no-large-snapshots": [
  //   "warn",
  //   {
  //     maxSize: 100
  //   }
  // ],
  // "jest/no-test-callback": "error",
  // "jest/prefer-inline-snapshots": "error",
};

module.exports = {
  env: { browser: true, es6: true, jest: true, node: true },
  parserOptions: {
    ecmaFeatures: {
      impliedStrict: true
    },
    ecmaVersion: 6,
    extraFileExtensions: [".vue"],
    parser: "@typescript-eslint/parser",
    project: "./tsconfig.json",
    sourceType: "module"
  },
  ...presets,
  rules: {
    ...eslintRules,
    ...presetRules
  }
};
