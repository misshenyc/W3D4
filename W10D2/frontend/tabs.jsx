import React from 'react';
import ReactDOM from 'react-dom';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {selectedTab: 0}
  }

  changeTab(idx) {
    this.setState({
      selectedTab: idx
    })
  }

  render() {
    
    const title = this.props.tabs.map((tab, idx) => {
      const selected = this.state.selectedTab
      const klass = idx === selected? "active" : ""
      return ( <h3 key = {idx} className = {klass} onClick ={()=> { this.changeTab(idx)}}> {tab.title} </h3> )
    })

    const selectedTab = this.props.tabs[this.state.selectedTab];
    return (
        <div>
            <h1> Tab </h1>
            <div className = 'tabs'>
                <div className='header'>{title}</div>
                <div className ='content'> {selectedTab.content} </div>
            </div>
        </div>
    )
  }

}

export default Tabs;