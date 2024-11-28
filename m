Return-Path: <linux-renesas-soc+bounces-10755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D7D9DBA73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 16:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DD00B206B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 15:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087111B85D3;
	Thu, 28 Nov 2024 15:24:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A0847B;
	Thu, 28 Nov 2024 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807486; cv=none; b=ipZzucYIS0r6A+2ztT9sF12DL5rTDL5U7DrNgVB1HMuaFG6ii8RLucncmTp+4N1d2hGMldGXVEfPIH4nmEEFf+iDPskC8yquRj1o62CJO0WPzIXNgbMGLqtVPEs1gdWP+BF+PlNeUCQxj7fpLmtCL2i8G84XQf+JwbT3QDJho0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807486; c=relaxed/simple;
	bh=3ovcNO+H467fYtG/ZtWHRJGoNwJiT3rEW9Ri3EM4jZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arqXsufc4yoahuB1ktZVJBiNzaEiQbS14L80aIKRnFl/NL/XXXOd2hLaR9Q9nv3YWClLDwiD/BiIwZWIuPO1qhC0LJeyMPTnQzJ+076iTc3tj8m8IMAjLbh0Ex68DLfu6EdcF0O4sGW6/0lyunCfQWY76rkZ1UnS8MwqU7LtwcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6eebae6f013so10867537b3.0;
        Thu, 28 Nov 2024 07:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807483; x=1733412283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMC+Y9JuRtxGshUE5GtedzEOjkDfE7uG8aVt6EbRvFg=;
        b=A/xtmfvt+VCIBrxg00YIUb/Ar7F8Nwi63W6iGZXRHF3r73jRqArksaqDS+hX24N3Hx
         xnMMcmKfZif55RtpHBcByS4MSkWgcU+Bl8ofbGe8vbLXMHPLGR6a0k3Bz+cCSsXpIEpJ
         ZKfnyPFmbLo+vBMRwzovLexK9g/aaZrL+5HusXHq4V33g0GCCAgMWcEpkYgql3+Zmyoa
         oDxXl+moev1wJqqIXJLW/lFWwPU7fH429gUog0YpNVR8cUcxhY6e90j3f2assMtw2TU9
         Y6bKNNCL3SYGvnd96kLexk4P7y1xkzf9Pb+765sZ242HMeV9zvIa1LzGRtP3blLqd71P
         R0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8clRKX88pGxxhTERn9SwAbfsXNHn0lXpaIwwqHEECzGuP3rCnB59vbRQsdxXI2tDsRVe+zd+zeMwF@vger.kernel.org, AJvYcCUAW0/Dwej7cx8JuvtyLe4fsPRSk+vJEbTy1Lke7RcYxTAryg1nbR/DWt5F/c8L7KNdd9HgZA76x4OE@vger.kernel.org, AJvYcCV12nDMaPV097faGgKX8PJb33iYfFjdWdqyPuL/E57u+DTg61rF15pRGE4n5FBFlO8nZ5abpMvTuFq94S7X@vger.kernel.org, AJvYcCVi3kJfB21IYsMsUy+G3XAl9XtB308ri3yBuARK4OTHF+5xa4Wbp1jeM828R0m9UOlPeV8iU+4eTaewO+XGgdfJJTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xxfwYsbRBIJhRZl8XokoQ5K4zGYIcbl9grCW7ylXDMoxray2
	tw2LrfVoT1m2OtSxVEK2JtqrdBhF090NN+Y2S4C2Rn+a1UtNPgeAuTwGMM/tOiY=
X-Gm-Gg: ASbGnctws7IXftpdT1Y11y6c38cpU+wcsdySjT7Hb4FmKYRJoXwJHatDI7AY8SOIJ+A
	jz6LhgBCZKUK4ang5bXx7W1iq/DZr6ab0mpk3QZ1I667osS+Xvbdl6E69S3MFL6HihUS0jl+5mu
	AMTDYlxRZqx2U7vZJn6unWK8CVOrxL/otga6P7IotjVWqOIxkbA3tnB1WBifTpP+nrJP1OtFbnn
	U3RgNppFU7tmap92uHv8TvXH6m5eeGjuvKwy9mEpsfUMaD/ESCzufAj06mQ1lFs5xfMAfy5Y6Dm
	iOGSS7MqeBcT9CVM
