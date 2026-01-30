Return-Path: <linux-renesas-soc+bounces-27684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LxPK8W4fGkEOgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:57:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4DBB699
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A0F2300E259
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 13:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD2B313268;
	Fri, 30 Jan 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ze6CkP7y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4AB2EB87E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781441; cv=none; b=re9u8vdj0ToI4ifRaEIO6UWHsd2z3aqkek4DYvZCgJiHF6yXgHh8Y4qrI1EuPjJjLhQ3cfo/WS8EEjDuiEylIM0Cd2TwUW79tttmQrLxNTIrVhM+6SqmulB3S9FurAowwVSIZMcFthSQSeWsf7MzyrvGxTtPedkky4pe7afkBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781441; c=relaxed/simple;
	bh=gThK4VfvUxJmquQ6aK0nMyOCOhasklaBCUQtuScjdKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsPGrZA1taXZxWcznukwE5TegUlKv6eXz5wW69RXXio4fsjME6uNms4H7ViXpjXKd0qBnVzBLjCoGjN0ueUDAI2NWAedEkznSQhTlBtNBl/DftcAsCH3KziSSQShu6FjGoHtrv5L0HJf4PvRez2UVdYqimKBckZ7GEmt9uCfbX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ze6CkP7y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb5810d39so1595826f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 05:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769781438; x=1770386238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I40+F+E9VMc3WJ65QPLjp3haObJNkLk9zIiSJXq3k0E=;
        b=Ze6CkP7yh0Itsi26DbbjcQQy/nDQzkpVcQKaBbvYlvwgmyhl5UbEOwggBSn2egPUky
         Rpf84DEBBaJ/tTRDD8xuk2E48EKYxxqSLJPlLIjHxUCG0bsQz1hdTPJGdSc5xZqR4nfH
         cxBO182jtDZBJH2I1ThQzHpVqBjYN1axFMwL3lxIPnViUbLHjv6VXfukBeGi+QHIXTkJ
         Svduv95hLQABk4lcKt62XdG4WWkWaFYhF+798+DNEPhFyUMNjGG7F0FAncojzeSgAksH
         x8N5P9zIjNNqqQ2y2SXx6Ghyrc2lV9BxN+c//IF8xHYQ6OwBZxoPWFWctugP4QCkW8XQ
         ltcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781438; x=1770386238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I40+F+E9VMc3WJ65QPLjp3haObJNkLk9zIiSJXq3k0E=;
        b=HUz0IoPnIlH5pvjQXNN5Bm2nor/HBI57RDUxdsVIYDBR8VEmrQ+PhSapEI8UWNYcwV
         IXBEuX8TEnTnAjCYFiZ8OAX0VsQBVgrewC8ZkOvNYEk/jGPxVLiWqQENNmzD0zHe6JGG
         qIVyzf5dRP7GFItdQmXR0IrFHvaiWfOMYVS82pgq3ZknWLyhgwRwC2rLaPAVdy4YA9Ne
         0VpiewtHQ7q1h0vg+TSXgURckERwsALwH7yGg2KRrfS2BqjRecLwWLAPFrjy9XPpu0J4
         IhJT3OEp3I/tLts73yWMzw+idxWAJUdPGPSKbxDkTJlU2Lv+21LwbYaP+Yo99fW7nPUX
         YwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaZ4pyNC0e4Y2XZ6rHzFX5kY5x2wrnHJY6AXsXIJK6cezWhuw0peL7c9sCIg7rrTTpWv3VSLtcMOdwLJrduXsyUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDzT0CSj6ebiWXwfGeYl1r8Cp0P9z140KO4e/ufzG3DnKud+Y0
	OhyhJjJBo30EEqlQPnc8jyFavDQEXvN3kb7TZJpkWfLeBqrtZudadcV//iTUUJaLXz4=
