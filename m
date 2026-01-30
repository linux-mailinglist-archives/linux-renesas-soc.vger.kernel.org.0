Return-Path: <linux-renesas-soc+bounces-27682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cArbCSa4fGm7OQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:54:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B31BB625
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95992300B137
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 13:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563C03161AB;
	Fri, 30 Jan 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l67TSPRg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DFD30F943
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781282; cv=none; b=A6H0okBXuBRzFNA1yY6s9DWDUKRvyfsFGKG7FBdZB9KOAYrWUQypljfaezDU4jqPfE+SMgtDqY4RffP0HG4p/NCdftDgejsLuzTPWTiF7b+QBZZJKh8X4mYV8+vSVxG2KWJsu28jWacO0tIAW3SM2azKsEWzx5diqAo0mmmbVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781282; c=relaxed/simple;
	bh=/46oDN82LjogzmORyHLOarRQ21fOzhCRXiwBNpC4pgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQOeJeOP4GSohy0qHDeCNwNp3vlpfkgXYArVlu/nF/8hprwksjE9J2Aqbczz6gaFa5dt3jhgbdaS5b+H8oYK3fzml66BaST2FwjtK1IsM94/BI+NcdpVtdaBm3HQbvFLXDEuPDkhMYAV1leevm5ADvpZ1zUfQdoQlDmZF3pXwIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l67TSPRg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so1878382f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 05:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769781278; x=1770386078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2fnMBaIl3iqJIAy71Kiwyskd4MUnQ9YmeCSljhkZAw=;
        b=l67TSPRgA9OweFGD6z2maoe0ltMhaURwDY+hLfIyS/8/zfoOdumGFpZDrXzfNoFHlc
         bZRpxL95X30rTYcTyzgT2gm+FTnbM1nGV7Kpj+DbmP0ZNXia+qVAhtxsxGQIcPXuuAX9
         PmDrk3mKu4qqW0DGLH8sYQeXbhsCD9RhLj7DgQ0n3HKN8UJhRB9fdeN+Q9/mTG/2qMED
         yKkGuPT96QTj+n1EEAIgwPqfV1RXECUpSpC3PRUgkU3YYUS2zcWhI4FqRuPamiiEldRD
         P/+ekRFzeKhETYoDSS6SqHQ2AmFevXwlajZ1WOxRSg3+Xfh+C9Ny1CLBEAwY3LPuP8cU
         jkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781278; x=1770386078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2fnMBaIl3iqJIAy71Kiwyskd4MUnQ9YmeCSljhkZAw=;
        b=t6a+X6MXFx0D328ibHr1Swr0Whp/OkqW1ti3bvAC4+D3HSyYEXpAyxa3WA285Jo2S9
         Whq8XQ5ObTx7bSWyKbrNu9b1L8rM9Nkisdv20m5bpy1jBk8QwM+UMIv4w2NZ1EEGyDu/
         Ug0dqmghCjSRrPfLODrnvOlEmstFpombeaWWUvc79Q11Ksukv98VaJ1nTPku/1l4V4ST
         eMABvaONo1SIlBAVNXIryXGL6AlXfKrNwEloPI8Zausnk7BW4Io6Klj2+RIJFoB0Td39
         Bd7mPHWg4w2sHzOgKXq7v59LDyfNMsoTwgEnijqouWXHRAKefsgAFl2xd8WVC2m52+yu
         IrIw==
X-Forwarded-Encrypted: i=1; AJvYcCV0AazyzvBteXB8TOmMQte4vJgBIOO1mlHgxNByfN//IvyOLzhggCuC/aI5aNYEECeqAOS7aBlZP5n/5chzx3Ao9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKoH0I9SwgO5sA3fHDKnR5Hs92Ckwg5HlIvWWRad/TtFZaj6F+
	h5GJYzw7rT9ue/LyoeEscVKvRPadymuIgvuxwLtUsQ0P7uoZPwr+0YqrZdKKBHdWOJKxYSLvUzd
	7aZrv