X-Google-Smtp-Source: AGHT+IHw9ux3A4LTveT7mp5991xdeQG6HxSL0UA0rEOPMjP0qdMJBk0bM/ufcVfa3aIbgDi+HhaZpw==
X-Received: by 2002:a05:690c:6084:b0:6e3:323f:d8fb with SMTP id 00721157ae682-6ef371fc30amr87312637b3.14.1732807482843;
        Thu, 28 Nov 2024 07:24:42 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ef4ddb64d9sm3525227b3.105.2024.11.28.07.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 07:24:39 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6eeca160f14so10384157b3.2;
        Thu, 28 Nov 2024 07:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWG6FV7e9oUjOMfL06zrBEvjAVeOFs+m5LfI03pbCLTWRjr73gJ2lixU7ulznRJRO0MK+yffWPwNr1xVa93A4Km61A=@vger.kernel.org, AJvYcCWR+ijSIVe85odahagMCbXIP9DqSYtDMYxbT+aU9ZDthY55IwRwVhP3C/+jB8geOntj8nYeBSDjxMJY@vger.kernel.org, AJvYcCXVEvcV5nrbIP8ToM83rzg8HII7MkT2/ZvHMOtdaR4mpgWOnPF9mPVndvgyFcpqXe3QRWpcfVcFAo2P@vger.kernel.org, AJvYcCXgep1lS/ag6fninzB9hz4bhLyliC6hJztDnVhExCwCdb1Zg6Q7DH31hRqDSeUxprPP4SGsUm4zsmCffLnc@vger.kernel.org
X-Received: by 2002:a05:690c:4c0f:b0:6ee:b5ea:5fe8 with SMTP id
 00721157ae682-6ef37274a4amr87747517b3.30.1732807478236; Thu, 28 Nov 2024
 07:24:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2024 16:24:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvmTQeQXxhsXtj23-OS=aL3UgsyOtnawdmnusrEJ2JQw@mail.gmail.com>
Message-ID: <CAMuHMdUvmTQeQXxhsXtj23-OS=aL3UgsyOtnawdmnusrEJ2JQw@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ family
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com, 
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thanks for your patch!

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/G3S system controller (SYSC) has various registers that control
> signals specific to individual IPs. IP drivers must control these signals
> at different configuration phases.
>
> Add SYSC driver that allows individual SYSC consumers to control these
> signals. The SYSC driver exports a syscon regmap enabling IP drivers to
> use a specific SYSC offset and mask from the device tree, which can then =
be
> accessed through regmap_update_bits().
>
> Currently, the SYSC driver provides control to the USB PWRRDY signal, whi=
ch
> is routed to the USB PHY. This signal needs to be managed before or after
> powering the USB PHY off or on.
>
> Other SYSC signals candidates (as exposed in the the hardware manual of t=
he

s/the the/the/

> RZ/G3S SoC) include:
>
> * PCIe:
> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
>   register
> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
>
> * SPI:
> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
>   register
>
> * I2C/I3C:
> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
>   (x=3D0..3)
> - af_bypass I3C signal controlled through SYS_I3C_CFG register
>
> * Ethernet:
> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
>   registers (x=3D0..1)
>
> As different Renesas RZ SoC shares most of the SYSC functionalities
> available on the RZ/G3S SoC, the driver if formed of a SYSC core
> part and a SoC specific part allowing individual SYSC SoC to provide
> functionalities to the SYSC core.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> --- /dev/null
> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3S System controller driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/init.h>
> +
> +#include "rz-sysc.h"
> +
> +#define SYS_USB_PWRRDY         0xd70
> +#define SYS_USB_PWRRDY_PWRRDY_N        BIT(0)
> +#define SYS_MAX_REG            0xe20
> +
> +static const struct rz_sysc_signal_init_data rzg3s_sysc_signals_init_dat=
a[] __initconst =3D {

This is marked __initconst...

> +       {
> +               .name =3D "usb-pwrrdy",
> +               .offset =3D SYS_USB_PWRRDY,
> +               .mask =3D SYS_USB_PWRRDY_PWRRDY_N,
> +               .refcnt_incr_val =3D 0
> +       }
> +};
> +
> +const struct rz_sysc_init_data rzg3s_sysc_init_data =3D {

... but this is not __init, causing a section mismatch.

> +       .signals_init_data =3D rzg3s_sysc_signals_init_data,
> +       .num_signals =3D ARRAY_SIZE(rzg3s_sysc_signals_init_data),
> +       .max_register_offset =3D SYS_MAX_REG,
> +};

