import React, { Component } from 'react';
import Argument from './Argument';
import { AggregatedEventSource } from './helpers';

class ArgumentContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {arguments: []};

    const aggregator = new AggregatedEventSource(this.props.url);

    aggregator.subscribe(newArguments => {
      this.setState({arguments: newArguments});
    });
  }

  
  render() {
    /* console.log(Routes.argument_events_path({id: '5nUqeEqUXACwi3', format: 'sse'}));*/
    return (
      <div className="container">
        <div className="row">
          <div className="col-md-6">
            {this.state.arguments.map( argument =>
              <Argument argument={argument} url={Routes.argument_events_path(argument.id, {format: 'sse'})} key={argument.id} />
            )}
          </div>
        </div>
      </div>
    );
  }
}

export default ArgumentContainer
