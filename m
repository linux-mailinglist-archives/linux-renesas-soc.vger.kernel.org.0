Return-Path: <linux-renesas-soc+bounces-8960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9B6979202
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 18:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 008811F22802
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Sep 2024 16:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15881D049D;
	Sat, 14 Sep 2024 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gbZ+d2IZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA901D0167
	for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Sep 2024 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726330274; cv=none; b=r7TTM9Nng2MijDdzpIySF9gqYlZbD9eRnWgs4eCIvivgd3pD819k0h9KKV/PcWE1C1Z+jub0lwT6WNN00Y63scu5uyWhejXrYwv8C331jfhE6tUYqIOYEDx42ZIHzjl4T/zdX3zLXS2yk/Q3exgVl/J9EwFUj5g4MRlYc9e9IRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726330274; c=relaxed/simple;
	bh=wYT0kK43we2wiETMCUmETovHzAPRqIAVy6XfTCki770=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzFs6E1s+U2yG79IuTbrqiqYSYJCeOyFFUOiR4s9uPQzokftmCc3fx+DDj98G6XA6qPqEHiSE/HpCpIFqpkcDsxJIgInYOsqWK/9yXxWiRMYL+VADeL39KMsOT1T4kkXh2BNEFOteBL8CfziIk+BE7qspZYlp3HU0f2IqjEMtwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=gbZ+d2IZ; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pVMSsua8GqXJQpVMSsnqpy; Sat, 14 Sep 2024 18:11:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726330265;
	bh=MBuP/BOaPyMnGuO0PoHHXki8MmwwuT9/WeXZMzNlRZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gbZ+d2IZsZQv279daBVzp+/rWbquiYMr+ne+KDPjK07JlAArSJEHwv9f4sAFiaX6n
	 /DfTgWeka0+Ct5qMqN4v2r1jAna9g6OnyuugmVnEq13lrwnBi4+BtcGPE4Qc+rQvFW
	 O/zx7XsMA0ZoX3S90R16h9xLPUeodkRw/EsPD4fkeG3Qtz/A9YPpC0sasXQM1ZOt1C
	 GSHk9T8LTJVbXnT8eKKuX1nhjpM7YPy8UV44DI60K+PCeXXHa5GYNE5eorqs/zjoyr
	 GdVzuTgJg2tanmf4PQ+jsEpxJIhtlQkic4S8Nr4gBbWq6dvxpvYa/sGwKBf58l/WSg
	 x7eoFP9mP3LJw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 14 Sep 2024 18:11:05 +0200
X-ME-IP: 90.11.132.44
Message-ID: <c394ebc5-c19d-4e52-9cb1-939be554a153@wanadoo.fr>
Date: Sat, 14 Sep 2024 18:11:00 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] phy: renesas: rcar-gen3-usb2: Fix an error handling
 path in rcar_gen3_phy_usb2_probe()
To: biju.das.jz@bp.renesas.com,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org
References: <290b25827e3f0742808940719455ff0c5cb9d01d.1726329925.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <290b25827e3f0742808940719455ff0c5cb9d01d.1726329925.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/09/2024 à 18:07, Christophe JAILLET a écrit :
> If an error occurs after the reset_control_deassert(),
> reset_control_assert() must be called, as already done in the remove
> function.
> 
> Use devm_add_action_or_reset() to add the missing call and simplify the
> .remove() function accordingly.
> 
> Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch changes the order of function calls when releasing the resources
> in the .remove function(). Looks fine to me, but pm_ functions are
> sometimes tricky.
> 
> Changes in v3:
>    - Use devm_add_action_or_reset()   [Biju Das]
> 
> Changes in v2: (broken proposal)
>    - Re-use 'error' to simplify the patch   [claudiu beznea]
>    - Update the commit description to explain why it is safe.
> v2: https://lore.kernel.org/all/4efe2d0419cbe98163e2422ebe0c7896b8a5efed.1725717505.git.christophe.jaillet@wanadoo.fr/
> 
> v1: https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet@wanadoo.fr/
> ---
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 58e123305152..c8a3727f56aa 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -668,6 +668,13 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
>   	return candidate;
>   }
>   
> +static void rcar_gen3_reset_assert(void *data)
> +{
> +	struct reset_control *rstc = data;
> +
> +	reset_control_assert(rstc);
> +}
> +
>   static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>   {
>   	struct device *dev = channel->dev;
> @@ -686,6 +693,11 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>   	if (ret)
>   		goto rpm_put;
>   
> +	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert,
> +				       channel->rstc);
> +	if (ret)
> +		return ret;

NACK

This is still broken.
Should be goto rpm_put;

I'll send a v4.

CJ

> +
>   	val = readl(channel->base + USB2_AHB_BUS_CTR);
>   	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
>   	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
> @@ -815,7 +827,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
>   	if (channel->is_otg_channel)
>   		device_remove_file(&pdev->dev, &dev_attr_role);
>   
> -	reset_control_assert(channel->rstc);
>   	pm_runtime_disable(&pdev->dev);
>   };
>   


