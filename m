Return-Path: <linux-renesas-soc+bounces-26427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9589D03080
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71F2F30019CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA807481A81;
	Thu,  8 Jan 2026 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EWd7VXWU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0833481657
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878966; cv=none; b=a0LdUukBhWKUiidKSNuv2TamvnwXd0W/05S4Q0QM8HNUshAEttQ3aOTaazJaBLjo5U0hfqKzvCJecDX4O/NpcvYo+7URSwdj0xj/PmGi/LADQ+r1fID8k8dR3R5qgERodROJO2AzxILF1rIgl49V4uAmpEDhh/7C/C8QSVFkDA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878966; c=relaxed/simple;
	bh=nSUWJOqIrx3AnVAwEAjEUh9mqJaV50gidQhYDUvAv4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpEaOkMgRhFDa9iQgnibgv/gnZ4vWqUZghaoYjo/+2L/B0kwIXhzwQ0sZwVQ5u0KDcqOV207+cpwpMhNLvSjCPRrDstCgLi0pqGk7xZpQxuP4UwC5LtNmyIcRvCz661JDGNa/3eUFyn245GykVH2N6MDyBVvmFuRvVufJ1GioEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EWd7VXWU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-430fbb6012bso2361832f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767878963; x=1768483763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8dqHYwAya3LKA65BhpCBZyjUj3g0KXz1rtrvIqWkE8=;
        b=EWd7VXWUf7YVtu4Jhabd4/+IcwdrdSu895NSgMpCEDYHZA/QYH0MuG26MaehQZ1n3f
         FvoP9Y0KeihWdZyrSgkkookIgEFG7BTChdFQF+lQf3iL8vgM0Zf/IvAvboX55gyODfP6
         orweAvnMrMjg/ccv9bisymwW8H4K3OVcW36Ff9pU9sN7GkrLqhWA5wdhla6DQHB0uuh1
         L6KqO1sAFK3ZPnN6jyzQnQR5sVtHamRCFHnjz95rp7kkBVItAPdJZHrVtuIrUW5KO/CK
         eL3WpBzTwf01Q+cvZJSpH5w+8Z181q2306nAMs6zea3Ucb7qpkVY908XzLqn5O1mh0AO
         j1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878963; x=1768483763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8dqHYwAya3LKA65BhpCBZyjUj3g0KXz1rtrvIqWkE8=;
        b=q64g965tkyc2Z+1/v+RArqsIpNpiJahwmXibbLu7fXhYd33Hrzmv7+8e2j70Jx6+fO
         NiYSbFqV4hPArhYF2PgIAWxzUDsIDKCIU7hX9uPFp7nw7QwL/qAwodnAh2Tis7KaeIDK
         /RINjpKCyeQOL4vQWdv5U00sEN+XkYEMe01qgyPbJRlTb1jWI2UkFt+vrp4pRNvxB9xG
         pZgu5/wGs9B04sXvcCH0ySqb2p/gcAUxsA2V/rg4axElBuRIsWqCYfk5+g1F6ek44B+h
         ad8KxyaZJWLthJ2+MfAzxl9QMTVtN/hY39H6hcQ1j4Tye1DHZeJcLbb1N9cNMBcyzOMF
         3IMg==
X-Forwarded-Encrypted: i=1; AJvYcCUfYzmc3VCNUh77Hbcv7HyFez9QPquaqijiW2hkFilu+8j/OdYy8lCEcCpDa30etrTZZ4ZAPvmf0EYMcFUqb7Dsbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+TzIPgfM2BqY2xinCl10iXlw/uQGwmUI956tABdpUUGi1w7/
	R7i8Dihd4ERGbp3io4x7ur9oye/+AJwUo797nMUJ3BGFSAK81RCVktAxrTbNCNuTY3/pBic9zyw
	LifyR
