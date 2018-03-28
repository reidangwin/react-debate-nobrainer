import React from "react"
import PropTypes from "prop-types"
import Event from './Event'
import { AggregatedEventSource } from './helpers';
import FontAwesomeIcon from 'react-fontawesome'


const EventForm = (props) => {
  return (
    <form acceptCharset="UTF-8" data-remote="true" action={"/arguments/" + props.argument.id + "/events"} method="post">
      <input name="_method" readOnly type="hidden" value="post" />
      <input name="authenticity_token" readOnly type="hidden" value={$('meta[name=csrf-token]').attr('content')} />
      <input name="utf8" readOnly type="hidden" value="✓" />
      
      <input name="event[argument_id]" type="text" value={props.argument.id} hidden readOnly/>
      <input name="event[position]" type="text" value="0" hidden readOnly />
      
      <label htmlFor="event[body]">Body</label>
      <input name="event[body]" type="text" />

      <input type="submit" name="commit" value="Submit" />
    </form>
  )
}

class Argument extends React.Component {

  toggleNewEvent(e) {
    e.preventDefault(); 
    e.nativeEvent.stopImmediatePropagation();
    this.setState({showNewEvent: !this.state.showNewEvent});
  }

  constructor(props) {
    super(props);
    this.state = {events: [],
                  showNewEvent: false};

    const aggregator = new AggregatedEventSource(this.props.url);

    aggregator.subscribe(newEvents => {
      this.setState({events: newEvents});
    });

    /* $("form").bind('ajax:complete', this.toggleNewEvent());*/

  }

  render () {
    /* console.log(this.props.events)*/
    return(
      <div className="container">
        <h2>{this.props.argument.name}</h2>

        {this.state.showNewEvent ? <EventForm {...this.props} toggleNewEvent={this.toggleNewEvent} /> :
         <h2 onClick={(e) => this.toggleNewEvent(e)}>Add Event</h2> 
        }

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
