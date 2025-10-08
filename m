Return-Path: <linux-renesas-soc+bounces-22797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A791BBC4BBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 14:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 26B8A35130B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 12:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07781F583D;
	Wed,  8 Oct 2025 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mFU2nAuc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB6F1F5827
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759925781; cv=none; b=nAmb7bMpaJtGb4tQlvxjS7Y+GUP2htQeN1UEN/qprPAkzHFmw8Ycb/Wis6RM0vV+SXabN/10I0AAgnDVagbidQrbDcxekI9EpbZUe6GdLAoEdhGuORRMvGIccdZlEBJdiak7fJtOkcpQ86E1pTX9C9xtJ89rJvnG46ndUJ9Dl50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759925781; c=relaxed/simple;
	bh=kwPgUfwoVyb4zf8KwYkiVYCOXB7KcIbWTRUpHv4SgYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaDZsHxjtr2mswo54DfnmLW26NC3bwxp7mlzd24HhUDYGvmcC0bINgBx4CWTgpQDmjtU0w2o1D39hzLis30PC3jqHxhjs9PCKQB0kHiwIjazMrqofFnM9oXEVKFVgfq72caGaDS+Ys5/lgaryf70HJYbcoxNOpcPBG4pmmDxZcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mFU2nAuc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e52279279so50790655e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 05:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759925777; x=1760530577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxKRQONGzwOttwvgnC2LAlH+BX31PKH3osfZx+Nd7XI=;
        b=mFU2nAuc+GffPRUMjreTzzdKMFvDI30kbwHNFHf8WZJKCNSNbYoWj6JXLsfRaCvnI0
         N6LOVequAyXJuJEh/Z4I/hrWzXyv2U3e4zz6Tn0Zrc1XhBwdq9/ppuGycu79ak+N6v36
         Lh+sqq/cr1rvmBX7OXa0BJeV1z+1qnOocxgP8sKDnJX/J+kfx3OfxcWwWj6X4VllKvlY
         OCceqq8COVsUGU38wVzGVN+CgbqbOKufdMN1XKKmdypHo/BraLUmbcL1yoJj2K/Ij8SW
         XpDMhDCQmH70tkFY5M6DRRvqzlfRtwyRRJVjtmwfIWZxgyOMfAcKAkvUOosJZrJYQhX5
         o0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759925777; x=1760530577;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxKRQONGzwOttwvgnC2LAlH+BX31PKH3osfZx+Nd7XI=;
        b=ctOHS/z+M+WK//MYFB17ZMuEshHook8tFAgCZ1oS6wfizAN3hdkV6G5OeQeIzHe/V5
         ohbVO4H6jBsSRZs4P7Zdj4nkSupQCFA6zlMrRf2nJ9VZztW0AvVmkM6OZ3Yy5aN127lV
         nh48rbmeeT0pdFgaLdRuKMN78cW6Lasd2wFjLWcz84STX1PzXXquINxZ+yKnZvUB26YN
         O4qzFJtu6YgHh9iJEp42wYTZw3BzQ4DYeqMPvdFM4xvUw70Dc5nYWVzV4Gt3BgjpCk07
         JWVWy02sDyTNd2WgULXeavvfptT538ToYTO0n8MI9dyVzcO1YiiGs9V4Y2fC97gtz9Sa
         k+6A==
X-Forwarded-Encrypted: i=1; AJvYcCU7HTBqHXR3MqmG4NHMjCrVxJNJT4H/VyZ4UyaCnpsIjVM1MEsBofH+JCUssQLMFhOdoWeoH1zt1LLg+1pf8dxNIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc4QlKviIsiQ4vxTOWh+rceAwbmEg9oYCf/WgTimlrFSYyenY+
	ehrz+UIhQaBSaY+4RxYdIcKiceTKnlSh8d3Tp3Tza7dqyuOxIrQDUnq5Ox04THkrA/I=
