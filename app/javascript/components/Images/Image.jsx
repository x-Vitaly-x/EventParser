import React from 'react';

const image = (props) => {
    return (
        <div className='image card col-2'>
            <img className='card-img-top' src={props.image.url_thumbnail}/>
            <div className='card-body p-0 pt-2 pb-2'>
                <a href={props.image.url_original} target='_blank'>
                    <p className='card-text'>{props.image.image_file_file_name}</p>
                </a>
                <a className='btn btn-danger'
                   onClick={() => props.deleteCallback(props.image.id)}>Delete</a>
            </div>
        </div>
    );
};

export default image;
