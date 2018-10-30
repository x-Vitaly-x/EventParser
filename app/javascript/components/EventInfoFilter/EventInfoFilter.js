import React from 'react';

class EventInfoFilter extends React.Component {
    state = {
        currentType: null,
        currentDate: '',
        currentTitle: ''
    };

    setCurrentType = (type) => {
        if (this.state.currentType == type) {
            this.setState({currentType: null});
        } else {
            this.setState({currentType: type});
        }
    };

    setCurrentDate = (e) => {
        this.setState({currentDate: e.target.value})
    };

    setCurrentTitle = (e) => {
        this.setState({currentTitle: e.target.value})
    };

    render() {

        return (
            <div className='btn-toolbar mb-3' role='toolbar'>
                <div className='btn-group mr-1' role='group'>
                    <button className={this.state.currentType == 'EventInfos::GorkiEvent' ? 'btn btn-success' : 'btn'}
                            onClick={() => this.setCurrentType('EventInfos::GorkiEvent')}>Gorki.de
                    </button>
                    <button
                        className={this.state.currentType == 'EventInfos::CoBerlinEvent' ? 'btn btn-success' : 'btn'}
                        onClick={() => this.setCurrentType('EventInfos::CoBerlinEvent')}>Co-Berlin.org
                    </button>
                </div>
                <div className='input-group mr-1'>
                    <input type='date' className='form-control' onChange={this.setCurrentDate}
                           placeholder='Date' value={this.state.currentDate}/>
                </div>
                <div className='input-group mr-1'>
                    <input type='text' className='form-control' onChange={this.setCurrentTitle}
                           placeholder='Title' value={this.state.currentTitle}/>
                </div>
                <div className='btn-group' role='group'>
                    <button className='btn btn-success' onClick={() => this.props.search(this.state)}>Search</button>
                </div>
            </div>
        );
    }
}

export default EventInfoFilter;
