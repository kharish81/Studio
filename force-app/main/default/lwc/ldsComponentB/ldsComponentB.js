import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class LdsComponentB extends LightningElement {
    @api recordId;

    handleCancel() {
        this.dispatchEvent(new CustomEvent('cancel'));
    }

    handleSuccess() {
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success',
            message: 'Account updated successfully',
            variant: 'success'
        }));
        this.dispatchEvent(new CustomEvent('success'));
    }

}