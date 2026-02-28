import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
  name='';
  email='';

  showData=false;

    handleData(event){
      this.name=event.detail.name;
      this.email=event.detail.email;
      this.showData=true;
    }







  // formData = {
  //   name:'',
  //   email:''
  // }

 

  // handleInputChange(event){
  //   const field = event.target.name;
  //   this.formData[field] = event.target.value;
  // }

  // handleSubmit(){
  //   this.showChild=true;
  // }
  
}