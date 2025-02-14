---
layout: default
nav_exclude: true
---

# Exam template for 02476 Machine Learning Operations

This is the report template for the exam. Please only remove the text formatted as with three dashes in front and behind
like:

```--- question 1 fill here ---```

where you instead should add your answers. Any other changes may have unwanted consequences when your report is auto
generated in the end of the course. For questions where you are asked to include images, start by adding the image to
the `figures` subfolder (please only use `.png`, `.jpg` or `.jpeg`) and then add the following code in your answer:

```markdown
![my_image](figures/<image>.<extension>)
```

In addition to this markdown file, we also provide the `report.py` script that provides two utility functions:

Running:

```bash
python report.py html
```

will generate an `.html` page of your report. After deadline for answering this template, we will autoscrape
everything in this `reports` folder and then use this utility to generate an `.html` page that will be your serve
as your final handin.

Running

```bash
python report.py check
```

will check your answers in this template against the constrains listed for each question e.g. is your answer too
short, too long, have you included an image when asked to.

For both functions to work it is important that you do not rename anything. The script have two dependencies that can
be installed with `pip install click markdown`.

## Overall project checklist

The checklist is *exhaustic* which means that it includes everything that you could possible do on the project in
relation the curricilum in this course. Therefore, we do not expect at all that you have checked of all boxes at the
end of the project.

### Week 1

* [x] Create a git repository
* [x] Make sure that all team members have write access to the github repository
* [x] Create a dedicated environment for you project to keep track of your packages
* [x] Create the initial file structure using cookiecutter
* [x] Fill out the `make_dataset.py` file such that it downloads whatever data you need and
* [x] Add a model file and a training script and get that running
* [x] Remember to fill out the `requirements.txt` file with whatever dependencies that you are using
* [x] Remember to comply with good coding practices (`pep8`) while doing the project
* [x] Do a bit of code typing and remember to document essential parts of your code
* [x] Setup version control for your data or part of your data
* [x] Construct one or multiple docker files for your code
* [ ] Build the docker files locally and make sure they work as intended
* [ ] Write one or multiple configurations files for your experiments
* [ ] Used Hydra to load the configurations and manage your hyperparameters
* [ ] When you have something that works somewhat, remember at some point to do some profiling and see if
      you can optimize your code
* [ ] Use Weights & Biases to log training progress and other important metrics/artifacts in your code. Additionally,
      consider running a hyperparameter optimization sweep.
* [ ] Use Pytorch-lightning (if applicable) to reduce the amount of boilerplate in your code

### Week 2

* [x] Write unit tests related to the data part of your code
* [x] Write unit tests related to model construction and or model training
* [x] Calculate the coverage.
* [x] Get some continuous integration running on the github repository
* [x] Create a data storage in GCP Bucket for you data and preferable link this with your data version control setup
* [x] Create a trigger workflow for automatically building your docker images
* [x] Get your model training in GCP using either the Engine or Vertex AI
* [x] Create a FastAPI application that can do inference using your model
* [ ] If applicable, consider deploying the model locally using torchserve
* [x] Deploy your model in GCP using either Functions or Run as the backend

### Week 3

* [ ] Check how robust your model is towards data drifting
* [ ] Setup monitoring for the system telemetry of your deployed model
* [ ] Setup monitoring for the performance of your deployed model
* [ ] If applicable, play around with distributed data loading
* [ ] If applicable, play around with distributed model training
* [ ] Play around with quantization, compilation and pruning for you trained models to increase inference speed

### Additional

* [x] Revisit your initial project description. Did the project turn out as you wanted?
* [x] Make sure all group members have a understanding about all parts of the project
* [x] Uploaded all your code to github

## Group information

### Question 1
> **Enter the group number you signed up on <learn.inside.dtu.dk>**
>
> Answer:

8

### Question 2
> **Enter the study number for each member in the group**
>
> Example:
>
> *sXXXXXX, sXXXXXX, sXXXXXX*
>
> Answer:

s174479, s175393, s183909, s183998

### Question 3
> **What framework did you choose to work with and did it help you complete the project?**
>
> Answer length: 100-200 words.
>
> Example:
> *We used the third-party framework ... in our project. We used functionality ... and functionality ... from the*
> *package to do ... and ... in our project*.
>
> Answer:

