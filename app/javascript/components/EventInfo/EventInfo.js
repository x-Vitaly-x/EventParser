import React from 'react';
import moment from 'moment';

const eventInfo = (props) => {
    const typeName = props.type.split('::')[1];
    const date = moment(props.eventStart, 'YYYY-M-D H:m').utcOffset(4).format('DD.MM.YYYY');
    return (
        <a className={'card ' + typeName} href={props.url} target='_blank'>
            <div className='card-header'>{typeName} {date}</div>
            <div className='card-body'>
                <h5 className='card-title'>{props.title}</h5>
                <p className='card-text'>
                    <strong>{props.subtitle}</strong><br/>
                    {props.content}
                </p>
            </div>
        </a>
    );
};

export default eventInfo;