X-Gm-Gg: ASbGnctLUD0zb+dcD0YJM5pvMx2n1AabVVRhUCSUirHQa3CqrlmaHq4OXn4s0a/9BSH
	HP6VFoMRtB+mFD1HQvECvPbWKtRF5CrH5JQhPKu0uRNSZ4Y27BeHvfJlXYks7pR0EYWOXy4xaRX
	NYcuJsVvrZcDU77DQxEOhz3/fs/hvvt+Dli/n2trK/jkONWKDy5+PNMbLNG48PRF9fdvaAtURnT
	aBMAVUtF4US0VyF7BVVe/YEU2UfLVaMdwwqWlfOcif3pKHxFhEsH+pk9lNRJKv3IpNaQ47I8zzL
	TEzxwJJnSJprcZAre0gONTqGUfIS7OAMxp/RUESv3ZjW1hEEp8yRvP+y1hnBUkcTzW/dYwYH5OE
	DZXO+3Uqnw9ytom0FcvTt75DKUZquCGgTAYcBiCpMm13bJo0yU5VqnGR/W9d0STmE
X-Google-Smtp-Source: AGHT+IEimZmCk3/6Ggy9NCh0WE/6r4yeGO/nMGAdxmVGecm/Oa5AC8YxXdOW/M1RgQIyk9DqorAVqA==
X-Received: by 2002:a5d:64c8:0:b0:3e7:63b0:bf3c with SMTP id ffacd0b85a97d-4266e7c6209mr2266780f8f.27.1759925777385;
        Wed, 08 Oct 2025 05:16:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6daasm30018667f8f.7.2025.10.08.05.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:16:16 -0700 (PDT)
Message-ID: <cca1061e-df67-4b5b-99bd-9721c72a0f88@tuxon.dev>
Date: Wed, 8 Oct 2025 15:16:15 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] reset: rzg2l-usbphy-ctrl: Add support for USB
 PWRRDY
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
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <bcf6113b0025777db1cb2ace1618fed8fac2dfc6.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Philipp,

On 10/8/25 13:23, Philipp Zabel wrote:
> Hi Claudiu,
> 
> On Mi, 2025-10-08 at 12:29 +0300, Claudiu Beznea wrote:
>> Hi, Philipp,
>>
>> On 10/8/25 11:34, Philipp Zabel wrote:
>>> Hi Claudiu,
>>>
>>> On Do, 2025-09-25 at 13:02 +0300, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> On the Renesas RZ/G3S SoC, the USB PHY block has an input signal called
>>>> PWRRDY. This signal is managed by the system controller and must be
>>>> de-asserted after powering on the area where USB PHY resides and asserted
>>>> before powering it off.
>>>>
>>>> On power-on the USB PWRRDY signal need to be de-asserted before enabling
>>>> clock and switching the module to normal state (through MSTOP support). The
>>>> power-on configuration sequence
>>>
>>> The wording makes me wonder, have you considered implementing this as a
>>> power sequencing driver?
>>
>> No, haven't tried as power sequencing. At the moment this was started I
>> think the power sequencing support wasn't merged.
>>
>> The approaches considered were:
>> a/ power domain
> 
> Letting a power domain control a corresponding power ready signal would
> have been my first instinct as well.
> 
>> b/ regulator
>> c/ as a reference counted bit done through regmap read/writes APIs
>>
>> a and b failed as a result of discussions in the previous posted versions.
> 
> Could you point me to the discussion related to a?

It's this one
https://lore.kernel.org/all/CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com/


> 
> I see v2 and v3 tried to control the bit from the PHY drivers, and in
> v4 we were are already back to the reset driver.

v2 passed the system controller (SYSC) phandle to the USB PHYs only (though
renesas,sysc-signals DT property) where the PWRRDY bit was set. The PWRRDY
bit was referenced counted in the SYSC driver though regmap APIs.

v3 used the approach from v2 but passed the renesas,sysc-signals to all the
USB related drivers.

Then, in v4, the PWRRDY refcounting was dropped and passed
renesas,sysc-signals only to the USB PHY CTRL DT node in the idea that this
is the node that will always be probed first as all the other USB blocks
need it and request resets from it.

