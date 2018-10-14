import React from 'react';
import axios, {post} from 'axios';

class ImageForm extends React.Component {
    state = {
        file: null,
        buttonValue: 'Upload'
    };

    onFormSubmit(e) {
        e.preventDefault(); // Stop form submit
        this.fileUpload(this.state.file).then((data) => {
            alert('New data successfully uploaded.');
            this.setState({
                buttonValue: 'Upload'
            });
            this.props.success(data);
        }, error => {
            alert('Could not upload new data, check the integrity of your CSV.');
            console.log(error);
            this.setState({
                buttonValue: 'Upload'
            });
        })
    }

    fileUpload(file) {
        this.setState({
            file: null,
            buttonValue: 'Uploading...'
        });
        const url = '/api/images';
        const formData = new FormData();
        formData.append('image[image_file]', file);
        const config = {
            headers: {
                'content-type': 'multipart/form-data',
                'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').content
            }
        };
        return post(url, formData, config)
    }

    render() {
        return (
            <div className='image-form'>
                <form onSubmit={(e) => this.onFormSubmit(e)}>
                    <input type="file"
                           onChange={(e) => this.setState({file: e.target.files[0]})}
                           accept={['image/png', 'image/jpeg']}/>
                    <button
                        type="submit" className='btn btn-info'
                        disabled={this.state.file === null ? 'disabled' : ''}>
                        {this.state.buttonValue}
                    </button>
                </form>
            </div>
        );
    }
};

export default ImageForm;
