import { LightningElement, api } from 'lwc';

export default class LdsComponentA extends LightningElement {
    @api recordId;

    handleEditClick() {
        this.dispatchEvent(new CustomEvent('edit'));
    }
}