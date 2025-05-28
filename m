Return-Path: <linux-renesas-soc+bounces-17616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2B1AC69C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 949947B0413
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F1121322F;
	Wed, 28 May 2025 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hRTYQjBy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80B2857CB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748436712; cv=none; b=LtRO85mopICXUUc5mYgDV6dQhs8dxN12bD0K5XRTxskNSJUVdCeaBuYwaYItQkY6+pHn8ux1tGOKQmmBe/8G/y96ly3DHXVRfsyQ2nQnTjZs3r4CR6JZjrgM+MGqLCoTXjs3utCjzW3kZyZGtoZwBAOhpF1KUQtVLWcPRlzDPjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748436712; c=relaxed/simple;
	bh=smnmeCYjTzrN7LZXl255smVaN14J1a0yovz29gZaSe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwE2kvb9gg4+wA0DQxmLtE2WDB5sLEgkiwPVDRcG93jAbH1eNMuO1xM8PCp7g5YyDSo3C85G7RVhRRosVuQ7TkfgNZi+cL3VhYnhJV+oRE9x+sMlqTtd1owPGBwrtWeJK1Sc90HFuuIM8SzejxrevRn+W03QTtLnCALptl4SkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hRTYQjBy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4ebfaa623so83199f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748436708; x=1749041508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gtxFBVmEk7OdwaX8iO3/bw0IJ4UWR9xfEnW8+jRDwF4=;
        b=hRTYQjByxz8tUg+v5qNHFSF0N1NN0zvNq/apZ9uLhnxdNHEhyqT4PtHylGFHjwaHyV
         bcHP2m9AcLzOEoDAbUeg7lZ/aPNz8JXv+4AwcivV2hhe8rG7TOnDsiPu3kB2vwfo9Ba0
         37KmteoDyj0UL1pGv0H9iQ7KCv9rBLAB//3fSVweYDKG+S0j9ytwPiXs7eQ4azRgl4Li
         1YZlPhcab3nUh3kBb11XXw0VygNQHO0BZ125xzD42rNlLizuRIaQ5SlmwLxe78+5deWl
         SJoO+ahGwN3lAlU+9b2ltoVXIWrFiitW+gxQupS4XW7e5oUVVmEUahpD4WBGC0mv+4CM
         s8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436708; x=1749041508;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtxFBVmEk7OdwaX8iO3/bw0IJ4UWR9xfEnW8+jRDwF4=;
        b=njRME61dVJ/G8wFjf+RLEVJYgcwjaAyapRe3m0qSg+LeqHbPqDWeRtpisbdp9DU90E
         uHZ0kAE5D1Dy3MXeeR6nZC8SL8RkOF96xeTlPVpvWloWv3cKKxsdnnkCAI4bmSA7yBgX
         CbkwUeaInhiDIb8rCSTARYJHw9RuYBEiR9CI/3L5MZgCp/3FdxPSxnFEJlHzHDV/bG1C
         4+IdEiVYN64cb/zbgrKzkvdNWjGrICFeGvY2jG+pPNX9mnKoa0kb12DU3KvXrrPDvA4q
         qjdwGqTylx+btioRifPcJgqUL/7KyZxfOPaNewNCNU8jXMNdVNeo21d9yqjuBk5on3fE
         d9xA==
X-Forwarded-Encrypted: i=1; AJvYcCWGA2iNGmX3pbqWWpOlOVgRii+6Yqkw8IYUUIXhoj95aD2VkuueEVwGoMJojhd76b82IO/N4WxhSSIMa+w1pMgutg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMTWr36Y4kR44cJFpEvJlavCoRcZce8TSmhZnnsJVfrIPps0Bk
	EPp+nSpz7y/OFxzkGEUjSNw3wf2Qg0c5U+4ST3yDxPF250h+Xp0w0gDwsCDmUH+yJFo=
X-Gm-Gg: ASbGncteezHTJJj/K4zFoqzeBWfrFzZF5cUIFX700DIrJjsWCW78cywOl3BZfZSLbTd
	BZgCcwC4KdBhvCRKJ4WH8DMsgaxWYYkS2hDX7lDG02+hWVNUFySUCrRfFeoRsr+BJnTmm8MNq48
	ESQXSM96heOtqW1GMhZabRYRGwxb/p8qNZ8YIKeyq6loPmdLa3olGMHVaCowo5l8UXN/QPopAnf
	br63vDMYwHnaP0Md5spdNlXWkcGhmvpAsZa/xgdcfmhD2LfT6EPgsj1tGvnI/J5AeJ090GsVTGF
	oAmyM9+k1bOsrnPu27LN5MLfo28EGIKmE8Cvv3DaKCyvkiqZfo3CmdBS0N3BXCyPl0oVl8A=
X-Google-Smtp-Source: AGHT+IHZRUnH5Rp4aCZ1f9KHXVlEFS+hqrw/ulDU4vW45oSOCS0VZWSjD+ROhW/0PEAj5L3PAac3+A==
X-Received: by 2002:a05:6000:4210:b0:3a4:e0e1:8dc8 with SMTP id ffacd0b85a97d-3a4e0e18ffamr1983903f8f.9.1748436707566;
        Wed, 28 May 2025 05:51:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac7e0c8sm1423525f8f.30.2025.05.28.05.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:51:46 -0700 (PDT)
Message-ID: <4a2a8504-310d-4b65-ba52-1854f461b604@linaro.org>
Date: Wed, 28 May 2025 14:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] pinctrl: starfive: Allow compile testing on other
 platforms
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
 <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 14:36, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> Always descent to drivers/pinctrl/starfive/ because limiting it with
>> SOC_STARFIVE is redundant since all of its Kconfig entries are already
> 
> ... since its Makefile doesn't build anything if no Starfive-specific
> pin control Kconfig options are enabled?

Yes, that's better. Thank you.

> 
>> have "depends on SOC_STARFIVE".  This allows compile testing on other
>> architectures with allyesconfig.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/pinctrl/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
>> index ac27e88677d14f1c697e0d0be9f295c746556f4d..dcede70b25660833a158c298d1269d6ecea9dd8b 100644
>> --- a/drivers/pinctrl/Makefile
>> +++ b/drivers/pinctrl/Makefile
>> @@ -82,7 +82,7 @@ obj-y                         += sophgo/
>>  obj-y                          += spacemit/
>>  obj-$(CONFIG_PINCTRL_SPEAR)    += spear/
>>  obj-y                          += sprd/
>> -obj-$(CONFIG_SOC_STARFIVE)     += starfive/
>> +obj-y                          += starfive/
>>  obj-$(CONFIG_PINCTRL_STM32)    += stm32/
>>  obj-y                          += sunplus/
>>  obj-$(CONFIG_PINCTRL_SUNXI)    += sunxi/
> 
> The actual change LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
Ack

Best regards,
Krzysztof

