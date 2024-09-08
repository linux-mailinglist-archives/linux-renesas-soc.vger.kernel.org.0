Return-Path: <linux-renesas-soc+bounces-8854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9CD9708D6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Sep 2024 18:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4A11C20C3E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Sep 2024 16:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E01A172BB9;
	Sun,  8 Sep 2024 16:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Waf26juj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64172535D8;
	Sun,  8 Sep 2024 16:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725814742; cv=none; b=RV/2X1f/GY0zwh90ff/v920eDqIbP5kfj/P95d45qAs5LT7MCniah29Z75QHY6zTyJkoyFgmwQ6QrL7UJk9Z7WGuka1tdJ1Y45tnVgALsf4OeSzs+mNA9eTMRhF7YNCMAaDM1dIDTfk/pSQl9mT8fcdsTlNJw3ML4DPxWqeqi/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725814742; c=relaxed/simple;
	bh=6QjX+p/V7p6CoIL0gKUlUJEfv0XMVAsaxYaaV5atd5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6Op/R/x1+mfVWJlH7G3fNdn99BZoEBDA1oNK7pg0RN6Obh5QKsGNEIzTRBl9nMOE6xOFESB6V77ZNH9Oqh1pJeWRXQS3G2cN22Tu+5pf05uCnvyi0+YPVJDszWtVQgSnEwlB65ED+cBgEEXYfTXM18V//YgPufj7WLjdgDsb+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Waf26juj; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id nLFVsSexkHecynLFVs3xum; Sun, 08 Sep 2024 18:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725814737;
	bh=RdcTk8ohJPW11cQiApgamG5S3f5jcX8WFaEBB5WL29M=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Waf26jujfPXECY3CCDjijKiHyI/dBzztosdUkGORAS/uepLb4kcKcLqmgiPDoYcku
	 MoXMKrUxZEDENW48sn74nf7unkftTZiaW/l95dmfPviRRTkvexcsvSiskoc1uat1ZD
	 +gRtAs187E32Lft/bz80V2cScm6OjBinBKUQVX9Wyx0Xf17m1H6bpTOHmpjU4VtAGW
	 rklcVfzdta3T+DQRBeCO2mgLWFTmkVQ7LbQ6V4SI36ZSf59SzBh56y+6KmeB1IZu3Q
	 i/ZB8QGH7iR9sLQpi46o6xJdGoV3ffCZLVCx/6E7ZWWtMtOPTJ/mI/ktgazDnTtOe9
	 irQCqqT4HbSPg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 08 Sep 2024 18:58:57 +0200
X-ME-IP: 90.11.132.44
Message-ID: <d01bed96-7811-4ace-8b92-1ee9fafac649@wanadoo.fr>
Date: Sun, 8 Sep 2024 18:58:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Fix an error handling
 path in rcar_gen3_phy_usb2_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
References: <4efe2d0419cbe98163e2422ebe0c7896b8a5efed.1725717505.git.christophe.jaillet@wanadoo.fr>
 <TY3PR01MB113468D1573C1E50AC9F97DCF86982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <TY3PR01MB113468D1573C1E50AC9F97DCF86982@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/09/2024 à 18:39, Biju Das a écrit :
> Hi Christophe JAILLET,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> Sent: Saturday, September 7, 2024 2:59 PM
>> Subject: [PATCH v2] phy: renesas: rcar-gen3-usb2: Fix an error handling path in
>> rcar_gen3_phy_usb2_probe()
>>
>> If an error occurs after the rcar_gen3_phy_usb2_init_bus(),
>> reset_control_assert() must be called, as already done in the remove function.
>>
>> This is fine to re-use the existing error handling path, because even if "channel->rstc" is still NULL
>> at this point, it is safe to call reset_control_assert(NULL).
>>
>> Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Changes in v2:
>>    - Re-use 'error' to simplify the patch   [claudiu beznea]
>>    - Update the commit description to explain why it is safe.
>>
>> v1:
>> https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet
>> @wanadoo.fr/
>> ---
>>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> index 58e123305152..ccb0b54b70f7 100644
>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> @@ -803,6 +803,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>   	return 0;
>>
>>   error:
>> +	reset_control_assert(channel->rstc);
> 
> This will result in either kernel crash [1] or reset usage count imbalance in case
> of error [2] and [3] in rcar_gen3_phy_usb2_init_bus() see [4]. Also reset control API is not
> respected for SoCs other than RZ/G3S. For those SoC's reset assert is
> called without calling a get(). Maybe add a check (phy_data->init_bus) for
> assert api's, that guarantees assert is called after calling a get() as it
> valid only for RZ/G3S??
> 
> [1]
> channel->rstc = devm_reset_control_array_get_shared(dev);
> 	if (IS_ERR(channel->rstc))
> 		return PTR_ERR(channel->rstc);
> 
> [2]
> ret = pm_runtime_resume_and_get(dev);
> 	if (ret)
> 		return ret;
> [3]
> ret = reset_control_deassert(channel->rstc);
> 	if (ret)
> 		goto rpm_put;
> 
> [4] https://elixir.bootlin.com/linux/v6.11-rc6/source/drivers/reset/core.c#L483

So, if I understand correctly, v1 [5] was correct. :)


I don't think that [1] would crash, because of [6]. It would only 
WARN_ON. But with v1, it is not called.

With v1, reset_control_assert() is not called if 
rcar_gen3_phy_usb2_init_bus() fails. So [2] and [3] can't occur.

I can send a v3, which is the same of v1, or you can pick v1 as-is (if 
I'm correct... :)) or you can just ignore it if "reset control API is 
not respected for SoCs".


If of interest, I spotted it with one of my coccinelle script that 
compares functions called in .remove function, but not in error handling 
path of probe.


CJ

[5]: 
https://lore.kernel.org/all/fc9f7b444f0ca645411868992bbe16514aeccfed.1725652654.git.christophe.jaillet@wanadoo.fr/

[6]: 
https://elixir.bootlin.com/linux/v6.11-rc6/source/drivers/reset/core.c#L473

> 
> Cheers,
> Biju
> 
>>   	pm_runtime_disable(dev);
>>
>>   	return ret;
>> --
>> 2.46.0
>>
> 
> 
> 


