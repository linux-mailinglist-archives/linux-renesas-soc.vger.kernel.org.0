Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF21C068A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2019 15:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfI0Nlr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Sep 2019 09:41:47 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41682 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfI0Nlr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 09:41:47 -0400
Received: by mail-ot1-f66.google.com with SMTP id g13so2243633otp.8;
        Fri, 27 Sep 2019 06:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LNcd66l0DhA8RbJOj9WLHJH7KZerxN8Krx87SIjEovQ=;
        b=ny+NbaWgIfSZ92p8PMUn0tNyHZ80znOcEazU3gGwWwtDHKAcy5fIAwlASO8TWTvkJD
         GGzEG/7F2HcM1rNLsJUx75A0BJmlCRAyvWL7TH2oY6agl3dvB88uaRKbwC6C3xzzgRdX
         WMYCvhWXiOfF1bP8qnx/G25FEz7+ixw+dFRRl3vuyIbTC1HNZ+CJX2SUqXYkJFRnTeqO
         WsHf9E0A5mICLZV5kFTUvM9BMImATNcM+9K5rNj16rSGdkbpFCPtoh7nLtSh4j74e6aL
         2mGLuCJnWv8MyP6wuGZ45cbp5RnjB9tHxLqG5bDQR/Gtybh2wKzVBVnXi2+941H0KXBg
         4j1g==
X-Gm-Message-State: APjAAAWqOvIcovu8VTlWS7qvZfiiDuhZK/3jPI7Uf8I8fAc8GmKJKzT9
        TlbC9BdHkYBgUd6+b5MWt2cWFpMJQcHAR1zBVkc=
X-Google-Smtp-Source: APXvYqxsbmx3j6UeKMQXnquv2p6Me+AfkxmG3TFM3eFVy/9sMzEN1KPWC0xS3XWWpAIMOgoM3OncjKF8s5uXoVg4zrA=
X-Received: by 2002:a9d:730d:: with SMTP id e13mr2316412otk.145.1569591706762;
 Fri, 27 Sep 2019 06:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <1568725530-55241-1-git-send-email-biju.das@bp.renesas.com>
 <1568725530-55241-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVNfurC1MATNePq8Veefyxgc_HPz4wYA++h_+7145UPHA@mail.gmail.com> <OSBPR01MB2103CA9A60AE9366BC593944B8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103CA9A60AE9366BC593944B8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Sep 2019 15:41:35 +0200
Message-ID: <CAMuHMdWLpNn+8rh8Fb2-tQC_g9ThdAGxv4Js6muhPMr1BXR8Zg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: Add HiHope RZ/G2N main board support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Sep 27, 2019 at 2:56 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 4/4] arm64: dts: renesas: Add HiHope RZ/G2N main
> > board support
> > On Tue, Sep 17, 2019 at 3:12 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > Basic support for the HiHope RZ/G2N main board:
> > >   - Memory,
> > >   - Main crystal,
> > >   - Serial console
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > One question below...
> >
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
> > > @@ -0,0 +1,26 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Device Tree Source for the HiHope RZ/G2N main board
> > > + *
> > > + * Copyright (C) 2019 Renesas Electronics Corp.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "r8a774b1.dtsi"
> > > +#include "hihope-common.dtsi"
> > > +
> > > +/ {
> > > +       model = "HopeRun HiHope RZ/G2N main board based on r8a774b1";
> > > +       compatible = "hoperun,hihope-rzg2n", "renesas,r8a774b1";
> > > +
> > > +       memory@48000000 {
> > > +               device_type = "memory";
> > > +               /* first 128MB is reserved for secure area. */
> > > +               reg = <0x0 0x48000000 0x0 0x78000000>;
> > > +       };
> > > +
> > > +       memory@480000000 {
> > > +               device_type = "memory";
> > > +               reg = <0x4 0x80000000 0x0 0x80000000>;
> > > +       };
> > > +};
> >
> > So both the HiHope RZ/G2M and RZ/G2N boards have 4 GiB of RAM, while
> > the latter has a narrower memory bus, so it must be wired differently?
>
> RZ/G2M is LPDDR4-3200 with 32 bits × 2 channels,  where as RZ/G2N is LPDDR4-3200 with 32 bits × 1 channel.
> RZ/G2M can have split mapping where as RZ/G2N can have only linear mapping.

Thanks for the confirmation, will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
