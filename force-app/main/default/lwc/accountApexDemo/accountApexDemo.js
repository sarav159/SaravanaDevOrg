import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts'
export default class AccountApexDemo extends LightningElement {

    results;

@wire(getAccounts)
accounts({data,error}){
    if(data){
      this.results = data;
    }else if(error){
      console.log(error);
    }
}
}