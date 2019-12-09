import { addDecorator, configure } from "@storybook/vue";
import { withKnobs } from "@storybook/addon-knobs";
import requireContext from "require-context.macro";

// controls for interacting with components
addDecorator(withKnobs);

// import stories
configure(requireContext("../../../library", true, /\.story\.ts$/), module);