X-Gm-Gg: AZuq6aKmL0PQiwfJY052co10Uc9RIE/rF8EI2hse7fuOaLpRm6tTdMSkTfdHtBsHQs0
	gnpAGkN3BH/Z31TMrta13qbuhjEHzAp+Si/L+sk3/kFCfnJIUKX0ozESlcyYdaQKr8AZ/xttNgb
	k/e2piBh1URQtYIefLcAxqhYynhTe0qQI8rP1LDuPo2TbDKx2CYV+ifb5NEeRrlQ7fzV1BTq8JV
	a8Hu8xWvoVyVMQyLd7xjEH2CluV0R0iBNKQyS/Jk8c3d6TOH5rkqmpp6WV9HuQcA6rsCGqwNtin
	ACxi6n68wr16FliIxFvyGzoqAygfeCuC9f4RI0NU3tDvJQkhK469FgyBTKkFboNi+7TIMu1r3pw
	l3qkWf5thMfFkIjxgmfo6EDZiNy13iTjbq+8+QDfa/WqRR1zbKLDv7fcpLWpSSfcDnnHJ3nVXq/
	jFBoNDvCCt2I4FolxCk2FiaFFllOEy
X-Received: by 2002:a5d:5848:0:b0:435:bdc0:48e9 with SMTP id ffacd0b85a97d-435f3ab4bdcmr4450347f8f.55.1769781438006;
        Fri, 30 Jan 2026 05:57:18 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm22643822f8f.16.2026.01.30.05.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:57:17 -0800 (PST)
Message-ID: <34251dc9-5d09-43c6-b71e-a25785f6e662@tuxon.dev>
Date: Fri, 30 Jan 2026 15:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-13-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260129214130.16067-13-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27684-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tuxon.dev:mid,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 6DC4DBB699
X-Rspamd-Action: no action

Hi, John,

