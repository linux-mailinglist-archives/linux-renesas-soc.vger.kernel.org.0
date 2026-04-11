Return-Path: <linux-renesas-soc+bounces-31187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFMaA9w/2mmFzQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 14:34:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 630BF3DFED9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 14:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAF1F302C93D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 12:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC7B1DF26E;
	Sat, 11 Apr 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rOhNADDy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4119D065
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775910860; cv=none; b=BO25iyXSOL8ZIyc/aQ/w/NE7stQZ//KGq0ENzJJo005l3jL5gBerVlHeP3r7MZ9tztSJa/EkK9s6OyaomJK9PQA9s4z5AAVej4/ZiW8bXA7A/WwVH/IktdT9/uv58y/UMpAqP1fR99rzmG760DrOMC5EmalEl5o6JW/VXiL/yRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775910860; c=relaxed/simple;
	bh=X2t+yaYaZsutfPKPYxoJOyLmkjJDQRmkMhOU64B+e08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1Y/aWsIgqkGW2ZbOKdoe5nLzPnMrczUNljjyoTE6Ncp067zztf+38dHyO02wJ+miDyuXr0UCxg6zR9W/dhSJymSJKOWa+mPtmI3cxZFijq8BeIjjvnlqncUxK6i9q8TZ47PDkJJ/HrSu9wde3csFLADdgocyThKF5jOtyGWAwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rOhNADDy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so2844420f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775910857; x=1776515657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TOxwujemq0kL/KQS4PJuYHJAL6Vzf+e3T0xcOOritGk=;
        b=rOhNADDytYjBJ0HRjp4nibc9ez03YXhjeGHbXTlXTjyjRtJNLbvlk3GFbK4i8b5ts7
         A1GlMblsSiWBVqIeO+Un65Xi6Jbb2NKQyGus/4Ou9ojVosrh6wJ4F7s77Ivd100Zpgw2
         zxDt6/RSl1WWduVoAPBFd+Qi6rufr+FC5WrRyKUCpl//mIX3fcKya2aj+/10l7yEmTgC
         2Pbhl8BT4z04vS3tQIrssLu58FawoX4hSrhQZBpNM1GWEkBoJGPRSY4yoeMSqDimDDpg
         6rwk2uCn8K0PiSEd/EsMhO7RYRt/LlHAmEdBmoA261VAbOScc5UPXrKpNpIuIQkFZNgH
         Vecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775910857; x=1776515657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOxwujemq0kL/KQS4PJuYHJAL6Vzf+e3T0xcOOritGk=;
        b=jD/tbiW8vPNLKviuWM1ix6jvEtsj6JmxFZFnQb7YwkfYAihGcIgYMK8R8Xr7XhPQJr
         nUjy2/JLACE624AdzZNL4lMlzoqRs3rcY7bOOFWWAO/dGqw095SXX7Ai88sKlqZFS3h1
         NP8XDksv5De915sp8kCiZPjpLz1xD1HLyplSVhn0HLz5daEhTKW8wdrtawXjxwCbHg79
         IcLHGSW34J+jrX5PMshBAbXhV1iVjy9jZKjxPq0SIBNQ8kFU9sl4lH117ctOGca1qHlj
         e/a4E1j89pWhNUlQAqCkXZtHteatOwlv9UYlGptnh83mVjO4Zt/jX6amSTXC0bduYgEn
         zNOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeaNTwvDLPV0rFr4VVZRsfK4YKcF4HD+Z/bEtMpWlfO6LEtB5perbAJ12MVydOpdhmNBSnnofPn9hU9SVGsRooHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAxQEziqCjtFnCDQuBhMJ027plyOzH1z+cH+S8XrfAaED/N2S
	Irvqxw0oMY4L/4it7nIHMRae1LsdjwdUuPw9fUbznBnyID2I89FdIgqk9tQACu5NBa8=
