import React from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';

import ImageForm from './Images/ImageForm';
import Image from './Images/Image';

class Images extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            images: []
        }
    }

    componentDidMount() {
        this.fetchImages();
    }

    fetchImages() {
        axios.get('/api/images')
            .then(response => {
                this.setState({images: response.data})
            })
            .catch(error => console.log(error));
    }

    deleteImage(imageId) {
        if (confirm('Really delete this image?')) {
            axios.delete('/api/images/' + imageId, {
                headers: {
                    'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').content
                }
            }).then(() => {
                let images = this.state.images.filter(image => {
                    return image.id !== imageId
                });
                this.setState({images});
            }).catch(error => console.log(error))
        }
    }

    addImage(image) {
        let imageList = this.state.images;
        imageList.push(image.data);
        this.setState({images: imageList});
    }

    render() {
        return (
            <div className='images-container'>
                <ImageForm success={this.addImage.bind(this)}/>
                <div className='images d-flex flex-wrap mt-2'>
                    {this.state.images.map((image, index) => (
                        <Image image={image}
                               deleteCallback={this.deleteImage.bind(this)}
                               index={index}
                               key={index}/>
                    ))}
                </div>
            </div>
        );
    }
}

export default Images
