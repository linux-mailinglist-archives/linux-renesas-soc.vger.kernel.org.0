Return-Path: <linux-renesas-soc+bounces-31411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCiGMrUj5mlBsgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 15:01:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A8542B229
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 15:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD6F7314BE8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5465239EF06;
	Mon, 20 Apr 2026 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c7EUpqbQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98728383C8E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689547; cv=none; b=Ps4E4bSqW3wM9X09UpbPPIY+fu7d8/ReI1Mi76+ncC1RV0I/FV3cLdiHGhQT4XRa8hETlFmDiE7J7b0BS7zj8XogKHeWRXGWmPgOTpGrvV8vpq559TDyNpjNdhkpVgSZRxEDvUuAlsWwDu/qPWv6bD25ms/UCHyevIBNsB3WKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689547; c=relaxed/simple;
	bh=wE/nLJYcfwfiHpxeFEQVE8m77fQJ78pDtEdAEnuEGZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDdxjs1pwJfRgUAbYYyRcXTCVqLDvYB1MsoICXuoNgZgE0gakZCp6QgwqZ+r4PI9fR6TPqzM/1R6paELaMMsYAa2sYYAC6G16mZ0xTPNjQSVpX8EtG+79pH7EhPBGlhHrha/5fcvM614JH4BUkHkSyQbztj0O9ArAikGHGzw2iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c7EUpqbQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfbd17589so2294796f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 05:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776689544; x=1777294344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyZEuicI8WQZweXVv7pRfSwXG7shncGVxuqHWPlSo+U=;
        b=c7EUpqbQ7kX6u+QhYsOte7xn26QbC+VdjvFYN/lcZO8C7EAlciz87rUG+mvzqFBO4N
         zECgCo2smOPX8Nt3M9ThcxLQ77f/UNcn84cWjDo8zgino7Y58dTI9O9nWe263Ki8ujz1
         FDEAsF1C+ZiwL/6ArM7F/zcKqDSj9u0QEw7lebFArUN9KYMdV/vbagDLHLLjnptewfzY
         Tu7xCp7wFIJJenZ2ughimvuQ/Ph8cuV7fktVI++cEdd8GQ8kLXvWVjE2LEtg3h7XVyXM
         mt0zlu/3dMxcKp3Tk8c48FxZ0/kTJ9WPjM6jwIdMCCLzSrB+4nhdQvHVCf/6i9nvsFTh
         Zbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776689544; x=1777294344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyZEuicI8WQZweXVv7pRfSwXG7shncGVxuqHWPlSo+U=;
        b=nb34fNM2hNkeexkxOhNe3QzvUfPMo01YHucf+8zey/nU7DDCYGak+X4FJ7bHvXV54c
         TnQTt72334GrCyIW4sSnr/Yf1XShkEiEqQQT0uzHtFtKrNJVttlgpOSwNziAsx2H8atN
         920wjj/qKTT/ggU/toYAFAIMbcel+BeykDpVGBBF9eM0CTuhdt25BOmJG1DtfnuIJQRD
         Klqp+s5W6EaNAovpDJYB+FaNHPTDr1JV+V9ma5YOdggvrigRAV5H5ffpC/a6/vWOx9YD
         YSIkkWC5aOpeMPAeshf4YvKHqY1o83pVOwMrKvWqE97rnZ3oYFumLLDjWJCDdd0S4L+c
         00vA==
X-Forwarded-Encrypted: i=1; AFNElJ90sGfNeJnoq5vNMwg5pvIs+9YVQ2MUyfUx3nHpAgGiQlbLU9qGaTjS02SEeTF7RrdlUkfvS5SXsK7gUvNY/XCkuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMeympuKtvAUudTXnrCfyxuoKt97XVWDXpMJ+exemN1hMXOM7g
	n43lKXxTB4E4vmQaWLZpGgWG8U7q+CknXGXUIR9PbiKbRQlNoTckaBLUFOb56envW1w=
