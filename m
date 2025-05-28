Return-Path: <linux-renesas-soc+bounces-17612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C83FAAC690C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEFEF178CAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921DD28466E;
	Wed, 28 May 2025 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qsaqSGwJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1427AC25
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434687; cv=none; b=bo4YQrQJ72VD/Pf6bkxYb1tXcILm41vm4aMir2Hi8QRcB6Xsk+3QvMGQjG0NcGjvq75UF47TMuFvmA41BdZjPaXU3rRcG7jXJmaoxzxp5UvlJ2eH9NZXrQ/3cXxDRwXYMqz7lQojOQx199wtC0AkJQqLEuJI1uaSUHfafIJcWwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434687; c=relaxed/simple;
	bh=O4LR9pI6xx3T8QZmRFCKsYryOpN9UWOwOrS0wb9wEu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fo12x558UVfDDFeKeefula5zyhWAAlynuamfLlP6lHG9c0KvW24jBUGB3OBfqbrQ5P3JrnpdT6rPmJEbIpLUJUGiyeLwTRnwG/pa0xdBYGwFLDy9rtppcjvK7UU2hWIeLg5lHFxAlK09K/USuBPRW9tOY/xntfexNj9EMNF1m3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qsaqSGwJ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad8a8da2376so38596666b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 05:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748434682; x=1749039482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Czkh2eiy3JDb3m73xx6orfFUPs2gcH1GVKp66Ebvzo0=;
        b=qsaqSGwJmjwK4yZWOGygJf4bRFGz4m/ivFFzqsWLgD/EKb0O9P5ygCj4akWUGDr6wh
         Gb0IV12vFiBIdPkqUUmwm3QMcq+KVhEWxLscJpBQIGx/Oj8ph1B8CN7DZhN1aP2ghgG8
         ODCMkhRmzMXOZf8j6/yUo2k6GILP2DBclqAc34XrmFE+i5csxu6wv6h+v2ZyNOgbwE5C
         R+jmPtGN7AgKqhdObTbXLvqVV9rpKHe1VsYHxkk8JtHDH5n42fCghzfy47t7CyZuB+Tu
         yYYrJvJ7dgHesXfLhxrzc7n34m/Sc4d33KWi205XiQIU/JYcNJiVDFstMw7+laLedFc4
         LiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434682; x=1749039482;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Czkh2eiy3JDb3m73xx6orfFUPs2gcH1GVKp66Ebvzo0=;
        b=it3XFoV6e5yA96cB0gXUwm76z00rUfwS0A/mq+sdhr4WH9RqXbDmxDx/Tt5J66zo65
         SsPbPiUIGfmbevbr4fQxBY/CZhp0StsYfYhGy79+iKkynPZFiKQOXddwdQvzVODH8v4J
         6jbg0cUPXRTOC+k2oFWS4pmhcCzY3ZPHBRgAiEb5tjumAufuDh1hxGzYtkGvEACygXjZ
         l+Wvk3D3xBEKZSkLd/o8okvJO/7a1G915d4Vc81h4ZgLaCWq7Ezjw1eFBUuPCFS+RmYK
         cb5W1Tn1Fh/SX13ZJwrooUfPOcZIjH4jYLHU6JwavKABoPCbMIVS4EAzAFwNln5HhFZ4
         WGxw==
X-Forwarded-Encrypted: i=1; AJvYcCXT5KpdR68F09i6Gc/1Z7qVAgLs78lonfmPXJ5N+nIksQMi9GIMzOW7fMOCYNP6x6NuWPJzUe/JkoSZhc+9r1OvNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7PP+cnx6oK7wAjBuf8rXOpwMBJ7lnSLk4neoJSxO/4Rs9mBeY
	EilP6wBMQbFZnlN0AzjDIZWaEllMUcn1mMsZ4aGaD4W7EYIgxpM0ifOyhW6Cj0ThvRQ=
X-Gm-Gg: ASbGncutADnfW7EDEokhp0k0JuyIHRsFEstlyd0c/IWRC96sMPvIyjrQXU0oWaQ6cPI
	khhJD6krQGBHWYQNun8ROP8B9xd7YrgDm65iNvrtqyBb+fPgvGgaf4zmUouIdNSCgGiqf/6TfJ8
	gWKpBdCxT2wXvbcJeu6IDgwwJ9fNTXGCbT60z2brvTyJlSivk5Vog6cguIAC84KR8l+OTQQG8JT
	aOj6Sl9s6OSv+MgBfvRkQKqu0PdamHU6wMy+q/eU164yIvEo8zcF5YcIVGIm59fFcdES46/q42M
	Y4w3ks5cUk52s1y1A1aEXUZmS/uJfYNO/pXQOtlDUy6936V/6fuQrmw51RYU
