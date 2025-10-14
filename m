Return-Path: <linux-renesas-soc+bounces-22995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D660BBD8359
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 10:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE8FD4FA97F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804A230FC2E;
	Tue, 14 Oct 2025 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="a9yqRzVX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FE030F944
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430993; cv=none; b=N1DSu0TzvTaZsgDVsqwTtr7UMk0UcHvXCuqGjsiyhN8ZQaXEFitooORKSDxt7bYNsDLRbtn2l77z3M6qsqSXW4yp5PG7afCzRzWUSQbNY19ALtmQupbnzXzuKCP6rQRiM8bwMW7cC4heYwiU6d6FhFlU19O3VJ4xvMQE2euL5yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430993; c=relaxed/simple;
	bh=Xh/kUK5T9kJ6Cbz+nFC0i46j/3AHrwV0ngZ1Qyt0Mu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnLO+OsYSlalojphvA+6f5IwlcRKKciUAELPxPFno3xUdYBkx1PEuarKJJk3vCwNEi3qMtaA9GfusuOvBweeVMzZt5SLFFnaqDHd2Bhq95c5Jm2bqiQVIC9atXQteLxnpnAYnWDjF/ais0g7jqUqY1qNMKK6XQ2teOtXz/idBnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=a9yqRzVX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso30264335e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760430990; x=1761035790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PlCr4KtCOqjtwAQHsCr8GzfdPPkJghN91drUl4fH4VI=;
        b=a9yqRzVXzWLMhpedTvZDh/wEfCw9hTp5ECBFkZSIxmZesE9Tdmk6K2edhD3Du6RkVn
         1uU1kqpXn7qNuPYB7xdzIDL+Rv3El6ABCjI+nhaE0r355LOyty6g1opG5mnQQZnJsvvW
         GsnZE7DMyOQEbGzgW56Gd1KE1qNxPZ+mYd+ZsWOm4tXCuKh8WWSfuX3WRan1c1enbIwk
         U25HqTWNb6KxOFglPw86JNBEC/Xs+YGrvb3LIY/v4gB8/8wGJvY7zo39LtYtkVg7Exxm
         imvh36G3hRBdYqjDTPhr114NUxxR74pKSsNS89Rq2bC1csTcpW40EpZ8X8ct2ZGUf/Ha
         mx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430990; x=1761035790;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlCr4KtCOqjtwAQHsCr8GzfdPPkJghN91drUl4fH4VI=;
        b=LxCS8w32aVyiOBvciCgIo+lV5AXVAUWkuWavUILcV+K6NNTRwmv8q7SNB/NHhaG9MM
         gOHhpm0AxuNxraW+HTWBEx3ViyjIboAX5ArUKw4SKkloKcWzBWS3URFI+Zsxc9o851ob
         Y5GbgtwxTwIHxRDvo+lMky79OHcN52gmqPHhhOLmzYFoj2KdHcwV5DGsGASpuIjFYyo0
         GMBeqsScRyVY37RgJ39dtAd2ZvfXb67ynhAb6jupgGNTsFEuOgH/iAkxyH5N6hm+uRw+
         M3QO+JW8bynE8UX1T1ONKmE9MSw5o+hONoIHFpwB2qQfydK4P+zy6bgLLaQkPf9rD5kd
         290Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtvycR6pLCdyYq5IDENQ4YLHdwZyJCi1+InSaYH0vKf5rmzEXYVAgn1n5mrDREwGMOUdSajtFNUr4o0/29tCZNUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0eAV93TNPEjq7I00hw38fiynSMEuqWM84FcrIlgJVcA4du2PK
	dp2G9wb/PDGD0U6rV9wZIIQ2YYF4drmMcdGaiW11XqzeC8+j0FpUquYpizkZHgMfcu8=
X-Gm-Gg: ASbGncthd9F9Z/QzvUNOCT4lcsf1iwD60S4kOIc8SqorsK3vDvDAyYFavW69k+QhGuz
	0w+UgJRNnraLOd5byZcwg39YY5uLlhtQPjiYUFx18yg378YGwzqGqQxGnH/ioGo3yBjHRrb/JS/
	DsvrMU9tg62oAB7azUj3KnrpnkbZE4p562hDI0/l9wd84w0d1Z/LOiuVVAp+LR5/AIDKke9gfOG
	0X8XZUP5Dl2Jb3URa7W4JT69Hzdm9dhOxlbS56u+rvoZS2Ax2ybPQYyfVpbjILcknMzzZ2W5h3J
	ui5NrHCw3+NJ7xZwjgeVA1VDrwQKfjVheS0NybYVLgbfYxcgPxZz5YouhB8psdMB6wyncgRZyZ8
	AkbMqknn01WG3gfbff0AjneN+/oXp4psd3i+QL1KqRIFRPPFQKY6gynNlK4g=
