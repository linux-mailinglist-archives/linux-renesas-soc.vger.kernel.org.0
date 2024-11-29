Return-Path: <linux-renesas-soc+bounces-10759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B7D9DC0CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 09:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67762282117
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 08:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E78F17A58C;
	Fri, 29 Nov 2024 08:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NK8eZdsA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AAD176FB6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Nov 2024 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732870125; cv=none; b=aSRERlBCJHbtvcZmFIIyxCwWPUQB0wF1d2ney6QVdHJSDbuyxkBPE+fklhkn+UHxnmj6Ra64KSyvOfhsYuQPQtnHZYxkF6qtV7e5KizRY2Wt/E9jdVf9Nh1lJV/o1IIUrdyWJ+haUUfl7TN4ZKbcYiKMuCRhoZp3t6PT7jLumm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732870125; c=relaxed/simple;
	bh=A/Ieu612X5VBXK0dP//wDTEnDsl0CWq1frDOz0M0XCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+EAkDI8Oxu5Jv9ORcDUVDSGxvX7lSYMDVp27zBAl1Ch8QVMKIcxHGymtGQMPKGFb4fx+qEoJu1Cv5pxRocjC6XFGt+qjav6Df55+xiS3YZVQ338C4UnpzK0NLmDhAG+2L7eZsCDg2ECTGwkb2DTnM/X8OPzSzPfJDgfUD9mnjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NK8eZdsA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43494a20379so14791045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Nov 2024 00:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732870121; x=1733474921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PkQyuhys7G1VNXO6ofg16FC0sS07Akwiu7JTGVbtJ8=;
        b=NK8eZdsALaQ7cvAFaoMhwZPD4q9MxBLQyEhBDSCw9QMMPpNqPzbEAOYqN0MwqFN4hg
         QKnK85+FJgse+shHo4wuYK9LJvt1IjyA2zsmZdL6FWx0NIGaL17mZ/zaVCmTZof/rY7a
         31WTheYDel3hpLxWvxVylbmLhsDo4+jmXOW4QpK2nbsl9WTlBIq43y+FbNGT8zYZ0guc
         aJuMub4RiN+uQZorje8xLYomoZZR3aOT2+12MKRVfwfu8jrE3zcxBM7bxYoqJfFfP1PD
         5rPFMLvJ1QwjvimkhlhhCD/9YIw2qloG+gF2jF6YxV1lHYCH7X6myJZfzhBnH4YaLeFl
         AHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732870121; x=1733474921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PkQyuhys7G1VNXO6ofg16FC0sS07Akwiu7JTGVbtJ8=;
        b=N29m8Q9M2iKjGfci06gi70WIwbnWr9M+OWLT8vBrJByt8+Yn1LGfoEqnrEi2DDQ8Ec
         jGBRnfPgDSf3ey23oNEnUHHSDer71Qo3UHBv8garykwvmFr9m6s52ruX402S2zIjzSNv
         DDypsnaBuLwKbFfV+aXRP7LsV99NUNIudsLEVITVkepeQr36bHpSkpy7sjrwxpoUk6Qj
         nrw1pJpYKu9ntdTJdq+YHhMD+i5vfRKWvxeaTqGrE5Lc2KsVsHLPfO1uPB2BJTcNwYkm
         HjLnxPDBn6XTmiGq2AvOJ/gr5xovvSw1i9b458B7hKGVxAZTStns0v/XsoB/YP9lS4Y8
         eyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJmJs15pRUHBGtF09k8zbeHSL4kkmgEv5bbyNWCv2R65GYihBTEmDs/u6LkXssCdkV0TgoxKr8a5xRKXQRXR+g1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxazB2SX8E+N52Hvv3ilLE3b5aOtcNuH8GM0Jtb8oT8gLd8GQEH
	tRbtc6vjFDc5ltWBJM1SIbS2QfDxaXLIqz5omBetFeEaL5H8P6rmlevrhoazNaw=
X-Gm-Gg: ASbGncvTNNRTHiI14yKC72p/wyXA787xroc9HGAy0wnY4e+qOowwxC/TWn4j5WKLwVe
	PkP/sKOxb+XCiMMgSkuSlYYQnsl9OeNoVBRWizxBhL7G3BCGYAfcRgcE15WJhLzk8LWip8aQIJK
	LhHuD2oVaRQOTTN+H/CCfAnvA6BBdFSzAoEHKW4AB5ZQr54u0K11mMRf2rHIF0aUt4YNBxZWrLn
	in11dl4qnV287xl21Uqa7RSxvS12hx+j2sel6h24OGaGSb980z6hF0FuA==
