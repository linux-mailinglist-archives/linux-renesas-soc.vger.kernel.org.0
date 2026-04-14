Return-Path: <linux-renesas-soc+bounces-31258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GkFJqn63WlTlwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 10:28:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E23F7468
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 10:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1204A30098B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 08:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250F53A1A5B;
	Tue, 14 Apr 2026 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="refL2xOD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A23A168F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776155301; cv=none; b=Pzo8hRLePxQOeG6ys/txvCeq1vdDVqs+WLK6nl0rNrHBiahUMb+ifdp7q0o1DmFgZeiiE07hxpUVu++tQds/mZu415+yeGas54QBSH2WoaXMNPaoALL96FT40abGCNOgPUNQ0YNGI2b8F7Y4wn8T82Zy92A1e1GZPqPl2zlQQRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776155301; c=relaxed/simple;
	bh=A0A0SRk1zjT+GpcK54V4mSJXuPt0aQvZfkQIiF5d4Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAsW6AkzZjOcsfIFXdv40M8w99Q/RKxIek8/wtaTmlvJPC9C021ssB5waAX0k+8wqSV0GcNcQcZO5KnlAY8vmJ6Z6mw1u4iKW9Jw9iK6KkY4zmlvW09CdbrPDfaJJp8n1mszSZoRwgKvkU8ua6QoL1OjXTSeublm9uuuGwYIlY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=refL2xOD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488c2690057so51511125e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776155297; x=1776760097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uelHwNikEBg5tHyCN4f5ieipMicy2BHQBsPBzqFR0dE=;
        b=refL2xODmskYXu30XW1dHd0e1WwGAUfj2qGO13omkKc9jVT/bTa8n7VbqgXlm9HFwI
         WNXAVy+URJH8V0O01i0wr+hPAOqZjevCLdXhkoWKQ+u3hTCRsLiap6bXSw69/Q/qAaUH
         y06x5/YwO8d1webNJa7vZLOlaSPIatZ93WyqCxUefiSmqrJf990VNGf+6eqfFzpTqHyP
         I5i4GgeDZfGd/YGvt3lruBn5mb+jUuODAB0ZRZ4tOXvTY73QjuvyzbJKHc18A8PHYrYJ
         kqq5KUjNNxQhQYhJp+59KpFeC2TcDO4uWorkW8gVvwCidT+7LlTU+QXfQ/HnfR0ed1OC
         HYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776155297; x=1776760097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uelHwNikEBg5tHyCN4f5ieipMicy2BHQBsPBzqFR0dE=;
        b=CuiRvpBp9s9MPLuCDs7pc25+rb/u1skgmCnkhYRNI7uuzq9eGk9FoqHSZE+6tcUK05
         dqwPRfyGS8stxhHDKVx8VNO2/i2yei6+WJpK/vZL4MrJqNSKuaO36UhSQd66VfvRnw14
         Yd1L5pAnL74hfQlfFA3VmhauA5+CrPJs8zw6MEx57oejcCWVIWnOzL3mjjRZQA/5oIVw
         tKn51a2YeVMqq1wlX7B4wWbom10T33Uy2i4Q3tXHGQoN4wkhKMOHpmB1GdK9IdaB18qa
         mXzsYpowWCsLeVsRb4ViJ1Tb/Ixvu74F6mlLZDyPoQ8mWYI2cHdFrqdS39Q7wYh83Lw3
         iK+w==
X-Forwarded-Encrypted: i=1; AFNElJ+/qa546ngm8L24eywtKHX2T6ZnRWRH8gZPDojJcVyCrYJtswqlMLl1xlx+jvxrRWgVW1+YARuRvMO+fIgIIRKjRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz1Q8A9tILpSRxNEXwqb9GV5/YRncIxXGx5gO3NEu0RDi4C8PR
	/JekKvW8KHKsYvslXZ/VT59MF3vfnP+USBSEm69snjZJl3bPcyLaC7L5rASVALCuCAs=
