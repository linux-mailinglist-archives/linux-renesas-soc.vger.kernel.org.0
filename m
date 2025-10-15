Return-Path: <linux-renesas-soc+bounces-23046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B19BDD584
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 10:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 915FD192530A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 08:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6422D7DFE;
	Wed, 15 Oct 2025 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l7HzU/zU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A0D2C237E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760516382; cv=none; b=eDFUDvzLbQj1e991laG5nAUmFzVFCeulunmWCJRub91/HYzpus5bmzZ0ZkFx+ERmdPQiqjs/j7uZaVIzefvAKXLFkHgJ2XjOO7roXNnAzVynDNPkVZH8RaGaSpybuCHWeVhmG2XI2jCvamz5dq8zyyelU4DOgWaqMCfv4fLHSRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760516382; c=relaxed/simple;
	bh=WkSHbQXCPDqpXetRB1ukOSkjAVefKFWsDstqnzdpd9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAa06fc1YVC6g+a7qMwAqQirYvgBd0UUTsI9U/B44k/d6tTFC9GSz+swBLrA6hvW1+rjEpSwsPzAGhKcbPL2ptKdW3hVuwRozu0gdGzQmxWdLiQYt1tE0vCoAuSEoCfkmmnjfV2QjQR+oU1f32WzL1PCfyt4S+/hv88aea2YcjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l7HzU/zU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso1025508266b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760516378; x=1761121178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KneEMScoa9FWAqTtx3ph1+7zePLdAas+6JTV1uYXUY=;
        b=l7HzU/zU4dCdtyyD82rt8h1r5fXVq94kwZic6KgrzT4j/CzDETn5lIqqyQHJIYYMMh
         JbSJRyMIcJvRHiGD9kbB6WYxtVVdpVMsKeAg8Yhx+vnFFsQ8MZL+DR9XHOqUOBZxhPXm
         69clutJjeVCtmAeLwtlDH7ukJvpxVtHU8eok4Ow4MB87zcuHlzUAaIIzmbrrpzREV/NC
         jcpeQkkDCt4qXjMCsS4mehpV7dKsizriMCtI1b8xcBekAVDR/qdC8y5HM6uWbMvWtlCZ
         9f4hHdcyWRmLYXYyzMkwwEcbHvU+QgXW1vLm3kto8P6M40gtif8p7LA1myR+rpGpUEQW
         c0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760516378; x=1761121178;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KneEMScoa9FWAqTtx3ph1+7zePLdAas+6JTV1uYXUY=;
        b=K+uP2LlK6P/QEnqQGXuhdD3V/Ymbt7kvnng3G7i7EsrOXmKPZiD6OnT4upG6GuJwmr
         fv83o03U8/UnSBrUUClCqebkO24bKZckaPRoWbOsSk8tktX6LZ6jsZsJHUEF/NCv3Y1E
         WYEXzk4pQlPsx+/QhboMT8uLG6c8175jwahruZYyLHg/+9OCC/B19c9m9Szeiq029Dkq
         Wo5q2lb1/mL0ZrGpwe0V8UWVUz+AjwVs1BgzMmyjEkZff5XoO89wv0/L07+gSf5OYfiZ
         B8l2bdwikQ8Ci1UxwDzK0GQ+ZYydGD7KsGdgQWdR3r7x7SPWjkwf81q+KlZuRYqpY24N
         PCcw==
X-Forwarded-Encrypted: i=1; AJvYcCW4MO3LAe1KTfRa62iV9qz8WZ5ukXB8BYaIHiVlRbIZUe3ampSIcbmsem/gKQRZts3PbfbiBvMPX44W7f5erfRmhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBW6+lvmj8va2gf1iH5KV8iTqs+YXffhI57l2gkpb8PxTOjyCH
	IXDE97BFiPjqa63qMHwaqj8b1abeQ1Es0ssUM4SmHXpL6hB7nsKykhoJ3e9NYxR3XJ4=
