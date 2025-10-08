Return-Path: <linux-renesas-soc+bounces-22783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3DBC427D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 11:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B0F334EBFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 09:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FF01339A4;
	Wed,  8 Oct 2025 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U9TLX21l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F02BEC52
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759915766; cv=none; b=EDoTM4tnudUt9R6A+3TDUN7TVqTvTe/xAdpWI9/HRR6ayZZl0RiKYIjAuVxjrEyNSALynppptCJjDHmuk3vlSn9W5COg4hdmhZisBOeKgHpSmmnNMevip68VaG8I/3VJvFIe/XfZsLMGsoTf6byHVONoM1iYdfichB9cG/A5idg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759915766; c=relaxed/simple;
	bh=LxBBVtzwMKr2JTNUqHeq1IBThOaQgqw0EM0HLAomf20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyN0l3JkBYjRjEEmKs0IqVbGzs3qnnqySwffiOxJL4NcuatUraYTZvG/VteRvM43Tb7jCVatpJpJ99z0Dv/n+9mBioE90iJo2U+lJQfIiBvzLVGfXA3E8jq457WSOJiyU0qyb6vwei7Fhqupze+XWOgb/zZ1URdfl03z9rd1yV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U9TLX21l; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so43030095e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Oct 2025 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759915763; x=1760520563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGH1zm2/CVREaNWSZfTdihfB75bi/nZyvw0cv7dYup8=;
        b=U9TLX21leKyslAw2MI0m1zpegQdPHdmStWvlkATRiHabQjfYOqTUizy5IT3IiQ6P6C
         SLPvyUm/zsczGtAq0fPVyi9vlkjBG37HO454+TJG/AhRdQ/nW1ZKE2WoebjoK8q0oVq9
         E1FnlG1OvrKFgg4fNizgBdwNWfkiXNsk+TIP/NnRvLlzdjtoYE4gVXqMsRSRFEpiq67J
         n1fpVJyMppa83xNnxLRJTonJdPppl7U8QvNx5ZqIKxbWtEbcdoTqvdHZAT+951SxJ96n
         Qte3l9XiSB9OZxT4W5lYVMEiGvuzyRYivRqmOCk/1yz9wGI2ttlWmsWR/yXVJZJUDdyt
         eGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759915763; x=1760520563;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGH1zm2/CVREaNWSZfTdihfB75bi/nZyvw0cv7dYup8=;
        b=NLMKTlQ/9wo5MInm9b34mGDJPXS4eBgA76svO7ZDNy8+L2hNG69pR+tt5JG96R8YA0
         vKgXPYVh7zvAa3P986JtD5VQbrFzSongoG1r4vWBh034sEuVjG/BVWiGmPA51rW4CNIQ
         6TjxzAKmSs1tscP2x0P0+iuqP3pyEZpCpt2uGGIUEK57fFgurMW94uE5yl5snO/A2438
         Ksm2CX80CZPkZ7Ox5tzkmAHPom+5CeQYJv5sf4fGKzIXMr3ik/LTIyy4jjo9zBwZ88R7
         UIizXcmGJtTkKoFfq2no5NYSIQgjWw9yqVRedw1UaUExmu5C7jRMH0u8dck4n59ozpEG
         5hFw==
X-Forwarded-Encrypted: i=1; AJvYcCVFwm4YYAtpg1fJJPzFbOqhvTJzDnxHXaPhWqHEuR346fhMLMrAn3w1YeBr5/i3hWovdTp0q1ChkFXPRcb8csPQLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybnERaDY67P42shAldENNghsZYWJa7/cezbPy7D26t3CcNcQ9N
	k4U/y+o3qhcm5RE/KI/AIffi9esCrTxU406/7mOvP3wwX9UIZlMfz+XxfkNgsyaO2bI=
