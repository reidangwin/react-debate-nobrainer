import React from "react"
import PropTypes from "prop-types"
import Card from './Card'
import { AggregatedEventSource } from './helpers';
import FontAwesomeIcon from 'react-fontawesome'

const ReactionForm = (props) => {
  return (
    <form acceptCharset="UTF-8" data-remote="true" action={"/arguments/" + props.event.argument_id + "/events/" + props.event.id + "/reactions"} method="post">
      <input name="_method" readOnly type="hidden" value="post" />
      <input name="authenticity_token" readOnly type="hidden" value={$('meta[name=csrf-token]').attr('content')} />
      <input name="utf8" readOnly type="hidden" value="✓" />
      
      {/* <label htmlFor="reaction[position]">Position</label> */}
      <input name="reaction[position]" type="text" value="0" hidden readOnly />
      
      <label htmlFor="reaction[body]">Body</label>
      <input name="reaction[body]" type="text" />

      {/* <label htmlFor="reaction[event_id]">Event id</label> */}
      <input name="reaction[event_id]" type="text" value={props.event.id} readOnly hidden />

      {/* <label htmlFor="reaction[user_id]">user id</label> */}
      <input name="reaction[user_id]" type="text" value="5nhJ2WB2jDqnaq" readOnly hidden />
      
      <input type="submit" name="commit" value="Submit" />
    </form>
  )
}



class Event extends React.Component {
  constructor(props) {
    super(props);
    this.state = {reactions: [],
                  showNewReaction: false}

    const aggregator = new AggregatedEventSource(this.props.url);

    aggregator.subscribe(newReactions => {
      this.setState({reactions: newReactions});
    });

    this.toggleNewReaction = this.toggleNewReaction.bind(this);
    this.removeEvent = this.removeEvent.bind(this);
  }

  /* componentDidUpdate(prevProps, prevState) {
   *   if (prevProps.data !== this.props.data) {
   *     this.toggleNewReaction();
   *   }
   * }*/


  toggleNewReaction(e) {
    e.preventDefault(); 
    e.nativeEvent.stopImmediatePropagation();
    this.setState({showNewReaction: !this.state.showNewReaction});
  }

  removeEvent() {
    return $.ajax({
      method: 'DELETE',
      url: '/arguments/' + this.props.event.argument_id + '/events/' + this.props.event.id + "?&authenticity_token=" + encodeURIComponent($('meta[name=csrf-token]').attr('content')),
      success: function(res) {
        console.log('Deleted event.')
      },
      error: function() {alert('delete failed')}
    })
  }

  render () {
    console.log(this.props.url);
    return (
      <div className="event-container">


        <div className="card-container reactions-a">
          {this.state.reactions.map( reaction =>
            <Card title={reaction.body} key={reaction.id}/>
          )}

          {this.state.showNewReaction ? <ReactionForm {...this.props} toggleNewReaction={this.toggleNewReaction} /> :
           <FontAwesomeIcon
             onClick={(e) => this.toggleNewReaction(e)}
             name="plus-circle"
             style={{ display: 'block', margin: 'auto' }}
             className='plus-circle'
             size='2x'
           /> 
          }

        </div>
        <div className="card-container event">
          <Card title={this.props.event.body}
                remove={
                  <FontAwesomeIcon
                      onClick={this.removeEvent}
                      name="fa-remove"
                      className='fa-remove pull-right'
                      size='1x'
                      />
                }
                />
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
