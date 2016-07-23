import React from 'react'
import {toNumeral} from './../numerals.js'

export default class Numerals extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      output: ''
    }

    this.onChange = this.onChange.bind(this)
  }

  onChange(e) {
    const value = Number.parseInt(e.target.value)
    const newValue = Number.isNaN(value) ? '' : toNumeral(value)
    this.setState({output: newValue})
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