On 1/29/26 23:41, John Madieu wrote:
> Add support for the PCIe controller found in RZ/G3E SoCs to the existing
> RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is similar to the
> RZ/G3S's, with the following key differences:
> 
>   - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
>   - Uses a different reset control mechanism via AXI registers instead
>     of the Linux reset framework
>   - Requires specific SYSC configuration for link state control and
>     Root Complex mode selection
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v4: No changes
> v3: No changes
> 
> v2:
>   - Restructure as per Claudiu's comments
>   - Properly wrap multi-line statements
>   - Removed driver-specif code for init-off reset. This is now Document
>     from CPG driver.
> 
>   drivers/pci/controller/pcie-rzg3s-host.c | 167 ++++++++++++++++++++---
>   1 file changed, 146 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 985414076a85..240635dafe69 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -111,6 +111,16 @@
>   #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
>   #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
>   
> +/* RZ/G3E specific registers */
> +#define RZG3E_PCI_RESET				0x310
> +#define RZG3E_PCI_RESET_RST_OUT_B		BIT(6)
> +#define RZG3E_PCI_RESET_RST_PS_B		BIT(5)
> +#define RZG3E_PCI_RESET_RST_LOAD_B		BIT(4)
> +#define RZG3E_PCI_RESET_RST_CFG_B		BIT(3)
> +#define RZG3E_PCI_RESET_RST_RSM_B		BIT(2)
> +#define RZG3E_PCI_RESET_RST_GP_B		BIT(1)
> +#define RZG3E_PCI_RESET_RST_B			BIT(0)
> +
>   #define RZG3S_PCI_MSIRE(id)			(0x600 + (id) * 0x10)
>   #define RZG3S_PCI_MSIRE_ENA			BIT(0)
>   
> @@ -183,9 +193,13 @@ struct rzg3s_sysc_function {
>   /**
>    * struct rzg3s_sysc_info - RZ/G3S System Controller function info
>    * @rst_rsm_b: Reset RSM_B function descriptor
> + * @l1_allow: L1 power state management function descriptor
> + * @mode: Mode configuration function descriptor
>    */
>   struct rzg3s_sysc_info {
>   	struct rzg3s_sysc_function rst_rsm_b;
> +	struct rzg3s_sysc_function l1_allow;
> +	struct rzg3s_sysc_function mode;
>   };
>   
>   /**
> @@ -1124,6 +1138,49 @@ static int rzg3s_config_deinit(struct rzg3s_pcie_host *host)
>   					 host->cfg_resets);
>   }
>   
> +/* RZ/G3E SoC-specific config implementations */
> +static void rzg3e_pcie_config_pre_init(struct rzg3s_pcie_host *host)
> +{
> +	/*
> +	 * De-assert LOAD_B and CFG_B during configuration phase.
> +	 * These are part of the RZ/G3E reset register, not reset framework.
> +	 * Other reset bits remain asserted until config_post_init.
> +	 */
> +	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
> +			       RZG3E_PCI_RESET_RST_LOAD_B | RZG3E_PCI_RESET_RST_CFG_B,
> +			       RZG3E_PCI_RESET_RST_LOAD_B | RZG3E_PCI_RESET_RST_CFG_B);
> +}
> +
> +static int rzg3e_config_deinit(struct rzg3s_pcie_host *host)
> +{
> +	writel_relaxed(0, host->axi + RZG3E_PCI_RESET);
> +	return 0;
> +}
> +
> +static int rzg3e_config_post_init(struct rzg3s_pcie_host *host)
> +{
> +	/* De-assert PS_B, GP_B, RST_B */
> +	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
> +			       RZG3E_PCI_RESET_RST_PS_B | RZG3E_PCI_RESET_RST_GP_B |
> +			       RZG3E_PCI_RESET_RST_B,
> +			       RZG3E_PCI_RESET_RST_PS_B | RZG3E_PCI_RESET_RST_GP_B |
> +			       RZG3E_PCI_RESET_RST_B);
> +
> +	/*
> +	 * According to the RZ/G3E HW manual (Rev.1.15, Table 6.6-130
> +	 * Initialization Procedure (RC)), hardware requires >= 500us delay
> +	 * before final reset deassert.
> +	 */
> +	fsleep(500);
> +
> +	/* De-assert OUT_B and RSM_B to complete reset sequence */
> +	rzg3s_pcie_update_bits(host->axi, RZG3E_PCI_RESET,
> +			       RZG3E_PCI_RESET_RST_OUT_B | RZG3E_PCI_RESET_RST_RSM_B,
> +			       RZG3E_PCI_RESET_RST_OUT_B | RZG3E_PCI_RESET_RST_RSM_B);
> +
> +	return 0;
> +}
> +
>   static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
>   {
>   	/*
> @@ -1268,6 +1325,7 @@ static int rzg3s_pcie_host_init_port(struct rzg3s_pcie_host *host)
>   
>   static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>   {
> +	const struct rzg3s_sysc_info *sysc_info = host->sysc->info;
>   	u32 val;
>   	int ret;
>   
> @@ -1284,6 +1342,16 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>   	if (ret)
>   		goto config_deinit;
>   
> +	/* Enable ASPM L1 transition for SoCs that use it */
> +	if (sysc_info->l1_allow.mask) {
> +		ret = regmap_update_bits(host->sysc->regmap,
> +					 sysc_info->l1_allow.offset,
> +					 sysc_info->l1_allow.mask,
> +					 field_prep(sysc_info->l1_allow.mask, 1));
> +		if (ret)
> +			goto config_deinit;
> +	}
> +
>   	/* Initialize the interrupts */
>   	rzg3s_pcie_irq_init(host);
>   
> @@ -1636,11 +1704,25 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   		goto port_refclk_put;
>   	}
>   
> -	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -				 sysc->info->rst_rsm_b.mask,
> -				 field_prep(sysc->info->rst_rsm_b.mask, 1));
> -	if (ret)
> -		goto port_refclk_put;
> +	/*
> +	 * Put controller in RC (Root Complex) mode for SoCs that
> +	 * support it. These can operate in either EP or RC mode.
> +	 */
> +	if (sysc->info->mode.mask) {
> +		ret = regmap_write(sysc->regmap, sysc->info->mode.offset,
> +				   sysc->info->mode.mask);
> +		if (ret)
> +			goto port_refclk_put;
> +	}
> +
> +	if (sysc->info->rst_rsm_b.mask) {
> +		ret = regmap_update_bits(sysc->regmap,
> +					 sysc->info->rst_rsm_b.offset,
> +					 sysc->info->rst_rsm_b.mask,
> +					 field_prep(sysc->info->rst_rsm_b.mask, 1));
> +		if (ret)
> +			goto port_refclk_put;
> +	}

sysc configuration pattern is repeated in different places. I think it could be 
replaced by something like:

