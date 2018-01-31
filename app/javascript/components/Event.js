import React from "react"
import PropTypes from "prop-types"
import Card from './Card'

class Event extends React.Component {
  render () {
    return (
      <div className="event-container">
        <div className="card-container reactions-a">
          {this.props.event.feelings.map( feeling =>
            <Card title={feeling.body} />
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
