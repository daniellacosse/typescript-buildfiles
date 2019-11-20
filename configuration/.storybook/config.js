import { addDecorator, addParameters, configure } from "@storybook/vue";
import { DocsPage, DocsContainer } from "@storybook/addon-docs/blocks";
import { withKnobs } from "@storybook/addon-knobs";

// controls for interacting with components
addDecorator(withKnobs);

// document generation
addParameters({
  docs: {
    container: DocsContainer,
    page: DocsPage
  }
});

// import stories
configure(require.context("../../../library", true, /\.story\.ts$/), module);
