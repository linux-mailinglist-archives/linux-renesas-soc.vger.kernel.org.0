Return-Path: <linux-renesas-soc+bounces-28304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF/wM4yKlWkzSQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 10:46:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141B154DC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 10:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55DCF300F5EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Feb 2026 09:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E862A33D51F;
	Wed, 18 Feb 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oTZen1MD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704B25B1CB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408009; cv=none; b=OcGnq6mJBXcEvgLRoGOXR81wmqBW5y8bDR+0FHxlMzm+oE8FBec590wNBDlM88cl5hEYkiZiWIv97azY80kAyw5qzXZjSs6AmTfiDpyoEzNB1WCldz4kYGYfE5OKIrzBwoDQOU4VjuVmwatQHy2lZufEyfDsVs1ocSyKFW36OXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408009; c=relaxed/simple;
	bh=UihvISNIk9+AOhaYYMFDhcd9vzZsN2SB6ysEO9pCpvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3QD4ShvNootkqCMRakQGbasY62593dLLx5cR0ArJbiotBq5lr87FcFA6zcd/TvjsyY/4BJ6JAMnVQJngtKCbe2ALTik/3PnmPsxTv4DY5uVXxIU3GM6l/1W2BV515HDsVoUSwOBYH1sS3HLweZ2Q4BRLdXwlC0/hXWCLC6lszc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oTZen1MD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so46101805e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Feb 2026 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771408007; x=1772012807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YrnaX1knvD4GFXc1oYDQOQO8+n1c4cjNYq3Cxczmod0=;
        b=oTZen1MDAQQcvZTJnuUYikrpxj5meLZa+/QtzlCTESyt5cfGGGSgMnduc7cq4uqPx6
         geLD4qIee/6fraQUh+9ddfHew99YiJRYQKzyhXug4dUO4IRnlVGGu6vofNc4G1en1TyX
         SNg0BuCipsCOqawesEiVzuog8tj06SA/srUg9sRYUN7DqdLH2g1Gi+y+1O/CcqMTVBSS
         CHQSIdFV7yrFqm5ZGIWk53wOilzqbRYTshcxFuIVzmw17XK1JQuhGr5eiKk4jfqvaXv9
         OFU9G8RPfhwSAm0qEapqJXXGxLsTAl8bgwKhmbIizKhgWLc7pgFDMKDP0FZK7lhY+0ry
         LDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771408007; x=1772012807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrnaX1knvD4GFXc1oYDQOQO8+n1c4cjNYq3Cxczmod0=;
        b=ernVvFWtP9dgNp6qxpyAdIgzpHcasKMYC3hvk4oFDzC73FVUcd6q5RMGpJeFb/XjHt
         D9rAsFJTSKTyGwxBcNVu+3pbWNdN4u9CIDDadoYb+uNQ1++apvnLYgDF1f288WdmPhxf
         TX8BZpreLuQ1Q8jqWbhEljakx2GX3oEWftofrmsIOXpjCgbo7O1dJTxYl6Y6/+zuwQUT
         qnmRFEy3XjWLRd/YhdME2wXE3nTpHPd6el6mZ51SyICeQxcboMTgCEYw7M5wlYOEan8v
         DuwYOQc5Rk72IK+15ZEv/nP+xqAJeUQ9yE6xx39UpdpAGQRmYWhu+ooVX1g7uPz2sx12
         B3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVtrZ+LgBu0g9FG8wQPp0I8352pzHTOQj8t6wKmzI+HEe52xOkNQqPb6XYBQWXzgkFKOfdj0TK8THvHIXoiLAdAhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7eubMScYRcFHXRvMATelx5L6C2UrnNJPWLGgN7nzHH+OS+KhK
	JTXbSV0LnWNl6y8QYY6j6BsV7dZUf+mK8DbGn7tk1gYSz+6lT3tbS1DnHZWjKfT01cQ=
