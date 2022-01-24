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

// globalize (t function) as (__) so you can use it anywhere on the projct to translate text:
import { useI18n } from "vue-i18n";
Vue.config.globalProperties.__ = ($key) => {
    const { t } = useI18n({
        inheritLocale: true,
        useScope: "global",
    });
    return t($key);
};