X-Gm-Gg: ASbGncuy/cq0JbgY+tX93lfOwFpExte8dwvrTpg0ELSVybW06+RejGFEcDwjOfllkp/
	nFrt1Swc5YgBIsKtYThVlPrk+Ybc7OvflMSK7bVAeOlbdM0QCUWvGkXW+a6G7ShwxZH5db/DkKH
	zrObI2rJgneG5CLXw1VBYk7vGv648MxfYIIN/mRV11rJjxraK+fH8m7J8F3JYl5NFVzlM1fRojd
	esGWYribfGEA1OT0+r8cJtLaW/AgzTQc4Sx4ymRwYe+npbQOQmtgpaKNLnCpryeV9HlVmDdqeA5
	yLMD4vPCwJ5u9haAMQqa35+CIJWByNANzmoKZBqZa4z6P0TdEqYofCCBK5IQEAl747yAap4keRI
	ITmBfOiNZpG+UB0tQxodDdk+gU1E5bzcQQLJGCpBPy+a0bT1DMQ==
X-Google-Smtp-Source: AGHT+IEVkjo7z+13pgEMw8ki/r0mUSZhrjZCaI1xrW40+u9DWDfR3ebpJtSBjpXr8BzCEh4v3qtFoA==
X-Received: by 2002:a17:907:72cf:b0:b04:61aa:6adc with SMTP id a640c23a62f3a-b50aa69e311mr2948870066b.7.1760516377814;
        Wed, 15 Oct 2025 01:19:37 -0700 (PDT)
