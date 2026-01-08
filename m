Return-Path: <linux-renesas-soc+bounces-26413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7DD03958
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 15:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F2A3302FBDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 14:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB57D44D69C;
	Thu,  8 Jan 2026 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HfOt6Hpq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5958D3D1CD1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767872684; cv=none; b=ljd3H4m5br2+M3njYcf8yidQOnDZOrTkNLp3fJ/wuucQcXRWphbfPPGv0fwbhiOLGnEhfL6aXeRQmijybyh9qXpYUKM94O0p/ayb2QB2R7ISEjeHUWe4FKOjVtoCfd9Umlomx1vT/YmeSv1Rfo79ChvdU/EaAAVywVdC5c8NdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767872684; c=relaxed/simple;
	bh=c5b43E0GnOfhYe35FNpzxBQXxJaNPMy848bxda5ueRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ed3swVgo7UhspDGRnkZpPwpWghS6m7V3RiJ0sJEZadmzsaLXbt/vQvN6pZWdF4dkW+5zYk2uzCYPuv3U6hynZ+01F5MLQmHpLiz0LWsn21bg/O3ULDD5XwskHb9aN1vekNy5ON/qrPCzsUY2Oe0oosmgjpwQJId9dt7WD3v88fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HfOt6Hpq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47796a837c7so22995895e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767872678; x=1768477478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXVp7c2KZyPxfovsWjA2iVt8yUE2heAGChkNokDPQjw=;
        b=HfOt6HpqSVcamO5ZckK1EPdxpfJM+gW12wwBnbJqtQfzkyNDpA9qTNqrc71CqrLIPd
         pWnFpsct9wZpoMUNWDHOkDtVJsvLGTdZM13R/dp6vCe1n64cKACpwWaTbwhK6jXYJKEn
         Pwx9bImCtKeUQq3ZRfnUEaCYQrgLNyeiQZ9IFvHgEn5L24i5WjqplnMPH2ilFB0bQqyp
         q3ymtDeZ3UqrjGIALUJXHCO/Ig91xLbt9YAzzMeKRiguy1hvNOZWzM2YtI4+QBp3aAoc
         tdpC0AIx1lKd+qemDw54r+8/t4XpbFxWU+kXxDuYLrOdimPoCW4x6eHKEHbXhj9tqFvI
         K+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767872678; x=1768477478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXVp7c2KZyPxfovsWjA2iVt8yUE2heAGChkNokDPQjw=;
        b=PsF1kHVYGp7akfcUaw6cO4eObpWV6DsPhkvFSzKK/6A3lfJvO7hsifWYj8fyvE8k1/
         HTriycu8UOFikDAv1NXagsBPWNTCYU4u7MPVWeVR1E1k7BEzOpdFP5SSbddcQuI4K5yx
         INbGgTu4J4vcMdCABgQzCkw2Gz8e/MRxTM2g1wI0T4TmOMsuhHyKVBz4OvizE9VhqO6S
         sd1QS0RCIL/QUEEW9UUlssjVzVB2o9xyWsmc0rEd679SDdX4U+6pCOqAdDAyu+lkgh/J
         Fj15o9QizO7BR1xxsDG85P+BWkUocNqcGw7No9w+HkiAn8QXKKFZ3TfbjinB6zsD7CL0
         WbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD13ckrh2gl7nn7aBhVv6nqpWjx6qk1RgHbK0SAgPAlqoimRvgyJRMzC5uP5sSHsfHtACHaxBTpW7K4mAYZ/YWDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBe/+kyYQOcCwmnVyp3X6/bEhgxG7Lr6PUuc+/wDa2B59RqaoT
	wXGa+1HWL7xacWJ1j2WcxeMoLBINez1grJtDC33XHRb7jIjtt/ESsQ23L/PoTthqT9M=
X-Gm-Gg: AY/fxX5s/AUj62dcmYsIb/VGb/iEoo3UcjIcpna/185sTFjk6La6UtoHgnB3daZ7eHE
	EeuizW1FWF5ou7IcgFN6ng8sN8zK1op3SRnKdmGgIHFFqSvK8Nz7xwgrlLy83zcP5GHyVr8eVC7
	Oh5wAO0vdtmNC/lPq4NyxHTfLfHBfblj7h9NfLf3+i5aiM5FSlhwz9byRveKZ0fRaOeKcPJxu4z
	Hyj0v3wsJoZCN6meb0MT6YG98PqeZp+XUM3ZYgHj+vIjAohpRImkleKhV5fLwjS04h1OV0CZCQ/
	RDB6n3wW2s2Dz1g0ntlNZXXfWYMXkAHgfvaCMqSMYMDdliLIVrbLYnbuMK8WaSdAQ9b43P18Znm
	rFIaYr4Gjxe+xj6PBhQ+o5Yf8uEsy18Daj1nGIU2ijWh5D68iU3JNIwbjuXPv/4SCNsk0v/uM8L
	Wtt0kJlx+aMMRwOpwEFw==
