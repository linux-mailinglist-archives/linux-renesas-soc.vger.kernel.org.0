Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401BF489E8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 18:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238488AbiAJRmD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 12:42:03 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:38754 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238382AbiAJRmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 12:42:03 -0500
Received: by mail-ua1-f46.google.com with SMTP id h11so2929825uar.5;
        Mon, 10 Jan 2022 09:42:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EoMwEY16BN9K3Eb+Ybo0QoV7oiSlmQWo6MQ4z6mhDc8=;
        b=5yFYSIK+aIzSkCqTi/KVy/4BZrBCD8jcRbJiuYqGjId4pt1wqUVoawcUYKYac70SFt
         ItRnP7M0/QLcsgKpZzQs7Z6wShP9XeHE7uKIGlR3BP7/M0dXOMfgFPawSw28UBAu4Hxw
         /RFBS49HXFMmtnGmfhCk+YO0XTUHu+g2kwn5R5fmQeRkpGgEI4bVxOiCNtgvJKmVTdc2
         2Tpy2xE0mD6TLJuT/86XKwwjv/Nj/eML+xxfeDk6FOQoc6TjaJbg0I4IX/Yvz7CSA84D
         2q+wWj9hTDLu/sNDM1Krr3GLbKPam9+j+bRPymjsQSrvcCU/BenQznnWWlUzgPzee87s
         2gSA==
X-Gm-Message-State: AOAM531M6OSr9WbhJLVQbr1vVCqzamp8nQecaRUKKEO31zKTrPAo4yPO
        JvpXTYSsw0CXU8H/fm7KmRwreMFTam/J/Q==
X-Google-Smtp-Source: ABdhPJydCf+vqaECMDjVWE8qQ9scQGEQk5UwVgOgraOwhULbFwV/o7WH5Wa79wSZRYdwrvBhlKgP4g==
X-Received: by 2002:a05:6102:4a3:: with SMTP id r3mr294243vsa.85.1641836522472;
        Mon, 10 Jan 2022 09:42:02 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id t131sm2554716vkd.8.2022.01.10.09.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 09:42:02 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id g5so4794669vkg.0;
        Mon, 10 Jan 2022 09:42:02 -0800 (PST)
X-Received: by 2002:a05:6122:21a6:: with SMTP id j38mr433600vkd.39.1641836521904;
 Mon, 10 Jan 2022 09:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20211216114305.5842-1-biju.das.jz@bp.renesas.com>
 <20211216114305.5842-4-biju.das.jz@bp.renesas.com> <CAMuHMdWG+onWR-UGSG9WXcTmgfjnWxA77ZUMR6dicS9=T7Mqmw@mail.gmail.com>
 <OS0PR01MB59222FCD5D966294B9E29F6786509@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59222FCD5D966294B9E29F6786509@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 18:41:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX=boXjawU5uDM8WNuZBEqgkAqxXv4nX526sOzQr_LbYA@mail.gmail.com>
Message-ID: <CAMuHMdX=boXjawU5uDM8WNuZBEqgkAqxXv4nX526sOzQr_LbYA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add initial device tree for
 RZ/G2LC SMARC EVK
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Jan 10, 2022 at 6:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Hi Geert,
>
> Thanks for the feedback.
>
> > Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add initial device tree for
> > RZ/G2LC SMARC EVK
> >
> > Hi Biju,
> >
> > On Thu, Dec 16, 2021 at 12:43 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add basic support for RZ/G2LC SMARC EVK (based on R9A07G044C2):
> > > - memory
> > > - External input clock
> > > - SCIF
> > > - GbEthernet
> > > - Audio Clock
> > >
> > > It shares the same carrier board with RZ/G2L, but the pin mapping is
> > > different. Disable the device nodes which is not tested and delete the
> > > corresponding pinctrl definitions.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Before I queue this in renesas-devel for v5.18, I have two questions:
> >
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> > > @@ -0,0 +1,99 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +/*
> > > + * Device Tree Source for the RZ/G2LC SMARC EVK board
> > > + *
> > > + * Copyright (C) 2021 Renesas Electronics Corp.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "r9a07g044c2.dtsi"
> > > +#include "rzg2lc-smarc-som.dtsi"
> > > +#include "rzg2lc-smarc-pinfunction.dtsi"
> >
> > 1) So far it looks like the definitions in rzg2lc-smarc-pinfunction.dtsi
> >    do not really differ from those in rzg2l-smarc-pinfunction.dtsi,\
> >    there are just less. Will there be other differences?
>
> SoM module contains below SW for multiplex function. Same pins used for both operations.
>
> SW1-3 : 1:CAN1, 0:SCIF1
> SW1-4 : 1:CAN1, 0:RSPI1
> SW1-5 : 1:I2S2 HDMI Audio, 0:I2S0 Audio code
>
> Apart from this, there are differences w.r.to
> 1) PMOD pins
> 2) SD0 power enable and SD0_DEV_SEL
> 3) IIC3
> 4) Only CAN1 and ETH0.

OK, so let's go as you proposed.

> > 2) Would it make sense to create rzg2*-smarc-som-pinfunction.dtsi
> >    files, too?
>
> Only ADC, Ethernet and SD0/eMMC are defined on SoM.
>
> Between RZ/G2L and RZ/G2LC, ADC is not present on LC
> And SD0 pins are different between this as mentioned above.
>
> Only ethernet(eth0) is common, but that also different in RZ/G2UL.
> That is the reason it is not done.
>
> If there is a value in adding, rzg2*-smarc-som-pinfunction.dtsi, I can create
> rzg2*-smarc-som-pinfunction.dtsi files.
>
> Please let me know.

Thanks, it's fine as-is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
