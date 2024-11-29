Return-Path: <linux-renesas-soc+bounces-10761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3FC9DC0E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 09:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C3D81638FC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 08:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43A016D9B8;
	Fri, 29 Nov 2024 08:54:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11216AD27;
	Fri, 29 Nov 2024 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732870471; cv=none; b=YojcuwLb0bfeAJVATEgLu19Df3WdoA621GxSU7sybNlopARpR9wvQxuu6w14aHNDlwqnqFVpufkuT/yyyXquuCRUH9dERe6j+988MVgTO0PMEYVothIdxSAkP0itTd/hr6kTVxVtTGKYX+VWVW/RrsFUuTNGT1+waNQjVCx9E+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732870471; c=relaxed/simple;
	bh=1jW2sJC2gA+iZNbMYV3OC/SGiypWcHHfISK0qT339h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkZgq4SvTd0wfAAWMsZEfrUrmvtDN//yCb+6Ipu+Nabn/mnplH2aoW0k0HFpcsv6RqZysqO8jVG3eD/9vAm79a1iuq70j5jgd6vQCwXM8CqDngnzYm2Wz/srJ/8dsMv8W5NsNzobMThNGf5kFEVZEdBbHHD0JmPj0nU9MvYU6pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85b9c456f46so123908241.3;
        Fri, 29 Nov 2024 00:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732870468; x=1733475268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Euk3VJ7BmU7RfhdWEIOUgVSr2IUFcOE2zUwRiXafaDc=;
        b=c6xFA8lvBKBaUN1gfyRED6Xg6+Q156QKz+SPCI0hPJtQ2ssdP2/FiISXn6FYf4Ihu0
         D3U0p+53nR5hex1zi3SxjIsXw1+ZIDO0oykJbOWj1Z4L8nByoI/YRf4FN8/Iq0ubfY2c
         KlK5t43+vXc5rnOKEM+2UT65iuW0oXwyILTE0zmhuihdDjHziNz0kVjXuMPwBNhRTdcs
         Zw03n6XaULMyUwVAuuXWNq66e7WghNDsmAKUfdgy/FrUzHJqHhymhYvuKP+upy7TUKvc
         dGe3HMMCTySyZmKegfCXtCOLkpGqp68nFZKrj90ez26E9IQ39Ig74OxM6rTfuLl0ltH/
         S/CA==
X-Forwarded-Encrypted: i=1; AJvYcCW3oCqF1YafP7NgnOuuVDbd950YqjoDHUR+hSmDVblS2xiDf61o+TN1spU6xeL3/48emWGNew8RKCEy8FG0A46FlJc=@vger.kernel.org, AJvYcCWTuee2TG71sdnhBExLIN7ZYG6RJYjtLXpMkNnC78onCESZD2Y+bfKtr44n4kAYLy+hyVzzZ8LXCelV@vger.kernel.org, AJvYcCWgibzlj7mLhwHsMR9GIy1cdp7UxTBVbXfIsCv1EaLAg0rgaSM4BHl1gG7BwIV3n6k77jhc01fgFKuf@vger.kernel.org, AJvYcCXe6TNVr4uebcWT0NOwyHDVQGN1CKE/Zwk5sA8ewE3Y+VpULvVn8giv9UjztorDi0jEPYoH+NGp6xcjBUsp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0lu5UYwCotA8jDqoVtNTHxCO1uyyXzWAQOVrA5R4NmVg7csVr
	rZE3ThYGB9IzcnG9R5B6yVuDe5Gvev3MQvhJg/aqSGcb2OvQsPxH0V3pes2Uce8=
X-Gm-Gg: ASbGncuW5egdtExfKF5zYMdgJ8LnSthoKQPKCEGF/nIbBFHm5TFa9W9FhizXSfNWxoU
	cxudHlpxx9C3FIPUXFhok4QBVqdh8i9ZStQu+OHvrwoAGuu7fPWTBIuZixVBYwD0N1BwW6Suuv+
	Z0j3w5sKCq7ymaDXjNqNWYTg3EqqcPPEqi/hlc8WPllIJ0ySDLLfi6zMPiCLE41Dw0A8j3Ytl/c
	7ShEGYt15WKAP4Oc5h7pAyYhUQiM9GWmAFahH35x3fQfGOcnBL850YUByY2v7XmHyJjd217df5q
	Rdu5aX6P5O5O
