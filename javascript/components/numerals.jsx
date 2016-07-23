import React from 'react'

export default class Numerals extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      output: ''
    }

    this.onChange = this.onChange.bind(this)
  }

  onChange(e) {
    this.setState({output: e.target.value})
  }

  render() {
    return (
      <div id="numerals">
        <input onChange={this.onChange}/>
        <h1>{this.state.output}</h1>
      </div>
    )
  }
}