X-Gm-Gg: AeBDieuP872Kew5yGCj1Q5YOgE/S+hiPtxCUflcDAjV9M41Y5Cir1oSYLWozuLcfkEQ
	1vy87tR4e9cQmWBHsXTRKJPYikhMxvurV6WV2t8/nBO29XMGPft0+a/u+B2DpBE2bwsdnnhXuFS
	0vCmLuIIZWvYLMvZShNER8uXLUrTbMYX+r52YHDNFL5ugmiurZMDx/lPvJJ0X7slsH+kwqMpIFZ
	CtvcO2M4SUnFpTp3bWPva+VG0zq9NmwgVhFptXEq6GCOEl4ypmKVM7DWjLwSKm7Nw22P9DlbVk9
	nIJCGd1CawY8A/yHwo5Sm91+NJQZ9VJyxlUaLK5rn6jk4yZuRPJGQqfobTp1Gz3Xm/14X4rLwzu
	f7A4yYKABiCsPlvzY/o9wXKumR/ZaUq7NfuIxFkihLm/J6ALPb1ZoyvEnXvbsfymmOnMvbjIA04
	pbYJXhaLrK1cjmIGcpJv9ZuReLuip8+vg=
X-Received: by 2002:a05:600c:528c:b0:488:a2ac:a337 with SMTP id 5b1f17b1804b1-488d68c2bffmr213398185e9.21.1776155296847;
        Tue, 14 Apr 2026 01:28:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ec77508csm54500935e9.0.2026.04.14.01.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:28:16 -0700 (PDT)
Message-ID: <a2362c89-e9ea-4c11-80ac-b65786da1e32@tuxon.dev>
Date: Tue, 14 Apr 2026 11:28:13 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] dmaengine: sh: rz-dmac: Do not disable the
 channel on error
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
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-6-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346923D8D18E79A9F7AC10086262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346923D8D18E79A9F7AC10086262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31258-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,tuxon.dev:dkim,tuxon.dev:email,tuxon.dev:mid]
X-Rspamd-Queue-Id: 0F8E23F7468
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/26 15:30, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 11 April 2026 12:43
> -soc@vger.kernel.org; Claudiu Beznea
>> <claudiu.beznea.uj@bp.renesas.com>
>> Subject: [PATCH v4 05/17] dmaengine: sh: rz-dmac: Do not disable the channel on error
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Disabling the channel on error is pointless, as if other transfers are queued, the IRQ thread will be
>> woken up and will execute them anyway by calling rz_dmac_xfer_desc().
>>
>> rz_dmac_xfer_desc() re-enables the transfer. Before doing so, it sets CHCTRL.SWRST, which clears
>> CHSTAT.DER and CHSTAT.END anyway.
>>
>> Skip disabling the DMA channel and just log the error instead.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - none
>>
>> Changes in v3:
>> - none, this patch is new
>>
>>   drivers/dma/sh/rz-dmac.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c index 40ddf534c094..943c005f52bd
>> 100644
>> --- a/drivers/dma/sh/rz-dmac.c
>> +++ b/drivers/dma/sh/rz-dmac.c
>> @@ -871,10 +871,6 @@ static void rz_dmac_irq_handle_channel(struct rz_dmac_chan *channel)
>>   	if (chstat & CHSTAT_ER) {
>>   		dev_err(dmac->dev, "DMAC err CHSTAT_%d = %08X\n",
>>   			channel->index, chstat);
>> -
>> -		scoped_guard(spinlock_irqsave, &channel
> ->vc.lock)
>> -			rz_dmac_disable_hw(channel);
> 
> On previous patch, rz_dmac_disable_hw() for initializing each register
> 
> +	/* Initialize register for each channel */
> +	rz_dmac_disable_hw(channel);

This initializes a single register by clearing various bits.

> 
> 
> As per hardware manual,
> 
> Once an error occurs, the data of the whole transfer cannot be guaranteed.
> Be sure to start the transaction again from the
> beginning by following the procedure below.
> 1. Set 1 in the SWRST bit of the CHCTRL_n/nS register.
> 2. Set each register again.

I wasn't aware of this sequence. Thank for pointing it. However, calling 
rz_dmac_disable_hw() as it previously was may be wrong from my point of view. 
According to the sequence you pointed, I think the code here should have only 
set the SWRST, if any, and let the rz_dmac_xfer_desc() "set each register 
again". According to "Figure 14.26 Setting Example 4", of RZ/G3S HW manual, rev 
1.20, the registers that need to be set when starting DMAC ch in Link mode are:

- DCTRL = 0x1
- NXLA = 0x1000
- CHCFG = 0x80000000
- CHCTRL = 0x8 // swreset
- CHCTRL = 0x5 // enable

So, I think these are the registers that need to be re-configured again (handled 
though the rz_dmac_xfer_desc()).

Anyway, I'll drop this patch from the next version, as it is not the subject of 
cyclic DMA.

Thank you,
Claudiu

