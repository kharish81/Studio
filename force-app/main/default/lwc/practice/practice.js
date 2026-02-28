import { LightningElement,track } from 'lwc';
import saveStudentDetails from '@salesforce/apex/SaveStudent.saveStudentDetails';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Practice extends LightningElement {

    @track fields = {
     name : '',
     id : '',
     hod : ''
    }
 
    handleChange(event){
        const field = event.target.dataset.field;
        this.fields[field] = event.target.value;
    }

    
     handleClick(){
       const {name,id,hod} = this.fields;

        if(!name || !id || !hod){
            console.log('inputs failed');
            this.showToast('Error','fill the Details properly..','error');
            return;
        }
        try{
              saveStudentDetails({
                name,
                id,
                hod
            });
            this.showToast('Success','Details Saved successfully','success');
            this.resetFields();

        }
        catch(error){
            console.log(error);
            this.showToast('Error', error.body?.message || 'An unknown error occurred.', 'error');
        }

 
    }

    showToast(title,message,variant){
        const event = new ShowToastEvent({
            title:title,
            message:message,
            variant:variant
        });
        this.dispatchEvent(event);
    }


        // resetFields(){
        //     this.fields = {
        //         name : '',
        //         id : '',
        //         hod : ''
        //     }
        // }

       resetFields() {
    this.template.querySelectorAll('lightning-input').forEach(input => {
        input.value = '';  // Clear each input field
    });

    // Also clear the fields object
    this.fields = {
      name : '',
      id : '',
      hod : ''
    };
}


}