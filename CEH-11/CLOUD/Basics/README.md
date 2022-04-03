    Filename: eccouncil-ceh31250-v11-19-1-1-cloud-computing-basics.md
    Show Name: CEHv11 (312-50)
    Topic Name: Cloud Computing - Cloud Computing
    Episode Name: Cloud Computing Basics ================================================================================

Cloud Computing Basics
Objectives:

-    Define cloud computing and the common types of cloud services
-    Define areas of responsibility with common types of cloud computing
-    List and describe the different cloud deployment models

#    Types of Cloud Services
#        IaaS
- So I AAS is infrastructure as a service
- Then I can just build servers in the cloud and do whatever I want to with them
- he provider will offer you at least IAAS, they're hosting the actual metal, right? I just got to go into their portal, use virtualization and spin up stuff giving me the infrastructure to build whatever I like. And then that's IAAS

#        PaaS
- Platform massive services kind of like a I asked but what past does is say? Yeah, here's a server but it's also got some stuff baked into it, right. So it's a platform that developers love Pass because they can spin up a test environment like that


#        SaaS
- Then there's SAs the other the big three as we have SAs is software as a service. You've probably used software as a service. If you're watching us your well, I guess we technically have another form of sass that were called.
- So I think more along the lines of facebook, right, twitter. These are software and services. You use the software, the web application, you don't touch that, you don't build it, you don't develop it, you don't do any of that stuff, you just use it where you are purposes, whatever it can give you the capabilities to do.
- It's other people's stuff, if you haven't figured out what the cloud is, other people's stuff, write software, service is going to be their software that they let you use as a service and you just pay them in some way, shape or form. if it's Facebook or Twitter, you're paying them with you. You are the product at that point, that's fun to think about. Let's see here now let's move on to somewhere interesting forms of as a service.


#        IDaaS
            ID as a Service
            Identity and Account Management Services
                SSO
                MFA
#        SECaaS
            Security as a Service
-                Pentests
-                AV/EDR
-                Incident Response
#        CaaS
            Container as a Service
-                 Container/app/cluster management
#        FaaS
            Function as a Service
-                Microservices
-                App Functions
-                    AWS Lambda

#    Responsibility Areas
-        On Prem
            ALL Subscriber
#        IaaS
            Subscriber
-                Applications
-                Data
-                Runtime
-                Middleware
-                OS

#            Service Provider
-                Virtualization environment
-                Metal servers
-                Storage
-                Network

#        PaaS
-            Subscriber
-                Applications
-                Data

#            Service Provider
-                Runtime
-                Middleware
-                OS
-                Virtualization environment
-                Metal servers
-                Storage
-                Network
#        SaaS
-            ALL Serice Provider

#    Deployment Models
-        Public
-        Private
-            Single org use

#        Community
            Multiple org use
                Common industry and security concerns
-                    Healthcare
-                    Transportation
-                    Hotel
#        Hybrid
            Some mixing of the cloud Deployment Models
#        Multi-Cloud
            Environment that spans across Multiple cloud providers
                Single management interface
----------------------------------------------------------------



#    NIST Cloud Deployment Reference Architecture
        Cloud Consumer
- Cloud provider was a cloud provider. It is someone who provides you with cloud services. Sometimes you hear this cloud service provider CSPS
-
        Cloud Provider
- Cloud consumer, you and I the end user, the person that actually or entity that is consuming cloud services, that's hence the name cloud consumer. 

        Cloud Carrier
- The org that provides network connectivity between consumers and providers

        Cloud Auditor
-            3rd-party examiners
-                Regulation and compliance
-                Security and services

        Cloud Broker
-            Intermediary that specializes in cloud management
-                Categories
-                    Service aggregation
                        The cloud broker combines and integrates multiple existing services into new service, carrying responsibility of data integration between cloud consumer and cloud providers.
-                    Service intermediation
                        A cloud broker provides value-added service, enhancing an existing service by improving some of its capabilities.
-                    Service arbitrage
                        This is similar to service aggregation but with flexible dynamic choice of service providers based on the broker’s internal evaluations.

#    Cloud Storage Architecture
-        Front-End
            Where the end user interacts with the data through an API
-        Middleware
            Data De-duplication and Replication
-        Back-End
            Metal hardware