We used the framework Transformers, to train an NLP classifier. The goal of the classifier was to classify tweets whether the author is Donald Trump or a Russian troll account. From the framework, we used the two functions `AutoTokenizer` and `AutoModelForSequenceClassification` to do respectively tokenization and classification. Both functions are based on the pre-trained model [bert-base-uncased](https://huggingface.co/bert-base-uncased) from Huggingface. This is an English base BERT model, trained on a large English corpus of raw text, hence without any human labeling. It's uncased, meaning the model sees no difference between uppercase and lowercase letters. The classification task in our project was done with two labels, whether the selected tweet came from Donald Trump or a Russian Troll.

## Coding environment

> In the following section we are interested in learning more about you local development environment.

### Question 4

> **Explain how you managed dependencies in your project? Explain the process a new team member would have to go**
> **through to get an exact copy of your environment.**
>
> Answer length: 100-200 words
>
> Example:
> *We used ... for managing our dependencies. The list of dependencies was auto-generated using ... . To get a*
> *complete copy of our development enviroment, one would have to run the following commands*
>
> Answer:

For a new team member to have a compatible environment, we start by informing them we are using python 3.9. We would ask them to create a new environment by using `conda create -n ‘environment name’ python=3.9`

Furthermore, there is a file called requirements which contains all the used libraries and dependencies for this project. Thus, we expect them to download all the dependencies using `pip install -r requirements.txt`. 

We have our GitHub repository with all of our code, and all members will be working on their own forked version. For cloning the repository, they will call the function `git clone https://github.com/<username>/tweet_classification.git`

To obtain the data used for the project the command `dvc pull` will be used, which would download the raw and processed versions of the data.

### Question 5

> **We expect that you initialized your project using the cookiecutter template. Explain the overall structure of your**
> **code. Did you fill out every folder or only a subset?**
>
> Answer length: 100-200 words
>
> Example:
> *From the cookiecutter template we have filled out the ... , ... and ... folder. We have removed the ... folder*
> *because we did not use any ... in our project. We have added an ... folder that contains ... for running our*
> *experiments.*
> Answer:

We did use the cookiecutter template to structure our code. From the cookiecutter template, we have used selected premade folders src, report and models. Then we added a .dvc folder to handle data storage and version control. Furthermore, we added a tests folder to include all the unit tests for our code. Besides that, we customized the makefile and requirements.txt files. And the readme file was edited such that it contained a detailed description of our project. And as we plan to utilize the google cloud platform we added 3 configuration files and 3 dockerfiles. Furthermore, we have added a .github/workflows folder for CI. 

### Question 6

> **Did you implement any rules for code quality and format? Additionally, explain with your own words why these**
> **concepts matters in larger projects.**
>
> Answer length: 50-100 words.
>
> Answer:

We implemented flake8 to check if each line of code contains max 100 characters and this is enforced using black. And we remove unused imports using autoflake and sort the remaining imports in the optimal order using isort. Thereafter we also commented our code in a consistent manner for efficient code comprehension for other users. 

## Version control

> In the following section we are interested in how version control was used in your project during development to
> corporate and increase the quality of your code.

### Question 7

> **How many tests did you implement and what are they testing in your code?**
>
> Answer length: 50-100 words.
>
> Example:
> *In total we have implemented X tests. Primarily we are testing ... and ... as these the most critical parts of our*
> *application but also ... .*
>
> Answer:

In total, we have implemented two main tests. One for testing the data, and one for testing the model.

For the data test, we are testing whether there are the same amount of tweets and labels if the data are the right datatypes (tweets as strings, and labels as integers either 0 or 1) and if there are any NAs.

For the model, we test the shape of the input and output of the model.

### Question 8

> **What is the total code coverage (in percentage) of your code? If you code had an code coverage of 100% (or close**
> **to), would you still trust it to be error free? Explain you reasoning.**
>
> Answer length: 100-200 words.
>
> Example:
> *The total code coverage of code is X%, which includes all our source code. We are far from 100% coverage of our **
> *code and even if we were then...*
>
> Answer:

The total code coverage of our code is 83.4%. As mentioned above we have included tests for our `make_dataset.py` and our `model.py`. However, it is not guaranteed that the code is mostly error-free as there could be errors in lines of code that have not been tested or not captured by the tests, such as if we only test for input type but not if there is an input. There are other python documents such as predict_model.py and train_model.py which we did not create tests for, thus these scripts are not tested. And this place further constraints on our code coverage, thereby the reliability of how error-free the source codes are.  

### Question 9

> **Did you workflow include using branches and pull requests? If yes, explain how. If not, explain how branches and**
> **pull request can help improve version control.**
>
> Answer length: 100-200 words.
>
> Example:
> *We made use of both branches and PRs in our project. In our group, each member had an branch that they worked on in*
> *addition to the main branch. To merge code we ...*
>
> Answer:

We made very much use of branches and especially pull requests. To avoid excessive merge conflicts, all team members worked on their own forked version of the project. Such that every time we wanted to commit changes to the code, we had to do a pull request. But for the size of the project which is quite small and we wanted to speed up the collaboration, we granted each member access to confirm his/hers own pull requests. When making changes to the code we created new branches such that it allowed us to go back to the previous working version if something broke in the new updates. 

### Question 10

> **Did you use DVC for managing data in your project? If yes, then how did it improve your project to have version**
> **control of your data. If no, explain a case where it would be beneficial to have version control of your data.**
>
> Answer length: 100-200 words.
>
> Example:
> *We did make use of DVC in the following way: ... . In the end it helped us in ... for controlling ... part of our*
> *pipeline*
>
> Answer:

We attempted to make use of DVC, however, it turned out to be unnecessary for our project since there are no changes in data over time and therefore no need for versioning. That being said, in the case where we would continuously require new tweets or data in general that would most likely lead to model decay over time, retraining is required. When that happens, we will definitely use DVC to keep track of data versions so we make sure to retrain the model on the updated dataset, as well as keeping the previous version in case the retrained model fails. 

### Question 11

> **Discuss you continues integration setup. What kind of CI are you running (unittesting, linting, etc.)? Do you test**
> **multiple operating systems, python version etc. Do you make use of caching? Feel free to insert a link to one of**
> **your github actions workflow.**
>
> Answer length: 200-300 words.
>
> Example:
> *We have organized our CI into 3 separate files: one for doing ..., one for running ... testing and one for running*
> *... . In particular for our ..., we used ... .An example of a triggered workflow can be seen here: <weblink>*
>
> Answer:

We have organized our CI into 3 separate files: "Auto linter" for sorting imports using isort, "Auto linter flake8" for organizing linebreaks and removing unused imports  (this was created but later removed due to errors created by it), "Install with cache" for unit testing as mentioned earlier. We have selected some unit testing being optional, mainly regarding data preparation. We have selected testing on 3 operating systems, namely Windows, Mac, and Linux. We selected these three because they cover the majority of operating systems that are being used. This also covers the systems used by our team members. The python version we have selected to test on is only 3.9 since versions <3.9 were found to result in many conflicts with dvc and versions > 3.9 resulted in other incompatibilities with multiple dependencies. However multiple PyTorch versions are being tested for which are 1.11.9, 1.12.0, and 1.13.0. We have selected multiple PyTorch versions to test for since we are using models which highly depend on the input being in torch format thus we found it very important that our code can run in multiple PyTorch versions. For the whole project we are using a lot of different libraries making the requirements list is very long thus we have selected to use caching to reduce redundant installation time and improve efficiency.

## Running code and tracking experiments

> In the following section we are interested in learning more about the experimental setup for running your code and
> especially the reproducibility of your experiments.

### Question 12

> **How did you configure experiments? Did you make use of config files? Explain with coding examples of how you would**
> **run a experiment.**
>
> Answer length: 50-100 words.
>
> Example:
> *We used a simple argparser, that worked in the following way: python my_script.py --lr 1e-3 --batch_size 25*
>
> Answer:

We implemented click commands for inputting optional arguments for configuring the hyperparameters. For example, for training our model we can input different learning rate, number of epochs, and batch size that works in the following way: `python train_model --lr 1e-3 --epoch 10 --batch_size 64`. This saves us time from having to change all the hyperparameter values manually everywhere in the code compared to if they were all implemented directly in functions. 

### Question 13

> **Reproducibility of experiments are important. Related to the last question, how did you secure that no information**
> **is lost when running experiments and that your experiments are reproducible?**
>
> Answer length: 100-200 words.
>
> Example:
> *We made use of config files. Whenever an experiment is run the following happens: ... . To reproduce an experiment*
> *one would have to do ...*
>
> Answer:

In our case, we did not make use of any configuration tools such as hydra. However, we do recognize the importance of keeping clear documentation of the setup of each experiment. In the ideal case, we would utilize hydra to build configuration files containing hyperparameter values and load them in the script, and then incorporate them into the script with the predefined and consistent naming convention. For every experimental run, we also implement logging to keep a record of outputs from each experiment so that we know the timeline and how exactly the models are being trained. To reproduce a specific experiment one would have to load in the specific configurations corresponding to that experiment and incorporate the hyperparameters into the same script. 

### Question 14

> **Upload 1 to 3 screenshots that show the experiments that you have done in W&B (or another experiment tracking**
> **service of your choice). This may include loss graphs, logged images, hyperparameter sweeps etc. You can take**
> **inspiration from [this figure](figures/wandb.png). Explain what metrics you are tracking and why they are**
> **important.**
>
> Answer length: 200-300 words + 1 to 3 screenshots.
>
> Example:
> *As seen in the first image when have tracked ... and ... which both inform us about ... in our experiments.*
> *As seen in the second image we are also tracking ... and ...*
>
> Answer:

![image](https://user-images.githubusercontent.com/117659231/213195500-83437a22-8914-4335-a446-ae9e818b03ac.png)

Due to time constraints and the complexity of our model, we have selected not to use W&B. We were not able to run a training loop with more than 1 epoch and have not had the opportunity to play with other parameters such as learning rate even after greatly reducing the amount of data. We would have implemented logging and creation of the loss graph, where we have the loss on the y-axis and epochs on the x-axis, which will give us a visual understanding of how the training is progressing. We would also save other metrics such as accuracy, this will give us a numerical understanding of how well the model is performing. To further evaluate our model it would also be beneficial to have a validation set included in our loss plot to see and compare loss for training and validation set which will insure our model is not overfitting. We could also save some randomly sampled tweets in our training set such we could take a look at how the input would look and make sure they still make sense. With W&B we could also compare the performance of different models, currently, we are only using BERT-base-uncased we would then be able to compare with BERTweet-base using accuracy or other metrics.

### Question 15

> **Docker is an important tool for creating containerized applications. Explain how you used docker in your**
> **experiments? Include how you would run your docker images and include a link to one of your docker files.**
>
> Answer length: 100-200 words.
>
> Example:
> *For our project we developed several images: one for training, inference and deployment. For example to run the*
> *training docker image: `docker run trainer:latest lr=1e-3 batch_size=64`. Link to docker file: <weblink>*
>
> Answer:

For our project, we developed three images: one for training, one for inference, and one for deployment. This is done so by adding three docker builds and pushes in the cloudbuild.yaml file with different tags and creating three separate dockerfiles with different entry points. The docker images are set to build automatically using a trigger in Google Cloud every time we pushed changes to our repository. At times we did though disable the trigger to not run out of resources. Hence only building new docker images when we found it necessary. To run the docker images as custom jobs in vertex AI we created separate config files indicating different imageUris. Link to app dockerfile: https://github.com/MiaMiya/tweet_classification/blob/main/app.dockerfile
      
### Question 16

> **When running into bugs while trying to run your experiments, how did you perform debugging? Additionally, did you**
> **try to profile your code or do you think it is already perfect?**
>
> Answer length: 100-200 words.
>
> Example:
> *Debugging method was dependent on group member. Some just used ... and others used ... . We did a single profiling*
> *run of our main code at some point that showed ...*
>
> Answer:

The debugging method was dependent on each group member, but the majority of the time print statements were used. The print statement ensures us an understanding of what our input and output look like and we could evaluate whether they make sense for the given context. Furthermore, this allows us to understand where in the code the error is starting to occur, since at times even a wrong input will still work, and it would just carry on with the incorrect input/output until a call cannot handle it. Some group members have also selected to look at the data and make sure we shuffled them and examined if the model is fitting the data. We decided not the create profiling since the majority of our problems occurred when we transformed our code to could which we could not connect to the profiling.

## Working in the cloud

> In the following section we would like to know more about your experience when developing in the cloud.

### Question 17

> **List all the GCP services that you made use of in your project and shortly explain what each service does?**
>
> Answer length: 50-200 words.
>
> Example:
> *We used the following two services: Engine and Bucket. Engine is used for... and Bucket is used for...*
>
> Answer:

We used the following services:
- Bucket. To store our data and models in the cloud.
- Cloud Build (with Triggers). To automatically create new images, when the GitHub repository changes were pushed.
- Container Registry. To store our images and containers.
- Vertex AI. To run our containers and produce the desired output based on the call.

### Question 18

> **The backbone of GCP is the Compute engine. Explained how you made use of this service and what type of VMs**
> **you used?**
>
> Answer length: 100-200 words.
>
> Example:
> *We used the compute engine to run our ... . We used instances with the following hardware: ... and we started the*
> *using a custom container: ...*
>
> Answer:

We did set up a Compute Engine. The instance for the project had the following hardware: 
- Zone: europe-west4-a
- Machine Type: n1-standard-1
- GPUs: 1 x NVIDIA V100

But we did not make use of the engine, mainly because it is extremely expensive to run, and we didn't find a great need for it.

Instead, we used other cloud services such as Vertex AI to train our model, and Cloud Functions to deploy an app with our prediction model. However, this resulted in us not being able to utilize GPUs for the project and greatly increased the time spent. 

### Question 19

> **Insert 1-2 images of your GCP bucket, such that we can see what data you have stored in it.**
> **You can take inspiration from [this figure](figures/bucket.png).**
>
> Answer:

![image](https://user-images.githubusercontent.com/117659231/213194100-4721ef43-fe49-4d4b-9ebf-5d45c9dd5b13.png)
![image](https://user-images.githubusercontent.com/117659231/213194159-db6312d7-4bdb-49e5-a15b-b1e9264918e8.png)

### Question 20

> **Upload one image of your GCP container registry, such that we can see the different images that you have stored.**
> **You can take inspiration from [this figure](figures/registry.png).**
>
> Answer:

![image](https://user-images.githubusercontent.com/117659231/213194285-7220c51f-0c47-43b4-9f29-796066969cd1.png)

### Question 21

> **Upload one image of your GCP cloud build history, so we can see the history of the images that have been build in**
> **your project. You can take inspiration from [this figure](figures/build.png).**
>
> Answer:

![image](https://user-images.githubusercontent.com/117659231/213194543-8d166f17-e742-4800-8170-9aee01a1bfff.png)

### Question 22

> **Did you manage to deploy your model, either in locally or cloud? If not, describe why. If yes, describe how and**
> **preferably how you invoke your deployed service?**
>
> Answer length: 100-200 words.
>
> Example:
> *For deployment we wrapped our model into application using ... . We first tried locally serving the model, which*
> *worked. Afterwards we deployed it in the cloud, using ... . To invoke the service an user would call*
> *`curl -X POST -F "file=@file.json"<weburl>`*
>
> Answer:

We managed to deploy with both cloud functions and cloud runs. We initially deployed with cloud functions (because of technical issues see Q26). For the purpose of this project, it is well suited given the fact that our application only needs to take a string as input and then output a prediction. However, if we want to add more functionality it’s preferred to use containers and Cloud Run. This is precisely what we did and to invoke the service the user can either use the makefile (when in root repository) with `make tweet=<some tweet> api_str` or with `curl -X 'GET' 'https://tweet-classification-app-ed4ieygz7a-ew.a.run.app/tweet/<some tweet>’ -H 'accept: application/json'`. Alternatively you can also upload a txt file instead with: `make txt=<file.txt> api_txt` or with `curl -X 'POST' 'https://tweet-classification-app-ed4ieygz7a-ew.a.run.app/upload/' -H 'accept: application/json' -H 'Content-Type: multipart/form-data' -F 'data=@<file.txt>;type=text/plain'`.

### Question 23

> **Did you manage to implement monitoring of your deployed model? If yes, explain how it works. If not, explain how**
> **monitoring would help the longevity of your application.**
>
> Answer length: 100-200 words.
>
> Example:
> *We did not manage to implement monitoring. We would like to have monitoring implemented such that over time we could*
> *measure ... and ... that would inform us about this ... behaviour of our application.*
>
> Answer:

We did not manage to implement monitoring of our deployed models; due to complications, we had when deploying our model. We would have wanted to implement monitoring, which could help inform us about the behavior of our model in the long run. It would warn us if there was data drift, or if the predictions would start to become screwed. Furthermore, this would help inform us if the model needs to be retrained or if the model should be archived. The monitoring would be a very important step in securing the model’s relevance to the data. In our case, though given Trump doesn't use Twitter anymore no new data will be generated, and thus until he starts generating new tweets monitoring is less relevant.
      
### Question 24

> **How many credits did you end up using during the project and what service was most expensive?**
>
> Answer length: 25-100 words.
>
> Example:
> *Group member 1 used ..., Group member 2 used ..., in total ... credits was spend during development. The service*
> *costing the most was ... due to ...*
>
> Answer:

We ended up using 24.64 credits during the project. 
The credits were spent on the following services:
- Cloud Build, 0.52 credits 
- Cloud Storage, 18.85 credits
- Compute Engine, 4.68 credits
- Networking, 0.17 credits
- Vertex AI, 0.41 credits

Hence clearly Cloud Storage has cost the most. 

## Overall discussion of project

> In the following section we would like you to think about the general structure of your project.

### Question 25

> **Include a figure that describes the overall architecture of your system and what services that you make use of.**
> **You can take inspiration from [this figure](figures/overview.png). Additionally in your own words, explain the**
> **overall steps in figure.**
>
> Answer length: 200-400 words
>
> Example:
>
> *The starting point of the diagram is our local setup, where we integrated ... and ... and ... into our code.*
> *Whenever we commit code and puch to github, it auto triggers ... and ... . From there the diagram shows ...*
>
> Answer:

![system_architecture](https://user-images.githubusercontent.com/117659231/213176803-237f51ec-26b9-41ec-9b82-efc5adcc7bc2.svg)
As seen in the image above we are utilizing 14 services. 
First of all on the right-hand side is our local setup, where we start with the PyTorch application as our hub. From there we create our virtual environment using conda with a specific python version (3.9). 
The next step is to create a cookiecutter code structure in order for us to have a clear overview and organized collection of code and documentation. This folder is then uploaded to GitHub which ensures collaboration and version control. 
For our data, we first created local data storage in the folder data (in a cookiecutter structure). To create version control for our data we selected using the dvc service so that we can push and pull our data to cloud buckets. 
The final service we are using locally is docker to containerize our project so it is reproducible.  
For scalability and availability, we established connections to the selected cloud services on the google cloud platform. In other words, whenever we update our main branch in GitHub it would automatically trigger a new build in the cloud which is stored as images in the container registry. For a user to interact with our deployed model we will be utilizing fastapi.   

### Question 26

> **Discuss the overall struggles of the project. Where did you spend most time and what did you do to overcome these**
> **challenges?**
>
> Answer length: 200-400 words.
>
> Example:
> *The biggest challenges in the project was using ... tool to do ... . The reason for this was ...*
>
> Answer:

We had several challenges. One of the biggest challenges was our old and slow computers which didn't have enough storage or RAM to run the scripts. Luckily we had one computer that was sufficient, where we could run stuff locally. Eventually, we solved this challenge by uploading and running on the google services and testing there without having tested locally. This worked out but took significantly longer to do, as each build takes over 20mins. 

Another issue we had, was difficulties figuring out the right path to access our data stored in cloud buckets. This turned out to be because dvc saves the data in uncomprehensive path names thus making it almost impossible to define a proper file path. Therefore, we had to decide on doing a quick fix by uploading the data manually to cloud buckets to get the models up and running. But it is of note that this leads to no data version control which is an inconvenient limitation to our project. 

Another big challenge was that we could not utilize GPU resources on the Vertex AI training service due to resource limitations. Unfortunately, we use transformers models which are known to be very large and time-consuming to use and fine-tune. This resulted in an extremely long training time even with a significantly reduced dataset size. To give an example, it took about 30 minutes just to train 1 epoch with 750 data points.

### Question 27

> **State the individual contributions of each team member. This is required information from DTU, because we need to**
> **make sure all members contributed actively to the project**
>
> Answer length: 50-200 words.
>
> Example:
> *Student sXXXXXX was in charge of developing of setting up the initial cookie cutter project and developing of the*
> *docker containers for training our applications.*
> *Student sXXXXXX was in charge of training our models in the cloud and deploying them afterwards.*
> *All members contributed to code by...*
>
> Answer:

Students s183909 and s183998 were mainly in charge of setting up the model and writing the training and prediction scripts etc. 
Students s174479 and s175393 were mainly in charge of setting up the project in the cloud and deploying the model etc.
All along we communicated, discussed our work helped each other out with challenges. 
Regarding the report we contributed equally, each answering different questions and discussing some together.  
