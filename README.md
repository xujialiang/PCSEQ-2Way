PCSEQ-2Way
=====

EQ visualizer

Is an animated EQ visualizer that can be used for audio ios applications.  

![alt tag](https://github.com/xujialiang/PCSEQ-2Way/blob/master/eq.jpg?raw=true)

How to use: 

  PCSEQVisualizer* eq = [[PCSEQVisualizer alloc]initWithNumberOfBars:20];
  [self.view addSubview:eq];
  [eq start];
  

To pause the EQ call:

  [eq stop];


I will try to update this code to handle audio output such as treble and bass

Feel free to contact me if you have any questions

