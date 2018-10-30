import React, {Component} from 'react';
import axios from 'axios';

import EventInfo from './EventInfo/EventInfo'
import EventInfoFilter from "./EventInfoFilter/EventInfoFilter";

class EventInfos extends Component {
    constructor(props) {
        super(props);
        this.state = {
            eventInfos: []
        }
    }

    componentDidMount() {
        this.searchHandler({});
    }

    searchHandler = (searchParams) => {
        axios.get('/api/event_infos', {
            params: searchParams
        }).then(res => {
            this.setState({eventInfos: res.data});
        });
    };

    render() {
        return [
            <EventInfoFilter key='filter' search={this.searchHandler}/>,
            <div className='card-columns' key='cards'>
                {this.state.eventInfos.map((eventInfo, index) => {
                    return (
                        <EventInfo
                            key={eventInfo.id}
                            type={eventInfo.type}
                            title={eventInfo.title}
                            subtitle={eventInfo.subtitle}
                            content={eventInfo.content}
                            eventStart={eventInfo.event_start}
                            url={eventInfo.url}
                        />
                    );
                })}
            </div>
        ];
    }
}

export default EventInfos;