X-Google-Smtp-Source: AGHT+IHvca3H/eoAiSfXW7AaqB6vZ9CVuxlAXPqbLcEH7dPAWw/TAns0mWyDT3g0uw99AA+D6AEn0w==
X-Received: by 2002:a05:600c:8206:b0:46e:19f8:88d3 with SMTP id 5b1f17b1804b1-46fa9af313bmr162991485e9.22.1760430989453;
        Tue, 14 Oct 2025 01:36:29 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e8b31sm22554601f8f.54.2025.10.14.01.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:36:28 -0700 (PDT)
Message-ID: <77678dd6-071b-4911-a5c5-f1519c92e91a@tuxon.dev>
Date: Tue, 14 Oct 2025 11:36:27 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] reset: rzg2l-usbphy-ctrl: Add support for USB
 PWRRDY
To: Philipp Zabel <p.zabel@pengutronix.de>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
 <20250925100302.3508038-5-claudiu.beznea.uj@bp.renesas.com>
 <c7fc31f1247332196516394a22f6feef9733a0b4.camel@pengutronix.de>
 <66d85e70-efb8-4a45-9164-55b123691b70@tuxon.dev>
 <bcf6113b0025777db1cb2ace1618fed8fac2dfc6.camel@pengutronix.de>
 <cca1061e-df67-4b5b-99bd-9721c72a0f88@tuxon.dev>
 <6d4bc69c-1571-4d98-b0d4-214c68be118e@tuxon.dev>
 <c1099a8e422abbc5d12bf3f325cb9f2140c8c006.camel@pengutronix.de>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <c1099a8e422abbc5d12bf3f325cb9f2140c8c006.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Philipp,

On 10/13/25 17:57, Philipp Zabel wrote:
> Hi Claudiu,
> 
> On Fr, 2025-10-10 at 14:26 +0300, Claudiu Beznea wrote:
>> Hi, Philipp,
>>
>> On 10/8/25 15:16, Claudiu Beznea wrote:
>>> Hi, Philipp,
>>>
>>> On 10/8/25 13:23, Philipp Zabel wrote:
>>>> Hi Claudiu,
>>>>
>>>> On Mi, 2025-10-08 at 12:29 +0300, Claudiu Beznea wrote:
>>>>> Hi, Philipp,
>>>>>
>>>>> On 10/8/25 11:34, Philipp Zabel wrote:
>>>>>> Hi Claudiu,
>>>>>>
>>>>>> On Do, 2025-09-25 at 13:02 +0300, Claudiu wrote:
>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>
>>>>>>> On the Renesas RZ/G3S SoC, the USB PHY block has an input signal called
>>>>>>> PWRRDY. This signal is managed by the system controller and must be
>>>>>>> de-asserted after powering on the area where USB PHY resides and asserted
>>>>>>> before powering it off.
>>>>>>>
>>>>>>> On power-on the USB PWRRDY signal need to be de-asserted before enabling
>>>>>>> clock and switching the module to normal state (through MSTOP support). The
>>>>>>> power-on configuration sequence
>>>>>> The wording makes me wonder, have you considered implementing this as a
>>>>>> power sequencing driver?
>>>>> No, haven't tried as power sequencing. At the moment this was started I
>>>>> think the power sequencing support wasn't merged.
>>>>>
>>>>> The approaches considered were:
>>>>> a/ power domain
>>>> Letting a power domain control a corresponding power ready signal would
>>>> have been my first instinct as well.
>>>>
>>>>> b/ regulator
>>>>> c/ as a reference counted bit done through regmap read/writes APIs
>>>>>
>>>>> a and b failed as a result of discussions in the previous posted versions.
>>>> Could you point me to the discussion related to a?
>>> It's this one
>>> https://lore.kernel.org/all/
>>> CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com/
> 
> Thank you! From this discussion it still isn't clear to me whether
> Ulf's suggestion of using genpd on/off notifiers was considered and why

