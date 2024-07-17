Return-Path: <linux-renesas-soc+bounces-7391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9062D933905
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 10:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21F31C2089F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2024 08:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A982E859;
	Wed, 17 Jul 2024 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CRcqOjr+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815062033A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jul 2024 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721205086; cv=none; b=F4yn21ewy1577MnCGrygZGmHrAvBvrUgUIa5JUWDW3PMzsYv3TsdfG3kwvC+UKF6g/pYQiN9DlAwB8bLrm40CWzghMvPF+Pm4ANs082Rb2WvFGf9mwNBEtZql2YPr2OA4hmAyTGY8n1P29NQs7JIiB/EP8PTc2hkXcKaNMubLW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721205086; c=relaxed/simple;
	bh=WbzApNOLjNOdU1YCDYNMQErxOCTVZd8bojWaaykHLx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvz6b1j4FQX/Hi7KoYP0l+O4saEp4ZpDTYKEXxhBHkmB0FIXAA6+ui8JmDMr//5CXODHEACoyvci7UpcjzEWIUpSRO+1UD7wlFtLajbInYNeGh2v9mZDnioBnx7jspaAf+ocb1s059TT4Dcl/fZoO52WlMnO0bIxcCBC39eWel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CRcqOjr+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42793fc0a6dso44230635e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jul 2024 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721205083; x=1721809883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odTbO9u7AyhS8xreJluNKyj0ekqxabepcpFkDx/pdXM=;
        b=CRcqOjr+SXR7Qfot9mmHcCgFX83TQbFkUnfzYNGArIFhfSk/tcZgqK0jzpDMGnrVOa
         0atK4aMPnr6evmf7A1AsmpwqgNA69PWkzoXM0PqvvRNEK/mJoNg/WfufNVPRcFw0/St7
         CnlO4PheyqerrK8IsRQqgL0sbtqR6pY1kzrlx4voUmQKzJxHmR2UttFNx90yQwZjTJVY
         ftbIrmNTvQIO+06OF+o/8N8BnR7vMpLY5zB6JtG0j6H2+IWVh0AGqWR3jN6Cv4E/4gU5
         LZN57odQeUZ6oJLL0jjIZoXxsH0Q7l336aFZ9mRZSNvUhnnaUiItCsTdLks6/0dUuYFg
         Zt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721205083; x=1721809883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odTbO9u7AyhS8xreJluNKyj0ekqxabepcpFkDx/pdXM=;
        b=agqCEJpyzGESaMqj4how1ZeanoD5Aev3f+UKqZE21ZKppVFVhQgdDd6I25uQO/Q9MZ
         N8Qq5DE35EFseyd7UGlHQAwsGhMW+qrOLDsGED+iHDWNhhyhYzBT0EvJCIbIriUFOpxP
         NE00XNYibb+uEOeViWr3e39fIW0qrI9UL0/b+RGYyPt/y50uAU/jDvfCXB+8FZuPjR4E
         So3RroEeh1MHglHX57e8UNxxlFcEvhQGTCqGOlEMDjCJB6aEJ9EfgpXnn/AX/s8KDtCL
         QDmDctiJw1p9PEEWvoiVpsiKC5cUda13VcwkvKoGv2Mx9Ep3mCrWJgl89hWymgje48bk
         rSCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4kSvY+/1UE+ikAX5M2UsYpOWHi9T91OnA4qnT637/E6T9BIkfYElPjcwTrfndoV2eTksXJckCdlC7u2Xg7c92UcHyyT6uG1Hp9wWUyBSVOGA=
X-Gm-Message-State: AOJu0YwXYg07U7y0RvjOEO1+zSyR2xjt86DXF6MKRp2t9qc0aGFu1Yh5
	U5gIvqz3OTpJ1QgMlYoasAW7jnznEZpsBnXU+gUKH5wptkwjXvcI/LBnd/Poju4=
X-Google-Smtp-Source: AGHT+IFxAFyo8cL/V89UtkMiApuS4cDBAYaqIrX7GtE+oWaOkWacfHj+o5WDxnzLrAffsH1ZbEmYMw==
X-Received: by 2002:a05:600c:1f0e:b0:426:60e4:c691 with SMTP id 5b1f17b1804b1-427c2cb36b1mr6643635e9.11.1721205082759;
        Wed, 17 Jul 2024 01:31:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f27846bsm196825965e9.25.2024.07.17.01.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 01:31:22 -0700 (PDT)
Message-ID: <e3103f07-ce8a-4c34-af5c-bb271c7ec99a@tuxon.dev>
Date: Wed, 17 Jul 2024 11:31:20 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, alexandre.belloni@bootlin.com,
 conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org,
 lee@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240716103025.1198495-4-claudiu.beznea.uj@bp.renesas.com>
 <2abcd440664067d95b1ac0e765ad55a3.sboyd@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <2abcd440664067d95b1ac0e765ad55a3.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Stephen,

On 17.07.2024 01:28, Stephen Boyd wrote:
> Quoting Claudiu (2024-07-16 03:30:17)
>> diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/clk-vbattb.c
>> new file mode 100644
>> index 000000000000..8effe141fc0b
>> --- /dev/null
>> +++ b/drivers/clk/renesas/clk-vbattb.c
>> @@ -0,0 +1,212 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * VBATTB clock driver
>> + *
>> + * Copyright (C) 2024 Renesas Electronics Corp.
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/clk.h>
> 
> Prefer clk providers to not be clk consumers.