X-Gm-Gg: AZuq6aJt2vGkSz0RFXs0yN+sbz/Xuu2CudzcpTepEKNCI4RyY3415lA+sQ/zO1iKiFh
	klKncPp0Ts3cKnI2hct4ROBQ6WScyS65cDP7Dtoz99HlmYqyoBltPAGsLR/NgHkWJxB2wtSWry2
	tj8v3UQBoRqM5Ccbpf4xNkyxpN6nuQ6ksWHQs5Sj6Z5kZJRRKDMtGPkFsdvK6Br8sYOJDz00mHc
	KI4qn+mP30GG4J3ayksksMaDffweHV6kIq0klEyF1dUecdD0HVwcKiYoQ91Yf0JI5uZCFRXICh1
	SPWhm3TAP5yDRU7pfm0I/mDZ5zZS2ZMaHaNfbdJnh/zcZT/lsiMDzNlG8fq+YYA/ArpSTD7GIu0
	rPQokl2qnOhnD3pDHGoI7/DTxst5EsfAsikllzZn/6RaBQFAIV7OXdGGAvcvvvKIOMCod/WUaMU
	ZhAgQMoDbXLvrfn67Yjg==
X-Received: by 2002:a05:6000:1a8f:b0:430:f68f:ee97 with SMTP id ffacd0b85a97d-435f3aa7800mr4427461f8f.40.1769781278225;
        Fri, 30 Jan 2026 05:54:38 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1322eefsm23255962f8f.30.2026.01.30.05.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:54:37 -0800 (PST)
Message-ID: <2fb06fb9-eaf3-4911-8d3e-5d5c554e5f5d@tuxon.dev>
Date: Fri, 30 Jan 2026 15:54:35 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] PCI: rzg3s-host: Add SoC-specific configuration
 and initialization callbacks
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-10-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260129214130.16067-10-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27682-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:mid,tuxon.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3B31BB625
X-Rspamd-Action: no action

Hi, John,

On 1/29/26 23:41, John Madieu wrote:
> Add optional cfg_pre_init, cfg_post_init, and cfg_deinit callbacks
> to handle SoC-specific configuration methods. While RZ/G3S uses the Linux
> reset framework with dedicated reset lines, other SoC variants like RZ/G3E
> control configuration resets through PCIe AXI registers.
> 
> As Linux reset bulk API gracefully handles optional NULL reset lines
> (num_cfg_resets = 0 for RZ/G3E), the driver continues to use the standard
> reset framework when reset lines are available, while custom callbacks
> are only invoked when provided.
> 
> This provides a balanced pattern where:
> - RZ/G3S: Uses reset framework only, no callbacks needed
> - RZ/G3E: Sets num_cfg_resets=0, provides cfg_pre_init/cfg_post_init/cfg_deinit
> - In addition to that, RZ/G3E requires explicit cfg reset and clock turned off
>    to put the PCIe IP in a known state.
> 
> Add cfg_pre_init, cfg_post_init, and cfg_deinit callbacks to support
> custom configuration mechanism in preparation to RZ/G3E PCIe support.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v4: No changes
> 
> v3: No changes
> 
> v2:
>   - Renamed callbacks as per Claudiu's comments
>   - Reworded goto labels to be consistents with callbacks
> 
>   drivers/pci/controller/pcie-rzg3s-host.c | 66 +++++++++++++++++-------
>   1 file changed, 46 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index a6fb2ec4a341..15ccd9095a3e 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -223,6 +223,9 @@ struct rzg3s_pcie_host;
>   /**
>    * struct rzg3s_pcie_soc_data - SoC specific data
>    * @init_phy: PHY initialization function
> + * @config_pre_init: Optional callback for SoC-specific pre-configuration
> + * @config_post_init: Callback for SoC-specific post-configuration
> + * @config_deinit: Callback for SoC-specific de-initialization
>    * @power_resets: array with the resets that need to be de-asserted after
>    *                power-on
>    * @cfg_resets: array with the resets that need to be de-asserted after
> @@ -233,6 +236,9 @@ struct rzg3s_pcie_host;
>    */
>   struct rzg3s_pcie_soc_data {
>   	int (*init_phy)(struct rzg3s_pcie_host *host);
> +	void (*config_pre_init)(struct rzg3s_pcie_host *host);
> +	int (*config_post_init)(struct rzg3s_pcie_host *host);
> +	int (*config_deinit)(struct rzg3s_pcie_host *host);
>   	const char * const *power_resets;
>   	const char * const *cfg_resets;
>   	struct rzg3s_sysc_info sysc_info;
> @@ -1082,6 +1088,18 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>   	return 0;
>   }
>   
> +static int rzg3s_config_post_init(struct rzg3s_pcie_host *host)
> +{
> +	return reset_control_bulk_deassert(host->data->num_cfg_resets,
> +					   host->cfg_resets);
> +}
> +
> +static int rzg3s_config_deinit(struct rzg3s_pcie_host *host)
> +{
> +	return reset_control_bulk_assert(host->data->num_cfg_resets,
> +					 host->cfg_resets);
> +}
> +
>   static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
>   {
>   	/*
> @@ -1229,20 +1247,24 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>   	u32 val;
>   	int ret;
>   
> +	/* SoC-specific pre-configuration */
> +	if (host->data->config_pre_init)
> +		host->data->config_pre_init(host);
> +
>   	/* Initialize the PCIe related registers */
>   	ret = rzg3s_pcie_config_init(host);
>   	if (ret)
> -		return ret;
> +		goto config_deinit;
>   
>   	ret = rzg3s_pcie_host_init_port(host);
>   	if (ret)
> -		return ret;
> +		goto config_deinit;
>   
>   	/* Initialize the interrupts */
>   	rzg3s_pcie_irq_init(host);
>   
> -	ret = reset_control_bulk_deassert(host->data->num_cfg_resets,
> -					  host->cfg_resets);
> +	/* SoC-specific post-configuration */
> +	ret = host->data->config_post_init(host);
>   	if (ret)
>   		goto disable_port_refclk;

This will have to jump to the config_deinit_and_reclk label (see below).

>   
> @@ -1253,19 +1275,22 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>   				 PCIE_LINK_WAIT_SLEEP_MS * MILLI *
>   				 PCIE_LINK_WAIT_MAX_RETRIES);
>   	if (ret)
> -		goto cfg_resets_deassert;
> +		goto config_deinit_post;
>   
>   	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
>   	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>   
>   	return 0;
>   
> -cfg_resets_deassert:
> -	reset_control_bulk_assert(host->data->num_cfg_resets,
> -				  host->cfg_resets);
> +config_deinit_post:
> +	host->data->config_deinit(host);
>   disable_port_refclk:
>   	clk_disable_unprepare(host->port.refclk);
>   	return ret;
> +
> +config_deinit:
> +	host->data->config_deinit(host);

