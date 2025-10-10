Return-Path: <linux-renesas-soc+bounces-22887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08526BCCC52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 13:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B163A3A2C43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 11:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95386286891;
	Fri, 10 Oct 2025 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DIBBCJxO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AA4286D66
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095591; cv=none; b=V6wIUOBXJO0iILGllR4Vs1oGFkvHw1XnSLw7ur2i8qyN6BkvnBHDPlG9V5pQGbFK1Q77SfXqc6kFs2w9hy+/UqsCkYq5/dxUm88MCsdEGF3FyCUIk0062hKX8aPJAEUI6ao12GY2KfaT55CQ/I1m91vPl45UirBRwNpJKKaL7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095591; c=relaxed/simple;
	bh=fNcGy+FTinFlO6rjUIlxt7xm2mSUFyR7mTt65QRs0yc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gPcUXKioFMcxkTzx0MKgQQj1mDxhtzQiZwSSdcBhprlOVpgniAsZ2Nriyw017CvuN3cJo2P+rmUiFvvNbLQLVzk6UVNxm5Ao7CrJIz44K2f/Eu5qW/fnMc+hHX5jBAsD52jBAOaN3SJPBX0T+O59KqvA2K3B0ixz6AnSo6Ppj0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DIBBCJxO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso14470345e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 04:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760095588; x=1760700388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MJYv7wcTmHOu13aBWc1M6LrX7Yag7J9oLnKL5BHIPTg=;
        b=DIBBCJxO0spBsGQvhKA3qJq9PQ6sAwjKUfZugF1TzPBd0FOx15NGl1+OBPXrh5J4a5
         i/MnTFQOTPKJLR66H/ihTQGp9zmCqa49GpkY1qNnHgUl+AfFdHG37UOZTShYt5OJlOAY
         eSRu46d9DuHrDKysaRJkuCdoL85rswJFp1xHzL9wiEQz4AyMHbo0kMM+YvFpVRM5jDFX
         L4ViVsU9ZgGX8wk/HOborlzW1mN9uREI5ZoX58Wj9WfFreRIswRgSjf2z8oqDupwJcUQ
         dFKVSQfDJxxWp6aY5q0PHHwvD96UXQ7PrX+JpBa8nX5UO+1Fl8kTiIuTulsKqT0y5fAz
         1Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095588; x=1760700388;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJYv7wcTmHOu13aBWc1M6LrX7Yag7J9oLnKL5BHIPTg=;
        b=E48l529yajI55e/VVrQoLSit4BPGY/gw+cmfLvfy0vZGeqFk3XPzwJnp5i6HxlcTXE
         fT6/RHr1WjzHklCqs/PyRV7WKwHTU15i9zKBTrQdvdknX73w9+31EpOjmZrfGz3rQ754
         YYAYGWwdLPkQsUe3Mz9FOtIvLfziaMUo/ceqW+kdXtJkYF6OrD4TSQy8Z0vHiEoRNchz
         c/XUBqA+WFcIb8QFznG7ETq79905LgCkS+20Y+AAeAT+aY0AWJ5Og1qLDdb8VEcA1uJD
         RAhs3D3oq/kHu1WoODhDfEkX68QUABpUbZ62KbsX+VomgyEY5hdk/IfcIHlb2t3c7ki6
         cxBw==
X-Forwarded-Encrypted: i=1; AJvYcCXbGkTYrmnyF1IOQznukZ9LAc9CAhJ6FgQ7p1/9jMFX/LXCOH0S7VKw2/qbkdPzn6i5sDHz0o7JApWdtZzsojJL2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8lybQB7t/HHgXiVrkITgVLtjkt6alxz3bb80OT/Rxi/rxU4hv
	BNG+2IT6K6fWdssg5CU9jAbLw8NAYVz35BwTYutmWqGonVY5/4xo1g+hpd2+jI/cSJw=
X-Gm-Gg: ASbGnctsN742Py/v6Grfl0v2rWv5mzcq7uIMhwR9gBX9rQhYJHgkUVqIfnS8sIRDmou
	EM9/Wbr+zGgVxh0QTU9lcCWi3hpcpUs3n1ezgWfnhqiJiC3FrS6pKQjGSr+3IkHsbb9BEjJ5oHB
	R1tlWpI5U7uNV5kSzSZO3kDGiaZH4pW7++oGmVIsaJgAPiqLd8gtE1t9IFg4tP88MiOfPCKLE61
	hG0UsvE+PecpF1whjJLtRKLdiD8P56HfA1InE3RDDg48QHY7cai6iM/Sz4dl+2VNC260WOOJtfi
	SnuKbDc3ztX7h2qn8kgi7FeL6hk6Bx9cH37KshUrdM6blsrOFwnOk9c7HQJj5/ZsLbijGPicVMC
	roKbDaJRZNHLtZVuV+QePnTi2eQIbt4cZmrtttHEuUqM7E+Egkcvzi9atpuk=
