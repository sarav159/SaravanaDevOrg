import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    name = "saravana"
    
    role = "Salesforce developer"
    ChangeHandler(event){
        this.role=event.target.value
    }
}