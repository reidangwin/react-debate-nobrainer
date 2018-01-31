import React from "react"
import PropTypes from "prop-types"
import Event from './Event'

class Argument extends React.Component {
  render () {
    /* console.log(this.props.events)*/
    return(
      <div className="container">
        <div className="events">
          {/* {this.props.events.map( event => 
              <Event event={event} />
              )
              } */}
        </div>
      </div>
    );
  }
}

export default Argument
