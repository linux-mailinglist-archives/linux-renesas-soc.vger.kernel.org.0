Return-Path: <linux-renesas-soc+bounces-23561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF30C0479E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 08:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 292083A9BE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 06:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBC4266565;
	Fri, 24 Oct 2025 06:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TJS7Eppy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF29625A640
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 06:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286754; cv=none; b=nR9E1Iv8Z5+oPHHNoN4FkLnDqgsNnRZSxILyEFPqb8NrJThENM36TU+60nIXsbkuMVwjE2P+9Ypgew8IZjtyt3yIwQGAVKX5hHb8Mbr5YvqnjQIz8cqz33k/TD+NadFg1MXlFOh/g7ecKgs3EC1f2jk9e7HPeQSAX+8MujDGKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286754; c=relaxed/simple;
	bh=uFBRlYn4H/hc4UUtKo/Zl3Wbu/SALrjPSrHjuWs//RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPvB6sAzzc8+nq/6ZycFzaMe4OfRXXZth6yD68xSr5iCAOAyzNCs+GvrEeh0xCPMt5hppeyKIxV37CCkicNHWnO0yJqZQh5baiCuKKozdRHGjfnBsEpEOkMsCD/or1sVV8RymfNaYE/Zy0oCcsKWmEJ9hgIiB7271kSNBs53WOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TJS7Eppy; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so1588483f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 23:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761286751; x=1761891551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQi3eyYMx2IoRux5VExRaiY1WH0rhtxyzuItrffu2M0=;
        b=TJS7EppyDKLtII6Sz5O7rFol+WL0XwBOnwm2ZBvvj6N0HjHJ3dDtMyApvp3L0UBSjg
         6mNdj/q6Sdh4FLNgntssvLr6ca46lWQ9+4mb4zbaj+pp9TDY7+30KJBiA3TDDTz4n1B5
         FIJyCU93hGVcZ5jm9JV2D7gEJU9ljpqkFWw448RIre+QF8qaQX408bgzrtjjCSIH7lNc
         CeghnirWa/Ub1O+3SYrpspq2lH8r32ZsqsDllLUZ9f2vIVU+Q/JXsFt9iU9sX+RlViwK
         FC+vxTUMVqXB19ZMhJFsRYF2RuwE3K6a54siFl1bCEl888LE4GS146PJRrJQUMCnJGGs
         MP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761286751; x=1761891551;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQi3eyYMx2IoRux5VExRaiY1WH0rhtxyzuItrffu2M0=;
        b=wdiQO7IJgf4ALBiis6y9ZGzsB59THEmip+lGwxX0h/Lpxr/v/sl9FvrCXDH6Y/QR3t
         gsXxu9+DljWONwd8lBXTipL0Qt5HfP4j4uTrZv5wupyKj6DyNxdGtSynf4KiYsD3vvkg
         hCIwFy4nubrSh3qkla5QTkusYlMdj/GRi+19RPh2ffSePWOfkZGse4I9xAfd1yUtyfxE
         DM1sda2o5UehUK7vht83nE3cvm+5V9E2g4XplzXMIU0wkrP/dkmpdlP/DfXpP2oOVsyM
         Ynyq93Yy14FYCp/Q+rUlOkhyOguSC49Ttl1P8AkLcMCIffNrk5KSpkAA6GzVR637Er+t
         bJSw==
X-Forwarded-Encrypted: i=1; AJvYcCVDr8iXqZwj7uo3DQP1IDA/zSB57sisLOMpuKle80MQlNuoau5H2ZfAd7qT+77RGmVPekB5p+tdd+KrDdYnRyL7Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSiK8TnRQpZEZfu1gaYNenaArIDYWI1XoKbOWyxms+m0lqr0UG
	Tqyby2DHQDq+yW5r6vKnZh6CJA3MiI+KjqLmBqhmsTOOKYCoQTYQlsv9MHrNH2TbOyo=
X-Gm-Gg: ASbGncspRaoDzbW2ttKcGZmJdD08AgfuHVvN4scSmsz1YGAPsoZT5V6i0Tp8vKabZRk
	v8lnzMHVCH/Q5rvRHRcF6SJcxowZmhhJ7LN1W4fQ4XjLJXhnazQbJeOnNGcYweIuGcSkmq7DNnF
	tdMRRV4neDXZFiRx1H6tE9Xgt5JPANK6BMCXJo/E/b3bfRgdZQQc0yzy9ym/KiNA+Atj5P10xqu
	83MJpDR8F00vwTlUIaNQdS/7EYLYdij096rtPaw6OdxzQPc9yuKqOs3gA+zDsJ82hPbJJSXoY/e
	3yUwjSKL3YLMeF5QBpc/XviaZO3nhxGRoau1vb4UojClycEPWjNzTgRt4Z38E1x2AQoUSo1bKMk
	8Da3FXEvwnaY+j4p+bPh1DBAugDm7hh8pgT0JON3tubdNUAOJKJxxUG8Lm+9DJ4BYVAdmwQPPLc
	Kh6N5bj0DC