Received: from [10.95.0.194] ([213.233.104.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd39b7d8sm166061566b.69.2025.10.15.01.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:19:37 -0700 (PDT)
Message-ID: <19746f65-bf10-4687-9e2b-b259220a9ea8@tuxon.dev>
Date: Wed, 15 Oct 2025 11:19:34 +0300
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
 <77678dd6-071b-4911-a5c5-f1519c92e91a@tuxon.dev>
 <6ba1fd1f07753c9b98a57c87bffbbee16971da7a.camel@pengutronix.de>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <6ba1fd1f07753c9b98a57c87bffbbee16971da7a.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Philipp,

On 10/14/25 19:42, Philipp Zabel wrote:
> Hi Claudiu,
> 
> On Di, 2025-10-14 at 11:36 +0300, Claudiu Beznea wrote:
>> On 10/13/25 17:57, Philipp Zabel wrote:
> [...]
>>>>> On 10/8/25 13:23, Philipp Zabel wrote:
>>>>>> On Mi, 2025-10-08 at 12:29 +0300, Claudiu Beznea wrote:
> [...]
>>>>>>> The approaches considered were:
>>>>>>> a/ power domain
> [...]
>>>>>> Could you point me to the discussion related to a?
> [...]
>>> Thank you! From this discussion it still isn't clear to me whether
>>> Ulf's suggestion of using genpd on/off notifiers was considered and why
>>
>> The genpd on/off notifier suggestion wasn't tried, but only the
>> implementation of PWRRDY handling through the power domain (what Ulf
>> suggested though "Move the entire reset handling into the PM domain
>> provider, as it obviously knows when the domain is getting turned on/off"
>> in
>> https://lore.kernel.org/all/fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev/).
>> Sorry if I mislead you.
> 
> No worries, misunderstandings happen. Here I assumed the "power domain
> approach" meant letting the PWRRDY signal be controlled by power domain
> state, not specifically all code in the power domain driver.

I had a power domain driver implemented with its own genpd::power_{on,
off}, where the PWRRDY bit was set. I just pushed a branch here [1] with my
trials if you would like to check.

[1] https://github.com/claudiubeznea/linux/tree/usb-bringup%2Bpm-domain-v0

> And I only
> learned about the genpd notifier suggestion after reading the thread.
> 
>> Ulf suggested then here
>> https://lore.kernel.org/all/CAPDyKFpLnREr4C=wZ7o8Lb-CZbQa4Nr2VTuYdZHZ26Rcb1Masg@mail.gmail.com/
>> that he is not agreeing anymore with having it as power domain due to the
>> discussion in thread
>> https://lore.kernel.org/all/TY3PR01MB1134652F9587CFA0ADE851CA486902@TY3PR01MB11346.jpnprd01.prod.outlook.com/
>> (I can't remember what made him taking back is ack on this solution and I
>> can't find something in the thread either).
>>
>> If I'm not wrong, with the information that we have at the moment, the best
>> for the notifier would have to register it (before runtime resume) and
>> implement it in this driver (reset-rzg2l-usbphy-ctrl) so that, when the
>> pm_runtime_resume_and_get()/pm_runtime_put() in
>> rzg2l_usbphy_ctrl_probe()/rzg2l_usbphy_ctrl_remove() will be called (or
>> suspend/resume) the notifier will be called and set the PWRRDY bit. Please
>> let me know if you see it otherwise.
> 
> That sounds like a clean abstraction to me.
> 
>>> it was dismissed.
>>
>> The power domain approach was dismissed as a result of discussion from this
>> thread:
>> https://lore.kernel.org/all/TY3PR01MB1134652F9587CFA0ADE851CA486902@TY3PR01MB11346.jpnprd01.prod.outlook.com/
>>
>> I don't remember exactly what triggered it and can't find it as well, sorry.
> 
> Ok.
> 
>>> From the DT patches it looks like there is no actual separate power
>>> domain for USB, just the single always-on CPG power domain (in rzg2l-
>>> cpg.c). Is that correct?
>>
>> That is correct, the CPG is a clock power domain. All the clocks that CPG
>> can be provided (including USB clocks) are part of CPG clock power domain.
>>
>>> In the thread it sounded like there were
>>> multiple domains.
>>
>> You probably refer to this:
>> https://lore.kernel.org/all/fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev/
> 
> Yes, I was confused by this sentence near the end: "And the USB SYSC PM
> domain is parent for all USB PM domains provided by CPG (3 in this
> case)."

There were 2 approaches that I've tried with power domain:

1/ to provide both (cpg and PWRRDY) power domains phandle to the
   reset-rzg2l-usbphy-ctrl DT node as:

power-domains = <&cpg R9A08G045_PD_USB_PHY>, <&sysc R9A08G045_SYSC_PD_USB>;

   branch at [1] is for this approach (except, in there the cpg was used as
   an always on power domain, not providing individual controls for each
   IP, due to early implementation of MSTOP (please see above))

2/ to provide a single power domain phandle to the reset-rzg2l-usbphy-ctrl
   DT node, that being the power domain that handled the PWRRDY, and to
   model the PWRRDY-CPG power domains parent-child relation in the driver
   code (as can be seen in commit 7788bcbc3ebe ("initial") from [2], files:
   - arch/arm64/boot/dts/renesas/r9a08g045.dtsi
   - drivers/clk/renesas/r9a08g045-cpg.c, diff:

+       DEF_PD("usb",           RZG3S_PD_USB,
+                               DEF_REG_CONF_COOKIE(SYS_USB_PWRRDY, BIT(0),
RZG3S_FW_SIP_ID),
+                               RZG2L_PD_PARENT_DEFAULT, RZG2L_PD_F_NONE),
+       DEF_PD("usb0",          R9A08G045_PD_USB0,
+                               DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP,
GENMASK(6, 5)),
+                               RZG2L_PD_PARENT_USB, RZG2L_PD_F_NONE),
+       DEF_PD("usb1",          R9A08G045_PD_USB1,
+                               DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(7)),
+                               RZG2L_PD_PARENT_USB, RZG2L_PD_F_NONE),
+       DEF_PD("usb-phy",       R9A08G045_PD_USB_PHY,
+                               DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(4)),
+                               RZG2L_PD_PARENT_USB, RZG2L_PD_F_NONE),

   - drivers/clk/renesas/rzg2l-cpg.c

Please note that code in [2] is ugly.

By "And the USB SYSC PM domain is parent for all USB PM domains provided by
CPG (3 in this case)." I was referring to the solution 2/, implemented in
branch at [2]

Also, few other aspects that I missed to mention in this discussion, which
are important for the genpd notifier approach:

a/ by the time v1 was posted the MSTOP for each IP was abstracted as a
   power domain; at that time the MSTOP was implemented as power domain
   only in the drivers but it wasn't enabled in device tree due to some
   bugs in the watchdog driver

b/ as a result of discussions with Renesas HW team on the USB PWRRDY it was
   revealed that MSTOP must be strictly configured after/before clocks
   enable/disable. Due to this, the MSTOP power domain abstraction was
   dropped from the drivers code and now we are with a always on power
   domain (CPG) for all the IPs, that is actually a clock power domain.
   Today the MSTOP is set in the clock enable/disable APIs.

[2] https://github.com/claudiubeznea/linux/tree/usb-pwrrdy-parent-of-cpg-usb

> 
>> In there, I was trying to present to Ulf how I did implement (locally,
>> nothing posted) the handling of PWRRDY though power domains. In that case
>> the SYSC (System Controller), where the PWRRDY resides, was modeled as a
>> power domain, I passed to the reset-rzg2l-usbphy-ctrl DT node the phandle
>> to sysc USB power domain as:
>>
>> power-domains = <&cpg R9A08G045_PD_USB_PHY>, <&sysc R9A08G045_SYSC_PD_USB>;
>>
>> along with the cpg, and handled it in the reset-rzg2l-usbphy-ctrl probe().
> 
> Ok, thank you for the clarification.
> 
>>> Is the issue that you need the PWRRDY signal to be (de)asserted
>>> independently from the CPG power domain enable/disable?
>>
>> Yes. I need to de-assert it before clocks, MSTOP on probe/resume and assert
>> it back after clocks, MSTOP, on remove/suspend.
>>
>>> (Why?)
>>
>> Due to hardware constraints. This is how Renesas HW team recommended.
> 
> I still haven't understood this part. Isn't CPG the power domain
> enabled "before clocks, MSTOP on probe resume" and disabled "after
> clocks, MSTOP, on remove/suspend"? So PWRRDY could be toggled from
> genpd notifications. If it needs to be (de)asserted independently,
> wouldn't that mean the genpd notifier approach can not be used?

I did tried on my side yesterday evening to prototype the genpd notifier
solution and, yes, you are right.

Because CPG is an always on clock power domain, shared by all it's clocks,
the _genpd_power_on(), where the notifier are invoked, is called only when
the 1st clock in the system is enabled, as there is genpd_status_on() check
in genpd_power_on(), which I missed when I inspected the code yesterday,
when replying to your email.

Because of this, you're right, we can't use the genpd notifier for this,
either.

> The notifiers are called from genpd_power_on/off(), after all.
> 
>>> Why can't the power domain provider (cpg) have the renesas,sysc-pwrrdy
>>> property and set the signal together with the power domain?
>>
>> That can be done but, passing a SYSC phandle to the CPG DT node will not be
>> valid from the HW description point of view.
>>
>>>>>> I see v2 and v3 tried to control the bit from the PHY drivers, and in
>>>>>> v4 we were are already back to the reset driver.
>>>>> v2 passed the system controller (SYSC) phandle to the USB PHYs only (though
>>>>> renesas,sysc-signals DT property) where the PWRRDY bit was set. The PWRRDY
>>>>> bit was referenced counted in the SYSC driver though regmap APIs.
>>>>>
>>>>> v3 used the approach from v2 but passed the renesas,sysc-signals to all the
>>>>> USB related drivers.
>>>>>
>>>>> Then, in v4, the PWRRDY refcounting was dropped and passed
>>>>> renesas,sysc-signals only to the USB PHY CTRL DT node in the idea that this
>>>>> is the node that will always be probed first as all the other USB blocks
>>>>> need it and request resets from it.
>>>>>
>>>>> v5 and v6 kept the approach from v4 and only addressed misc comments or
>>>>> things that I noticed.
>>>>
>>>> Could you please let me know if you are OK with the approach proposed in
>>>> v7, so that I can start preparing a new version addressing your comments?
>>>
>>> If the PWRRDY signal is an input to the USB2PHY control block, and not
>>> only to the PHY blocks, I have no issue with this being handled in the
>>> usb2phy reset driver -
>>
>> Yes, this is how the Renesas HW team confirmed they are related.
> 
> Ok, understood. I concur that usb2phy-ctrl is the right place for the
> sysc property then.
> 
>>> iff it is not sensible to just control the
>>> signal from the power domain driver.
>>
>> As mentioned above, that can be done as well but, passing a SYSC phandle to
>> the CPG DT node will not be valid from the HW description point of view.
>>
>>> If we have to handle it in the reset driver, I'd prefer to see this
>>> controlled with a dev_pm_genpd_add_notifier(). If that is not possible,
>>> I'd like to understand why.
>>
>> From the code inspection I did, that can be done. From what I can tell at
>> the moment, I'll have to register a gepnd notifier from
>> reset-rzg2l-usbphy-ctrl, before runtime resuming the device and control the
>> SYSC PWRRDY from it.
> 
> I'd like that.

Now, that we found the genpd notifier is not a solution, could you please
let me know how would you like me to proceed?

Thank you,
Claudiu

