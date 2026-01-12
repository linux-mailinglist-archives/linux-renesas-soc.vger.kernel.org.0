Return-Path: <linux-renesas-soc+bounces-26579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E77D11842
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 10:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E57353071B88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 09:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A222E25B1DA;
	Mon, 12 Jan 2026 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OsUA9GSJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA0E246770
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210242; cv=none; b=bzKJVyUfggiVqVJ+dm4TkWDg2T2sw40XGJ2kTATBkzlpwwunF6rr1wCJtvCrjjmzkvLpIJnb8BjzCCL4yALx9cKLDKsljHmRmLu8sJGpdUoWjxcbQDRN4360rebGJyFamnQi/LKT6urbtymk9pczNNZ/YJJgvRSDVBA2E9jn+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210242; c=relaxed/simple;
	bh=GWV28/vmpmO8SPm3F91Gti98N5Hg36koBeIE519B3i8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5MjhvC55c94tntOo+NWn/DElYFioLtONHcEV2er9UDAIyUlDucgQlmeeKjNRdnUevtnSW1r+Ruo+9k+sXEAUN/QrtlWIJz6BMsCcO8YiD+yVf3AKqceGvcN6DU687W0+NoBTvwyHIR3y3cIGq7DtfNeC5GXHiXmibVJaMv/vos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OsUA9GSJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b87018f11e3so192372166b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 01:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768210238; x=1768815038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNLrzr3qkVx4OIY6GjV8r8rlvuM/wNc6aOYx08xVrrQ=;
        b=OsUA9GSJiQJnuR4akDZDQgEHpG3KntWMVfYqn/jnln94cFOp6IK2+zuCgsx5iITR4/
         ZtK6Udk1c17cnG1DBmNhCtfDNk+RF1z364tVbEhTB96KEOIJ3BW0VVbexGPQQro+i2+m
         LSW2QP5LXqypZKOCB4t6ury7aazAFlbYbbAKlkMxeoU/MFouYgB6Q6RLcW68ccLUzeBg
         M/MtY62qG2RaFXw/fE0PcxEsu/BHBLU5Zy4yplijU4Vve3/UXAl5iBMGFue15j4sajSR
         P6j6UjFHspU1BQ3Vr8KRwjwjAfVGOkrkiuOvqEz62tpfMxF5f0rVqUCpmO6q4t988OHA
         /BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210238; x=1768815038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNLrzr3qkVx4OIY6GjV8r8rlvuM/wNc6aOYx08xVrrQ=;
        b=Xr8pyiBwp1ZQpHJAo9XKyrYg0dDv6Wx5Gd6rzwj06k0gQ8X++KyuoUCoxYyX6zoeGK
         AO2Sdoz1gWgyShlDy+V7lEsdZyutgVuulsmeVnehlC8w0ZpZmqIWyMToDFJrmW2cOLfD
         wdBxVXfjUQ+r9X4i3nX4T6g73wEe43CjntcnXOA+YiEtb+Xn1qltCc3cfXwUZfIdnUf9
         //xvNAgc7jtKpD3volTzZYvc0oGc8Pyj+Z2G6gm86WdNgb+Q6BBcqvkhWpUgdm9v/twd
         2QelkRnubA5jx9e1jAasfy5J7BEBQHg38RrpAVIoU1mSgyIZQvU/Hy7ZvvDBk14aMcGo
         A/0A==
X-Gm-Message-State: AOJu0YxQxUH/jLmep1iTitSTr1EBqqZXpsDrSe55manAeCfan6Y/filH
	p7tAc5wYlnUAc5B1aSt9MGrJG6ojMao9LGOEauHa/AbYcSgU1wLKJdAbUi/4n9PNvFc=
X-Gm-Gg: AY/fxX6aQ4T2rjH4et5Sb3Ismc7GiJtl9tkHYhaSrH+pk/TBo+K+PnudorYlGkzYmyy
	JDDnqLIk1q3MBPcfrLARAyLLc1upBzNU9vSe+SM+zgic1YMaIl1oSoMe+R8UbIRep8sqI246Idu
	Z0K9sx9AuQGP8iCZ8vsQ59S2dgSTRCxOGcqAUoSkhGKKs/4QpNz3oL5M3SFX1ancyFs7vNhgeNX
	+h667PdnwmQOUd7XB4OnI2rCf5WYIW0q8mvkPqPvuY8ui416agRIKNmnV9T/qWlXcpea0GnpVmz
	9iCmni+rHtBpdfLWo2I9ufjxDevY3cLcr1OD6pAAqrYtmNc5+wNQl/tQxTHe9+gjqpnxjw7Czdn
	a/vXRrR9UyTLj5ZE3oprh8Gx3XmlIga+wJT5iMQIoOlbRyYhd5cFK7wb3CreSUuOECEEAd/iXTf
	+pWnv7pEJXAiP0IDSSxQ==
X-Google-Smtp-Source: AGHT+IE3jERyAgUMeyNFYUFeB+yy2mozpdQFjJ6f8BNz9krP4mlTPOQQ5ezMeogXcOrzxqj3jJR6fg==
X-Received: by 2002:a17:906:f5a1:b0:b7a:72bd:ac65 with SMTP id a640c23a62f3a-b8444c3fc39mr1534919766b.9.1768210237758;
        Mon, 12 Jan 2026 01:30:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b844e46ee63sm1446817366b.15.2026.01.12.01.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 01:30:37 -0800 (PST)
Message-ID: <2ad40570-102e-448b-bf40-06af8ecdfca2@tuxon.dev>
Date: Mon, 12 Jan 2026 11:30:35 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dmaengine: sh: rz-dmac: Refactor runtime PM handling
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250905144427.1840684-1-tommaso.merciai.xr@bp.renesas.com>
 <20250905144427.1840684-4-tommaso.merciai.xr@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250905144427.1840684-4-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Tommaso,

On 9/5/25 17:44, Tommaso Merciai wrote:
> Refactor runtime PM handling to ensure correct power management and prevent
> resource leaks.  Invoke pm_runtime_get_sync() when allocating DMA channel
> resources and pm_runtime_put() when freeing them.  Add pm_runtime_put() in
> rz_dmac_probe() to balance the usage count during device initialization,
> and remove the unnecessary pm_runtime_put() from rz_dmac_remove() to avoid
> PM inconsistencies.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>   drivers/dma/sh/rz-dmac.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
> index 0bc11a6038383..4ab6076f5499e 100644
> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c
> @@ -455,7 +455,7 @@ static int rz_dmac_alloc_chan_resources(struct dma_chan *chan)
>   	if (!channel->descs_allocated)
>   		return -ENOMEM;
>   
> -	return channel->descs_allocated;
> +	return pm_runtime_get_sync(chan->device->dev);

This looks wrong to me as, rz_dmac_alloc_chan_resources() could be 
called from the following path:

dma_request_chan() ->
   find_candidate() ->
     dma_chan_get() ->
       rz_dmac_alloc_chan_resources()

With this, the runtime PM reference counter is incremented on 
dma_request_chan() calls, when DMA consumers request DMA channels, and 
remains different than zero until the DMA channel is put. But, on 
suspend path, the runtime PM reference counter is not touched even when 
there are DMA channels requested.

Am I missing something?

Thank you,
Claudiu