X-Google-Smtp-Source: AGHT+IGHXn3zqknO36gBf8PaX89e3/ePAXgcVcgxllkFHzTmZEbELsbeXb7EHFul04jlQLhl2pkr3Q==
X-Received: by 2002:a17:907:728d:b0:ad5:a210:a3ef with SMTP id a640c23a62f3a-ad85b1de305mr1817768266b.45.1748434682253;
        Wed, 28 May 2025 05:18:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19accc3sm98836266b.9.2025.05.28.05.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:18:01 -0700 (PDT)
Message-ID: <111d2d6c-8ac0-40b9-94c3-02f2f64ef9fe@tuxon.dev>
Date: Wed, 28 May 2025 15:18:00 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] PM: domains: Add devres variant for
 dev_pm_domain_attach()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 len.brown@intel.com, pavel@kernel.org, ulf.hansson@linaro.org,
 jic23@kernel.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, bhelgaas@google.com,
 geert@linux-m68k.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
 <20250526122054.65532-2-claudiu.beznea.uj@bp.renesas.com>
 <hojdkntm3q5a5ywya7n5i4zy24auko4u6zdqm25infhd44nyfx@x2evb6sc2d45>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <hojdkntm3q5a5ywya7n5i4zy24auko4u6zdqm25infhd44nyfx@x2evb6sc2d45>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Dmitry,

On 28.05.2025 00:27, Dmitry Torokhov wrote:
> Hi Claudiu,
> 
> On Mon, May 26, 2025 at 03:20:53PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The dev_pm_domain_attach() function is typically used in bus code alongside
>> dev_pm_domain_detach(), often following patterns like:
>>
>> static int bus_probe(struct device *_dev)
>> {
>>     struct bus_driver *drv = to_bus_driver(dev->driver);
>>     struct bus_device *dev = to_bus_device(_dev);
>>     int ret;
>>
>>     // ...
>>
>>     ret = dev_pm_domain_attach(_dev, true);
>>     if (ret)
>>         return ret;
>>
>>     if (drv->probe)
>>         ret = drv->probe(dev);
>>
>>     // ...
>> }
>>
>> static void bus_remove(struct device *_dev)
>> {
>>     struct bus_driver *drv = to_bus_driver(dev->driver);
>>     struct bus_device *dev = to_bus_device(_dev);
>>
>>     if (drv->remove)
>>         drv->remove(dev);
>>     dev_pm_domain_detach(_dev);
>> }
>>
>> When the driver's probe function uses devres-managed resources that depend
>> on the power domain state, those resources are released later during
>> device_unbind_cleanup().
>>
>> Releasing devres-managed resources that depend on the power domain state
>> after detaching the device from its PM domain can cause failures.
>>
>> For example, if the driver uses devm_pm_runtime_enable() in its probe
>> function, and the device's clocks are managed by the PM domain, then
>> during removal the runtime PM is disabled in device_unbind_cleanup() after
>> the clocks have been removed from the PM domain. It may happen that the
>> devm_pm_runtime_enable() action causes the device to be runtime-resumed.
>> If the driver specific runtime PM APIs access registers directly, this
>> will lead to accessing device registers without clocks being enabled.
>> Similar issues may occur with other devres actions that access device
>> registers.
> 
> I think you are concentrating too much on runtime PM aspect of this. As
> you mentioned in the last sentence the same issue may happen in the
> absence of runtime PM if the power domain code will shut down the device
> while it is not fully cleaned up.

I see your point. Just wanted to describe the scenario that leads to this
patch.