> --- /dev/null
> +++ b/drivers/soc/renesas/rz-sysc.c

> +/**
> + * struct rz_sysc - RZ SYSC private data structure
> + * @base: SYSC base address
> + * @dev: SYSC device pointer
> + * @signals: SYSC signals
> + * @num_signals: number of SYSC signals
> + */
> +struct rz_sysc {
> +       void __iomem *base;
> +       struct device *dev;
> +       struct rz_sysc_signal *signals;
> +       u8 num_signals;

You could change signals to a flexible array at the end, tag it with
__counted_by(num_signals), and allocate space for both struct rz_sysc
and the signals array using struct_size(), reducing the number of
allocations.

> +};

> +static struct rz_sysc_signal *rz_sysc_off_to_signal(struct rz_sysc *sysc=
, unsigned int offset,
> +                                                   unsigned int mask)
> +{
> +       struct rz_sysc_signal *signals =3D sysc->signals;
> +
> +       for (u32 i =3D 0; i < sysc->num_signals; i++) {

s/u32/unsigned int/

> +               if (signals[i].init_data->offset !=3D offset)
> +                       continue;
> +
> +               /*
> +                * In case mask =3D=3D 0 we just return the signal data w=
/o checking the mask.
> +                * This is useful when calling through rz_sysc_reg_write(=
) to check
> +                * if the requested setting is for a mapped signal or not=
.
> +                */
> +               if (mask) {
> +                       if (signals[i].init_data->mask =3D=3D mask)
> +                               return &signals[i];
> +               } else {
> +                       return &signals[i];
> +               }

if (!mask || signals[i].init_data->mask =3D=3D mask)
        return &signals[i];

> +       }
> +
> +       return NULL;
> +}
> +
> +static int rz_sysc_reg_update_bits(void *context, unsigned int off,
> +                                  unsigned int mask, unsigned int val)
> +{
> +       struct rz_sysc *sysc =3D context;
> +       struct rz_sysc_signal *signal;
> +       bool update =3D false;
> +
> +       signal =3D rz_sysc_off_to_signal(sysc, off, mask);
> +       if (signal) {
> +               if (signal->init_data->refcnt_incr_val =3D=3D val) {
> +                       if (!refcount_read(&signal->refcnt)) {
> +                               refcount_set(&signal->refcnt, 1);
> +                               update =3D true;
> +                       } else {
> +                               refcount_inc(&signal->refcnt);
> +                       }
> +               } else {
> +                       update =3D refcount_dec_and_test(&signal->refcnt)=
;
> +               }
> +       } else {
> +               update =3D true;
> +       }

You could reduce indentation/number of lines by reordering the logic:

    if (!signal) {
            update =3D true;
    } else if (signal->init_data->refcnt_incr_val !=3D val) {
            update =3D refcount_dec_and_test(&signal->refcnt);
    } else if (!refcount_read(&signal->refcnt)) {
            refcount_set(&signal->refcnt, 1);
            update =3D true;
    } else {
            refcount_inc(&signal->refcnt);
    }

> +
> +       if (update) {
> +               u32 tmp;
> +
> +               tmp =3D readl(sysc->base + off);
> +               tmp &=3D ~mask;
> +               tmp |=3D val & mask;
> +               writel(tmp, sysc->base + off);
> +       }
> +
> +       return 0;
> +}
> +
> +static int rz_sysc_reg_write(void *context, unsigned int off, unsigned i=
nt val)
> +{
> +       struct rz_sysc *sysc =3D context;
> +       struct rz_sysc_signal *signal;
> +
> +       /*
> +        * Force using regmap_update_bits() for signals to have reference=
 counter
> +        * per individual signal in case there are multiple signals contr=
olled
> +        * through the same register.
> +        */
> +       signal =3D rz_sysc_off_to_signal(sysc, off, 0);
> +       if (signal) {
> +               dev_err(sysc->dev,
> +                       "regmap_write() not allowed on register controlli=
ng a signal. Use regmap_update_bits()!");
> +               return -EOPNOTSUPP;
> +       }
> +

Can you ever get here, given rz_sysc_writeable_reg() below would have
returned false? If not, is there any point in having this function?

> +       writel(val, sysc->base + off);
> +
> +       return 0;
> +}
> +
> +static bool rz_sysc_writeable_reg(struct device *dev, unsigned int off)
> +{
> +       struct rz_sysc *sysc =3D dev_get_drvdata(dev);
> +       struct rz_sysc_signal *signal;
> +
> +       /* Any register containing a signal is writeable. */
> +       signal =3D rz_sysc_off_to_signal(sysc, off, 0);
> +       if (signal)
> +               return true;
> +
> +       return false;
> +}

> +static int rz_sysc_signals_show(struct seq_file *s, void *what)
> +{
> +       struct rz_sysc *sysc =3D s->private;
> +
> +       seq_printf(s, "%-20s Enable count\n", "Signal");
> +       seq_printf(s, "%-20s ------------\n", "--------------------");
> +
> +       for (u8 i =3D 0; i < sysc->num_signals; i++) {
> +               seq_printf(s, "%-20s %d\n", sysc->signals[i].init_data->n=
ame,
> +                          refcount_read(&sysc->signals[i].refcnt));
> +       }
> +
> +       return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(rz_sysc_signals);

What is the use-case for this? Just (initial) debugging?

> +
> +static void rz_sysc_debugfs_remove(void *data)
> +{
> +       debugfs_remove_recursive(data);
> +}
> +
> +static int rz_sysc_signals_init(struct rz_sysc *sysc,
> +                               const struct rz_sysc_signal_init_data *in=
it_data,
> +                               u32 num_signals)
> +{
> +       struct dentry *root;
> +       int ret;
> +
> +       sysc->signals =3D devm_kcalloc(sysc->dev, num_signals, sizeof(*sy=
sc->signals),
> +                                    GFP_KERNEL);
> +       if (!sysc->signals)
> +               return -ENOMEM;
> +
> +       for (u32 i =3D 0; i < num_signals; i++) {

unsigned int

> +               struct rz_sysc_signal_init_data *id;
> +
> +               id =3D devm_kzalloc(sysc->dev, sizeof(*id), GFP_KERNEL);
> +               if (!id)
> +                       return -ENOMEM;
> +
> +               id->name =3D devm_kstrdup(sysc->dev, init_data->name, GFP=
_KERNEL);
> +               if (!id->name)
> +                       return -ENOMEM;
> +
> +               id->offset =3D init_data->offset;
> +               id->mask =3D init_data->mask;
> +               id->refcnt_incr_val =3D init_data->refcnt_incr_val;
> +
> +               sysc->signals[i].init_data =3D id;
> +               refcount_set(&sysc->signals[i].refcnt, 0);
> +       }
> +
> +       sysc->num_signals =3D num_signals;
> +
> +       root =3D debugfs_create_dir("renesas-rz-sysc", NULL);
> +       ret =3D devm_add_action_or_reset(sysc->dev, rz_sysc_debugfs_remov=
e, root);
> +       if (ret)
> +               return ret;
> +       debugfs_create_file("signals", 0444, root, sysc, &rz_sysc_signals=
_fops);
> +
> +       return 0;
> +}

> --- /dev/null
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ System Controller
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#ifndef __SOC_RENESAS_RZ_SYSC_H__
> +#define __SOC_RENESAS_RZ_SYSC_H__
> +
> +#include <linux/refcount.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct rz_sysc_signal_init_data - RZ SYSC signals init data
> + * @name: signal name
> + * @offset: register offset controling this signal
> + * @mask: bitmask in register specific to this signal
> + * @refcnt_incr_val: increment refcnt when setting this value
> + */
> +struct rz_sysc_signal_init_data {
> +       const char *name;
> +       u32 offset;
> +       u32 mask;
> +       u32 refcnt_incr_val;
> +};
> +
> +/**
> + * struct rz_sysc_signal - RZ SYSC signals
> + * @init_data: signals initialization data
> + * @refcnt: reference counter
> + */
> +struct rz_sysc_signal {
> +       const struct rz_sysc_signal_init_data *init_data;

Can't you just embed struct rz_sysc_signal_init_data?
That way you could allocate the rz_sysc_signal and
rz_sysc_signal_init_data structures in a single allocation.

> +       refcount_t refcnt;
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