X-Google-Smtp-Source: AGHT+IGqto8DzzsUkr3m2rhrXEeJ8gdggFLEt9ehxmvIAsPFVSe6T8rsRQ8HQwfhX/mMuR4S29coxQ==
X-Received: by 2002:a05:600c:19c6:b0:46e:3d17:b614 with SMTP id 5b1f17b1804b1-46fa9a9440emr89600325e9.6.1760095587252;
        Fri, 10 Oct 2025 04:26:27 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489af92sm48160085e9.17.2025.10.10.04.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 04:26:26 -0700 (PDT)
Message-ID: <6d4bc69c-1571-4d98-b0d4-214c68be118e@tuxon.dev>
Date: Fri, 10 Oct 2025 14:26:25 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] reset: rzg2l-usbphy-ctrl: Add support for USB
 PWRRDY
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Philipp Zabel <p.zabel@pengutronix.de>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
 <20250925100302.3508038-5-claudiu.beznea.uj@bp.renesas.com>
 <c7fc31f1247332196516394a22f6feef9733a0b4.camel@pengutronix.de>
 <66d85e70-efb8-4a45-9164-55b123691b70@tuxon.dev>
 <bcf6113b0025777db1cb2ace1618fed8fac2dfc6.camel@pengutronix.de>
 <cca1061e-df67-4b5b-99bd-9721c72a0f88@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cca1061e-df67-4b5b-99bd-9721c72a0f88@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Philipp,

On 10/8/25 15:16, Claudiu Beznea wrote:
> Hi, Philipp,
> 
> On 10/8/25 13:23, Philipp Zabel wrote:
>> Hi Claudiu,
>>
>> On Mi, 2025-10-08 at 12:29 +0300, Claudiu Beznea wrote:
>>> Hi, Philipp,
>>>
>>> On 10/8/25 11:34, Philipp Zabel wrote:
>>>> Hi Claudiu,
>>>>
>>>> On Do, 2025-09-25 at 13:02 +0300, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> On the Renesas RZ/G3S SoC, the USB PHY block has an input signal called
>>>>> PWRRDY. This signal is managed by the system controller and must be
>>>>> de-asserted after powering on the area where USB PHY resides and asserted
>>>>> before powering it off.
>>>>>
>>>>> On power-on the USB PWRRDY signal need to be de-asserted before enabling
>>>>> clock and switching the module to normal state (through MSTOP support). The
>>>>> power-on configuration sequence
>>>> The wording makes me wonder, have you considered implementing this as a
>>>> power sequencing driver?
>>> No, haven't tried as power sequencing. At the moment this was started I
>>> think the power sequencing support wasn't merged.
>>>
>>> The approaches considered were:
>>> a/ power domain
>> Letting a power domain control a corresponding power ready signal would
>> have been my first instinct as well.
>>
>>> b/ regulator
>>> c/ as a reference counted bit done through regmap read/writes APIs
>>>
>>> a and b failed as a result of discussions in the previous posted versions.
>> Could you point me to the discussion related to a?
> It's this one
> https://lore.kernel.org/all/
> CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com/
> 
> 
>> I see v2 and v3 tried to control the bit from the PHY drivers, and in
>> v4 we were are already back to the reset driver.
> v2 passed the system controller (SYSC) phandle to the USB PHYs only (though
> renesas,sysc-signals DT property) where the PWRRDY bit was set. The PWRRDY
> bit was referenced counted in the SYSC driver though regmap APIs.
> 
> v3 used the approach from v2 but passed the renesas,sysc-signals to all the
> USB related drivers.
> 
> Then, in v4, the PWRRDY refcounting was dropped and passed
> renesas,sysc-signals only to the USB PHY CTRL DT node in the idea that this
> is the node that will always be probed first as all the other USB blocks
> need it and request resets from it.
> 
> v5 and v6 kept the approach from v4 and only addressed misc comments or
> things that I noticed.

Could you please let me know if you are OK with the approach proposed in
v7, so that I can start preparing a new version addressing your comments?

Thank you,
Claudiu