> 
>>
>> Add devm_pm_domain_attach(). When replacing the dev_pm_domain_attach() and
>> dev_pm_domain_detach() in bus probe and bus remove, it ensures that the
>> device is detached from its PM domain in device_unbind_cleanup(), only
>> after all driver's devres-managed resources have been release.
>>
>> For flexibility, the implemented devm_pm_domain_attach() has 2 state
>> arguments, one for the domain state on attach, one for the domain state on
>> detach.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - none; this patch is new
>>
>>  drivers/base/power/common.c | 59 +++++++++++++++++++++++++++++++++++++
>>  include/linux/pm_domain.h   |  8 +++++
>>  2 files changed, 67 insertions(+)
>>
>> diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
>> index 781968a128ff..6ef0924efe2e 100644
>> --- a/drivers/base/power/common.c
>> +++ b/drivers/base/power/common.c
>> @@ -115,6 +115,65 @@ int dev_pm_domain_attach(struct device *dev, bool power_on)
>>  }
>>  EXPORT_SYMBOL_GPL(dev_pm_domain_attach);
>>  
>> +/**
>> + * devm_pm_domain_detach_off - devres action for devm_pm_domain_attach() to
>> + * detach a device and power it off.
>> + * @dev: device to detach.
>> + *
>> + * This function reverse the actions from devm_pm_domain_attach().
>> + * It will be invoked during the remove phase from drivers implicitly.
>> + */
>> +static void devm_pm_domain_detach_off(void *dev)
>> +{
>> +	dev_pm_domain_detach(dev, true);
>> +}
>> +
>> +/**
>> + * devm_pm_domain_detach_on - devres action for devm_pm_domain_attach() to
>> + * detach a device and power it on.
>> + * @dev: device to detach.
>> + *
>> + * This function reverse the actions from devm_pm_domain_attach().
>> + * It will be invoked during the remove phase from drivers implicitly.
>> + */
>> +static void devm_pm_domain_detach_on(void *dev)
>> +{
>> +	dev_pm_domain_detach(dev, false);
>> +}
>> +
>> +/**
>> + * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
>> + * @dev: Device to attach.
>> + * @attach_power_on: Use to indicate whether we should power on the device
>> + *                   when attaching (true indicates the device is powered on
>> + *                   when attaching).
>> + * @detach_power_off: Used to indicate whether we should power off the device
>> + *                    when detaching (true indicates the device is powered off
>> + *                    when detaching).
>> + *
>> + * NOTE: this will also handle calling dev_pm_domain_detach() for
>> + * you during remove phase.
>> + *
>> + * Returns 0 on successfully attached PM domain, or a negative error code in
>> + * case of a failure.
>> + */
>> +int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
>> +			  bool detach_power_off)
> 
> Do we have examples where we power on a device and leave it powered on
> (or do not power on device on attach but power off it on detach)? I

I haven't found one yet.

> believe devm release should strictly mirror the acquisition, so separate
> flag is not needed.

I was in the middle whether I should do it with 2 flags or only to revert
the acquisition.

> 
> 
>> +{
>> +	int ret;
>> +
>> +	ret = dev_pm_domain_attach(dev, attach_power_on);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (detach_power_off)
>> +		return devm_add_action_or_reset(dev, devm_pm_domain_detach_off,
>> +						dev);
>> +
>> +	return devm_add_action_or_reset(dev, devm_pm_domain_detach_on, dev);
> 
> Instead of 2 separate cleanup methods maybe define dedicated devres:
> 
> struct dev_pm_domain_devres {
> 	struct device *dev;
> 	bool power_off;
> }
> 
> ?

That was the other option I've thought about but I found the one with 2
cleanup methods to be simpler. What would you prefer here?

Ulf: could you please let me know what would you prefer here?

> 
>> +}
>> +EXPORT_SYMBOL_GPL(devm_pm_domain_attach);
>> +
>>  /**
>>   * dev_pm_domain_attach_by_id - Associate a device with one of its PM domains.
>>   * @dev: The device used to lookup the PM domain.
>> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
>> index 0b18160901a2..ee798b090d17 100644
>> --- a/include/linux/pm_domain.h
>> +++ b/include/linux/pm_domain.h
>> @@ -509,6 +509,8 @@ struct device *dev_pm_domain_attach_by_name(struct device *dev,
>>  int dev_pm_domain_attach_list(struct device *dev,
>>  			      const struct dev_pm_domain_attach_data *data,
>>  			      struct dev_pm_domain_list **list);
>> +int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
>> +			  bool detach_power_off);
>>  int devm_pm_domain_attach_list(struct device *dev,
>>  			       const struct dev_pm_domain_attach_data *data,
>>  			       struct dev_pm_domain_list **list);
>> @@ -539,6 +541,12 @@ static inline int dev_pm_domain_attach_list(struct device *dev,
>>  	return 0;
>>  }
>>  
>> +static int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
> 
> Needs to be marked "inline".

Will do!

Thank you for your review,
Claudiu

> 
>> +				 bool detach_power_off)
>> +{
>> +	return 0;
>> +}
>> +
>>  static inline int devm_pm_domain_attach_list(struct device *dev,
>>  					     const struct dev_pm_domain_attach_data *data,
>>  					     struct dev_pm_domain_list **list)
> 
> Thanks.
> 


