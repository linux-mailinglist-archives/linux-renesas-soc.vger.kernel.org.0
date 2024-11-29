Return-Path: <linux-renesas-soc+bounces-10766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E79DC20F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 11:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04408B224F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 10:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9D2189BB5;
	Fri, 29 Nov 2024 10:23:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9770155753;
	Fri, 29 Nov 2024 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732875830; cv=none; b=lUH3szDIdQ2uGkdOBX/Mz3CEI4vzU65BH5dOX8vGjmHadPydmfTnhEeDzBblsHn4vueKCjEHQ5AZwI49KsSZcSOnUQMqGDb5vpt1RorOVmZux8LfqCOEYMHMUsyYudHictbZntd7x6TB2n2grWx6p9hBFeqBJUMDtt+uBOnLFck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732875830; c=relaxed/simple;
	bh=N0sqU8NkAOZabHcNlGMMpaPfV+bPF/O7Yg+flTk9yhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgHsOTV+obs9LjZmfX3YJqH/l+8W9rEyvkWi7KQFdD589j80Oh8D6Tjh+bDY+6xGWGgo7tQ1D0D+KyRRtWYRbm6XafZpvUwSbbRs9i4MTq4U2r2Vu+iEKhmR+gFeve1e7fSKoQAxayPdXBhDw0nNXNcZvVHlKEFOt1zEoOJzE1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4af4575ec4cso559601137.2;
        Fri, 29 Nov 2024 02:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732875827; x=1733480627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lb0O6wOGoEZfGObCxjbicwXvMy3aEqtM9vf1++Bs8QA=;
        b=kdFxJAeeZhzMYdTYnJLnD31wH0rZLYnpjjAowvFe+7TypxCbW9IZ4SxusOkmL8f8po
         6cp2qYTSFZz1h7E43/9isrqEXP9d9ee/7eyoT9j9OXKvX3YlVKqdgzl+b872TLUu+OwD
         LxDrRXG419Xnrze76cgrJZCVVBYJqsPgaXYQpoHrDMXJKTnXA0SwY1mwpCV73heIHHXZ
         sxVxLVs7U5HIR4/p6V+5vD89aW8DCXkPUOOn9oEGJPtuOQiCXNmB+vbkhh8vX4rb+Gnw
         eEbNhuOgiSeR3LdTaXA1W0zDC3B1vBp1Ee/TJ6LDTZmp4MrV0ICCVnm+OGAEYevuA4Xm
         XPvg==
X-Forwarded-Encrypted: i=1; AJvYcCV0ZKJHG3JfNgC1H9l45f9bktXYz42ebWUyNLFoIYj3u/Kk/NsryvquFCR8awy1NQZaO8NJRvul6iGi@vger.kernel.org, AJvYcCVA412TR6WOvw5xbKCCYUfFPxrbnoEK22SX16QRXcoWoWwpfBq31cW4HmUYzlnpwjxuvGYd2O9UKNDTmFD7E6GDNkU=@vger.kernel.org, AJvYcCVUV4gxXPZs6K/pLhz4ySi0ZRQl1p5rbTCiY2BHbmNJWGoqsBY5MhCECtwdao+Q+sKYraAuYdd63Ixp@vger.kernel.org, AJvYcCXBNu0HKvDvlKNONUQHqCoRX3HYy6EQ6mylkFHgp9FhDHdfjsomoMMkalNtF5BjYimG2ODNwMXsZD3rVEX+@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYRP/46pN2DrVvclRhrjUleF20zZrKXNuCi9NzDCFFtVPtIu+
	bKu8BhVZq29j7mV66LkM9cfEiVpCCcBKKDeRRSvn1vi+aERdRdYhEDoDRHzDVtA=
X-Gm-Gg: ASbGncvpdl/1wf9z0MmeMz6AYxFryftiBI48urIV8pFdZ5rynO3qBEs512acL2a72mV
	HdGTrn0MrzG0/NF8Ql4QnHzYDmalkFJH1W6a5euhXesFVDik/VcowXRL7miu6GBAHBAK8YyokbA
	H6mhvf0Haubbl+djs4hukpX5mOY5turgSShxSPuKqeFWF/yu2xOKVPtE+PZw0SB8rRuxNjoAPHJ
	2teIcZhaYfhTpMFkU/DeU2Ttva8plic6SSLFbsSyvFp/Ti6nXnKTu7oNkza7l/NElMiYspcYWdH
	csCAv4xaaxGK
X-Google-Smtp-Source: AGHT+IGPX4Z7XXeacRRkXvXJizJ93foOwZUyFckFAkluw3CyKCBGUmwkUccHt2INEhkiufUAO5bY8w==
X-Received: by 2002:a05:6102:26cc:b0:4af:496b:1bce with SMTP id ada2fe7eead31-4af496b1cfemr8687733137.4.1732875826855;
        Fri, 29 Nov 2024 02:23:46 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82a0e475sm703509241.7.2024.11.29.02.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 02:23:46 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4af1578d288so466789137.3;
        Fri, 29 Nov 2024 02:23:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcn1q0dXCDFkFpgHEhylaUADDDhfhlvTFgp++SELeluTHJBl0C+4iBKM/gQprG30Dl2xKNRQxcj2fB@vger.kernel.org, AJvYcCWAqRINAOa3tw+EC1RjI5YZ4aQv/gDuqH4xehJWfgTPkA9Ql9J22mXKPjlv+im/y0KFIDZdNU3VAttHGIcACuq1E10=@vger.kernel.org, AJvYcCWIQKPiASQf6yZO3Or4DbpRX6pD5iDDCeN2hmE9RPYbivKsJhorBZfUNuBACq69nWp35+2BGyQy/Yt+v66V@vger.kernel.org, AJvYcCXpF5SFVD1986BIGPOKMSTWnFH3izzLQ2M8+o0G/YWltTmHSNGPc33Nbwz+GprxUfOFc3MENbrLfbw2@vger.kernel.org