X-Gm-Gg: AZuq6aKUivD9jqlEVrsvsUWahoD7jYSuCDSSDV3ArfGcwTh0bCVJ3yiUHEW80UPk/Of
	k2hZX2QTSoYxm7UQSwvDe4AFoCPwOV0GH9CrLFuDZ8rkBsXgKd0ErhxeQ3cWByreTRKRmci/HbH
	TYE4taV+LfYJlWRR/ul47Zbl0I82kmfnUVk0VDqhuaXJMh2KaGeiLdLD4KLcUsOAn9T3Xf5u2gP
	f2FU1F2L3ErDaX27wkKbX1rzrq7Xc2WxGoCo0YaKhSjiogluU+lomOn+mOkJmj1uC7PEXDkvuwX
	Raog7VD6xF8r33phYcpdkR2G9QRfUh4jl5IfvN131U+NSNV21OSegO55Eb33dK8PyZky807kPvt
	pa+MbppnRDwQJ2OiVdTNaPsJ5GjB5PNUsAGoNBbd/tCWacriqhybRAB/Kd8L+CvnAab5RSh1pCc
	O3JSpTVo9F0t4BsD3uagbX1bGn6q3w0Q==
X-Received: by 2002:a05:600c:314f:b0:483:6fe1:c057 with SMTP id 5b1f17b1804b1-48373a3f3bcmr271059935e9.21.1771408006823;
        Wed, 18 Feb 2026 01:46:46 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd34sm620399235e9.7.2026.02.18.01.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 01:46:46 -0800 (PST)
Message-ID: <5dc39d5a-7de0-49e1-9cf9-da1bac765d0f@tuxon.dev>
Date: Wed, 18 Feb 2026 11:46:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] PCI: rzg3s-host: Add SoC-specific configuration
 and initialization callbacks
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
 <20260210113041.138430-11-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260210113041.138430-11-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28304-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:mid,tuxon.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 3141B154DC1
X-Rspamd-Action: no action

Hi, John,

On 2/10/26 13:30, John Madieu wrote:
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
> v5:
>   - Roerder got labels as per Claudiu's requirements
> 
> v4: No changes
> 
> v3: No changes
> 
> v2:
>   - Renamed callbacks as per Claudiu's comments
>   - Reworded goto labels to be consistents with callbacks
> 
>   drivers/pci/controller/pcie-rzg3s-host.c | 59 +++++++++++++++++-------
>   1 file changed, 42 insertions(+), 17 deletions(-)

[ ... ]

> @@ -1662,15 +1686,15 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
>   
>   	clk_disable_unprepare(port->refclk);
>   
> -	ret = reset_control_bulk_assert(data->num_cfg_resets,
> -					host->cfg_resets);
> +	/* SoC-specific de-initialization */
> +	ret = data->config_deinit(host);
>   	if (ret)
>   		goto refclk_restore;
>   
>   	ret = reset_control_bulk_assert(data->num_power_resets,
>   					host->power_resets);
>   	if (ret)
> -		goto cfg_resets_restore;
> +		goto config_reinit;
>   
>   	ret = regmap_update_bits(sysc->regmap, sysc->info->rst_rsm_b.offset,
>   				 sysc->info->rst_rsm_b.mask,
> @@ -1684,9 +1708,8 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
>   power_resets_restore:
>   	reset_control_bulk_deassert(data->num_power_resets,
>   				    host->power_resets);
> -cfg_resets_restore:
> -	reset_control_bulk_deassert(data->num_cfg_resets,
> -				    host->cfg_resets);
> +config_reinit:

If I'm not wrong, you need this, here, as well:

	if (data->config_pre_init)
		data->config_pre_init(host);

Thank you,
Claudiu

> +	data->config_post_init(host);
>   refclk_restore:
>   	clk_prepare_enable(port->refclk);
>   	pm_runtime_resume_and_get(dev);
> @@ -1755,6 +1778,8 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
>   	.num_power_resets = ARRAY_SIZE(rzg3s_soc_power_resets),
>   	.cfg_resets = rzg3s_soc_cfg_resets,
>   	.num_cfg_resets = ARRAY_SIZE(rzg3s_soc_cfg_resets),
> +	.config_post_init = rzg3s_config_post_init,
> +	.config_deinit = rzg3s_config_deinit,
>   	.init_phy = rzg3s_soc_pcie_init_phy,
>   	.sysc_info = {
>   		.rst_rsm_b = {