X-Google-Smtp-Source: AGHT+IFRhch1nCNU+qHaY6mVuosWDZbzD+ZNCNBYwS1WBUru2/g0gETbNGkAMA76mLySN+rutX1oyg==
X-Received: by 2002:a05:6000:186d:b0:425:76e3:81c5 with SMTP id ffacd0b85a97d-42704d86bb1mr17597369f8f.17.1761286750563;
        Thu, 23 Oct 2025 23:19:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897ff3f5sm7733618f8f.22.2025.10.23.23.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 23:19:09 -0700 (PDT)
Message-ID: <67f386ad-62d6-4ad7-8906-face362b5ef0@tuxon.dev>
Date: Fri, 24 Oct 2025 09:18:54 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host
 driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20251023155513.GA1292722@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251023155513.GA1292722@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Bjorn,

On 10/23/25 18:55, Bjorn Helgaas wrote:
> On Thu, Oct 23, 2025 at 08:11:17AM +0300, Claudiu Beznea wrote:
>> On 10/22/25 22:49, Bjorn Helgaas wrote:
>>> On Tue, Oct 07, 2025 at 04:36:53PM +0300, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>>> only as a root complex, with a single-lane (x1) configuration. The
>>>> controller includes Type 1 configuration registers, as well as IP
>>>> specific registers (called AXI registers) required for various adjustments.
> 
>>>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>>>
>>>> +#define RZG3S_PCI_MSIRCVWMSKL			0x108
>>>> +#define RZG3S_PCI_MSIRCVWMSKL_MASK		GENMASK(31, 2)
>>>
>>> Unfortunate to have to add _MASK here when none of the other GENMASKs
>>> need it.  Can't think of a better name though.
>>
>> Most of the register offsets and fields defines tried to use the naming
>> from the HW manual. ...
> 
> It's OK as-is.
> 
>>>> +static int rzg3s_pcie_msi_enable(struct rzg3s_pcie_host *host)
>>>> +{
>>>> +	struct platform_device *pdev = to_platform_device(host->dev);
>>>> +	struct rzg3s_pcie_msi *msi = &host->msi;
>>>> +	struct device *dev = host->dev;
>>>> +	const char *devname;
>>>> +	int irq, ret;
>>>> +
>>>> +	ret = devm_mutex_init(dev, &msi->map_lock);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	msi->irq = platform_get_irq_byname(pdev, "msi");
>>>> +	if (msi->irq < 0)
>>>> +		return dev_err_probe(dev, irq ? irq : -EINVAL,
>>>> +				     "Failed to get MSI IRQ!\n");
>>>> +
>>>> +	devname = devm_kasprintf(dev, GFP_KERNEL, "%s-msi", dev_name(dev));
>>>> +	if (!devname)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	ret = rzg3s_pcie_msi_allocate_domains(msi);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = request_irq(msi->irq, rzg3s_pcie_msi_irq, 0, devname, host);
>>>
>>> Should this be devm_request_irq()?  Most drivers use it, although
>>> pci-tegra.c and pcie-apple.c do not.  Maybe there's some special
>>> rule about using request_irq() even though the driver uses devm in
>>> general?  I dunno.
>>
>> In general is not good to mix devm cleanups with driver specific
>> one.
>>
>> As it was requested to drop the devm cleanups from this driver
>> (especially devm_pm_runtime_enable() which enables the also the
>> clocks) I switched the initial devm_request_irq() to request_irq()
>> to avoid keeping the interrupt requested on error path, after
>> driver's probed was executed, until devm cleanups are called, and
>> potentially having it firing w/o hardware resourced being enabled
>> (e.g. clocks), and potentially reading HW registers.
> 
> I couldn't find that request to drop devm,

In v3 and v4 it was requested to drop the devm_add_action_or_reset() who's
purpose was to allow using the currently generalized devm helpers (like
devm_request_threaded_irq()) and don't mix devm cleanup with driver
specific cleanup:

v4 -
https://lore.kernel.org/all/pnph54wv3736lemzren64ig4karlulffkvmc3dzgrhgyv2cpwu@2mcgvlqdr6wu/
v3 -
https://lore.kernel.org/all/ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj/

> and I don't see where
> devm_pm_runtime_enable() enables clocks.

Sorry, I wanted to refer to pm_runtime_resume_and_get() and its devm
cleanup helper implemented in v3, v4:

+	/*
+	 * Controller clocks are part of a clock power domain. Enable them
+	 * through runtime PM.
+	 */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, rzg3s_pcie_pm_runtime_put, dev);
+	if (ret)
+		return ret;


