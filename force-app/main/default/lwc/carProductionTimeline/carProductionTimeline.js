import {api, LightningElement} from 'lwc';
import getCarById from '@salesforce/apex/CarProductionTimelineController.getCarById';

export default class CarProductionTimeline extends LightningElement {

    @api recordId;

    car;

    loading = false;

    mode = 'table';

    get isTableMode () {
        return this.mode === 'table';
    }

    handleToggle () {
        this.mode = this.isTableMode ? 'timeline' : 'table';
    }

    get toggleIcon () {
        return this.isTableMode ? 'utility:toggle_off' : 'utility:toggle_on';
    }

    async connectedCallback () {
        await this.loadCar();
    }

    async loadCar () {
        this.loading = true;
        this.car = await getCarById({carId: this.recordId});
        this.loading = false;
    }

    async handleRefresh () {
        await this.loadCar();
    }

    get eventColumns () {
        return [
            {
                label: 'Event',
                fieldName: 'label',
                type: 'text',
                sortable: true,
                sortedBy: 'label'
            },
            {
                label: 'Type',
                fieldName: 'type',
                type: 'text',
                sortable: true,
                sortedBy: 'type'
            },
            {
                label: 'Description',
                fieldName: 'description',
                type: 'text',
                sortable: true,
                sortedBy: 'description'
            },{
                label: 'Datum',
                fieldName: 'createdDate',
                type: 'date',
                sortable: true,
                sortedBy: 'createdDate',
                typeAttributes: {
                    day: 'numeric',
                    month: 'short',
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit',
                    second: '2-digit',
                    hour24: true
                },
            }
        ];
    }

}