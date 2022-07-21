import { LightningElement, track } from 'lwc';

export default class MyFirstLWCComponent extends LightningElement {
    @track Title;
    changeHandler(event){
        this.Title = event.target.value;
    }
   
}