X-Received: by 2002:a05:6102:390e:b0:4af:30c3:6a2c with SMTP id
 ada2fe7eead31-4af4492c932mr14186029137.10.1732875825820; Fri, 29 Nov 2024
 02:23:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUvmTQeQXxhsXtj23-OS=aL3UgsyOtnawdmnusrEJ2JQw@mail.gmail.com>
 <32fa7eb8-2139-454c-8866-cb264d060616@tuxon.dev> <CAMuHMdXPQnCPjKRxoSceYabWPHF9Z_A7qVN85yaUZjPG7-o7tg@mail.gmail.com>
In-Reply-To: <CAMuHMdXPQnCPjKRxoSceYabWPHF9Z_A7qVN85yaUZjPG7-o7tg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Nov 2024 11:23:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLVKDybzgeXc0rqiOFXFfRrat0LDEAEsBdHA3rmDiL0w@mail.gmail.com>
Message-ID: <CAMuHMdXLVKDybzgeXc0rqiOFXFfRrat0LDEAEsBdHA3rmDiL0w@mail.gmail.com>
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

On Fri, Nov 29, 2024 at 9:54=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Nov 29, 2024 at 9:48=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tu=
xon.dev> wrote:
> > On 28.11.2024 17:24, Geert Uytterhoeven wrote:
> > > On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxo=
n.dev> wrote:
> > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>
> > >> The RZ/G3S system controller (SYSC) has various registers that contr=
ol
> > >> signals specific to individual IPs. IP drivers must control these si=
gnals
> > >> at different configuration phases.
> > >>
> > >> Add SYSC driver that allows individual SYSC consumers to control the=
se
> > >> signals. The SYSC driver exports a syscon regmap enabling IP drivers=
 to
> > >> use a specific SYSC offset and mask from the device tree, which can =
then be
> > >> accessed through regmap_update_bits().
> > >>
> > >> Currently, the SYSC driver provides control to the USB PWRRDY signal=
, which
> > >> is routed to the USB PHY. This signal needs to be managed before or =
after
> > >> powering the USB PHY off or on.
> > >>
> > >> Other SYSC signals candidates (as exposed in the the hardware manual=
 of the
> > >>
> > >> * PCIe:
> > >> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> > >> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
> > >>   register
> > >> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
> > >>
> > >> * SPI:
> > >> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
> > >>   register
> > >>
> > >> * I2C/I3C:
> > >> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
> > >>   (x=3D0..3)
> > >> - af_bypass I3C signal controlled through SYS_I3C_CFG register
> > >>
> > >> * Ethernet:
> > >> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
> > >>   registers (x=3D0..1)
> > >>
> > >> As different Renesas RZ SoC shares most of the SYSC functionalities
> > >> available on the RZ/G3S SoC, the driver if formed of a SYSC core
> > >> part and a SoC specific part allowing individual SYSC SoC to provide
> > >> functionalities to the SYSC core.
> > >>
> > >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > >> --- /dev/null
> > >> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
> > >> @@ -0,0 +1,31 @@
> > >> +// SPDX-License-Identifier: GPL-2.0
> > >> +/*
> > >> + * RZ/G3S System controller driver
> > >> + *
> > >> + * Copyright (C) 2024 Renesas Electronics Corp.
> > >> + */
> > >> +
> > >> +#include <linux/array_size.h>
> > >> +#include <linux/bits.h>
> > >> +#include <linux/init.h>
> > >> +
> > >> +#include "rz-sysc.h"
> > >> +
> > >> +#define SYS_USB_PWRRDY         0xd70
> > >> +#define SYS_USB_PWRRDY_PWRRDY_N        BIT(0)
> > >> +#define SYS_MAX_REG            0xe20
> > >> +
> > >> +static const struct rz_sysc_signal_init_data rzg3s_sysc_signals_ini=
t_data[] __initconst =3D {
> > >
> > > This is marked __initconst...
> > >
> > >> +       {
> > >> +               .name =3D "usb-pwrrdy",
> > >> +               .offset =3D SYS_USB_PWRRDY,
> > >> +               .mask =3D SYS_USB_PWRRDY_PWRRDY_N,
> > >> +               .refcnt_incr_val =3D 0
> > >> +       }
> > >> +};
> > >> +
> > >> +const struct rz_sysc_init_data rzg3s_sysc_init_data =3D {
> > >
> > > ... but this is not __init, causing a section mismatch.
> >
> > Do you know if there is a way to detect this?
>
> The kernel should tell you during the build...

Sorry, I hit send too early; I was still verifying this...
And it indeed doesn't trigger, strange...

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

