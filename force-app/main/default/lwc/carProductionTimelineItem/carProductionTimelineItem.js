import {LightningElement, api} from 'lwc';

export default class CarProductionTimelineItem extends LightningElement {

    @api event;

    opened = false;

    get itemClass () {
        return `slds-timeline__item_expandable slds-timeline__item_email ${this.opened ? 'slds-is-open' : ''}`
    }

    handleToggle () {
        this.opened = !this.opened;
    }

    get itemIcon () {
        const itemMap = {
            "finish": 'goals',
            "quality_control": 'search',
            "milestone": 'sales_cadence',
            "start": 'record_create',
        }
        return `/_slds/icons/standard-sprite/svg/symbols.svg#${itemMap[this.event.type]}`;
    }

    get iconClass () {
        const classMap = {
            "finish": 'slds-icon-standard-goals',
            "quality_control": 'slds-icon-standard-search',
            "milestone": 'slds-icon-standard-sales-cadence',
            "start": 'slds-icon-standard-record-create',
        }
        return `slds-icon_container ${classMap[this.event.type]} slds-timeline__icon`
    }

}