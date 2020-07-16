Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F62221F91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 11:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgGPJSi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 05:18:38 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:33413 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbgGPJSh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 05:18:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id w029jTsWQyPEdw02Cj3UJP; Thu, 16 Jul 2020 11:18:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594891114; bh=f/+PE7uvrvBzCd2FPEuT+QH4AP75SFLYd1nHj76lynk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PbvJ+XFjvF1KvH6ZZzC+U+/QlA//bMgYtDW69hnQBn2moJdphDRqsOAfLrZ3F4GWh
         VJFisXwQTfasyAu08noeM7lnr65T+8MTOh19bUY1vuuY5ba7NdHedQ66yB7ugZCkAW
         z5hlpq9h8yUSoHO1qBmjPvBoxGNjy9E1KeN2Rxhau9wYnzpctunJRD1SxE94tGWcPq
         3l6tojUqd31jYC3QdU96U5xVjCb3C+Y3Ei5wH3r4towP+AqDG0HX62jN8AQWdLqlb7
         B73zlS5ut8vstMNGQjeP3eV+gtNUES3r/kcjh+bYaQ5fAYGdgUxuerF1TkeK+5jPYn
         2b02xF/K0ZFow==
Subject: Re: [PATCH] media: rcar-vin: Move media_device_register to async
 completion
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com,
        Steve Longerbeam <steve_longerbeam@mentor.com>
References: <1592328696-84533-1-git-send-email-mrodin@de.adit-jv.com>
 <20200617105646.GB2850317@oden.dyn.berto.se>
 <20200617151537.GB88066@vmlxhi-121.adit-jv.com>
 <20200617152857.GA2936315@oden.dyn.berto.se>
 <427325ff-e21f-91fd-6236-6d1f6615ca41@xs4all.nl>
 <20200624145423.GA1595450@oden.dyn.berto.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e0e38519-bdce-9865-5420-904b41d7531a@xs4all.nl>
