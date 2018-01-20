# README

This is a proof of concept that benchmarks react-rails + wicked_pdf (server side rendered) vs prawn.

To get up and running:

* make sure you have node installed
* make sure you have foreman installed ($ `gem install foreman`)
* $ `bundle`
* $ `foreman`

You then can go to [localhost:3000](http://localhost:3000) and then start sending emails and playing with the app. To view emails go to [localhost:1080](http://localhost:1080)

On my machine here is what I am seeing for a benchmark:

| PDF TYPE |    user    |   system   |   total    |    real    |
|:---------|:----------:|:----------:|:----------:|:----------:|
|  react:  |  0.030000  |  0.030000  |  1.990000  | (2.865517) |
|  prawn:  |  0.030000  |  0.010000  |  0.040000  | (0.035425) |

prawn being about 75-80 times faster in rendering than react SSR rendering on my machine (quad core 2017 13" MBP). I was also seeing some pretty intense memory spikes with react SSR rendering and was not with prawn rendering (but that wasn't scientific, I was watching activity monitor turning one or the other off)

Also note that the react component is extremely simplistic where as the prawn template was actually doing some more complex drawing. This is intentional, it shows even more that there is a big difference between the two.
