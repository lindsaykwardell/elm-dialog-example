import "./style.css";
import { Elm } from "./src/Main.elm";

const root = document.querySelector("#app div");
const app = Elm.Main.init({ node: root });

app.ports.toggleDialog.subscribe(id => {
    const dialog = document.querySelector(`#${id}`)

    if (dialog.open) {
        dialog.close?.();
    } else {
        dialog.showModal?.();
    }
})