X-Google-Smtp-Source: AGHT+IGAmHmwWFpxTlQrxXJ0dmlBdwdNLlou9mYsvkBH6tgG51GMjsJCWMV2eI8HMBpAFse4o/apJQ==
X-Received: by 2002:a05:600c:3542:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-47d84b26bf0mr63907685e9.7.1767872677950;
        Thu, 08 Jan 2026 03:44:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f65d9f0sm155006245e9.12.2026.01.08.03.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 03:44:37 -0800 (PST)
Message-ID: <83ead495-04c9-4dad-b971-29dca4c45898@tuxon.dev>
Date: Thu, 8 Jan 2026 13:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] reset: rzg2l-usbphy-ctrl: Add suspend/resume
 support
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260108102600.3477012-1-claudiu.beznea.uj@bp.renesas.com>
 <20260108102600.3477012-3-claudiu.beznea.uj@bp.renesas.com>
 <7b4aa36772039d6607bf0aee38bd897b773e3f7f.camel@pengutronix.de>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <7b4aa36772039d6607bf0aee38bd897b773e3f7f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Philipp,

On 1/8/26 13:19, Philipp Zabel wrote:
> On Do, 2026-01-08 at 12:26 +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZ/G2L USBPHY control driver is also used on the RZ/G3S SoC.
>> The RZ/G3S SoC supports a power-saving mode in which power to most USB
>> components (including the USBPHY control block) is turned off. Because of
>> this, the USBPHY control block needs to be reconfigured when returning
>> from power-saving mode.
>>
>> Add suspend/resume support to handle runtime suspend/resume of the device,
>> assert/deassert the reset signal, and reinitialize the USBPHY control
>> block.
>>
>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - used pm_runtime_put_sync() in rzg2l_usbphy_ctrl_suspend()
>>
>>   drivers/reset/reset-rzg2l-usbphy-ctrl.c | 94 +++++++++++++++++++++----
>>   1 file changed, 79 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
>> index 9ce0c1f5d465..1a1581643bf3 100644
>> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
>> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> [...]
>> @@ -266,10 +273,67 @@ static void rzg2l_usbphy_ctrl_remove(struct platform_device *pdev)
> [...]
>> +static int rzg2l_usbphy_ctrl_resume(struct device *dev)
>> +{
>> +	struct rzg2l_usbphy_ctrl_priv *priv = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = reset_control_deassert(priv->rstc);
>> +	if (ret)
>> +		goto pwrrdy_off;
> 
> Do I understand correctly that this reset clears PHY_RESET_PORT[12]
> bits in the RESET register such that rzg2l_usbphy_ctrl_init() must be
> called below?

No, this reset is the reset of this HW block, controlled by another HW 
block (the clock controller).

Bits in PHY_RESET_PORT and other registers specific to this driver could 
be cleared due to the fact the power to this USB PHY CTRL HW block is 
turned off in suspend.

The Renesas RZ/G3S SoC, that uses this HW block, has a power saving mode 
where power to most of the SoC components, including USB PHY CTRL, is 
turned off.

Due to this, we need to restore the previous settings. priv->rstc need 
to also be restored as power to the clock controller is also lost.

> 
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret)
>> +		goto reset_assert;
>> +
>> +	rzg2l_usbphy_ctrl_init(priv);
> 
> This assumes that consumers requested PHY_RESET_PORT[12] resets to be
> asserted in their suspend function.

That's right!

> I think you should warn if that is
> not the case during suspend.

AFAICT, that could be done by adding extra logic in this driver to store 
the state of the de-asserted bits. We can't interrogate directly the 
registers as there might be the case where these resets are used by 
previous bootloaders (that might let them in the de-assert state) but 
not by Linux. In that case, w/o extra software cache, we can generate 
false positives by directly interrogating the registers.

My point here was that the users of these resets will have to properly 
configure their own requested resets, otherwise, they are not doing the 
things in the proper way.

I can add those extra software cache for the hw registers but this is 
what I've tried to avoid.

Please let me know how do you want me to proceed and I'll update.

> Saving the relevant RESET bits during
> suspend and restoring them here is probably not useful.

That's what I've tried to avoid.

Thank you,
Claudiu