X-Gm-Gg: AeBDievWPPZoKm4GB+pSjqmdeCTHVe0fbj+P3kk+qy3/PSg50+fYLpYZIQzFjADtkXQ
	3WLps4iwo+QEGKOer60UamctCUfcTzvW6OIM6R3saD/JSg3lcmJBNvrPuUVHEPxTmQwVnBie1yT
	I/tO3OWG09awpWIjpqi3Z+xy9MRGfgzxUVbgT1+N2TRerEK0XdFaN+/QNgnbtzKkj/Opu0Izsla
	QBZiXU/kAI2GMLNzRAJ0CpM78OoLGw5ZDr+nQt5rC5ozo7eRs318QW2YShdlWR2nSLlUECL+HAE
	wMq2PckqGLXChxYwvkEsfeqyMBT8GYMiOY7vHt6oazew65VPweTr38j2WYXNa40t3vzoo0KKVwt
	7p6pM7BiTLpyDflp/9bm2WfHpQnddEP5rjX0oLb1+v/whiCWbEWwYxUzXs0VzLmEG/EkT/lj4GB
	L2CS8O9DfTUNzCgveXgXC3lGdvZSyKd60Vb2lSV53J1g==
X-Received: by 2002:a5d:4535:0:b0:43f:e22f:606 with SMTP id ffacd0b85a97d-43fe3da6680mr13443062f8f.2.1776689543971;
        Mon, 20 Apr 2026 05:52:23 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e44f69sm30902955f8f.25.2026.04.20.05.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:52:23 -0700 (PDT)
Message-ID: <e928f207-1497-4301-a814-3b5045adaa56@tuxon.dev>
Date: Mon, 20 Apr 2026 15:52:22 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: sashiko.dev review (Re: [PATCH v4 14/17] dmaengine: sh: rz-dmac: Add
 suspend to RAM support)
