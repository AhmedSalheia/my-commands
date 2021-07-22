import upperFirst from "lodash/upperFirst";
import camelCase from "lodash/camelCase";
import { Head } from "@vueuse/head";
import { Vue } from "../../init";

// global rigester the Head component:
Vue.component("Head", Head);

// global rigester the layouts components:
const requireComponent = require.context(
  "../../components/layouts",
  false,
  /[A-Z]\w+\.(vue|js)$/
);
requireComponent.keys().forEach((fileName) => {
  const componentConfig = requireComponent(fileName);

  const componentName = upperFirst(
    camelCase(fileName.replace(/\.\/(.*)\.\w+$/, "$1"))
  );

  Vue.component(componentName, componentConfig.default || componentConfig);
});