X-Google-Smtp-Source: AGHT+IHOrdw05njzpGOyCesmp5YA3v4j4ngUQt/RUP7bLsFXyj13G3qk8T1q/D5WDxY5zb5XKDBk4A==
X-Received: by 2002:a05:600c:1d18:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-434a9dbbcc7mr100701195e9.4.1732870119927;
        Fri, 29 Nov 2024 00:48:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70cb2sm45550775e9.37.2024.11.29.00.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 00:48:39 -0800 (PST)
Message-ID: <32fa7eb8-2139-454c-8866-cb264d060616@tuxon.dev>
Date: Fri, 29 Nov 2024 10:48:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ
 family
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com,
 gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com,
 christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUvmTQeQXxhsXtj23-OS=aL3UgsyOtnawdmnusrEJ2JQw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUvmTQeQXxhsXtj23-OS=aL3UgsyOtnawdmnusrEJ2JQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 28.11.2024 17:24, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> Thanks for your patch!
> 
> On Tue, Nov 26, 2024 at 10:21 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZ/G3S system controller (SYSC) has various registers that control
>> signals specific to individual IPs. IP drivers must control these signals
>> at different configuration phases.
>>
>> Add SYSC driver that allows individual SYSC consumers to control these
>> signals. The SYSC driver exports a syscon regmap enabling IP drivers to
>> use a specific SYSC offset and mask from the device tree, which can then be
>> accessed through regmap_update_bits().
>>
>> Currently, the SYSC driver provides control to the USB PWRRDY signal, which
>> is routed to the USB PHY. This signal needs to be managed before or after
>> powering the USB PHY off or on.
>>
>> Other SYSC signals candidates (as exposed in the the hardware manual of the
> 
> s/the the/the/
> 
>> RZ/G3S SoC) include:
>>
>> * PCIe:
>> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
>> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
>>   register
>> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
>>
>> * SPI:
>> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
>>   register
>>
>> * I2C/I3C:
>> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
>>   (x=0..3)
>> - af_bypass I3C signal controlled through SYS_I3C_CFG register
>>
>> * Ethernet:
>> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
>>   registers (x=0..1)
>>
>> As different Renesas RZ SoC shares most of the SYSC functionalities
>> available on the RZ/G3S SoC, the driver if formed of a SYSC core
>> part and a SoC specific part allowing individual SYSC SoC to provide
>> functionalities to the SYSC core.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>> --- /dev/null
>> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
>> @@ -0,0 +1,31 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * RZ/G3S System controller driver
>> + *
>> + * Copyright (C) 2024 Renesas Electronics Corp.
>> + */
>> +
>> +#include <linux/array_size.h>
>> +#include <linux/bits.h>
>> +#include <linux/init.h>
>> +
>> +#include "rz-sysc.h"
>> +
>> +#define SYS_USB_PWRRDY         0xd70
>> +#define SYS_USB_PWRRDY_PWRRDY_N        BIT(0)
>> +#define SYS_MAX_REG            0xe20
>> +
>> +static const struct rz_sysc_signal_init_data rzg3s_sysc_signals_init_data[] __initconst = {
> 
> This is marked __initconst...
> 
>> +       {
>> +               .name = "usb-pwrrdy",
>> +               .offset = SYS_USB_PWRRDY,
>> +               .mask = SYS_USB_PWRRDY_PWRRDY_N,
>> +               .refcnt_incr_val = 0
>> +       }
>> +};
>> +
>> +const struct rz_sysc_init_data rzg3s_sysc_init_data = {
> 
> ... but this is not __init, causing a section mismatch.

Do you know if there is a way to detect this?

> 
>> +       .signals_init_data = rzg3s_sysc_signals_init_data,
>> +       .num_signals = ARRAY_SIZE(rzg3s_sysc_signals_init_data),
>> +       .max_register_offset = SYS_MAX_REG,
>> +};
> 
>> --- /dev/null
>> +++ b/drivers/soc/renesas/rz-sysc.c
> 
>> +/**
>> + * struct rz_sysc - RZ SYSC private data structure
>> + * @base: SYSC base address
>> + * @dev: SYSC device pointer
>> + * @signals: SYSC signals
>> + * @num_signals: number of SYSC signals
>> + */
>> +struct rz_sysc {
>> +       void __iomem *base;
>> +       struct device *dev;
>> +       struct rz_sysc_signal *signals;
>> +       u8 num_signals;
> 
> You could change signals to a flexible array at the end, tag it with
> __counted_by(num_signals), and allocate space for both struct rz_sysc
> and the signals array using struct_size(), reducing the number of
> allocations.

I'll look into this.

> 
>> +};
> 
>> +static struct rz_sysc_signal *rz_sysc_off_to_signal(struct rz_sysc *sysc, unsigned int offset,
>> +                                                   unsigned int mask)
>> +{
>> +       struct rz_sysc_signal *signals = sysc->signals;
>> +
>> +       for (u32 i = 0; i < sysc->num_signals; i++) {
> 
> s/u32/unsigned int/
> 
>> +               if (signals[i].init_data->offset != offset)
>> +                       continue;
>> +
>> +               /*
>> +                * In case mask == 0 we just return the signal data w/o checking the mask.
>> +                * This is useful when calling through rz_sysc_reg_write() to check
>> +                * if the requested setting is for a mapped signal or not.
>> +                */
>> +               if (mask) {
>> +                       if (signals[i].init_data->mask == mask)
>> +                               return &signals[i];
>> +               } else {
>> +                       return &signals[i];
>> +               }
> 
> if (!mask || signals[i].init_data->mask == mask)
>         return &signals[i];

Looks better, indeed!

> 
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +static int rz_sysc_reg_update_bits(void *context, unsigned int off,
>> +                                  unsigned int mask, unsigned int val)
>> +{
>> +       struct rz_sysc *sysc = context;
>> +       struct rz_sysc_signal *signal;
>> +       bool update = false;
>> +
>> +       signal = rz_sysc_off_to_signal(sysc, off, mask);
>> +       if (signal) {
>> +               if (signal->init_data->refcnt_incr_val == val) {
>> +                       if (!refcount_read(&signal->refcnt)) {
>> +                               refcount_set(&signal->refcnt, 1);
>> +                               update = true;
>> +                       } else {
>> +                               refcount_inc(&signal->refcnt);
>> +                       }
>> +               } else {
>> +                       update = refcount_dec_and_test(&signal->refcnt);
>> +               }
>> +       } else {
>> +               update = true;
>> +       }
> 
> You could reduce indentation/number of lines by reordering the logic:
> 
>     if (!signal) {
>             update = true;
>     } else if (signal->init_data->refcnt_incr_val != val) {
>             update = refcount_dec_and_test(&signal->refcnt);
>     } else if (!refcount_read(&signal->refcnt)) {
>             refcount_set(&signal->refcnt, 1);
>             update = true;
>     } else {
>             refcount_inc(&signal->refcnt);
>     }

Looks better, indeed!

> 
>> +
>> +       if (update) {
>> +               u32 tmp;
>> +
>> +               tmp = readl(sysc->base + off);
>> +               tmp &= ~mask;
>> +               tmp |= val & mask;
>> +               writel(tmp, sysc->base + off);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int rz_sysc_reg_write(void *context, unsigned int off, unsigned int val)
>> +{
>> +       struct rz_sysc *sysc = context;
>> +       struct rz_sysc_signal *signal;
>> +
>> +       /*
>> +        * Force using regmap_update_bits() for signals to have reference counter
>> +        * per individual signal in case there are multiple signals controlled
>> +        * through the same register.
>> +        */
>> +       signal = rz_sysc_off_to_signal(sysc, off, 0);
>> +       if (signal) {
>> +               dev_err(sysc->dev,
>> +                       "regmap_write() not allowed on register controlling a signal. Use regmap_update_bits()!");
>> +               return -EOPNOTSUPP;
>> +       }
>> +
> 
> Can you ever get here, given rz_sysc_writeable_reg() below would have
> returned false? 

Yes, in case the user wants to access a register having a signal associated.

If user does this:

regmap_write(regmap, signal_offset, value);

The rz_sysc_writeable_reg() returns true (as it checks only the signal
offset but not the mask) and the rz_sysc_reg_write() reach this point. If
we allow it to continue we can break reference counting for the existing
implemented signals, or, if there are multiple signals handled thorough the
same register, we can break other signals.

> If not, is there any point in having this function?

I chose to have it for (currently unexisting) other use cases of the syscon
+ regmap exported by this driver. For the moment, it is not necessary,
indeed. I can drop it if you prefer.

> 
>> +       writel(val, sysc->base + off);
>> +
>> +       return 0;
>> +}
>> +
>> +static bool rz_sysc_writeable_reg(struct device *dev, unsigned int off)
>> +{
>> +       struct rz_sysc *sysc = dev_get_drvdata(dev);
>> +       struct rz_sysc_signal *signal;
>> +
>> +       /* Any register containing a signal is writeable. */
>> +       signal = rz_sysc_off_to_signal(sysc, off, 0);
>> +       if (signal)
>> +               return true;
>> +
>> +       return false;
>> +}
> 
>> +static int rz_sysc_signals_show(struct seq_file *s, void *what)
>> +{
>> +       struct rz_sysc *sysc = s->private;
>> +
>> +       seq_printf(s, "%-20s Enable count\n", "Signal");
>> +       seq_printf(s, "%-20s ------------\n", "--------------------");
>> +
>> +       for (u8 i = 0; i < sysc->num_signals; i++) {
>> +               seq_printf(s, "%-20s %d\n", sysc->signals[i].init_data->name,
>> +                          refcount_read(&sysc->signals[i].refcnt));
>> +       }
>> +
>> +       return 0;
>> +}
>> +DEFINE_SHOW_ATTRIBUTE(rz_sysc_signals);
> 
> What is the use-case for this? Just (initial) debugging?

Only debugging.

> 
>> +
>> +static void rz_sysc_debugfs_remove(void *data)
>> +{
>> +       debugfs_remove_recursive(data);
>> +}
>> +
>> +static int rz_sysc_signals_init(struct rz_sysc *sysc,
>> +                               const struct rz_sysc_signal_init_data *init_data,
>> +                               u32 num_signals)
>> +{
>> +       struct dentry *root;
>> +       int ret;
>> +
>> +       sysc->signals = devm_kcalloc(sysc->dev, num_signals, sizeof(*sysc->signals),
>> +                                    GFP_KERNEL);
>> +       if (!sysc->signals)
>> +               return -ENOMEM;
>> +
>> +       for (u32 i = 0; i < num_signals; i++) {
> 
> unsigned int
> 
>> +               struct rz_sysc_signal_init_data *id;
>> +
>> +               id = devm_kzalloc(sysc->dev, sizeof(*id), GFP_KERNEL);
>> +               if (!id)
>> +                       return -ENOMEM;
>> +
>> +               id->name = devm_kstrdup(sysc->dev, init_data->name, GFP_KERNEL);
>> +               if (!id->name)
>> +                       return -ENOMEM;
>> +
>> +               id->offset = init_data->offset;
>> +               id->mask = init_data->mask;
>> +               id->refcnt_incr_val = init_data->refcnt_incr_val;
>> +
>> +               sysc->signals[i].init_data = id;
>> +               refcount_set(&sysc->signals[i].refcnt, 0);
>> +       }
>> +
>> +       sysc->num_signals = num_signals;
>> +
>> +       root = debugfs_create_dir("renesas-rz-sysc", NULL);
>> +       ret = devm_add_action_or_reset(sysc->dev, rz_sysc_debugfs_remove, root);
>> +       if (ret)
>> +               return ret;
>> +       debugfs_create_file("signals", 0444, root, sysc, &rz_sysc_signals_fops);
>> +
>> +       return 0;
>> +}
> 
>> --- /dev/null
>> +++ b/drivers/soc/renesas/rz-sysc.h
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Renesas RZ System Controller
>> + *
>> + * Copyright (C) 2024 Renesas Electronics Corp.
>> + */
>> +
>> +#ifndef __SOC_RENESAS_RZ_SYSC_H__
>> +#define __SOC_RENESAS_RZ_SYSC_H__
>> +
>> +#include <linux/refcount.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct rz_sysc_signal_init_data - RZ SYSC signals init data
>> + * @name: signal name
>> + * @offset: register offset controling this signal
>> + * @mask: bitmask in register specific to this signal
>> + * @refcnt_incr_val: increment refcnt when setting this value
>> + */
>> +struct rz_sysc_signal_init_data {
>> +       const char *name;
>> +       u32 offset;
>> +       u32 mask;
>> +       u32 refcnt_incr_val;
>> +};
>> +
>> +/**
>> + * struct rz_sysc_signal - RZ SYSC signals
>> + * @init_data: signals initialization data
>> + * @refcnt: reference counter
>> + */
>> +struct rz_sysc_signal {
>> +       const struct rz_sysc_signal_init_data *init_data;
> 
> Can't you just embed struct rz_sysc_signal_init_data?

Meaning to have directly the members of struct rz_sysc_signal_init_data
here or to drop the const qualifier along with __initconst on
rzg3s_sysc_signals_init_data[]  and re-use the platfom data w/o allocate
new memory?

Thank you for your review,
Claudiu


> That way you could allocate the rz_sysc_signal and
> rz_sysc_signal_init_data structures in a single allocation.
> 
>> +       refcount_t refcnt;
>> +};
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