X-Gm-Gg: AeBDietuVed1L1akjXIIWQCjfE9pmK85tilLey4Voc35UvH3tYydVqg6wyvn9jFt8qu
	OXLhAl/ZP805z2h1aT4ndK1Bw+yH/jNNh8OX351+88sWZqa6iyc/UWPyk3XvlTaotyAdQwItMW1
	rfGNNQblbpJWONeH5eo3mnz+wbTE2meyO1eVNHvJz9+XrGc8eSQEKjLoLUNxu646CqVl3hHWXXq
	x+BXruUUml+ve84tigpH8E/R27iGpCu3rF2RiUoMMrHQBDPqEyvFbVjGN9WHmKa7o1halzyFwpC
	HacPWdcy8iOTRMMrrxcPfiHw9ggti/RCrrcN2glnJrj8OR4IzBcPRqE7nT+oOoMy0S5f5rye+Jb
	vlHa2KNuD0eGwz4HrosBLMFm686hsyG2m0Vy8oSK28oD8KxV8B/6cS4xgrrcOMQ4bvhkNrFgDf5
	C03zJRZj+zoLDHV3TeQZOnJoHeXAHR60k=
X-Received: by 2002:a05:6000:40c8:b0:439:be67:a038 with SMTP id ffacd0b85a97d-43d642d47f7mr9826259f8f.41.1775910856868;
        Sat, 11 Apr 2026 05:34:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm16450654f8f.34.2026.04.11.05.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 05:34:16 -0700 (PDT)