To: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, geert+renesas@glider.be,
 fabrizio.castro.jz@renesas.com, long.luu.ur@renesas.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-15-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260411114303.2814115-15-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31411-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,glider.be,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:dkim,tuxon.dev:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2A8542B229
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

 > commit e7af08b0f2dc569cc63b17e07dd4e506e50fee28
 > Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 > dmaengine: sh: rz-dmac: Add suspend to RAM support
 > The Renesas RZ/G3S SoC supports a power saving mode in which power to most
 > of the SoC components is turned off, including the DMA IP. Add suspend to
 > RAM support to save and restore the DMA IP registers.
 > > diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
 > > --- a/drivers/dma/sh/rz-dmac.c
 > > +++ b/drivers/dma/sh/rz-dmac.c
 > [ ... ]
 > > @@ -1354,6 +1407,130 @@ static void rz_dmac_remove(struct platform_device 
*pdev)
 > >     pm_runtime_disable(&pdev->dev);
 > >  }
 > >
 > > +static int rz_dmac_suspend_prepare(struct device *dev)
 > > +{
 > > +   struct rz_dmac *dmac = dev_get_drvdata(dev);
 > > +
 > > +   for (unsigned int i = 0; i < dmac->n_channels; i++) {
 > > +           struct rz_dmac_chan *channel = &dmac->channels[i];
 > > +
 > > +           guard(spinlock_irqsave)(&channel->vc.lock);
 > > +
 > > +           /* Wait for transfer completion, except in cyclic case. */
 > > +           if (channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC))
 > > +                   continue;
 > > +
 > > +           if (rz_dmac_chan_is_enabled(channel))
 > > +                   return -EAGAIN;
 > Is it intended that this aborts the system suspend instead of waiting?

Returning -EAGAIN here makes the core suspend code to keep trying calling the 
prepare API of this driver. That's why it has mentioned waiting.

 > The commit message states the .prepare callback "waits for all the ongoing
 > transfers to complete before allowing suspend-to-RAM to proceed."
 > However, returning -EAGAIN from a system sleep .prepare callback immediately
 > aborts the system suspend process instead of waiting.
 > Additionally, since the PM core executes the .prepare phase for all devices
 > before executing any .suspend callbacks, consumer devices haven't yet run
 > their own .suspend callbacks to stop their DMA transfers.
 > If any normal background DMA activity is ongoing, won't this immediately
 > abort the entire system suspend transition?

If DMA activity is ongoing the expectation is that it will finish and the 
suspend_prepare() will go forward.

 > > +   }
 > > +
 > > +   return 0;
 > > +}
 > [ ... ]
 > > +static int rz_dmac_suspend(struct device *dev)
 > > +{
 > > +   struct rz_dmac *dmac = dev_get_drvdata(dev);
 > > +   int ret;
 > Can ret be used uninitialized here?

Yes, this is a typo. I'll properly initialize this here.

 > If the DMA controller has no cyclic channels configured, the loop below will
 > skip every iteration due to the continue statement, leaving ret
 > uninitialized.
 > > +
 > > +   for (unsigned int i = 0; i < dmac->n_channels; i++) {
 > > +           struct rz_dmac_chan *channel = &dmac->channels[i];
 > > +
 > > +           guard(spinlock_irqsave)(&channel->vc.lock);
 > > +
 > > +           if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
 > > +                   continue;
 > > +
 > > +           ret = rz_dmac_device_pause_internal(channel);
 > > +           if (ret) {
 > > +                   dev_err(dev, "Failed to suspend channel %s\n",
 > > +                           dma_chan_name(&channel->vc.chan));
 > > +                   break;
 > > +           }
 > > +
 > > +           channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
 > > +   }
 > > +
 > > +   if (ret) {
 > If ret contains uninitialized stack memory that evaluates to true, could this
 > trigger the error recovery path and silently abort the system suspend
 > transition?
 > > +           rz_dmac_suspend_recover(dmac);
 > > +           return ret;
 > > +   }
 > > +
 > > +   pm_runtime_put_sync(dmac->dev);
 > > +
 > > +   ret = reset_control_assert(dmac->rstc);
 > Is the ordering of runtime PM and reset control inverted here compared to
 > rz_dmac_remove()?

Yes, I'll adjust it.

 > In rz_dmac_remove(), reset_control_assert() is called before pm_runtime_put().
 > Operating on the reset control after the device's power domain is suspended
 > might cause the operations to be silently ignored by the hardware or lead to
 > system bus lockups.
 > > +   if (ret) {
 > > +           pm_runtime_resume_and_get(dmac->dev);
 > > +           rz_dmac_suspend_recover(dmac);
 > > +   }
 > > +
 > > +   return ret;
 > > +}
 > > +
 > > +static int rz_dmac_resume(struct device *dev)
 > > +{
 > > +   struct rz_dmac *dmac = dev_get_drvdata(dev);
 > > +   int errors = 0, ret;
 > > +
 > > +   ret = reset_control_deassert(dmac->rstc);
 > Similarly, is the ordering of reset control and runtime PM inverted here
 > compared to rz_dmac_probe()?

Yes, I'll adjust it.

 > In rz_dmac_probe(), pm_runtime_resume_and_get() is called before
 > reset_control_deassert(). Doing this in the reverse order here means the
 > reset is deasserted before the hardware power domain is enabled.
 > > +   if (ret)
 > > +           return ret;
 > > +
 > > +   ret = pm_runtime_resume_and_get(dmac->dev);
 > > +   if (ret) {
 > > +           reset_control_assert(dmac->rstc);
 > > +           return ret;
 > > +   }
 > [ ... ]
 > > @@ -1380,6 +1557,7 @@ static struct platform_driver rz_dmac_driver = {
 > >     .driver         = {
 > >             .name   = "rz-dmac",
 > >             .of_match_table = of_rz_dmac_match,
 > > +           .pm     = pm_sleep_ptr(&rz_dmac_pm_ops),
 > Should this use pm_ptr() instead of pm_sleep_ptr()?
 > If CONFIG_PM_SLEEP is disabled, pm_sleep_ptr() evaluates to NULL, but the
 > struct rz_dmac_pm_ops itself and its unconditional callbacks like
 > rz_dmac_suspend_prepare will remain fully compiled into the binary as unused
 > dead code, potentially leading to compiler warnings.
 > Using pm_ptr() for the dev_pm_ops structure pointer and pm_sleep_ptr()
 > around the sleep callbacks inside the structure might resolve this.
 > >     },
 > >     .probe          = rz_dmac_probe,
 > >     .remove         = rz_dmac_remove,

I think pm_sleep_ptr() fits better here as CONFIG_PM_SLEEP depends on 
CONFIG_SUSPEND which is the flag under which the system suspend/resume code 
resides. Also, CONFIG_PM_SLEEP selects CONFIG_PM, so CONFIG_PM_SLEEP cannot be 
enabled w/o CONFIG_PM.

