Return-Path: <linux-renesas-soc+bounces-30217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGOQIlS5w2nUtgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:30:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9460322FF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53FE130D6A40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325943A6B93;
	Wed, 25 Mar 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="B9LzHTlY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564EC39B94A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433961; cv=none; b=tQR6CWbBtSvlqcaoIQO7wYBpdBgqYrQtNNuxAaA/Q7XU0USc2tIzxKyv5lcDHv/NNA4B11WfgV1nELuCvm+P09kgbvYJM1p8LjAWhXy3lE6Y8uhrnFUh/W+oLPESGgktHMthv60w+Kdn7j/TB14wIsR1NlVw3yubY6rQBLFr//c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433961; c=relaxed/simple;
	bh=8GOOH1oj1RLl1iyMb1b33WJjS/mkbepPmhqd8Urwd4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sf85jsACoRqP5CUa/sdDATY5vMqqAyTseStWFgy4Xn+zX2qsS6d5VhFmEI4+TZ76ZZqfPfa73/OxqzZQRgEXB93mGAuWMPcxgBGw5LWNP31lizIAHcOmudct2VG5z54But8/9E+y/ITiEUK+I2Ggbn0vA8StfFCK+Dn0ailOD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=B9LzHTlY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so37352735e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1774433958; x=1775038758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+f07CFi59zJysxikJ3eCqXzT8HRAuTSO1UGqdwQtCY=;
        b=B9LzHTlY5t/ShvGMdy8+6Fv70cOx9w7uHEvbtU5QtVCNgOta4jzG/KQ9ji+JOM/TNL
         2jTUDwW02/aTMNU0YFzu2mMXG5C9POT2l1WiRbdgqiIuJHIt6y0kc+9fz1LsKL5rGNfc
         8niHZUi9Yto6/Ij2TgML8yvfK0zNKaw583vmGakrxqYCM7nurNM1Ek08F/oBGVP/xgf2
         4+EgXgrl710ZggGCVJlBOl8RsDy7c7FCOooYQYZXp6tqwr+tyP5xT1AOkxQhxvNOCTVp
         RFRWavT899uRrM8K9gCM5bnUSBkAuMWngd5fgi2lOMPDBHwjdNAAMJE/FibJFPDEd265
         2x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433958; x=1775038758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+f07CFi59zJysxikJ3eCqXzT8HRAuTSO1UGqdwQtCY=;
        b=SE8kFLFywhg/sucOMMUI/VWjvaMzQXtFMUevAgLGuKPC8xH4AAnMvLzM9w73z8rTKQ
         qL0g025P4wPaFDjYosZsx/0x+u/e6w+bgrpVNOMaNfs07YGENfbormCVpP7JTM32d5Es
         1SE0Cn3ZLncGnTkekBLZGWxGN1Pi4nvzoOXJOrOJ4wViComV48171GQQ/mXE4j5PPJ9l
         7fbrCIsv6QNlcOG3qgHfxkA89vzfLKOD7h9rrCi268qoNYGAM80caugonMxp2RAtR7gL
         rgZZVptxIRzLBfjjeDyx9v2iVqp8uIJSP89RD5O3828zjhjVbHBbyxx0Msnho7muWwGn
         F89A==
X-Forwarded-Encrypted: i=1; AJvYcCUrWenawb8y9hoDMfhJDqe9dCCOSracphLyhhRB3fgbS+qg68zDu/1zIGKWZ6mR5lrSrRs6wzqztd0ntitBx8ZN5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxoOTq+1F/yWb/PJJ2A08oKkqtSA/gUnEFOAm5CLUo7ITLDSP
	b8GOW56TZCzZL06K1RuJruUSsFIxzszYhJNZwPBmnkHPWbPV151OWYnvxiibcSbHA/M=
X-Gm-Gg: ATEYQzxJRvZZBKJNsf15UV+ux71oYcVIa95p9evqIIoN+vD/wCfhbjmVGEJgX3bNgHI
	mmcQQtm3sD37lS65jJbrexON7kgZwhg++p0EeBNVb8/Ow2sW3eKbHwExZPEhFvnNJHXS8fnhuhh
	cwtErN5qKky0jHWNrBT0KFhqoaWZ815EU4gVYMHGBjSw549LOYzj+35D7Sl0YvVUBmdSpQjjSW1
	QNLpsUpCXTSZesv5BvpLSplvdo3P+8f+MxXPL09rzGYVzuU3IncJq9sCwdR1+tK/1aASIxb2N/v
	+InKEZwqIlhu7plrEuLyn0QskFTIqPyzTeqNR4LprmdzoJTtwUQWKkQm8q0w9K3zoIwlfxpsbBW
	6dFa2cG7OjIUmMNmsVt3mXnlM2fTyUSiivLS0644zl9hEs4iBgfTV3WIvxdAyLo+HgLGA2GogJW
	6D+y6QQA3pWmPEAX4nMPp2wdmaH/PcwnGX5lCNqxt5Og==
X-Received: by 2002:a05:600c:83c6:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48715fcc5acmr41628225e9.8.1774433957560;
        Wed, 25 Mar 2026 03:19:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871176391fsm109820675e9.12.2026.03.25.03.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:19:17 -0700 (PDT)
Message-ID: <c2c56940-e14d-44fb-9b9a-9aff70998bd7@tuxon.dev>
Date: Wed, 25 Mar 2026 12:19:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] PCI: rzg3s-host: Prepare System Controller handling
 for multiple PCIe channels
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260318124450.163471-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260318124450.163471-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30217-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9460322FF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Prabhakar,

On 3/18/26 14:44, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Prepare the driver to handle multiple PCIe channels with distinct System
> Controller register sets, as required by RZ/V2H(P). The current design
> stores a single sysc_info structure per SoC, which is insufficient for
> multi-channel configurations.
> 
> Introduce channel identifiers and extend struct rzg3s_pcie_soc_data to
> hold a sysc_info array indexed per PCIe channel. Add a channel field to
> struct rzg3s_pcie_host and select the appropriate System Controller
> information during probe based on the channel.
> 
> Keep existing single-channel SoCs functionally unchanged while
> preparing the driver for RZ/V2H(P) multi-channel support.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 48 ++++++++++++++++--------
>   1 file changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index c61e011f8302..a629e861bbd0 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -241,6 +241,18 @@ struct rzg3s_pcie_msi {
>   	int irq;
>   };
>   
> +/**
> + * enum rzg3s_pcie_channel_id - RZ/G3S PCIe channel IDs
> + * @RZG3S_PCIE_CHANNEL_ID_0: PCIe channel 0
> + * @RZG3S_PCIE_CHANNEL_ID_1: PCIe channel 1
> + * @RZG3S_PCIE_CHANNEL_ID_MAX: Max PCIe channels
> + */
> +enum rzg3s_pcie_channel_id {
> +	RZG3S_PCIE_CHANNEL_ID_0,
> +	RZG3S_PCIE_CHANNEL_ID_1,

Just saying... based on Bjorn feedback on patch 3/5 the names used here would 
have to be adjusted accordingly. Maybe controller_id? Same for the other patches.

Thank you,
Claudiu