X-Gm-Gg: ASbGncuMf159SMiq92z34dWDR95ruoj96+AC+1AWvpuVnLtrHGpHGZ/FZk3npquGRvA
	1Nx1m7pfHKEVrMDo2mN85kbGOtPMH0Ez6pqC2s/dKt7InJ+AB8QHgi1aJqJ8db5H9b8EHhf9Nse
	+DsYWHAlqrqF6uOJdqdpltYqdJVyguw4sFJl+ekf0fSB/jk2SmSlc27CSzBGV6OejeMF0w6T7UW
	xSzJ8brkHAEfjL+7VAs3K8Jj9Zk+MH6urV20IAcqUcC10GcH6PK8g+bAxZjSJ5nU7NLcvO/6tVb
	tx4MWe9QridYFJf+g3QaVZnrKI0rsgSoGPpkHCih6E872K3D/NTQ/qSEhXgdP3b0FhYqcxA5njq
	KwO69Wrn4G5QVhxqek/zoaB6koy0vipoDMSLIoje4EQPIFtcLPZwsEA==
X-Google-Smtp-Source: AGHT+IFVhJVXs1UnSSIhLaMtG8uwdc3i+sqmZ5ZivzOR9x4tm0KSEE5lliZtWtRctkFNlouI6CE90w==
X-Received: by 2002:a05:600c:3546:b0:46e:33a6:46b2 with SMTP id 5b1f17b1804b1-46fa9a96a70mr17610385e9.12.1759915762221;
        Wed, 08 Oct 2025 02:29:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d6fb41sm28973635e9.17.2025.10.08.02.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:29:21 -0700 (PDT)
Message-ID: <66d85e70-efb8-4a45-9164-55b123691b70@tuxon.dev>
Date: Wed, 8 Oct 2025 12:29:20 +0300
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
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <c7fc31f1247332196516394a22f6feef9733a0b4.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Philipp,

On 10/8/25 11:34, Philipp Zabel wrote:
> Hi Claudiu,
> 
> On Do, 2025-09-25 at 13:02 +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On the Renesas RZ/G3S SoC, the USB PHY block has an input signal called
>> PWRRDY. This signal is managed by the system controller and must be
>> de-asserted after powering on the area where USB PHY resides and asserted
>> before powering it off.
>>
>> On power-on the USB PWRRDY signal need to be de-asserted before enabling
>> clock and switching the module to normal state (through MSTOP support). The
>> power-on configuration sequence
> 
> The wording makes me wonder, have you considered implementing this as a
> power sequencing driver?

No, haven't tried as power sequencing. At the moment this was started I
think the power sequencing support wasn't merged.

The approaches considered were:
a/ power domain
b/ regulator
c/ as a reference counted bit done through regmap read/writes APIs

a and b failed as a result of discussions in the previous posted versions.

c was abandoned by me after long discussions with Renesas HW team which
revealed the block schema b/w individual USB blocks (presented in the patch
description).

The point is that this bit doesn't actually power anything, at the moment
the bit is set, the power to USB is already applied. Software just need to
set the bit before/after setting the clocks and the associated MSTOP and
applying any USB specific settings. Each clock has an MSTOP associated and
the MSTOP is set though the clock driver when the clock is set.