X-Google-Smtp-Source: AGHT+IH3t5pNJc5GG6TQrCXVETTdhlzO3niUq+pU984b171bieTs1ybTz9aZWhlKHo/kFEz99CWt8Q==
X-Received: by 2002:a05:6102:e07:b0:4af:5682:bc30 with SMTP id ada2fe7eead31-4af5682bf83mr7538296137.12.1732870467897;
        Fri, 29 Nov 2024 00:54:27 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af59213219sm694565137.20.2024.11.29.00.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 00:54:26 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4addd900de1so472185137.3;
        Fri, 29 Nov 2024 00:54:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUClNxUAnlay+Rc7ouiFWIL1KRuEydr2RKBRta5U9bklIFHpUbbVXYuOWY0jcmgOh2o0BfHDes3A52TMH/u@vger.kernel.org, AJvYcCUR3wwGKqyu9+rRaZBqhUyaSygIx0HTvDM2mTTp6276i3yrjz5njGPbKkTC+3qHn9+gRUXrlfUug1FJ@vger.kernel.org, AJvYcCVlHyMIpuf8M1DbUoGIrDYSc2MSDqAwmKoBHsmjrmJdL1kdmwIduzpphOvO+UYHxa8xULyeIlPKuzI3tpKAWNMQo4s=@vger.kernel.org, AJvYcCXHZHXhjDoqnZzGrWs8fpBkmOA5NNaXozbIXReZzPzxA44FMkHOxP8+K9iOxf8H817+5lkLGD3hTrDf@vger.kernel.org
X-Received: by 2002:a05:6102:4421:b0:4af:4a89:7a1f with SMTP id
 ada2fe7eead31-4af4a8981d0mr10889457137.19.1732870466034; Fri, 29 Nov 2024
 00:54:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUvmTQeQXxhsXtj23-OS=aL3UgsyOtnawdmnusrEJ2JQw@mail.gmail.com> <32fa7eb8-2139-454c-8866-cb264d060616@tuxon.dev>
In-Reply-To: <32fa7eb8-2139-454c-8866-cb264d060616@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Nov 2024 09:54:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPQnCPjKRxoSceYabWPHF9Z_A7qVN85yaUZjPG7-o7tg@mail.gmail.com>
Message-ID: <CAMuHMdXPQnCPjKRxoSceYabWPHF9Z_A7qVN85yaUZjPG7-o7tg@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ family
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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

