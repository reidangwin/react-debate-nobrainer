import React from "react"
import PropTypes from "prop-types"
import Card from './Card'
import { AggregatedEventSource } from './helpers';



class Event extends React.Component {
  constructor(props) {
    super(props);
    this.state = {reactions: []};

    const aggregator = new AggregatedEventSource(this.props.url);

    aggregator.subscribe(newReactions => {
      this.setState({reactions: newReactions});
    });
  }

  render () {
  console.log(this.props.url);
    return (
      <div className="event-container">
        <div className="card-container reactions-a">
          {this.state.reactions.map( reaction =>
              <Card title={reaction.body} />
              )}
        </div>
        <div className="card-container event">
          <Card title={this.props.event.body}/>
        </div>
        <div className="card-container reactions-b">
          <Card title="reaction1"/>
          <Card title="reaction2"/>
          <Card title="reaction3"/>
        </div>
      </div>
    );
  }
}

export default Event