v5 and v6 kept the approach from v4 and only addressed misc comments or
things that I noticed.

> 
>> c was abandoned by me after long discussions with Renesas HW team which
>> revealed the block schema b/w individual USB blocks (presented in the patch
>> description).
>>
>> The point is that this bit doesn't actually power anything, at the moment
>> the bit is set, the power to USB is already applied. Software just need to
>> set the bit before/after setting the clocks and the associated MSTOP and
>> applying any USB specific settings. Each clock has an MSTOP associated and
>> the MSTOP is set though the clock driver when the clock is set.
> 
> I understand.
> 
> Apart from having to carry non-reset-related code in reset drivers, I
> worry about the implicit ordering that the PHY driver depends on with
> this:
> 
> The power-up (probe) order is guaranteed by probe order via the
> reset_control_get() check in the PHY driver, and power-down (remove)
> order is guaranteed by the reset controller device reference that the
> reset control holds. That's all very hidden and indirect when the
> actual dependency is between a bit being set in SYSC and the clock
> handling in (either) PHY driver.


The USB PHY CTRL block controlled by this driver is also part of the USB
PHY block:

┌──────────────────────────┐
│                 ┌────────┐
│                 │        │
│                 │ PHY0   │
│     USB PHY     │        │
│                 └────────┘
│                          │
│┌──────────────┐ ┌────────┐
││USHPHY control│ │        │
││  registers   │ │ PHY1   │
│└──────────────┘ │        │
│                 └────────┘
└─▲───────▲─────────▲──────┘
  │       │         │
  │       │         │
  │       │         │
  │PWRRDY │         │
  │       │   CPG_CLK_ON_USB.CLK3_ON
  │       │
  │  CPG_BUS_PERI_COM_MSTOP.MSTOP4_ON
  │
┌────┐
│SYSC│
└────┘

Thus, touching USB PHY CTRL registers, though this driver, will also have
to be done after setting PWRRDY, clk, MSTOP.

In v3 the PWRRDY SYSC phandle was passed to all the drivers in charge of
controlling the blocks from the USB PHY area. And the PWRRDY was referenced
counted through regmap APIs. In v3 I was in the middle of keeping vs
dropping the refcounting and, thus, posted it and asked for feedback on
this approach. I didn't get any input about it, I've dropped in v4.

In v4, I dropped it as I considered it too much and unnecessary taking into
account that the USB PHY CTRL driver will be probed/remove all the time
first/last as all the other drivers depends on it. And, due to this, it
will be last/first in suspend/resume sequence.


