import React from "react"
import PropTypes from "prop-types"
import Card from './Card'
import { AggregatedEventSource } from './helpers';
import FontAwesomeIcon from 'react-fontawesome'
import {FormFor, HashFields, Submit, Label, TextField} from 'react-rails-form-helpers'

const ReactionForm = (props) => {
  return (
    <form acceptCharset="UTF-8" action={"/arguments/" + props.event.argument_id + "/events/" + props.event.id + "/reactions"} method="post">
      <input name="_method" readOnly type="hidden" value="post" />
      <input name="authenticity_token" readOnly type="hidden" value={$('meta[name=csrf-token]').attr('content')} />
      <input name="utf8" readOnly type="hidden" value="✓" />
      
      <label htmlFor="position">Position</label>
      <input name="position" type="text" />
      
      <label htmlFor="body">Body</label>
      <input name="body" type="text" />
      
      <input type="submit" name="commit" value="Submit" />
    </form>
  )
}

class Event extends React.Component {
  constructor(props) {
    super(props);
    this.state = {reactions: [],
                  showNewReaction: false};

    const aggregator = new AggregatedEventSource(this.props.url);

    aggregator.subscribe(newReactions => {
      this.setState({reactions: newReactions});
    });

    this.createNewReaction = this.createNewReaction.bind(this);
  }

  createNewReaction(e) {
    e.preventDefault(); 
    e.nativeEvent.stopImmediatePropagation();
    this.setState({showNewReaction: true})
  }

  render () {
    console.log(this.props.url);
    return (
      <div className="event-container">
      <div className="card-container reactions-a">
      {this.state.reactions.map( reaction =>
        <Card title={reaction.body} key={reaction.id}/>
      )}
      {this.state.showNewReaction ? <ReactionForm {...this.props} /> :
       <FontAwesomeIcon
         onClick={(e) => this.createNewReaction(e)}
         name="plus-circle"
         style={{ display: 'block', margin: 'auto' }}
         className='plus-circle'
         size='2x'
       /> 
      }


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
