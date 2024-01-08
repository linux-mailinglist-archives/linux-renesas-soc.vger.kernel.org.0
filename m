Return-Path: <linux-renesas-soc+bounces-1351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD318269FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jan 2024 09:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE0E1F2394D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jan 2024 08:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4A5CA47;
	Mon,  8 Jan 2024 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ew0PWZrs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA19BE7F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jan 2024 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eaaf2c7deso1434420e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jan 2024 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704704324; x=1705309124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guTqdWfxQATjkH07r6kHImh4BVrF3OOXj/+02SDtpis=;
        b=Ew0PWZrsnmIvkC3sgL21jYzL7ocvyPeB9VgDCDxqs0Tg6bIYfl32atM2COCGRlCCoL
         Rg92BvAFQFFW+GNPUEXwprIJGHaCcGM2p6o5uZ8HVxNzWXFP2INCZDdmaB5F9AevX3PJ
         eXozkWdsKTceRP65S8BXSbHiIm6lVJ6IiJTlrtBRvyLq0cGmkbWaSOdsHw4hX0FNJk29
         6fZKuyZD9dRa324HzvD0DZQuFXy5RoMxLNJrA3Idy9wmlfBDbqmflTMem27s7WsqsdYq
         L7McGvr5KTFMLJBTOoLBs4ssbv+T0u8nHFyZsuF1ri7SerGiVf5uH36MCNtUXxarHyEj
         g3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704704324; x=1705309124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guTqdWfxQATjkH07r6kHImh4BVrF3OOXj/+02SDtpis=;
        b=vDMjKp9VPIBJoUm3ZsSZn41K9eFmVuP3VsYyPcsZYdnQjT1x791J844bFZfinQs+yU
         O2OKcA+ZTjy5ziZJ1G5zsqT0QNnAotSAhzyAblFh/vH/YPnzg8jLS+JLTvv9SOjWF+Qb
         /uYXPXe4fLJ4jSaKoHYsuQKO38kuer+Qs/f+qsgsOsEal6kEQPElAdUDhYsxzCC/z8mV
         6pVXPhFB1MeQY4uIpHZ/1k+U9O1X7yyn4mBT82KqSfaZse5HIGj+h7LgXN3vD1kAmHhG
         950XyePehx8x8iv6pKsRC271oHcCZXQdCqhHvUzdLxqoVxZZt13NtbGsBgLWFOO9cR+x
         h7BQ==
X-Gm-Message-State: AOJu0YxsQ0JCAuu4HH+YNc0b99lQQa5R5b5cruPQ15AgeiNodZkC0cqS
	Yq8a3J4sLyzb46LNuvdwngf2mKEzJYJa9Q==
X-Google-Smtp-Source: AGHT+IGwWu+ziasK21eWcu0RdH15T/X0cxyQ0WJSaDLbl9oInntwAdgRts17Jtg0k4EoezBnkLHrPg==
X-Received: by 2002:a19:6d15:0:b0:50e:7c0e:57d1 with SMTP id i21-20020a196d15000000b0050e7c0e57d1mr1049083lfc.130.1704704323630;
        Mon, 08 Jan 2024 00:58:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id c7-20020a0564021f8700b0055473af90a6sm4109654edc.0.2024.01.08.00.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 00:58:43 -0800 (PST)
Message-ID: <ee783b61-95fc-44ab-a311-0ca7d058ac39@tuxon.dev>
Date: Mon, 8 Jan 2024 10:58:41 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 08/19] net: ravb: Move the IRQs get and
 request in the probe function
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, p.zabel@pengutronix.de,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
 <20240105082339.1468817-9-claudiu.beznea.uj@bp.renesas.com>
 <02548b1b-d32c-78b1-f1b6-5fdb505d31bb@omp.ru>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <02548b1b-d32c-78b1-f1b6-5fdb505d31bb@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07.01.2024 20:24, Sergey Shtylyov wrote:
> On 1/5/24 11:23 AM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The runtime PM implementation will disable clocks at the end of
>> ravb_probe(). As some IP variants switch to reset mode as a result of
>> setting module standby through clock disable APIs, to implement runtime PM
>> the resource parsing and requesting are moved in the probe function and IP
>> settings are moved in the open function. This is done because at the end of
>> the probe some IP variants will switch anyway to reset mode and the
>> registers content is lost. Also keeping only register specific operations
>> in the ravb_open()/ravb_close() functions will make them faster.
>>
>> Commit moves IRQ requests to ravb_probe() to have all the IRQs ready when
>> the interface is open. As now IRQs gets and requests are in a single place
>> there is no need to keep intermediary data (like ravb_rx_irqs[] and
>> ravb_tx_irqs[] arrays or IRQs in struct ravb_private).
> 
>    There's one thing that you probably didn't take into account: after
> you call request_irq(), you should be able to handle your IRQ as it's
> automatically unmasked, unless you pass IRQF_NO_AUTOEN to request_irq().
> Your device may be held i reset or even powered off but if you pass IRQF_SHARED to request_irq() (you do in a single IRQ config), you must
> be prepared to get your device's registers read (in order to ascertain
> whether it's your IRQ or not). And you can't even pass IRQF_NO_AUTOEN
> along with IRQF_SHARED, according to my reading of the IRQ code...

Good point!

> 
>> This is a preparatory change to add runtime PM support for all IP variants.
> 
>   I don't readily see why this is necessary for the full-fledged RPM
> support...

I tried to speed up the ravb_open()/ravb_close() but missed the IRQF_SHARED
IRQ. As there is only one IRQ requested w/ IRQF_SHARED, are you OK with
still keeping the rest of IRQs handled as proposed by this patch?

> 
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>    Unfortunately, I have to NAK this patch, at least in its current
> form...
> 
> [...]
> 
> MBR, Sergey

