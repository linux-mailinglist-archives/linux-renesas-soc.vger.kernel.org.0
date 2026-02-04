Return-Path: <linux-renesas-soc+bounces-27880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNsTEXFAg2kPkQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 13:49:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69287E6015
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 13:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 484173013FDF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 12:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76C53F23BA;
	Wed,  4 Feb 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nK1RH4Xe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E59D19C566
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209308; cv=none; b=EW3wBDOVTs3REljEtrVH7YBBwlx4mpfSR7tAJw5sfbdSl/ZIhMWtNGnghf9OUJoeXB0ZUPLGza149w9oeSZeHYtf5dQq2Du2LN5+Fzt1eBHLnf9Vuiu/VppRQO8ApEwPEqnVT8Lim9k6z7AHUEalsVMweEWnXSj/HRCTygQCcHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209308; c=relaxed/simple;
	bh=6MfjmNk8dtyaBuEQCdqrh2ZHv3QxPSfQgxQU2sWMjCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqIWr4MllqmfxebPZK5wws+gxIhVKnUUR19pbzLiiDhREtRCWtTpsNzsZEcTYQT2aUzC8QG1PPivifTXPxC3c4wSPnZCXRIKsLcpIJ3EowgZOlHTds3T9tZmZMti92vflRO6+YFe6+PTzfgow2owsAsm7TyAiOAVSdKgzEx7hOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nK1RH4Xe; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b885e8c679bso1063984866b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 04:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1770209307; x=1770814107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmsMlFS2If3FaGyK0lL7JZ89jCKyXCfusyNuSVVf17s=;
        b=nK1RH4XeYWYYFx7VMKonWyhxFjJaZt4zHbEB5ahflmiycVYOFP3SYXwVYA0VJU/UPu
         lFtBcpXYghWEbeEZiJ5z6CmMmPPzOwcaAiEitKiNCQf+M/holIQ+AF3QC3N5HFciE7U/
         iQyQscjE5+w6V+b6ahUi6B/54O7frYGWA7Yl/VEk0eOuXvMUgtt/RsvtvVDpDi1KNfhY
         httOWdUPsKDrpSSlUdwvASiaiCx3ss58HFcCoRfLuVaIElzbAxyKIo+z27PehcpxBmh9
         dSK99C96Mq0dj9+IeS9gbSjjPLbrlTGH3nuEHMKR76rFVL2fTZDPfYW4JEeQDyLuxYPf
         FFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209307; x=1770814107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmsMlFS2If3FaGyK0lL7JZ89jCKyXCfusyNuSVVf17s=;
        b=nX41AEctu8Ka7LeEvBLhmT+gQKZDimxbiEVJqHmxD7Cs4nY6fseAd5MBNwKt8+Yc7q
         39Woy2fqW7ie5SOuraVmof66fx+trbmmQMX17Qq0RaMDr8FjkkSrZm4UfPr9ZNj2OnUq
         x9jcXg2w8yVDZthU2s0hHZhX5uE0FM04tWTt59qHGLkNt7dYod06vfovXlaH3PkyI2L8
         pVqFVWU5YgyIfsyK9eXq7kKVNtoPAX019UFOi8mdxMOsPUDvqTc/CWzUKTBHW6ewugLs
         2jAeOMRmV8dJwTmTYfGQ4wjsnu3iPhsmsurmJjF5wUwsvgNjjW7f1Ykyw+qO1e4L2xCR
         Vv0A==
X-Forwarded-Encrypted: i=1; AJvYcCWdwIrtRJZXdIr4Pi0XzRMwtE6wMq/HrS87pNVaaxeohhhtzO1iVC10RwKOnxXOpyAbyzMu5aVslfi8EjBu7m57Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNw1bWnV/hYzT8X+epRtLAFwBV/rrbqMv4k7+xL4oWRDc9vYw
	MPtAwNHaYwAxWyIwYJbONmz6zzYkYpKVrrJ0Aas4e4VvCpi149yC3uvNfrkL1oT2tfE=
X-Gm-Gg: AZuq6aJEYCOpyI+Lz/wY+I7TxRUv61o+Bg7ADeT7ljt61lr5/4+m2tlbtqR0eh3KGt+
	wH10FnaIOVuVAGRdSZiJM2ZUQ0Cxf0rGzSc5pdsYHwVFQezXyd2Xc7TL5MmHgyGMxdY+ov2ZyYA
	yM+p/IEFaWER1KecrMMEu/SRTD7+2GL+LE/oWhn9K0n+zJKsqwYdLWhn7wDzqgbafhqYTW7OUwc
	RXA3uiZAgH8XRKmdpi/UfysdUy/eGs6cBg2+2JX44iZ/79SaztCTe9efU+V6rxsffF/aSVVTrWs
	bU7WPHVmrWD+v8+kIeOZAAnMRRLkgGMlNavYHInmpqkjllJ3nV08MM0yYxsCuGlLJFEc6I1iI+0
	4UAnCd6IhdJt1Wi/YiCDjTv4m1QQqMfGyPNSgSITJYktDSMsXB/sBRTeAQ08aJKQzgIqz+n0HKs
	eSvZQBoLvib3LOIljM1vA=