The genpd on/off notifier suggestion wasn't tried, but only the
implementation of PWRRDY handling through the power domain (what Ulf
suggested though "Move the entire reset handling into the PM domain
provider, as it obviously knows when the domain is getting turned on/off"
in
https://lore.kernel.org/all/fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev/).
Sorry if I mislead you.

Ulf suggested then here
https://lore.kernel.org/all/CAPDyKFpLnREr4C=wZ7o8Lb-CZbQa4Nr2VTuYdZHZ26Rcb1Masg@mail.gmail.com/
that he is not agreeing anymore with having it as power domain due to the
discussion in thread
https://lore.kernel.org/all/TY3PR01MB1134652F9587CFA0ADE851CA486902@TY3PR01MB11346.jpnprd01.prod.outlook.com/
(I can't remember what made him taking back is ack on this solution and I
can't find something in the thread either).

If I'm not wrong, with the information that we have at the moment, the best
for the notifier would have to register it (before runtime resume) and
implement it in this driver (reset-rzg2l-usbphy-ctrl) so that, when the
pm_runtime_resume_and_get()/pm_runtime_put() in
rzg2l_usbphy_ctrl_probe()/rzg2l_usbphy_ctrl_remove() will be called (or
suspend/resume) the notifier will be called and set the PWRRDY bit. Please
let me know if you see it otherwise.

> it was dismissed.

The power domain approach was dismissed as a result of discussion from this
thread:
https://lore.kernel.org/all/TY3PR01MB1134652F9587CFA0ADE851CA486902@TY3PR01MB11346.jpnprd01.prod.outlook.com/

I don't remember exactly what triggered it and can't find it as well, sorry.

> 
> From the DT patches it looks like there is no actual separate power
> domain for USB, just the single always-on CPG power domain (in rzg2l-
> cpg.c). Is that correct?

That is correct, the CPG is a clock power domain. All the clocks that CPG
can be provided (including USB clocks) are part of CPG clock power domain.

> In the thread it sounded like there were
> multiple domains.

You probably refer to this:
https://lore.kernel.org/all/fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev/

In there, I was trying to present to Ulf how I did implement (locally,
nothing posted) the handling of PWRRDY though power domains. In that case
the SYSC (System Controller), where the PWRRDY resides, was modeled as a
power domain, I passed to the reset-rzg2l-usbphy-ctrl DT node the phandle
to sysc USB power domain as:

power-domains = <&cpg R9A08G045_PD_USB_PHY>, <&sysc R9A08G045_SYSC_PD_USB>;

along with the cpg, and handled it in the reset-rzg2l-usbphy-ctrl probe().

> 
> Is the issue that you need the PWRRDY signal to be (de)asserted
> independently from the CPG power domain enable/disable?

Yes. I need to de-assert it before clocks, MSTOP on probe/resume and assert
it back after clocks, MSTOP, on remove/suspend.

> (Why?)

Due to hardware constraints. This is how Renesas HW team recommended.

> 
> Why can't the power domain provider (cpg) have the renesas,sysc-pwrrdy
> property and set the signal together with the power domain?

That can be done but, passing a SYSC phandle to the CPG DT node will not be
valid from the HW description point of view.

> 
>>>> I see v2 and v3 tried to control the bit from the PHY drivers, and in
>>>> v4 we were are already back to the reset driver.
>>> v2 passed the system controller (SYSC) phandle to the USB PHYs only (though
>>> renesas,sysc-signals DT property) where the PWRRDY bit was set. The PWRRDY
>>> bit was referenced counted in the SYSC driver though regmap APIs.
>>>
>>> v3 used the approach from v2 but passed the renesas,sysc-signals to all the
>>> USB related drivers.
>>>
>>> Then, in v4, the PWRRDY refcounting was dropped and passed
>>> renesas,sysc-signals only to the USB PHY CTRL DT node in the idea that this
>>> is the node that will always be probed first as all the other USB blocks
>>> need it and request resets from it.
>>>
>>> v5 and v6 kept the approach from v4 and only addressed misc comments or
>>> things that I noticed.
>>
>> Could you please let me know if you are OK with the approach proposed in
>> v7, so that I can start preparing a new version addressing your comments?
> 
> If the PWRRDY signal is an input to the USB2PHY control block, and not
> only to the PHY blocks, I have no issue with this being handled in the
> usb2phy reset driver -

Yes, this is how the Renesas HW team confirmed they are related.

> iff it is not sensible to just control the
> signal from the power domain driver.

As mentioned above, that can be done as well but, passing a SYSC phandle to
the CPG DT node will not be valid from the HW description point of view.

> 
> If we have to handle it in the reset driver, I'd prefer to see this
> controlled with a dev_pm_genpd_add_notifier(). If that is not possible,
> I'd like to understand why.

From the code inspection I did, that can be done. From what I can tell at
the moment, I'll have to register a gepnd notifier from
reset-rzg2l-usbphy-ctrl, before runtime resuming the device and control the
SYSC PWRRDY from it.

Thank you,
Claudiu

