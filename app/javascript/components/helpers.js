import Rx from 'rxjs';

export class AggregatedEventSource extends Rx.Subject {
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
