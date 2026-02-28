import { api, LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class LdsSingleComponent extends LightningElement {
    @api recordId;
    isShow=false;

    handleClick(){
        this.isShow = true;
    }

    handleCancel(){
        this.isShow = false;
    }

    handleSuccess(){
        this.isShow = false;
        this.dispatchEvent(new ShowToastEvent({
            title : 'Succcess',
            message : 'Account updated successfully',
            variant : 'success'
        }))
    }
}