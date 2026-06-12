Return-Path: <linux-renesas-soc+bounces-33946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PbemLQFHLGryOgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 19:50:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264E67B72B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 19:50:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NO29Eynd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4CF532F3D6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 17:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85862358381;
	Fri, 12 Jun 2026 17:49:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36D03655F9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 17:49:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781286598; cv=none; b=XADs+ibveGWrUh71ET14jh/kyzKBR5adfOosoYq8tt1AQ1F4Wwr5vuQHBP6Fl8KGvvrh5gjPkVhvZ+d4a5wOaLleUcESL4+u1QRCrK9AdtyDECtiQtEmVjfsTJfbZEDaganUwZXrBcM0Fn7/1wky4g78TNvnGuoka5JCG51wU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781286598; c=relaxed/simple;
	bh=h115VTK6dungfQ4qIdCxA3kCKtoEZBfHb83D7Vo31gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gMyqML6Vb8F6YvxENOR3+YlLoiTWhZ9AlOtDfHFR7NeD9qRBXNZQpKZZHz71XwyzxyRgDcgnBgNF8TB63AwUq7ZbjSLDNod+nODM76hFvqk+3j/961IN2/iIhcADucEE8KCbq38VWxEOAKtJJfmc3R6dDbpSHOd0KsM0wmX7Ziw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NO29Eynd; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so10276785e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781286595; x=1781891395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C85wBIXdmOAkbGAX37TSwTaJxl8p7p/GigMbGhAuSmc=;
        b=NO29EyndaZTP4L9bwqRYnxiwYwu3iC3bkQTJe8JVl/jCSqZDwSLYVhxRAxAAlsZnGq
         z8ovA9kxiRPX3uNCAtCQQk/40+Vi6nSJYfNxnTHyn0BNUkMogapVhueSRGrJfmlWkluu
         70Hv+BtE2YYQexNE03azSY4wCAmx8xs/khlZlG7yrX2zCOxYfp1PcbpXYhcH3pVxu8hE
         1DBjU81toTHYhFse6lhVRyRKCjP4ZBwNZrmUtSNlAUItk9V8115ndCndbEM0uR8d0LFW
         wom8KKabJYaS0GivkOV0K4ZgeDirCDMp4OqtqGEJSDg1kbnLQrYsMmpIhisaLIjwv5fU
         hQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781286595; x=1781891395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C85wBIXdmOAkbGAX37TSwTaJxl8p7p/GigMbGhAuSmc=;
        b=QOk0MnyDtOrWD5AAhalnJFJJhbtUi2O95eEvwKqZrNSiPxj9kTQ/oGsV+5ortMYh35
         6q5zxWde9hEG+xfWFRS2DIEcohjUYaUh0ru1FGYCif01CVsv0DK3DhYRw6EgzTNeK0o7
         +4gmG6qHrgthToarTrL/r0AxQ5KqFR+jN0vLPjI4jicYxUGyzWBDwVeQ3wn0yaj+F/Yl
         ckRZZu6IMf/hoCbdKq6cbxIIkCgX+mP9In49+M8O+Mla1/U3XarhNeJ7apsJTOufsvPs
         LcH5Z5r0BBJa1HD66J3yzqYaSSMOuHJTzJ1LqCyRS9hCxNxs1ADdCLDvGgdAjmwsU31M
         AFrA==
X-Forwarded-Encrypted: i=1; AFNElJ+bcSfF2ZJ5HAo61UQG3d3jHlZlwTfO3bPWi84PdBQVMslPqAjCeonA1R64XVxwbmVe+TdFGUl1XQ/QvLtco6IB2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzngiHdnsOupL0hMh5lPODYhDnHvqxbLF1A7oln2JwN9IhtZZiy
	YAz0ZycwfwKdNqCUy/xSlUXBP4hiHpG/EuGltM9r44x/feqXpC7Tffvl
X-Gm-Gg: Acq92OFk34Z+JyfqFABTBf2CgDscuNqndloRl6U2JtSgwKo32z2yh3/XKxc6d1DfWLd
	72L3l/6x4BUTvpG26o3ZLyw5hxjx5rCm+ZGC3FCA6opasLOOLAPJ2Avkq9vFI6H3yBM1BFIzNis
	8UpCTgP2BvCkILNVBZI3Zgl0pWxdwlmac4VSqGaP3d1GxT7MTk7KpX2f86DYIoVDM9MRcmqwZXQ
	4LDbiZuV2m+SmOm+EAWhz+gpCBOVl0CB82lnYpLHj6GJ94L287ea6PDL4D3LdM8oJ76ZuxjARm/
	P4LwX1U1BNoUu4GeNwexozhEcrFq7pqXtkseZJc05Lb8jF+5jOwHYIoInRahPRqmlrkZbZd5Fjj
	qN1o/vBst7tECO3ZNuvjGKIKX81HAHOmEJ9Ji9l7/g8QYWzBfCQZMv0kI7+G9dLzy3Iodi/kS5u
	ri+mM5K7duCphbBjK3l+HWflzjKPCQfvuoL6TGBEthfAhEPRYU/nd3qJtJoN8lv7lO2xHY5ZGgX
	Gk=
X-Received: by 2002:a05:600c:820c:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490ec4cd08fmr53203395e9.1.1781286595100;
        Fri, 12 Jun 2026 10:49:55 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm7395809f8f.12.2026.06.12.10.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:49:54 -0700 (PDT)
Message-ID: <31cb54ac-8cf7-45fe-9167-becc4cd2aea9@gmail.com>
Date: Fri, 12 Jun 2026 20:49:51 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 3/9] net: ethernet: ravb: Simplify gPTP start and stop
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-4-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33946-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ragnatech.se,pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0264E67B72B

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> For devices that do not support the gPTP clock in config mode the
> somewhat oddly named flag gptp is set, compared to devices that do
> support the gPTP clock in config and operation mode where the flag
> ccc_gac is set instead. The two flags are mutually exclusive.
> 
> For the gptp-flag devices (Gen2) the clock is tied to the AVB-DMAC, when
> it is stopped so is the gPTP clock. For ccc_gac-flag devices (Gen3) the
> gPTP clock is available whenever the ndev is open.
> 
> Prepare to add Gen4 support which will add a third way by cleaning the
> Gen2 and Gen3 cases up a bit.
> 
> Fold the gptp-flag start and stop calls into ravb_dmac_init() and
> ravb_stop_dma(), which start and stops the AVB-DMAC. There are no

   s/stops/stop/.

> functional change as all call sites to the construct,

   s/,/:/?

> 
>     if (info->gptp)
>         ravb_ptp_init(ndev, priv->pdev);
> 
> Are always just after a call to into ravb_dmac_init() and all call sites

   s/Are/are/.

> to the to the construct,

   "to the" repeated... And s/,/:/?

> 
>     if (info->gptp)
>         ravb_ptp_stop(ndev);
> 
> Are always directly followed by a call to ravb_stop_dma().

   s/Are/are/.

> 
> There are two special cases where the calling construct covers both the
> gptp-flag and info->ccc_gac devices, one for start and one for stop. The
> condition that it is preceded by a call to ravb_dmac_init(), or followed
> by a call to ravb_stop_dma() are however true for them too. Reworked the
> two special cases to drop the check of info->gptp.
> 
> The end result is that the gPTP clock will be started or stopped for the
> gptp-flag devices in tandem with the AVB-DMAC, while the info->ccc_gac
> devices will be controlled, as before, when the ndev is opened or
> closed.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]
MBR, Sergey


