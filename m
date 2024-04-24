Return-Path: <linux-renesas-soc+bounces-4871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40AB8B0824
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 13:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 071CDB2260E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 11:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A54915959F;
	Wed, 24 Apr 2024 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U4bC0ILa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22B91598E7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2024 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713957193; cv=none; b=dbxy5RD3Du3V+/pdY07IXZ3i+0IhtsXk5CmvDbgicsevAEIM3vOguJZBk8IeIg165SSi2UNDULFPZOcdYxVnH2HruVfysNE95M3x6KsZZNpulZHV3LfgsxTHm6RRTEYCLX1yT8J+rZcSuafIbnTafPc82BwBsFTcYtgs38+JtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713957193; c=relaxed/simple;
	bh=WMNSKI3RtoRqbQieeq7QOrGvMyFJTgjOPtgzlmdiq2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgJYNvRptyAZSY9p3CuIpJqvw0k1n4YCcD25HG+WtETYoUo+rx2AZem/q2UWzFlheUvYmPvDS3A7PxtcgBXeJWV6OB1QSSSowtZFv7XQSfURAFIkQZtYwwahT5GWKxziow3u4jKhH3smU3AK86Z6hIrFMe+QhKBFlBfbLswzwwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U4bC0ILa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41b21ed19f6so515015e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2024 04:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713957189; x=1714561989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuS/MeSVaQGd2vfiEhoiZ2JN9TmDlUJ9YDiQAbZPceA=;
        b=U4bC0ILaFmJVdvpndPiJW3U8Sdg4mc8qmsgR9PcDJbbxXgfYhRdPLfwshaMkCpn3OX
         s5t6nZCh04hIhOePyXrvPrQinuBElzpyj9ltXAEBbo0kA7qF1bjm2Wrimo7vboKzT9W1
         rr382YvCm9Fdv/UGBEgFHvr7Q8u+oBXVhUOPFGxprKTJp34yDMK586p9qSH89WghgPK9
         XCUUFc4r3rfnsdpb3QIlHZBWcHBi2luVsjijKMD/wEp4mNmY9IYrNG778fkkb+o4a2Hn
         x9/084IGRitRkNtnSrwbpL9eCBWudOUDhFPvKgQWDbWx1OYSWdq0TguTGH3M0E1L+Gbd
         Pfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713957189; x=1714561989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuS/MeSVaQGd2vfiEhoiZ2JN9TmDlUJ9YDiQAbZPceA=;
        b=vt6v7x1HwEaC682T6zqiTlF9Nj3iLrKfbS6CdWRqYDMF/zuAgudLRkcngKZdgbo3xD
         ccsWiLbg5l09DVUv4V+65IpNkwujQSf45MkbSl8z08CeeB1vWkFnzhS2zN6fROFc5rNM
         kP3fIZTOVqLuYrK/wXZNAxQ7c1sLCc2zNuB/HvFIK8T0C5qEXTaW3FA8NjFhghlFyejX
         DOgaAt7LOBHXNtDe2TNeuO0M97kGI/DVEC8+GORhnWP1LW1hkNv2rrH5gwnRP04QXIoA
         5DCAXTpfb4rGSlOv3q59aNvH4G2ZSqYXqXg4uGQBkG0ZolDv2eiVcCjBOwNVYIDYbGH2
         wsCA==
X-Forwarded-Encrypted: i=1; AJvYcCXs+0AkriIxiUsBiJUpcuOkjcHh7z7J8Ysp+p8WHlKJDmV+n7O6vMDl+wmGfYBrk1ZaB/55P0PIbT+Jm4x6/4yPT68b8uvirBm6DtNDiI/o37g=
X-Gm-Message-State: AOJu0YwkzZq9bopyqxOqw/t00baS3lRat3SFGOo9t8hdbAWZ6+A/CC75
	1Vet4dXStdAfJAbIGOZdmJVvG35vAVWbD1Ia7vLHtYZzLoK00EiDIb95+cRMKvI=