> 
>>>
>>>> must be:
>>>>
>>>> 1/ PWRRDY=0
>>>> 2/ CLK_ON=1
>>>> 3/ MSTOP=0
>>>>
>>>> On power-off the configuration sequence should be:
>>>>
>>>> 1/ MSTOP=1
>>>> 2/ CLK_ON=0
>>>> 3/ PWRRDY=1
>>>>
>>>> The CLK_ON and MSTOP functionalities are controlled by clock drivers.
>>>>
>>>> After long discussions with the internal HW team, it has been confirmed
>>>> that the HW connection b/w USB PHY block, the USB channels, the system
>>>> controller, clock, MSTOP, PWRRDY signal is as follows:
>>>>
>>>>                                ┌──────────────────────────────┐
>>>>                                │                              │◄── CPG_CLKON_USB.CLK0_ON
>>>>                                │     USB CH0                  │
>>>> ┌──────────────────────────┐   │┌───────────────────────────┐ │◄── CPG_CLKON_USB.CLK2_ON
>>>> │                 ┌────────┐   ││host controller registers  │ │
>>>> │                 │        │   ││function controller registers│
>>>> │                 │ PHY0   │◄──┤└───────────────────────────┘ │
>>>> │     USB PHY     │        │   └────────────▲─────────────────┘
>>>> │                 └────────┘                │
>>>> │                          │    CPG_BUS_PERI_COM_MSTOP.MSTOP{6, 5}_ON
>>>> │┌──────────────┐ ┌────────┐
>>>> ││USHPHY control│ │        │
>>>> ││  registers   │ │ PHY1   │   ┌──────────────────────────────┐
>>>> │└──────────────┘ │        │◄──┤     USB CH1                  │
>>>> │                 └────────┘   │┌───────────────────────────┐ │◄── CPG_CLKON_USB.CLK1_ON
>>>> └─▲───────▲─────────▲──────┘   ││ host controller registers │ │
>>>>   │       │         │          │└───────────────────────────┘ │
>>>>   │       │         │          └────────────▲─────────────────┘
>>>>   │       │         │                       │
>>>>   │       │         │           CPG_BUS_PERI_COM_MSTOP.MSTOP7_ON
>>>>   │PWRRDY │         │
>>>>   │       │   CPG_CLK_ON_USB.CLK3_ON
>>>>   │       │
>>>>   │  CPG_BUS_PERI_COM_MSTOP.MSTOP4_ON
>>>>   │
>>>> ┌────┐
>>>> │SYSC│
>>>> └────┘
>>>>
>>>> where:
>>>> - CPG_CLKON_USB.CLK.CLKX_ON is the register bit controlling the clock X
>>>>   of different USB blocks, X in {0, 1, 2, 3}
>>>> - CPG_BUS_PERI_COM_MSTOP.MSTOPX_ON is the register bit controlling the
>>>>   MSTOP of different USB blocks, X in {4, 5, 6, 7}
>>>> - USB PHY is the USB PHY block exposing 2 ports, port0 and port1, used
>>>>   by the USB CH0, USB CH1
>>>> - SYSC is the system controller block controlling the PWRRDY signal
>>>> - USB CHx are individual USB block with host and function capabilities
>>>>   (USB CH0 have both host and function capabilities, USB CH1 has only
>>>>   host capabilities)
>>>>
>>>> The USBPHY control registers are controlled though the
>>>> reset-rzg2l-usbphy-ctrl driver. The USB PHY ports are controlled by
>>>> phy_rcar_gen3_usb2 (drivers/phy/renesas/phy-rcar-gen3-usb2.c file). The
>>>> USB PHY ports request resets from the reset-rzg2l-usbphy-ctrl driver.
>>>>
>>>> The connection b/w the system controller and the USB PHY CTRL driver is
>>>> implemented through the renesas,sysc-pwrrdy device tree property
>>>> proposed in this patch. This property specifies the register offset and the
>>>> bitmask required to control the PWRRDY signal.
>>>>
>>>> Since the USB PHY CTRL driver needs to be probed before any other
>>>> USB-specific driver on RZ/G3S, control of PWRRDY is passed exclusively
>>>> to it. This guarantees the correct configuration sequence between clocks,
>>>> MSTOP bits, and the PWRRDY bit. At the same time, changes are kept minimal
>>>> by avoiding modifications to the USB PHY driver to also handle the PWRRDY
>>>> itself.
>>>>
>>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v7:
>>>> - used proper regmap update value on rzg2l_usbphy_ctrl_set_pwrrdy()
>>>>
>>>> Changes in v6:
>>>> - used syscon_regmap_lookup_by_phandle_args() to simplify the code
>>>> - collected tags
>>>>
>>>> Changes in v5:
>>>> - none
>>>>
>>>> Changes in v4:
>>>> - updated patch description
>>>> - updated rzg2l_usbphy_ctrl_pwrrdy_init() to map directly the
>>>>   "renesas,sysc-pwrrdy" as the SYSC signal abstraction was dropped
>>>>   in this version, along with rz_sysc_get_signal_map()
>>>> - dropped priv member of rzg2l_usbphy_ctrl_pwrrdy_init() as it is
>>>>   not needed in this version
>>>> - shift left !power_on with pwrrdy->mask as this is how the
>>>>   regmap_update_bits() needs the last member to be
>>>> - selected MFD_SYSCON
>>>>
>>>> Changes in v3:
>>>> - none; this patch is new
>>>>
>>>>
>>>>  drivers/reset/Kconfig                   |  1 +
>>>>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 62 +++++++++++++++++++++++++
>>>>  2 files changed, 63 insertions(+)
>>>>
>>>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>>>> index 78b7078478d4..329730cbcfb9 100644
>>>> --- a/drivers/reset/Kconfig
>>>> +++ b/drivers/reset/Kconfig
>>>> @@ -237,6 +237,7 @@ config RESET_RASPBERRYPI
>>>>  config RESET_RZG2L_USBPHY_CTRL
>>>>  	tristate "Renesas RZ/G2L USBPHY control driver"
>>>>  	depends on ARCH_RZG2L || COMPILE_TEST
>>>> +	select MFD_SYSCON
>>>>  	help
>>>>  	  Support for USBPHY Control found on RZ/G2L family. It mainly
>>>>  	  controls reset and power down of the USB/PHY.
>>>> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
>>>> index 8a7f167e405e..be315199e2b0 100644
>>>> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
>>>> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
>>>> @@ -13,6 +13,7 @@
>>>>  #include <linux/regmap.h>
>>>>  #include <linux/reset.h>
>>>>  #include <linux/reset-controller.h>
>>>> +#include <linux/mfd/syscon.h>
>>>>  
>>>>  #define RESET			0x000
>>>>  #define VBENCTL			0x03c
>>>> @@ -41,6 +42,18 @@ struct rzg2l_usbphy_ctrl_priv {
>>>>  
>>>>  #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
>>>>  
>>>> +/**
>>>> + * struct rzg2l_usbphy_ctrl_pwrrdy - SYSC PWRRDY signal descriptor
>>>> + * @regmap: SYSC regmap
>>>> + * @offset: offset into the SYSC address space for accessing PWRRDY
>>>> + * @mask: mask into the register at offset for accessing PWRRDY
>>>> + */
>>>> +struct rzg2l_usbphy_ctrl_pwrrdy {
>>>> +	struct regmap *regmap;
>>>> +	u32 offset;
>>>> +	u32 mask;
>>>> +};
>>>> +
>>>>  static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
>>>>  				    unsigned long id)
>>>>  {
>>>> @@ -91,6 +104,8 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
>>>>  	return !!(readl(priv->base + RESET) & port_mask);
>>>>  }
>>>>  
>>>> +#define RZG2L_USBPHY_CTRL_PWRRDY	1
>>>> +
>>>>  static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
>>>>  	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
>>>>  	{ /* Sentinel */ }
>>>> @@ -110,6 +125,49 @@ static const struct regmap_config rzg2l_usb_regconf = {
>>>>  	.max_register = 1,
>>>>  };
>>>>  
>>>> +static void rzg2l_usbphy_ctrl_set_pwrrdy(struct rzg2l_usbphy_ctrl_pwrrdy *pwrrdy,
>>>> +					 bool power_on)
>>>> +{
>>>> +	u32 val = (!power_on << (ffs(pwrrdy->mask) - 1)) & pwrrdy->mask;
>>>
>>>
>>> Why not just:
>>>
>>> 	u32 val = power_on ? 0 : pwrrdy->mask;
>>
>> This would work as well. I wanted to be sure it doesn't fail in case the
>> mask is more than one bit (as it comes from device tree).
> 
> I'd just check this in rzg2l_usbphy_ctrl_pwrrdy_init() and fail if more
> than one bit is set.

OK

> 
> [...]
>>
>>> So we deassert PWRRDY on probe and assert on remove. What about
>>> suspend/resume ordering?
>>
>> As this driver has no suspend/resume support yet, my intention was to take
>> care of this bit on suspend/resume after it will be established how it is
>> handled on probe/remove. Adding suspend/resume support to this series will
>> make it bigger.
> 
> Ok, please add that to the commit description.

OK

> I'm just asking because the dt-bindings patch mentions how PWRRDY must
> be set during suspend/resume, and then this patch doesn't do it.

OK

Thank you for your review,
Claudiu

