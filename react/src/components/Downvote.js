import React from 'react';

const Downvote = props => {
  return(
    <i className="fa fa-arrow-down" aria-hidden="true" onClick={() => props.handleDownvote()}></i>
  );
}

export default Downvote;