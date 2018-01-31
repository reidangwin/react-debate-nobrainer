import React from "react"
import PropTypes from "prop-types"
import Event from './Event'
import { AggregatedEventSource } from './helpers';


class Argument extends React.Component {

  constructor(props) {
    super(props);
    this.state = {events: []};

    const aggregator = new AggregatedEventSource(this.props.url);

    aggregator.subscribe(newEvents => {
      this.setState({events: newEvents});
    });
  }

  render () {
    /* console.log(this.props.events)*/
    return(
      <div className="container">
        <h2>{this.props.argument.name}</h2>
        <div className="events">
          {this.state.events.map( event => 
          <Event event={event} url={Routes.argument_event_reactions_path(event.argument_id, event.id, {format: 'sse'})} key={event.id} />
          )
          }
        </div>
      </div>
    );
  }
}

export default Argument