X-Google-Smtp-Source: AGHT+IEsmRMTrmnRs0/q7vNtTTmh6ZDQCCPSXskQm7UUfKPKy/cw9giZEGu9KlhLOwDJB4WZDflq1g==
X-Received: by 2002:a05:600c:1d0e:b0:41a:c592:64ff with SMTP id l14-20020a05600c1d0e00b0041ac59264ffmr1508645wms.35.1713957188961;
        Wed, 24 Apr 2024 04:13:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b00418a6d62ad0sm27290070wmq.34.2024.04.24.04.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 04:13:08 -0700 (PDT)
Message-ID: <ea74f0f9-2081-4ca5-af11-4974625f22ed@tuxon.dev>
Date: Wed, 24 Apr 2024 14:13:06 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ravb: Fix registered interrupt names
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 24.04.2024 10:45, Geert Uytterhoeven wrote:
> As interrupts are now requested from ravb_probe(), before calling
> register_netdev(), ndev->name still contains the template "eth%d",
> leading to funny names in /proc/interrupts.  E.g. on R-Car E3:
> 
> 	89:  0      0  GICv2  93 Level  eth%d:ch22:multi
> 	90:  0      3  GICv2  95 Level  eth%d:ch24:emac
> 	91:  0  23484  GICv2  71 Level  eth%d:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  eth%d:ch1:rx_nc
> 	93:  0  13735  GICv2  89 Level  eth%d:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  eth%d:ch19:tx_nc

I failed to notice it, sorry about that.

> 
> Worse, on platforms with multiple RAVB instances (e.g. R-Car V4H), all
> interrupts have similar names.
> 
> Fix this by using the device name instead, like is done in several other
> drivers:
> 
> 	89:  0      0  GICv2  93 Level  e6800000.ethernet:ch22:multi
> 	90:  0      1  GICv2  95 Level  e6800000.ethernet:ch24:emac
> 	91:  0  28578  GICv2  71 Level  e6800000.ethernet:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  e6800000.ethernet:ch1:rx_nc
> 	93:  0  14044  GICv2  89 Level  e6800000.ethernet:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  e6800000.ethernet:ch19:tx_nc
> 
> Rename the local variable dev_name, as it shadows the dev_name()
> function, and pre-initialize it, to simplify the code.
> 
> Fixes: 32f012b8c01ca9fd ("net: ravb: Move getting/requesting IRQs in the probe() method")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for taking care of it.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S


> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index b621ddd4539cf517..384ddad65aaf641a 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2729,19 +2729,18 @@ static int ravb_setup_irq(struct ravb_private *priv, const char *irq_name,
>  	struct platform_device *pdev = priv->pdev;
>  	struct net_device *ndev = priv->ndev;
>  	struct device *dev = &pdev->dev;
> -	const char *dev_name;
> +	const char *devname = dev_name(dev);
>  	unsigned long flags;
>  	int error, irq_num;
>  
>  	if (irq_name) {
> -		dev_name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", ndev->name, ch);
> -		if (!dev_name)
> +		devname = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", devname, ch);
> +		if (!devname)
>  			return -ENOMEM;
>  
>  		irq_num = platform_get_irq_byname(pdev, irq_name);
>  		flags = 0;
>  	} else {
> -		dev_name = ndev->name;
>  		irq_num = platform_get_irq(pdev, 0);
>  		flags = IRQF_SHARED;
>  	}
> @@ -2751,9 +2750,9 @@ static int ravb_setup_irq(struct ravb_private *priv, const char *irq_name,
>  	if (irq)
>  		*irq = irq_num;
>  
> -	error = devm_request_irq(dev, irq_num, handler, flags, dev_name, ndev);
> +	error = devm_request_irq(dev, irq_num, handler, flags, devname, ndev);
>  	if (error)
> -		netdev_err(ndev, "cannot request IRQ %s\n", dev_name);
> +		netdev_err(ndev, "cannot request IRQ %s\n", devname);
>  
>  	return error;
>  }

