// ---
// env:
//   browser: true
//   node: true
//   jest: true
//   es6: true

// extends:
//   - plugin:@typescript-eslint/recommended
//   - prettier
//   - prettier/@typescript-eslint

// parser: vue-eslint-parser
// parserOptions:
//   parser: "@typescript-eslint/parser"
//   sourceType: module
//   project: ./tsconfig.json

// plugins:
//   - eslint-plugin-vue
//   - "@typescript-eslint"

// rules:
//   # quasi-hack to enforce/prettify indent in typescript
//   indent: 0
//   "@typescript-eslint/indent":
//     - error
//     - 2
  
//   # sort object keys and imports for easier
//   # at-a-glance checking that something is or isn't there.
//   sort-keys: error
//   sort-imports: error

//   # we require inline documentation on all functions, classes and methods.
//   require-jsdoc:
//     - error
//     - require:
//         FunctionDeclaration: true
//         ClassDeclaration: true
//         MethodDefinition: true

//   # inline documentation should be filled out and
//   # tell us what the methods take and what they're expected to return.
//   valid-jsdoc:
//     - error
//     - matchDescription: ".+"
//       requireParamType: true
//       requireParamDescription: true
//       requireReturnType: true