X-Received: by 2002:a17:907:971a:b0:b73:544d:b963 with SMTP id a640c23a62f3a-b8e9f04c8ecmr184780066b.13.1770209306435;
        Wed, 04 Feb 2026 04:48:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feeff67sm118439166b.36.2026.02.04.04.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:48:25 -0800 (PST)
Message-ID: <d024e1f1-ab7e-4b90-9be3-a55e130c2b67@tuxon.dev>
Date: Wed, 4 Feb 2026 14:48:24 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: renesas: rzg2l: Drop DMA driver dependency for
 system boot
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260130143456.256813-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260130143456.256813-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27880-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:mid,tuxon.dev:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69287E6015
X-Rspamd-Action: no action

Hi, Biju,

On 1/30/26 16:34, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> As per section 4.6.1.7.1 of the RZ/G3L hardware manual "Precaution when
> use the peripheral modules which can initiate DMA Controller", it is
> stated that it needs the below register settings even if DMA controller
> is not used:
>   - Set CPG_CLKON_DMAC_REG register to supply a clock for DMA Controller.
>   - Set CPG_RST_DMAC register to release a reset for DMA Controller.
> 
> Currently, the serial IRQ is not routed to the CPU if the DMA ACLK is off,
> or if DMA resets being in the asserted state result in not getting serial
> IRQs for the console. Fix the issue by explicitly deasserting the DMA
> resets during probe, and since the DMA clk is a critical clock, it will be
> turned on forever. This will allow booting system without DMA driver.
> 
> RZ/G2L SoC loses power during s2ram. Explicitly turn on clk/deassert
> resets to get the console during wakeup.
> 
> The DMA driver is used by both RZ/G2L and RZ/V2H family SoCs. The latter
> does not have any issue related to serial IRQ routing. The reset assert
> in DMA driver will impact wakeup using serial IRQ on RZ/G2L SoCs. The
> cpg_suspend() is suspend-no-irq which suspends later than DMA driver. So,
> deassert thereset in cpg_suspend() for making available the serial IRQ
> as a wakeup source for s2idle.
> 
> With these changes, the RZ/G2L-based systems:
>   1) can boot without the DMA driver
>   2) get serial IRQ available as wakeup source for s2idle
>   3) get serial console prompt during wakeup of s2ram.
>   4) has no dependency on bootloaders for turning on DMA clks/releasing
>      the resets.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 35 ++++++++++++++++++++++++++++++++-
>   1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index f4deb5d3b837..16771a0101bd 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -86,6 +86,12 @@
>   #define PLL5_HSCLK_MIN		10000000
>   #define PLL5_HSCLK_MAX		187500000
>   
> +/* Critical clk/resets to route serial IRQ to CPU by default */
> +#define CPG_CLKON_DMAC_REG	0x52c
> +#define CPG_RST_DMAC		0x82c
> +#define CPG_CLKON_DMAC_REG_ACLK_ON	((BIT(0) << 16) | BIT(0))
> +#define CPG_RST_DMAC_DEASSERTED_ALL	((GENMASK(1, 0) << 16) | GENMASK(1, 0))
> +
>   /**
>    * struct clk_hw_data - clock hardware data
>    * @hw: clock hw
> @@ -2051,21 +2057,48 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
>   	if (error)
>   		return error;
>   
> +	/*
> +	 * Deassert DMA resets to route the serial IRQ to CPU for serial
> +	 * console during boot. DMA clk is critical clk and it will be
> +	 * turned on forever.
> +	 */
> +	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);
> +
>   	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
>   	return 0;
>   }
>   
> +static int rzg2l_cpg_suspend(struct device *dev)
> +{
> +	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Deassert DMA resets to route the serial IRQ to CPU for making
> +	 * serial IRQ available as wakeup source for s2idle.
> +	 */
> +	writel(CPG_RST_DMAC_DEASSERTED_ALL, priv->base + CPG_RST_DMAC);

Instead of this, you can mark these resets as critical from the SoC specific 
drivers and based on that, don't ever assert them in __rzg2l_cpg_assert(), to 
avoid any potential window when this can be asserted by the user and then 
de-asserted back here.

> +	return 0;
> +}
> +
>   static int rzg2l_cpg_resume(struct device *dev)
>   {
>   	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
>   
>   	rzg2l_mod_clock_init_mstop(priv);
>   
> +	/*
> +	 * Deassert DMA resets and enable clk to route serial IRQ to CPU for
> +	 * serial console during wakeup from s2ram as the SoC is in DDR
> +	 * retention mode.
> +	 */
> +	writel(CPG_CLKON_DMAC_REG_ACLK_ON, priv->base + CPG_CLKON_DMAC_REG);

This need to be set before MSTOP to follow the MSTOP and clock configuration 
sequence described in the HW manual (section 42.2.2. in RZ/G2L HW manual, rev.1.30).

Thank you,
Claudiu