On Fri, Nov 29, 2024 at 9:48=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 28.11.2024 17:24, Geert Uytterhoeven wrote:
> > On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.=
dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The RZ/G3S system controller (SYSC) has various registers that control
> >> signals specific to individual IPs. IP drivers must control these sign=
als
> >> at different configuration phases.
> >>
> >> Add SYSC driver that allows individual SYSC consumers to control these
> >> signals. The SYSC driver exports a syscon regmap enabling IP drivers t=
o
> >> use a specific SYSC offset and mask from the device tree, which can th=
en be
> >> accessed through regmap_update_bits().
> >>
> >> Currently, the SYSC driver provides control to the USB PWRRDY signal, =
which
> >> is routed to the USB PHY. This signal needs to be managed before or af=
ter
> >> powering the USB PHY off or on.
> >>
> >> Other SYSC signals candidates (as exposed in the the hardware manual o=
f the
> >>
> >> * PCIe:
> >> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> >> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
> >>   register
> >> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
> >>
> >> * SPI:
> >> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
> >>   register
> >>
> >> * I2C/I3C:
> >> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
> >>   (x=3D0..3)
> >> - af_bypass I3C signal controlled through SYS_I3C_CFG register
> >>
> >> * Ethernet:
> >> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
> >>   registers (x=3D0..1)
> >>
> >> As different Renesas RZ SoC shares most of the SYSC functionalities
> >> available on the RZ/G3S SoC, the driver if formed of a SYSC core
> >> part and a SoC specific part allowing individual SYSC SoC to provide
> >> functionalities to the SYSC core.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> >> --- /dev/null
> >> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
> >> @@ -0,0 +1,31 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * RZ/G3S System controller driver
> >> + *
> >> + * Copyright (C) 2024 Renesas Electronics Corp.
> >> + */
> >> +
> >> +#include <linux/array_size.h>
> >> +#include <linux/bits.h>
> >> +#include <linux/init.h>
> >> +
> >> +#include "rz-sysc.h"
> >> +
> >> +#define SYS_USB_PWRRDY         0xd70
> >> +#define SYS_USB_PWRRDY_PWRRDY_N        BIT(0)
> >> +#define SYS_MAX_REG            0xe20
> >> +
> >> +static const struct rz_sysc_signal_init_data rzg3s_sysc_signals_init_=
data[] __initconst =3D {
> >
> > This is marked __initconst...
> >
> >> +       {
> >> +               .name =3D "usb-pwrrdy",
> >> +               .offset =3D SYS_USB_PWRRDY,
> >> +               .mask =3D SYS_USB_PWRRDY_PWRRDY_N,
> >> +               .refcnt_incr_val =3D 0
> >> +       }
> >> +};
> >> +
> >> +const struct rz_sysc_init_data rzg3s_sysc_init_data =3D {
> >
> > ... but this is not __init, causing a section mismatch.
>
> Do you know if there is a way to detect this?

The kernel should tell you during the build...

>
> >
> >> +       .signals_init_data =3D rzg3s_sysc_signals_init_data,
> >> +       .num_signals =3D ARRAY_SIZE(rzg3s_sysc_signals_init_data),
> >> +       .max_register_offset =3D SYS_MAX_REG,
> >> +};
> >
> >> --- /dev/null
> >> +++ b/drivers/soc/renesas/rz-sysc.c
> >
> >> +/**
> >> + * struct rz_sysc - RZ SYSC private data structure
> >> + * @base: SYSC base address
> >> + * @dev: SYSC device pointer
> >> + * @signals: SYSC signals
> >> + * @num_signals: number of SYSC signals
> >> + */
> >> +struct rz_sysc {
> >> +       void __iomem *base;
> >> +       struct device *dev;
> >> +       struct rz_sysc_signal *signals;
> >> +       u8 num_signals;
> >
> > You could change signals to a flexible array at the end, tag it with
> > __counted_by(num_signals), and allocate space for both struct rz_sysc
> > and the signals array using struct_size(), reducing the number of
> > allocations.
>
> I'll look into this.

> >> --- /dev/null
> >> +++ b/drivers/soc/renesas/rz-sysc.h
> >> @@ -0,0 +1,52 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Renesas RZ System Controller
> >> + *
> >> + * Copyright (C) 2024 Renesas Electronics Corp.
> >> + */
> >> +
> >> +#ifndef __SOC_RENESAS_RZ_SYSC_H__
> >> +#define __SOC_RENESAS_RZ_SYSC_H__
> >> +
> >> +#include <linux/refcount.h>
> >> +#include <linux/types.h>
> >> +
> >> +/**
> >> + * struct rz_sysc_signal_init_data - RZ SYSC signals init data
> >> + * @name: signal name
> >> + * @offset: register offset controling this signal
> >> + * @mask: bitmask in register specific to this signal
> >> + * @refcnt_incr_val: increment refcnt when setting this value
> >> + */
> >> +struct rz_sysc_signal_init_data {
> >> +       const char *name;
> >> +       u32 offset;
> >> +       u32 mask;
> >> +       u32 refcnt_incr_val;
> >> +};
> >> +
> >> +/**
> >> + * struct rz_sysc_signal - RZ SYSC signals
> >> + * @init_data: signals initialization data
> >> + * @refcnt: reference counter
> >> + */
> >> +struct rz_sysc_signal {
> >> +       const struct rz_sysc_signal_init_data *init_data;
> >
> > Can't you just embed struct rz_sysc_signal_init_data?
>
> Meaning to have directly the members of struct rz_sysc_signal_init_data
> here or to drop the const qualifier along with __initconst on
> rzg3s_sysc_signals_init_data[]  and re-use the platfom data w/o allocate
> new memory?

I mean

    struct rz_sysc_signal {
          struct rz_sysc_signal_init_data init_data;
          ...
    };

Currently you allocate rz_sysc_signal_init_data separately.
When embedded, it will be part of rz_sysc, cfr. above.

> > That way you could allocate the rz_sysc_signal and
> > rz_sysc_signal_init_data structures in a single allocation.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