This should be like:

config_deinit_and_reclk:
	clk_disable_unprepare(host->port.refclk);
config_deinit:
	if (host->data->config_pre_init)
		host->data->config_deinit(host);

To avoid asserting CFG resets on RZ/G3S when they weren't configured.

> +	return ret;
>   }
>   
>   static void rzg3s_pcie_set_inbound_window(struct rzg3s_pcie_host *host,
> @@ -1631,7 +1656,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   
>   host_probe_teardown:
>   	rzg3s_pcie_teardown_irqdomain(host);
> -	reset_control_bulk_assert(host->data->num_cfg_resets, host->cfg_resets);
> +	host->data->config_deinit(host);
>   rpm_put:
>   	pm_runtime_put_sync(dev);
>   rpm_disable:
> @@ -1666,32 +1691,31 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
>   
>   	clk_disable_unprepare(port->refclk);
>   
> -	ret = reset_control_bulk_assert(data->num_power_resets,
> -					host->power_resets);
> +	/* SoC-specific de-initialization */
> +	ret = data->config_deinit(host);
>   	if (ret)
> -		goto refclk_restore;
> +		goto config_reinit;

Shouldn't this jump to clk_prepare_enable(port->refclk) ?

Also, you've changed the reset order here. Please mention it in the patch 
description or add a separate patch for that.

Thank you,
Claudiu

>   
> -	ret = reset_control_bulk_assert(data->num_cfg_resets,
> -					host->cfg_resets);
> +	ret = reset_control_bulk_assert(data->num_power_resets,
> +					host->power_resets);
>   	if (ret)
> -		goto power_resets_restore;
> +		goto config_reinit;
>   
>   	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
>   				 sysc->info->rst_rsm_b.mask,
>   				 field_prep(sysc->info->rst_rsm_b.mask, 0));
>   	if (ret)
> -		goto cfg_resets_restore;
> +		goto power_resets_restore;
>   
>   	return 0;
>   
>   	/* Restore the previous state if any error happens */
> -cfg_resets_restore:
> -	reset_control_bulk_deassert(data->num_cfg_resets,
> -				    host->cfg_resets);
>   power_resets_restore:
>   	reset_control_bulk_deassert(data->num_power_resets,
>   				    host->power_resets);
> -refclk_restore:
> +config_reinit:
> +	data->config_post_init(host);
> +

Here

>   	clk_prepare_enable(port->refclk);
>   	pm_runtime_resume_and_get(dev);
>   	return ret;

