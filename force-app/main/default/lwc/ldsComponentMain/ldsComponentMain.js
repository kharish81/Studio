import { LightningElement, api } from 'lwc';

export default class LdsComponentMain extends LightningElement {
    @api recordId;
    isEditMode = false;

    handleEdit() {
        this.isEditMode = true;
    }

    handleCancel() {
        this.isEditMode = false;
    }

    handleSuccess() {
        this.isEditMode = false;
    }
}