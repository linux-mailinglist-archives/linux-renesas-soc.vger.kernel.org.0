Return-Path: <linux-renesas-soc+bounces-34183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /QQ5OtxdM2pA/wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 04:54:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01DE69D2D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 04:54:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bpQfephE;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=PYYu9Nfo;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A28FF3010F3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 02:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F6730BF5C;
	Thu, 18 Jun 2026 02:54:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B543161BA;
	Thu, 18 Jun 2026 02:54:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781751253; cv=none; b=btCoA/lIHNeZJMkTdtYbs1AywzJXh62d1EOoITMuHErHt615/4BYYNSYwYDlK4i7cgyTBdjor79lZSrIXl/KX9liL+GTfL15UU/Hf4czgBsSBEo3FGRP8JDFkt/0Gk3PZEkZd6mmCKskaiCRAeK3JgiE6qqpAC6zoLpS1zGykyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781751253; c=relaxed/simple;
	bh=oqEgF5BTWpU6/7DGsfy48AIAmjs1Jhrgpbt3XEKNXeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+5uCAsrFJ0wzXtKulzE4dbCgQjlZzqFfLkV/Aomd785S0FzjQGcNck4VDregkam3W5SwgP7iVeDGazP/iWJe540EE8LAo9rhdBY//C4oc8lz74mVQG0CO2nSWKmZ9HGNXj+EjTMEOmoCU7De3F6RWUnTKSFYHIf5yDZoBv/r9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bpQfephE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PYYu9Nfo; arc=none smtp.client-ip=80.241.56.172
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gglfz1VQXz9sqP;
	Thu, 18 Jun 2026 04:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTzc2XaLs1ayXYi9fOKXdA8l/VSZMq+FU1Cy1d7jE+E=;
	b=bpQfephE601H9ixHI6bk9OdkPQ1y3Yf0QbWWLCbZ5bIQP1OzX1uI535gcDIMihS2rXSmxa
	XdeGsYNUas3glXlKlVrzN/4NuyadHg/kjA0KwGeEIK1QbwFVkbK2yEi66vIHjV3QYyfWx7
	SxdTYBskQf3SSkmtgkdeLeq6O3Botmwt1xTdeOtx+vokSmZ7S91SeA8R+vIb0gzeGBwsR5
	HrSlzbHg/Jra2D8N0mGCaxys1Yeo+WBJ9JbQJP+fO3aAzrxRsjxvOzgg8MWczLU45TWl7k
	hyBIslFC8yEzrUn+y9s50V6jqGi/uGzPGBkFiL7mRRq8x0FVYBGPSod7syZi2A==
Message-ID: <0935eb67-83d2-49ea-89ab-0d0aa51ead8a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTzc2XaLs1ayXYi9fOKXdA8l/VSZMq+FU1Cy1d7jE+E=;
	b=PYYu9NfowJZvmdIJYqOGKcCdg0fsttqcG5kLsW6DZu1e1qQH7DZuCwurCDJfCekdj0wEuV
	xKJTc7zwWGl3won6j7z8Y/YqT+GZr+ejFDUS2BtGyuSeYuhEohKalm+vlbB8atSh5FSkBd
	/7uVgbVv47eevrAt0hVoHoSpFh9RDdulHZjFm2JxBI5v6jfs/JN1XZxpKfq0x9e3XXvrNC
	kEESgCMyCGJJl7an2PingR020k2mLeIgJnNFZeH6YEo5sJN8q4HwbMNRHe+fFG8a/Nm1lo
	dxjaXNyoubKlvzQk9AH/r8E7+Gpmgis809oYbrQOIO+ugp8aZtOEzeRV6Bif+Q==
Date: Thu, 18 Jun 2026 04:50:29 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Marc Zyngier <maz@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
 <864ij1tyrj.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <864ij1tyrj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 9cmpjqt5o4muagzsg5hbdb75p7upd1q9
X-MBO-RS-ID: f72b41f21a98a9f46ed
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34183-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F01DE69D2D3

On 6/17/26 9:24 AM, Marc Zyngier wrote:

Hello Marc,

>> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
>> or APB interface configured to 32 bit, it can therefore access only
>> the first 4 GiB of physical address space. This information comes from
>> R-Car V4H Interface Specification sheet, there is currently no technical
>> update number assigned to this limitation. Further input from hardware
>> engineer indicates that this limitation also applies to R-Car S4 and V4M.
>> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
>> limitation.

My concern is this ^ , I do not have an erratum number, because there 
isn't one. I am in touch with the hardware engineer and I did get a 
glimpse at internal details of the three SoC, which confirm the 
limitations. Is this sufficient ?

>> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
>> common for many ARM GICv3 implementations. Therefore, add an extra
> 
> Not quite. It designates GIC600 unambiguously.

What I am trying to communicate is, that the 0x0201743b ID is not ID of 
the Renesas GIC implementation, but it is a generic ARM GIC600 ID. That 
is why we cannot match the quirk on the ID (it is generic ARM GIC600 
ID), and instead we have to match the quirk on the [ ID combined with 
of_machine_is_compatible("renesas,...") ].

> It is just that GIC600
> is integrated in zillions of SoCs, most of which don't have this
> problem (the machine I'm typing this from has a GIC600 *and* 96GB of
> RAM).

Right.

Shall I reword this paragraph somehow to make it clearer ?

>> of_machine_is_compatible() check.
>>
>> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
> 
> Is this relevant?

I included it for the sake of completeness and to provide all relevant 
information, based on previous discussions about similar limitations 
that I could find on lore.k.o

[...]

>> +#ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
>> +	{
>> +		.desc   = "ITS: Renesas R-Car Gen4 GIC600 32-bit limit",
>> +		.iidr   = 0x0201743b,
>> +		.mask   = 0xffffffff,
>> +		.init   = its_enable_renesas_gen4,
>> +	},
>>   #endif
>>   	{
>>   	}
> 
> 
> Honestly, that's a bit too much copy-paste for my taste. Just refactor
> the erratum handling to be more generic, something like this:
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 291d7668cc8da..380c4758647d2 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4894,10 +4894,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
>   	return true;
>   }
>   
> -static bool __maybe_unused its_enable_rk3568002(void *data)
> +static const char * const dma_impaired_platforms[] = {
> +#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
> +	"rockchip,rk3566",
> +	"rockchip,rk3568",
> +#endif
> +	NULL,
> +};
> +
> +static bool __maybe_unused its_enable_dma32(void *data)
>   {
> -	if (!of_machine_is_compatible("rockchip,rk3566") &&
> -	    !of_machine_is_compatible("rockchip,rk3568"))
> +	if (!of_machine_compatible_match(dma_impaired_platforms))
>   		return false;
>   
>   	gfp_flags_quirk |= GFP_DMA32;
> @@ -4972,14 +4979,12 @@ static const struct gic_quirk its_quirks[] = {
>   		.property = "dma-noncoherent",
>   		.init   = its_set_non_coherent,
>   	},
> -#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
>   	{
> -		.desc   = "ITS: Rockchip erratum RK3568002",
> +		.desc   = "ITS: Broken GIC600 integration limited to 32bit PA",
>   		.iidr   = 0x0201743b,
>   		.mask   = 0xffffffff,
> -		.init   = its_enable_rk3568002,
> +		.init   = its_enable_dma32,
>   	},
> -#endif
>   	{
>   	}
>   };
> 
> Then add the two lines you need in a separate patch.

Will do in V2.

> In the future, please provide a cover letter when you have more than a
> single patch (git will happily generate one for you).
OK

