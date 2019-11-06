const eslintRules = {
  camelcase: "error",
  curly: "error",
  "dot-notation": ["error", { allowPattern: "^[a-z]+(-[a-z]+)+$" }],
  "eol-last": "error",
  eqeqeq: "error",

  "no-await-in-loop": "error", // use Promise.all instead so async calls are fired at once
  "no-eval": "error", // this is an attack vector
  "no-extra-parens": ["error", "all"],
  "no-implicit-coercion": "error", // be kind, use `Boolean()` - not `!!`
  "no-magic-numbers": "error",
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
  "sort-keys": "error",
  "sort-vars": "error",

  yoda: "error"
};

const presets = {
  extends: [
    "eslint:recommended",
    "plugin:vue/recommended",
    "prettier",
    "prettier/@typescript-eslint",
    "prettier/vue",
    "plugin:prettier/recommended",
    "plugin:compat/recommended"
  ],
  plugins: ["prettier", "vue", "@typescript-eslint"]
};

module.exports = {
  env: { browser: true, es6: true, jest: true, node: true },
  parserOptions: {
    parser: "@typescript-eslint/parser",
    ecmaVersion: 6,
    sourceType: "module",
    ecmaFeatures: {
      impliedStrict: true
    }
  },
  ...presets,
  rules: eslintRules
};