> 
>> must be:
>>
>> 1/ PWRRDY=0
>> 2/ CLK_ON=1
>> 3/ MSTOP=0
>>
>> On power-off the configuration sequence should be:
>>
>> 1/ MSTOP=1
>> 2/ CLK_ON=0
>> 3/ PWRRDY=1
>>
>> The CLK_ON and MSTOP functionalities are controlled by clock drivers.
>>
>> After long discussions with the internal HW team, it has been confirmed
>> that the HW connection b/w USB PHY block, the USB channels, the system
>> controller, clock, MSTOP, PWRRDY signal is as follows:
>>
>>                                ┌──────────────────────────────┐
>>                                │                              │◄── CPG_CLKON_USB.CLK0_ON
>>                                │     USB CH0                  │
>> ┌──────────────────────────┐   │┌───────────────────────────┐ │◄── CPG_CLKON_USB.CLK2_ON
>> │                 ┌────────┐   ││host controller registers  │ │
>> │                 │        │   ││function controller registers│
>> │                 │ PHY0   │◄──┤└───────────────────────────┘ │
>> │     USB PHY     │        │   └────────────▲─────────────────┘
>> │                 └────────┘                │
>> │                          │    CPG_BUS_PERI_COM_MSTOP.MSTOP{6, 5}_ON
>> │┌──────────────┐ ┌────────┐
>> ││USHPHY control│ │        │
>> ││  registers   │ │ PHY1   │   ┌──────────────────────────────┐
>> │└──────────────┘ │        │◄──┤     USB CH1                  │
>> │                 └────────┘   │┌───────────────────────────┐ │◄── CPG_CLKON_USB.CLK1_ON
>> └─▲───────▲─────────▲──────┘   ││ host controller registers │ │
>>   │       │         │          │└───────────────────────────┘ │
>>   │       │         │          └────────────▲─────────────────┘
>>   │       │         │                       │
>>   │       │         │           CPG_BUS_PERI_COM_MSTOP.MSTOP7_ON
>>   │PWRRDY │         │
>>   │       │   CPG_CLK_ON_USB.CLK3_ON
>>   │       │
>>   │  CPG_BUS_PERI_COM_MSTOP.MSTOP4_ON
>>   │
>> ┌────┐
>> │SYSC│
>> └────┘
>>
>> where:
>> - CPG_CLKON_USB.CLK.CLKX_ON is the register bit controlling the clock X
>>   of different USB blocks, X in {0, 1, 2, 3}
>> - CPG_BUS_PERI_COM_MSTOP.MSTOPX_ON is the register bit controlling the
>>   MSTOP of different USB blocks, X in {4, 5, 6, 7}
>> - USB PHY is the USB PHY block exposing 2 ports, port0 and port1, used
>>   by the USB CH0, USB CH1
>> - SYSC is the system controller block controlling the PWRRDY signal
>> - USB CHx are individual USB block with host and function capabilities
>>   (USB CH0 have both host and function capabilities, USB CH1 has only
>>   host capabilities)
>>
>> The USBPHY control registers are controlled though the
>> reset-rzg2l-usbphy-ctrl driver. The USB PHY ports are controlled by
>> phy_rcar_gen3_usb2 (drivers/phy/renesas/phy-rcar-gen3-usb2.c file). The
>> USB PHY ports request resets from the reset-rzg2l-usbphy-ctrl driver.
>>
>> The connection b/w the system controller and the USB PHY CTRL driver is
>> implemented through the renesas,sysc-pwrrdy device tree property
>> proposed in this patch. This property specifies the register offset and the
>> bitmask required to control the PWRRDY signal.
>>
>> Since the USB PHY CTRL driver needs to be probed before any other
>> USB-specific driver on RZ/G3S, control of PWRRDY is passed exclusively
>> to it. This guarantees the correct configuration sequence between clocks,
>> MSTOP bits, and the PWRRDY bit. At the same time, changes are kept minimal
>> by avoiding modifications to the USB PHY driver to also handle the PWRRDY
>> itself.
>>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v7:
>> - used proper regmap update value on rzg2l_usbphy_ctrl_set_pwrrdy()
>>
>> Changes in v6:
>> - used syscon_regmap_lookup_by_phandle_args() to simplify the code
>> - collected tags
>>
>> Changes in v5:
>> - none
>>
>> Changes in v4:
>> - updated patch description
>> - updated rzg2l_usbphy_ctrl_pwrrdy_init() to map directly the
>>   "renesas,sysc-pwrrdy" as the SYSC signal abstraction was dropped
>>   in this version, along with rz_sysc_get_signal_map()
>> - dropped priv member of rzg2l_usbphy_ctrl_pwrrdy_init() as it is
>>   not needed in this version
>> - shift left !power_on with pwrrdy->mask as this is how the
>>   regmap_update_bits() needs the last member to be
>> - selected MFD_SYSCON
>>
>> Changes in v3:
>> - none; this patch is new
>>
>>
>>  drivers/reset/Kconfig                   |  1 +
>>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 62 +++++++++++++++++++++++++
>>  2 files changed, 63 insertions(+)
>>
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 78b7078478d4..329730cbcfb9 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -237,6 +237,7 @@ config RESET_RASPBERRYPI
>>  config RESET_RZG2L_USBPHY_CTRL
>>  	tristate "Renesas RZ/G2L USBPHY control driver"
>>  	depends on ARCH_RZG2L || COMPILE_TEST
>> +	select MFD_SYSCON
>>  	help
>>  	  Support for USBPHY Control found on RZ/G2L family. It mainly
>>  	  controls reset and power down of the USB/PHY.
>> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
>> index 8a7f167e405e..be315199e2b0 100644
>> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
>> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/regmap.h>
>>  #include <linux/reset.h>
>>  #include <linux/reset-controller.h>
>> +#include <linux/mfd/syscon.h>
>>  
>>  #define RESET			0x000
>>  #define VBENCTL			0x03c
>> @@ -41,6 +42,18 @@ struct rzg2l_usbphy_ctrl_priv {
>>  
>>  #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
>>  
>> +/**
>> + * struct rzg2l_usbphy_ctrl_pwrrdy - SYSC PWRRDY signal descriptor
>> + * @regmap: SYSC regmap
>> + * @offset: offset into the SYSC address space for accessing PWRRDY
>> + * @mask: mask into the register at offset for accessing PWRRDY
>> + */
>> +struct rzg2l_usbphy_ctrl_pwrrdy {
>> +	struct regmap *regmap;
>> +	u32 offset;
>> +	u32 mask;
>> +};
>> +
>>  static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
>>  				    unsigned long id)
>>  {
>> @@ -91,6 +104,8 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
>>  	return !!(readl(priv->base + RESET) & port_mask);
>>  }
>>  
>> +#define RZG2L_USBPHY_CTRL_PWRRDY	1
>> +
>>  static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
>>  	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
>>  	{ /* Sentinel */ }
>> @@ -110,6 +125,49 @@ static const struct regmap_config rzg2l_usb_regconf = {
>>  	.max_register = 1,
>>  };
>>  
>> +static void rzg2l_usbphy_ctrl_set_pwrrdy(struct rzg2l_usbphy_ctrl_pwrrdy *pwrrdy,
>> +					 bool power_on)
>> +{
>> +	u32 val = (!power_on << (ffs(pwrrdy->mask) - 1)) & pwrrdy->mask;
> 
> 
> Why not just:
> 
> 	u32 val = power_on ? 0 : pwrrdy->mask;

This would work as well. I wanted to be sure it doesn't fail in case the
mask is more than one bit (as it comes from device tree).

> 
> You could simplify this further by using a regmap_field instead of
> rzg2l_usbphy_ctrl_pwrrdy.

I'll look to it. I wasn't aware of regmap_field :)

