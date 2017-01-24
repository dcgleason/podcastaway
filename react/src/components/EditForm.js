import React from 'react';

const EditForm = props => {
  return(
    <div>
      <h2>Edit review</h2>
      <form className="edit_review">
        <label htmlFor="review_rating">Rating</label>
        <input type="text" name="rating" id="review_rating" defaultValue={props.currentRating} onChange={props.handleRatingChange}/>
        <label htmlFor="review_body">Review</label>
        <input type="text" name="body" id="review_body" defaultValue={props.currentBody} onChange={props.handleBodyChange}/>
        <input type="submit" name="submit" value="Save changes" onClick={props.saveEdit}/>
      </form>
    </div>
  );
}

export default EditForm;