I added it here to be able to use devm_clk_get_optional() as it was
proposed to me in v1 to avoid adding a new binding for bypass and detect if
it's needed by checking the input clock name.


> 
>> +#include <linux/clk-provider.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
> 
> Is of_platform.h used?
> 
> Include mod_devicetable.h for of_device_id.

Ok.

> 
>> +#include <linux/platform_device.h>
>> +
>> +#define VBATTB_BKSCCR                  0x0
>> +#define VBATTB_BKSCCR_SOSEL            BIT(6)
>> +#define VBATTB_SOSCCR2                 0x8
>> +#define VBATTB_SOSCCR2_SOSTP2          BIT(0)
> [..]
>> +
>> +static int vbattb_clk_probe(struct platform_device *pdev)
>> +{
>> +       struct device_node *np = pdev->dev.of_node;
>> +       struct clk_parent_data parent_data = {};
>> +       struct device *dev = &pdev->dev;
>> +       struct clk_init_data init = {};
>> +       struct vbattb_clk *vbclk;
>> +       u32 load_capacitance;
>> +       struct clk_hw *hw;
>> +       int ret, bypass;
>> +
>> +       vbclk = devm_kzalloc(dev, sizeof(*vbclk), GFP_KERNEL);
>> +       if (!vbclk)
>> +               return -ENOMEM;
>> +
>> +       vbclk->base = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(vbclk->base))
>> +               return PTR_ERR(vbclk->base);
>> +
>> +       bypass = vbattb_clk_need_bypass(dev);
> 
> This is a tri-state bool :(
> 
>> +       if (bypass < 0) {
>> +               return bypass;
>> +       } else if (bypass) {
>> +               parent_data.fw_name = "clkin";
>> +               bypass = VBATTB_BKSCCR_SOSEL;
> 
> And now it is a mask value.
> 
>> +       } else {
>> +               parent_data.fw_name = "xin";
>> +       }
>> +
>> +       ret = of_property_read_u32(np, "renesas,vbattb-load-nanofarads", &load_capacitance);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = vbattb_clk_validate_load_capacitance(vbclk, load_capacitance);
>> +       if (ret)
>> +               return ret;
>> +
>> +       vbattb_clk_update_bits(vbclk->base, VBATTB_BKSCCR, VBATTB_BKSCCR_SOSEL, bypass);
> 
> Please don't overload 'bypass'. Use two variables or a conditional.

OK.

> 
> I also wonder if this is really a mux, 

It's a way to determine what type of clock (crystal oscillator or device
clock) is connected to RTXIN/RTXOUT pins of the module
(the module block diagram at [1]) based on the clock name. Depending on the
type of the clock connected to RTXIN/RTXOUT we need to select the XC or
XBYP as input for the mux at [1].

[1] https://gcdnb.pbrd.co/images/QYsCvhfQlX6n.png


> and either assigned-clock-parents should be used, 
> or the clk_ops should have an init routine that looks at
> which parent is present by determining the index and then use that to
> set the mux. The framework can take care of failing to set the other
> parent when it isn't present.


On the board, at any moment, it will be only one clock as input to the
VBATTB clock (either crystal oscillator or a clock device). If I'm getting
you correctly, this will involve describing both clocks in some scenarios.

E.g. if want to use crystal osc, I can use this DT description:

vbattclk: clock-controller@1c {
	compatible = "renesas,r9a08g045-vbattb-clk";
	reg = <0 0x1c 0 0x10>;
	clocks = <&vbattb_xtal>;
	clock-names = "xin";
	#clock-cells = <0>;
	status = "disabled";
};

vbattb_xtal: vbattb-xtal {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-frequency = <32768>;
};

If external clock device is to be used, I should describe a fake clock too:

vbattclk: clock-controller@1c {
	compatible = "renesas,r9a08g045-vbattb-clk";
	reg = <0 0x1c 0 0x10>;
	clocks = <&vbattb_xtal>, <&ext_clk>;
	clock-names = "xin", "clkin";
	#clock-cells = <0>;
	status = "disabled";
};

vbattb_xtal: vbattb-xtal {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-frequency = <0>;
};

ext_clk: ext-clk {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-frequency = <32768>;
};

Is this what you are suggesting?


> 
>> +
>> +       spin_lock_init(&vbclk->lock);
>> +
>> +       init.name = "vbattclk";
>> +       init.ops = &vbattb_clk_ops;
>> +       init.parent_data = &parent_data;
>> +       init.num_parents = 1;
>> +       init.flags = 0;
>> +
>> +       vbclk->hw.init = &init;
>> +       hw = &vbclk->hw;
>> +
>> +       ret = devm_clk_hw_register(dev, hw);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return of_clk_add_hw_provider(np, of_clk_hw_simple_get, hw);
>> +}
>> +
>> +static const struct of_device_id vbattb_clk_match[] = {
>> +       { .compatible = "renesas,r9a08g045-vbattb-clk" },
>> +       { /* sentinel */ }
>> +};
> 
> Any MODULE_DEVICE_TABLE?

I failed to added it.

Thank you for your review,
Claudiu Beznea

