import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title:string = 'counter-app';

  count:number = 0;

  handleIncrease(){
  	this.count = this.count+1;
  }

  handleDecrease() {
  	this.count = this.count-1;
  }

  handleReset() {
  	this.count = 0;
  }


}
