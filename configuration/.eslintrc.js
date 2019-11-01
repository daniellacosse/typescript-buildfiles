const eslintRules = {
  camelcase: "error",
  curly: "error", // leave room for later logic
  "dot-notation": ["error", { allowPattern: "^[a-z]+([-_][a-z]+)+$" }], // `css-case` and `python_case` allowed
  "eol-last": "error", // end files w/ newline - this is git-friendly
  eqeqeq: "error", // please check for type

  "no-await-in-loop": "error", // use Promise.all instead so async calls are fired at once
  "no-console": "error", // we shouldn't be logging from stateless components
  "no-eval": "error", // this is an attack vector
  "no-extra-parens": ["error", "all", { ignoreJSX: "all" }], // lots of nested unnecessary parens get confusing
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
  "sort-imports": "error",
  "sort-keys": "error",
  "sort-vars": "error",

  yoda: "error" // `"red" === color` => `color === "red"`
};

const presets = {
  extends: [
    "prettier/@typescript-eslint",
    "plugin:vue/recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:prettier/recommended",
    "@vue/prettier"
  ],
  plugins: ["@typescript-eslint", "prettier", "vue"]
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