> 
>> E.g., accessing the HW registers while clocks are disabled on the
>> SoC I'm working with leads to synchronous aborts.
>>
>> So, I only kept the devm helpers for memory allocations, resets
>> assert/de-assert and the mutex initialization.
> 
> I'm OK with request_irq() here since you have a good reason.  This
> problem of accessing registers while clocks are disabled sounds
> familiar, so I think other hardware has a similar issue.  It would be
> nice if everybody handled it the same way.
> 
> I don't know enough to identify other similar hardware and see how
> they handled it (or identify drivers that *don't* handle it).  It
> might be worth a one-line comment here to help future code readers.

OK, I'll add a comment on top of request_irq() call.

> 
>>>> +static int rzg3s_pcie_intx_setup(struct rzg3s_pcie_host *host)
>>>> +{
>>>> +	struct device *dev = host->dev;
>>>> +
>>>> +	for (int i = 0; i < PCI_NUM_INTX; i++) {
>>>> +		struct platform_device *pdev = to_platform_device(dev);
>>>
>>> Looks like this should be outside the loop.
>>
>> OK, I kept it here as it is used only inside this block.
> 
> Ah, I see the motivation.  I suppose the compiler is smarter than I am
> and hoists it out of the loop anyway, but I think it is easier for
> humans to read if the loop only contains things that change for each
> iteration.

OK, I'll move pdev out of this block.

> 
>>>> +		char irq_name[5] = {0};
>>>> +		int irq;
>>>> +
>>>> +		scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + i);
>>>> +
>>>> +		irq = platform_get_irq_byname(pdev, irq_name);
>>>> +		if (irq < 0)
>>>> +			return dev_err_probe(dev, -EINVAL,
>>>> +					     "Failed to parse and map INT%c IRQ\n",
>>>> +					     'A' + i);
>>>> +
>>>> +		host->intx_irqs[i] = irq;
>>>> +		irq_set_chained_handler_and_data(irq,
>>>> +						 rzg3s_pcie_intx_irq_handler,
>>>> +						 host);
>>>> +	}
> 
>> +     host->intx_domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
>> +                                                  PCI_NUM_INTX,
>> +                                                  &rzg3s_pcie_intx_domain_ops,
>> +                                                  host);
>> ...
>> +     irq_domain_update_bus_token(host->intx_domain, DOMAIN_BUS_WIRED);
>> +
> 
> Can we use dev_fwnode(dev) here instead of of_fwnode_handle() so it
> matches the one in rzg3s_pcie_msi_allocate_domains()?

Sure, I'll update it next time.

> 
> I think irq_domain_update_bus_token() is needed here because
> host->intx_domain and msi->domain are identified by the same fwnode,
> and this will be easier to see if we get the fwnode the same way.
> 
> (See 61d0a000b774 ("genirq/irqdomain: Add irq_domain_update_bus_token
> helper").  I wish irq_domain_update_bus_token() had a function comment
> to this effect.  Maybe even a mention in Documentation/.)
> 
> It would also help code readers if we could use function names similar
> to other drivers.  For instance, rzg3s_pcie_intx_setup() creates the
> INTx IRQ domain, but no other driver uses a name like *_intx_setup().
> The general consensus seems to be *_pcie_init_irq_domain().

I tried initially to align all the function name with the patterns I found
though the tree as you suggested.

With the pattern for MSI/INTx configuration I wanted to re-use the same
probe code on resume path. My point was to re-use the
rzg3s_pcie_host_setup() on resume, and on resume to configure only the HW
registers for MSI, INTx (as the rest is not necessary) by passing different
MSI, INTx setup functions along with their correspondent cleanup functions
for failures.

For the function names rzg3s_pcie_intx_setup(), rzg3s_pcie_msi_setup() I
took as reference (probably) tegra_pcie_msi_setup().

I'll try to switch to *_pcie_init_irq_domain() pattern if this is the
preferred one.

Thank you for your review,
Claudiu

