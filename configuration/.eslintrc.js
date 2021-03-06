const eslintRules = {
  camelcase: "error",
  curly: "error",
  "dot-notation": ["error", { allowPattern: "^[a-z]+(-[a-z]+)+$" }],
  "eol-last": "error",
  eqeqeq: "error",

  "no-await-in-loop": "error",
  "no-eval": "error",
  "no-implicit-coercion": "error",
  "no-return-assign": "error",
  "no-shadow": "error",
  "no-template-curly-in-string": "error",
  "no-trailing-spaces": "error",
  "no-unneeded-ternary": "error",

  // enforce es6 features
  "no-var": "error",
  "prefer-const": "error",
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
  // TODO: conflicts with other ts/vue rules
  // "sort-keys": ["error", "asc", { caseSensitive: false, natural: true }],
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
  "@typescript-eslint/generic-type-naming": ["error", "^[TK][A-Z]*[a-zA-Z]*$"],

  indent: "off",
  "@typescript-eslint/indent": ["error", 2],

  "@typescript-eslint/member-naming": ["error", { private: "^__" }],
  "@typescript-eslint/member-ordering": "error",

  "@typescript-eslint/no-extraneous-class": "error",
  "@typescript-eslint/no-floating-promises": ["error", { ignoreVoid: true }],

  "no-magic-numbers": "off",
  "@typescript-eslint/no-magic-numbers": [
    "error",
    {
      ignoreReadonlyClassProperties: true,
      ignoreEnums: true,
      ignore: [-1, 0, 1]
    }
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

  // need awaitless async for concurrent jest tests
  "@typescript-eslint/require-await": "off",

  "@typescript-eslint/strict-boolean-expressions": [
    "error",
    { allowNullable: true, ignoreRhs: true }
  ],

  quotes: "off",
  "@typescript-eslint/quotes": "error",

  semi: "off",
  "@typescript-eslint/semi": "error",
  "@typescript-eslint/restrict-plus-operands": "error",

  "vue/array-bracket-spacing": "error",
  "vue/arrow-spacing": "error",
  "vue/block-spacing": "error",
  "vue/brace-style": "error",
  "vue/camelcase": "error",
  "vue/comma-dangle": ["error", "never"],
  "vue/component-name-in-template-casing": ["error", "kebab-case"],
  "vue/eqeqeq": "error",
  "vue/key-spacing": "error",

  "vue/no-boolean-default": "error",
  "vue/match-component-file-name": [
    "error",
    {
      extensions: ["vue"]
    }
  ],
  "vue/object-curly-spacing": ["error", "always"],
  "vue/space-infix-ops": "error",
  "vue/space-unary-ops": ["error", { words: true, nonwords: false }],
  "vue/v-on-function-call": ["error", "always"],

  "jest/no-export": "error",
  "jest/no-large-snapshots": [
    "warn",
    {
      maxSize: 100
    }
  ],
  "jest/no-test-callback": "error",
  "jest/prefer-inline-snapshots": "error"
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
