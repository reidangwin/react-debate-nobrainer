import React from "react"
import PropTypes from "prop-types"
class Card extends React.Component {
  render () {
    return (
      <div className="card">
        {this.props.remove? this.props.remove: null}
        <p>{this.props.title}</p>
      </div>
    );
  }
}

export default Card
