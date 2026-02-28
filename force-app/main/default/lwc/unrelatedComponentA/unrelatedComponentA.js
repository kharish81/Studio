import ComponentCommunicationChannel from '@salesforce/messageChannel/ComponentCommunicationChannel__c';
import { MessageContext, subscribe } from 'lightning/messageService';
import { LightningElement, wire } from 'lwc';

export default class UnrelatedComponentA extends LightningElement {
    name='';
    email='';

    @wire(MessageContext)
    messageContext;


   connectedCallback(){
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel(){
        subscribe(this.messageContext,ComponentCommunicationChannel,(message)=>{
            this.name = message.name;
            this.email = message.email;
        })
    }



    // handleChange(event){
    //     const {name, value}=event.target;
    //     this[name] = value;
    // }

    // handleSubmit(){
    //     const payload = {
    //         name: this.name,
    //         email: this.email
    //     };
    //     publish(this.messageContext,ComponentCommunicationChannel,payload);
    //     console.log(payload);
        
    // }

}