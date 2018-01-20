import React from "react"
import PropTypes from "prop-types"
class Test extends React.Component {
  render () {
    return (
      <div>
        <div style={{color: 'red'}}>One: {this.props.one}</div>
        <div style={{color: 'green'}}>Two: {this.props.two}</div>
        <div style={{color: 'blue', fontWeight: 900}}>Three: {this.props.three}</div>
      </div>
    );
  }
}

Test.propTypes = {
  one: PropTypes.node,
  two: PropTypes.node,
  three: PropTypes.node
};
export default Test
