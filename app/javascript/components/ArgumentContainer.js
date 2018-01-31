import React, { Component } from 'react';
import Argument from './Argument'
import Rx from 'rxjs'

class AggregatedEventSource extends Rx.Subject {
  constructor(url) {
    super();

    this.source = new EventSource(url);
    this.state = {};

    this.source.addEventListener('row', (event) => {
      const payload = JSON.parse(event.data);
      if (payload.new_val) { // added or updated
        this.state[payload.new_val.id] = payload.new_val;
      } else { // deleted
        delete this.state[payload.old_val.id];
      }

      this.next(this.collection());
    });
  }

  collection() {
    return Object.keys(this.state).map(key => this.state[key]);
  }
}

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
    return (
      <div className="container">
        <div className="row">
          <div className="col-md-6">
            {this.state.arguments.map( argument =>
              <Argument argument={argument} key={argument.id} />
            )}
          </div>
        </div>
      </div>
    );
  }
}

export default ArgumentContainer