Date:   Thu, 16 Jul 2020 11:18:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200624145423.GA1595450@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDSaJlPsuSMSTwTorgKYR0W35aKiTdv4DKlrl+ksbHsnqE9fX1Ij0R9AhgdDMB4Vjra4Qk7/xGL6hgtDYqGOMWISFd9qJmIgGymDTmCZmIum4gZ2rZk6
 kS5KjL39hGpsvDt8/g4egIylrAcPJYHtay8j81i8HXzZ1Pf1xOMVAWouMH12Y3DWJhS8mS4AWkaR3Pu5ZpQOQNvxJy67TzOjbCu/s21bRaf9ToRapemDipDk
 IZKd17T2RoM9wvOdhQ4QwU8Hplz4ayfInh6eG9PtlxBDwQRYvIsjTib3v7L+IA+KaPe8ydQRMoUwwakyLZm0dw+ltihkE/GblwHbs8rMnJIch17U4kHrXlVD
 ePwBMcLq/2JgMMsQtwyVQUI8dUCl1rnvg7rQn9sZ7tPyKKeOMTrMrNDyyFuWtIjGghAWymW+aOGryuBQ6QIGjXNAYjcUu6P8yPLMV2TyFQLM7rcPE2zJl8ha
 hVfGbIwxuGXCb+UFmJARMe07m6uN9oJGdCOCxmeBhQyePh7XMmXsmPjZTQw=
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24/06/2020 16:54, Niklas Söderlund wrote:
> Hi Hans,
> 
> On 2020-06-24 15:31:01 +0200, Hans Verkuil wrote:
>> On 17/06/2020 17:28, Niklas Söderlund wrote:
>>> Hi Michael,
>>>
>>> On 2020-06-17 17:15:37 +0200, Michael Rodin wrote:
>>>> Hi Niklas and Steve,
>>>>
>>>> On Wed, Jun 17, 2020 at 12:56:46PM +0200, Niklas Söderlund wrote:
>>>>> Hi Michael and Steve,
>>>>>
>>>>> On 2020-06-16 19:31:36 +0200, Michael Rodin wrote:
>>>>>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>>>>
>>>>>> The media_device is registered during driver probe, before async
>>>>>> completion, so it is possible for .link_notify to be called before
>>>>>> all devices are bound.
>>>>>>
>>>>>> Fix this by moving media_device_register() to rvin_group_notify_complete().
>>>>>> This ensures that all devices are now bound (the rcar-csi2 subdevices and
>>>>>> and video capture devices) before .link_notify can be called.
>>>>>
>>>>> I'm curious to what situation created the need for this change. I'm 
>>>>> currently trying to take the VIN driver in the opposite direction [1] 
>>>>> with the end goal of registering video devices at probe time and then 
>>>>> allow the media graph to populate as devices becomes available.
>>>>
>>>> It looks like almost all platform drivers call media_device_register() in
>>>> the completion callback. From my understaning it is necessary to ensure
>>>> that all subdevices are bound and all links are created before the user
>>>> can enable any link (which would trigger link_notify callback execution)
>>>> and set formats. If I am not mistaken, Steve could observe an "OOPS" or
>>>> at least it is theoretically possible.
>>>
>>> If an OOPS have been observed I would be interested to see it. That way 
>>> we can fix the OOPS and keep the media graph registration where it is 
>>> today.
>>>
>>>>
>>>> Actually I found that this patch alone is not enough even if it is correct,
>>>> because we also have to register the media device in rvin_parallel_notify_complete()
>>>> in case if there is only a parallel video input device attached.
>>>>
>>>>> My reason for this is that we could have a functional pipeline inside 
>>>>> the graph even if it's not complete. This came out of the GMSL work done
>>>>> a while pack where I had a faulty camera that would prevent the other 7 
>>>>> in the system to function.
>>>>
>>>> I agree that if a probe of a faulty subdevice fails, this should not affect
>>>> functionality of the other attached subdevices. The "complete" callback of
>>>> the async notifier is probably not executed in this case, so I guess, we
>>>> would have to register the media device in the "bound" callback after the first
>>>> subdevice has been probed? Otherwise there is not much sense to have video
>>>> capture devices, which are not connected to any source.
>>>
>>> Calling it in the bound callback is mostly the same as it is today, as 
>>> link_notify could then be called when not all entities are in the graph.  
>>> In fact even if we where tp move the media device registration to the t
>>> complete callback we have this problem if any of the subdevices are 
>>> unbound. Then we are back to the state with a registerd media device 
>>> where not all entities are present.
>>>
>>> I think the solution here is to address the issue (if any) in the 
>>> link_notify callback when the graph is not fully populated.
>>
>> As I have mentioned in other threads in this mailinglist (e.g.
>> https://www.spinics.net/lists/linux-media/msg171067.html), this is part
>> of a bigger problem: what to do if only part of a graph comes up, or
>> a part disappears. Today this is not supported.
>>
>> It is certainly desirable to support this, but I want to see an RFC first
>> detailing the interaction with userspace. And remember that today the
>> expectation of applications is that device nodes are only created if all
>> components of the device probed successfully.
>>
>> My preference is that rcar-vin is first changed to conform to current
>> expectations (i.e. /dev/mediaX is only registered at async completion).
> 
> I do not object to first making rcar-vin behave in this way. However for 
> that work to be truly useful it should also solve what happens with all 
> video, subdevices and media devices in the scenario where one device of 
> the graph is unbound after complete have been called and how they can 
> reregisterd if the graph becomes complete again.
> 
> If I understand things correctly the idea is to register video and 
> subdevices at the time complete is called. However I'm unsure what is 
> suppose to happen when unbound is called, shall all video and subdevices 
> of the graph then be unregistered? Currently this happens for video 
> devices in rcar-vin but it has a huge drawback, if the device that was 
> unbound is rebound and complete() is called a second time the kernel 
> prints big warnings on newer kernels and crashes in older. This is due 
> to the kref involved in the V4L2 core. Also I'm unaware of how one could 
> unregister all subdevies if another subdev in the graph is removed.
> 
> Figuring this out would make me happy as it's been a pet problem of mine 
> for many years. I also think making this work could help in the 
> discussion on how we can build partial initialization on top.

What exactly are these warnings? I remember faintly seeing backtraces of
this before, but it is so long ago. It would be good to see what happens with
the latest kernel (i.e. media master branch).

Regards,

	Hans

> 
>>
>> After a proper discussion on how to handle partial initialization and
>> after we have a good plan, then this can be implemented in rcar-vin.
>>
>> Note that I really want to support partial initialization, but I want
>> to see an RFC with a proper analysis and proposal first.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>>
>>>> (Delayed) population of the media graph after media device registration
>>>> sounds also like a requirement for device tree overlay support, which would
>>>> also be a nice feature.
>>>>
>>>>> 1. [PATCH 0/5] media-device: Report if graph is complete
>>>>>
>>>>>>
>>>>>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>>>> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
>>>>>> ---
>>>>>>  drivers/media/platform/rcar-vin/rcar-core.c | 14 ++++++--------
>>>>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
>>>>>> index 7440c89..e70f83b 100644
>>>>>> --- a/drivers/media/platform/rcar-vin/rcar-core.c
>>>>>> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
>>>>>> @@ -253,7 +253,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>>>  	struct media_device *mdev = &group->mdev;
>>>>>>  	const struct of_device_id *match;
>>>>>>  	struct device_node *np;
>>>>>> -	int ret;
>>>>>>  
>>>>>>  	mutex_init(&group->lock);
>>>>>>  
>>>>>> @@ -266,7 +265,6 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>>>  	vin_dbg(vin, "found %u enabled VIN's in DT", group->count);
>>>>>>  
>>>>>>  	mdev->dev = vin->dev;
>>>>>> -	mdev->ops = &rvin_media_ops;
>>>>>>  
>>>>>>  	match = of_match_node(vin->dev->driver->of_match_table,
>>>>>>  			      vin->dev->of_node);
>>>>>> @@ -278,11 +276,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin)
>>>>>>  
>>>>>>  	media_device_init(mdev);
>>>>>>  
>>>>>> -	ret = media_device_register(&group->mdev);
>>>>>> -	if (ret)
>>>>>> -		rvin_group_cleanup(group);
>>>>>> -
>>>>>> -	return ret;
>>>>>> +	return 0;
>>>>>>  }
>>>>>>  
>>>>>>  static void rvin_group_release(struct kref *kref)
>>>>>> @@ -688,6 +682,8 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>>>>>>  		return ret;
>>>>>>  	}
>>>>>>  
>>>>>> +	vin->group->mdev.ops = &rvin_media_ops;
>>>>>> +
>>>>>>  	/* Register all video nodes for the group. */
>>>>>>  	for (i = 0; i < RCAR_VIN_NUM; i++) {
>>>>>>  		if (vin->group->vin[i] &&
>>>>>> @@ -736,8 +732,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>>>>>>  		}
>>>>>>  	}
>>>>>>  	mutex_unlock(&vin->group->lock);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>>>  
>>>>>> -	return ret;
>>>>>> +	return media_device_register(&vin->group->mdev);
>>>>>>  }
>>>>>>  
>>>>>>  static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>>>>>> -- 
>>>>>> 2.7.4
>>>>>>
>>>>>
>>>>> -- 
>>>>> Regards,
>>>>> Niklas Söderlund
>>>>
>>>> -- 
>>>> Best Regards,
>>>> Michael
>>>
>>
> 