X-Gm-Gg: AY/fxX4wxh8d/GPjiQ9ujHrh/uH/cideSPXm/KyHX0aPX4gFm6ECgvf4H4PNIbAnczR
	KAxdVMUq8UEAHhqW4uFUEnuhZkQlpNL9dPSh7znbnP2IlFYD0h6j1fHFvct3kauWqEwSG9YWFQD
	qE1joKMnOLGqhIx/I3kL+e8eZ/Z7jydAqP7A0afPpIvuG/VFODWWOiQVALUpEYnm7uuh6mSzh02
	k6xiRBYfJ6nqGOrcPS/K6TnjabXOYmSuAUaQ5MnmEwNdkroeCae4R+/1sO4hY7rJdn6aFcLTAx0
	KHW7YVg9HDf6J7q/JMHgOdcf3zvxTfzOyTT5zm05IqrUG4wXpbUx1L1DsF6SWIznoq2NuN0LD6n
	s/gkz0Fiitg9mFzNP14ynsTnG1odf2dQdh3xFQVhSKEIUcy9udv1MChq4jRxAqf6uoSAJFrRhjw
	XYrurHNv4RiOt2PG1CjQ==
X-Google-Smtp-Source: AGHT+IFDeCWuEAwHy4HsrZG9QngqUx2L+p4CiWRqYuRBxALgP8aHr0pyNH2mWrM4jJDddyZxi6vvNg==
X-Received: by 2002:a05:6000:2304:b0:430:fdb8:8516 with SMTP id ffacd0b85a97d-432c37983camr8113597f8f.35.1767878962771;
        Thu, 08 Jan 2026 05:29:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e17aasm16701396f8f.15.2026.01.08.05.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:29:22 -0800 (PST)
Message-ID: <846091a4-3353-438f-99fe-bfbb61c2b3be@tuxon.dev>
Date: Thu, 8 Jan 2026 15:29:21 +0200
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
 <83ead495-04c9-4dad-b971-29dca4c45898@tuxon.dev>
 <f2c7583d863feb767b59f6b82b47a621aae8fb86.camel@pengutronix.de>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <f2c7583d863feb767b59f6b82b47a621aae8fb86.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Philipp,

On 1/8/26 15:09, Philipp Zabel wrote:
> Hi Claudiu,
> 
> On Do, 2026-01-08 at 13:44 +0200, Claudiu Beznea wrote:
> [...]
>>>> +	ret = reset_control_deassert(priv->rstc);
>>>> +	if (ret)
>>>> +		goto pwrrdy_off;
>>>
>>> Do I understand correctly that this reset clears PHY_RESET_PORT[12]
>>> bits in the RESET register such that rzg2l_usbphy_ctrl_init() must be
>>> called below?
>>
>> No, this reset is the reset of this HW block, controlled by another HW
>> block (the clock controller).
>>
>> Bits in PHY_RESET_PORT and other registers specific to this driver could
>> be cleared due to the fact the power to this USB PHY CTRL HW block is
>> turned off in suspend.
>>
>> The Renesas RZ/G3S SoC, that uses this HW block, has a power saving mode
>> where power to most of the SoC components, including USB PHY CTRL, is
>> turned off.
>>
>> Due to this, we need to restore the previous settings. priv->rstc need
>> to also be restored as power to the clock controller is also lost.
> 
> Ok, thank you for the explanation.
> 
>>>
>>>> +	ret = pm_runtime_resume_and_get(dev);
>>>> +	if (ret)
>>>> +		goto reset_assert;
>>>> +
>>>> +	rzg2l_usbphy_ctrl_init(priv);
>>>
>>> This assumes that consumers requested PHY_RESET_PORT[12] resets to be
>>> asserted in their suspend function.
>>
>> That's right!
>>
>>> I think you should warn if that is
>>> not the case during suspend.
>>
>> AFAICT, that could be done by adding extra logic in this driver to store
>> the state of the de-asserted bits. We can't interrogate directly the
>> registers as there might be the case where these resets are used by
>> previous bootloaders (that might let them in the de-assert state) but
>> not by Linux.
> 
> Isn't the RESET register initialized during rzg2l_usbphy_ctrl_probe()
> before rzg2l_usbphy_ctrl_suspend() can ever be called? It seems to me
> that read-back in suspend should never return a value left behind by a
> previous bootloader.

Ah, you're right, I overlooked that.

> 
> [...]
>> I can add those extra software cache for the hw registers but this is
>> what I've tried to avoid.
>>
>> Please let me know how do you want me to proceed and I'll update.
> 
> If reading back the RESET register during suspend can be used, please
> add a warning.

OK, I'll update it like this.

Thank you,
Claudiu