Message-ID: <1932cc15-0ced-4e0a-8034-98ee78f370a2@tuxon.dev>
Date: Sat, 11 Apr 2026 15:34:14 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/17] dmaengine: sh: rz-dmac: Move interrupt request
 after everything is set up
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Long Luu <long.luu.ur@renesas.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-2-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346F56B1A311E46053EDB3486262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346F56B1A311E46053EDB3486262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31187-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,renesas.com:email,tuxon.dev:dkim,tuxon.dev:email,tuxon.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Queue-Id: 630BF3DFED9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/26 15:17, Biju Das wrote:
> 
>> -----Original Message-----
>> From: Claudiu<claudiu.beznea@tuxon.dev>
>> Sent: 11 April 2026 12:43
>> Subject: [PATCH v4 01/17] dmaengine: sh: rz-dmac: Move interrupt request after everything is set up
>>
>> From: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
>>
>> Once the interrupt is requested, the interrupt handler may run immediately.
>> Since the IRQ handler can access channel->ch_base, which is initialized only after requesting the IRQ,
>> this may lead to invalid memory access.
>> Likewise, the IRQ thread may access uninitialized data (the ld_free, ld_queue, and ld_active lists),
>> which may also lead to issues.
>>
>> Request the interrupts only after everything is set up. To keep the error path simpler, use
>> dmam_alloc_coherent() instead of dma_alloc_coherent().
>>
>> Fixes: 5000d37042a6 ("dmaengine: sh: Add DMAC driver for RZ/G2L SoC")
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea<claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - none, this patch is new
>>
>>   drivers/dma/sh/rz-dmac.c | 88 +++++++++++++++-------------------------
>>   1 file changed, 33 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c index 625ff29024de..9f206a33dcc6
>> 100644
>> --- a/drivers/dma/sh/rz-dmac.c
>> +++ b/drivers/dma/sh/rz-dmac.c
>> @@ -981,25 +981,6 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
>>   	channel->index = index;
>>   	channel->mid_rid = -EINVAL;
>>
>> -	/* Request the channel interrupt. */
>> -	scnprintf(pdev_irqname, sizeof(pdev_irqname), "ch%u", index);
>> -	irq = platform_get_irq_byname(pdev, pdev_irqname);
>> -	if (irq < 0)
>> -		return irq;
>> -
>> -	irqname = devm_kasprintf(dmac->dev, GFP_KERNEL, "%s:%u",
>> -				 dev_name(dmac->dev), index);
>> -	if (!irqname)
>> -		return -ENOMEM;
>> -
>> -	ret = devm_request_threaded_irq(dmac->dev, irq, rz_dmac_irq_handler,
>> -					rz_dmac_irq_handler_thread, 0,
>> -					irqname, channel);
>> -	if (ret) {
>> -		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n", irq, ret);
>> -		return ret;
>> -	}
>> -
>>   	/* Set io base address for each channel */
>>   	if (index < 8) {
>>   		channel->ch_base = dmac->base + CHANNEL_0_7_OFFSET + @@ -1012,9 +993,9 @@ static int
>> rz_dmac_chan_probe(struct rz_dmac *dmac,
>>   	}
>>
>>   	/* Allocate descriptors */
>> -	lmdesc = dma_alloc_coherent(&pdev->dev,
>> -				    sizeof(struct rz_lmdesc) * DMAC_NR_LMDESC,
>> -				    &channel->lmdesc.base_dma, GFP_KERNEL);
>> +	lmdesc = dmam_alloc_coherent(&pdev->dev,
>> +				     sizeof(struct rz_lmdesc) * DMAC_NR_LMDESC,
>> +				     &channel->lmdesc.base_dma, GFP_KERNEL);
>>   	if (!lmdesc) {
>>   		dev_err(&pdev->dev, "Can't allocate memory (lmdesc)\n");
>>   		return -ENOMEM;
>> @@ -1030,7 +1011,24 @@ static int rz_dmac_chan_probe(struct rz_dmac *dmac,
>>   	INIT_LIST_HEAD(&channel->ld_free);
>>   	INIT_LIST_HEAD(&channel->ld_active);
>>
>> -	return 0;
>> +	/* Request the channel interrupt. */
>> +	scnprintf(pdev_irqname, sizeof(pdev_irqname), "ch%u", index);
>> +	irq = platform_get_irq_byname(pdev, pdev_irqname);
>> +	if (irq < 0)
>> +		return irq;
>> +
>> +	irqname = devm_kasprintf(dmac->dev, GFP_KERNEL, "%s:%u",
>> +				 dev_name(dmac->dev), index);
>> +	if (!irqname)
>> +		return -ENOMEM;
>> +
>> +	ret = devm_request_threaded_irq(dmac->dev, irq, rz_dmac_irq_handler,
>> +					rz_dmac_irq_handler_thread, 0,
>> +					irqname, channel);
>> +	if (ret)
>> +		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n", irq, ret);
> As per [1], it is redundant.
> 
> [1]
> https://elixir.bootlin.com/linux/v7.0-rc7/source/kernel/irq/devres.c#L108

This is a fix patch, it just moves code around, intended to be backported to 
older kernels (e.g. v6.1, v6.12). However devm_request_result() is introduced in:

commit 55b48e23f5c4
Author: Pan Chuang <panchuang@vivo.com>
Date:   Tue Aug 5 17:29:22 2025 +0800

     genirq/devres: Add error handling in devm_request_*_irq()

     devm_request_threaded_irq() and devm_request_any_context_irq() currently
     don't print any error message when interrupt registration fails.

     This forces each driver to implement redundant error logging - over 2,000
     lines of error messages exist across drivers. Additionally, when
     upper-layer functions propagate these errors without logging, critical
     debugging information is lost.

     Add devm_request_result() helper to unify error reporting via dev_err_probe(),

     Use it in devm_request_threaded_irq() and devm_request_any_context_irq()
     printing device name, IRQ number, handler functions, and error code on failure
     automatically.

     Co-developed-by: Yangtao Li <frank.li@vivo.com>
     Signed-off-by: Yangtao Li <frank.li@vivo.com>
     Signed-off-by: Pan Chuang <panchuang@vivo.com>
     Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
     Link: https://lore.kernel.org/all/20250805092922.135500-2-panchuang@vivo.com

And it is not present in v6.1, v6.12 kernels.

To have a clean backport (at least to the above mentioned kernel versions), 
would be better to have the alignment to devm_request_result() done in a later 
cleanup patch.

Thank you,
Claudiu

