import { api, LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {

    // @api name;
    // @api email;

    // connectedCallback(){
    //     console.log(this.messageFromParent);
    // }
    formData = {
        name :'',
        email:''
    }

    handleChange(event){
        const field = event.target.name;
        this.formData[field] = event.target.value;
    }

    handleSubmit(){
        const customEvent = new CustomEvent('submitdata', {
            detail:{...this.formData}

        });
        this.dispatchEvent(customEvent);
    }
    }