> 
>> +
>> +	regmap_update_bits(pwrrdy->regmap, pwrrdy->offset, pwrrdy->mask, val);
>> +}
>> +
>> +static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
>> +{
>> +	rzg2l_usbphy_ctrl_set_pwrrdy(data, false);
>> +}
>> +
>> +static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
>> +{
>> +	struct rzg2l_usbphy_ctrl_pwrrdy *pwrrdy;
>> +	struct regmap *regmap;
>> +	const int *data;
>> +	u32 args[2];
>> +
>> +	data = device_get_match_data(dev);
>> +	if (data != (int *)RZG2L_USBPHY_CTRL_PWRRDY)
> 
> Better not to compare pointers here:
> 
> 	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)

OK

> 
>> +		return 0;
>> +
>> +	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
>> +						      "renesas,sysc-pwrrdy",
>> +						      ARRAY_SIZE(args), args);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	pwrrdy = devm_kzalloc(dev, sizeof(*pwrrdy), GFP_KERNEL);
>> +	if (!pwrrdy)
>> +		return -ENOMEM;
>> +
>> +	pwrrdy->regmap = regmap;
>> +	pwrrdy->offset = args[0];
>> +	pwrrdy->mask = args[1];
>> +
>> +	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
>> +
>> +	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrrdy);
>> +}
> 
> So we deassert PWRRDY on probe and assert on remove. What about
> suspend/resume ordering?

As this driver has no suspend/resume support yet, my intention was to take
care of this bit on suspend/resume after it will be established how it is
handled on probe/remove. Adding suspend/resume support to this series will
make it bigger.

Thank you for your review,
Claudiu

