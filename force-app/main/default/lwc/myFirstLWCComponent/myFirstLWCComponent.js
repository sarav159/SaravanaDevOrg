import { LightningElement} from 'lwc';

export default class MyFirstLWCComponent extends LightningElement {
    
     title = 'salesforce developer'
    changeHandler(event){
        this.title = event.target.value;
    }
   
}