static int rzg3s_sysc_config(struct sysc_info *sysc, int mode, int rsm_b)
{
	struct rzg3s_sysc_info *info = sysc->info;
	int ret;

	if (mode > 0 && info->mode.mask) {
		ret = regmap_write(sysc->regmap, info->mode.offset,
				   field_prep(info->mode.mask, mode));
		if (ret)
			return ret;
	}

	if (rsm_b > 0 && info->rst_rsm_b.mask) {
		ret = regmap_update_bits(sysc->regmap, info->rst_rsm_b.offset,
					 info->rst_rsm_b.mask,
					 field_prep(info->rst_rsm_b.mask, 1));
		if (ret)
			return ret;
	}

	// l1 allow configuration could be added as well.

	return 0;
}

And call it here like:
	ret = rzg3s_sysc_config(sysc, 1, 1);
	if (ret)
		goto port_refclk_put;


>   
>   	ret = rzg3s_pcie_resets_prepare_and_get(host);
>   	if (ret)
> @@ -1690,9 +1772,12 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>   	 * SYSC RST_RSM_B signal need to be asserted before turning off the
>   	 * power to the PHY.
>   	 */
> -	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -			   sysc->info->rst_rsm_b.mask,
> -			   field_prep(sysc->info->rst_rsm_b.mask, 0));
> +	if (sysc->info->rst_rsm_b.mask) {
> +		regmap_update_bits(sysc->regmap,
> +				   sysc->info->rst_rsm_b.offset,

This can fit on the previous line to save one exta line of code.

> +				   sysc->info->rst_rsm_b.mask,
> +				   field_prep(sysc->info->rst_rsm_b.mask, 0));
> +	}

And it could be replaced by, if any:
	rzg3s_sysc_config(sysc, -1, 0);

>   port_refclk_put:
>   	clk_put(host->port.refclk);
>   
> @@ -1723,11 +1808,14 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
>   	if (ret)
>   		goto config_reinit;
>   
> -	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -				 sysc->info->rst_rsm_b.mask,
> -				 field_prep(sysc->info->rst_rsm_b.mask, 0));
> -	if (ret)
> -		goto power_resets_restore;
> +	if (sysc->info->rst_rsm_b.mask) {
> +		ret = regmap_update_bits(sysc->regmap,
> +					 sysc->info->rst_rsm_b.offset,
> +					 sysc->info->rst_rsm_b.mask,
> +					 field_prep(sysc->info->rst_rsm_b.mask, 0));
> +		if (ret)
> +			goto power_resets_restore;
> +	}

Same here, if sysc config is done through the above proposed code:

rzg3s_sysc_config(sysc, -1, 0);

>   
>   	return 0;
>   
> @@ -1750,11 +1838,21 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
>   	struct rzg3s_sysc *sysc = host->sysc;
>   	int ret;
>   
> -	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -				 sysc->info->rst_rsm_b.mask,
> -				 field_prep(sysc->info->rst_rsm_b.mask, 1));
> -	if (ret)
> -		return ret;
> +	if (sysc->info->mode.mask) {
> +		ret = regmap_write(sysc->regmap, sysc->info->mode.offset,
> +				   sysc->info->mode.mask);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (sysc->info->rst_rsm_b.mask) {
> +		ret = regmap_update_bits(sysc->regmap,
> +					 sysc->info->rst_rsm_b.offset,

Same here, this can fit on the previous line.

> +					 sysc->info->rst_rsm_b.mask,
> +					 field_prep(sysc->info->rst_rsm_b.mask, 1));
> +		if (ret)
> +			return ret;
> +	}

And this block could be replaced by:

	ret = rzg3s_sysc_config(sysc, 1, 1);

>   
>   	ret = rzg3s_pcie_power_resets_deassert(host);
>   	if (ret)
> @@ -1781,9 +1879,12 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
>   	reset_control_bulk_assert(data->num_power_resets,
>   				  host->power_resets);
>   assert_rst_rsm_b:
> -	regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
> -			   sysc->info->rst_rsm_b.mask,
> -			   field_prep(sysc->info->rst_rsm_b.mask, 0));
> +	if (sysc->info->rst_rsm_b.mask) {
> +		regmap_update_bits(sysc->regmap,
> +				   sysc->info->rst_rsm_b.offset,
> +				   sysc->info->rst_rsm_b.mask,
> +				   field_prep(sysc->info->rst_rsm_b.mask, 0));
> +	}

And this:

	rzg3s_sysc_config(sysc, -1, 0);

Thank you,
Claudiu

