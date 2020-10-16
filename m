Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B8B28FE56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 08:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394246AbgJPGbJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 02:31:09 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44017 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394244AbgJPGbJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 02:31:09 -0400
Received: by mail-ot1-f68.google.com with SMTP id n61so1454163ota.10;
        Thu, 15 Oct 2020 23:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Udwqr7O5zi30yP/PtquvZaBuILNM0n87MEoRaEeVK4Q=;
        b=jrS/olqNZPq1/FwNt4qOhkCHyeppdRqVUX1aQH8VnDlMonKylX8cuARxFmauTcowg3
         B2GNFUjH0WfLK0WZz8FJ+YsM9a/Y/7WjdG5jc5KcXGFUDUYhR571Lw/cb01bYk9gorRR
         NDNGvRcQAppTAaPdri4IuvD8Gq2SBBHyo89dLEYGucLVuKZfmHIv92iqiEvpg2dchuQK
         gRHvADAnL+C8RPHmT9rrubZUrOgF4jlH0LxHNT4Ji+LJ5C6uYxJ0dyTYhYUEVaipbuUN
         EP6X/eesOac/nH/Et9V6543DCW23heUnpEGmYktw/jv6unFQCddhz9YDrpoQCvJklZVv
         kUzw==
X-Gm-Message-State: AOAM5339/YDgpf4D8Aw6ofDygMGvH2DWUMKZBrGqgxdSFo/10saR+eJu
        rtbGerI2y8Aha3YpreSCuBhQz29KN2cxy/qM2P4=
X-Google-Smtp-Source: ABdhPJxfyd1l4/BjCcqgxqJFxu8WkoXmr8FOL4ykQG/DWe5YKgf6zXtU/Z3ewSDOuHHdkA7eQNYLBhWh5joXNBmXess=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr1472820otc.145.1602829868635;
 Thu, 15 Oct 2020 23:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201015132350.8360-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUogbfHYv+g3+2=7JwhgH3MngmDEe5nvjZwkjTOJyn9dQ@mail.gmail.com> <TYBPR01MB53091FA117DF513BAF6A46E486030@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB53091FA117DF513BAF6A46E486030@TYBPR01MB5309.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Oct 2020 08:30:57 +0200
Message-ID: <CAMuHMdV5baxxGxWc5Y5O5dKXAXZcNhUdJdWfgwKrzcUGj8p=LQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps
 from ethernet-phy node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Oct 16, 2020 at 8:15 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 1/2] arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-
> > skew-ps from ethernet-phy node
> > On Thu, Oct 15, 2020 at 3:24 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > HiHope RZG2[HMN] boards uses Realtek phy and the driver does not
> > > support rxc-skew-ps property. So remove rxc-skew-ps from ethernet-phy
> > node.
> > >
> > > Fixes: 7433f1fb8ec8fe ("arm64: dts: renesas: Add HiHope RZ/G2M sub
> > > board support")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> > > @@ -23,7 +23,6 @@
> > >         status = "okay";
> > >
> > >         phy0: ethernet-phy@0 {
> > > -               rxc-skew-ps = <1500>;
> > >                 reg = <0>;
> > >                 interrupt-parent = <&gpio2>;
> > >                 interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> >
> > Should "rx-internal-delay-ps = <1800>" be added to the avb node instead
> > (after [1] has entered v5.10-rc1, and the DTS part of [2] has been  applied to
> > renesas-devel)?
>
> Looking at the schematic, it is not needed, since it has "2ns" internal delay  (4.7K Ohm latched to 2.5 V) on the Rx side.

Thanks for the pointer, I can confirm LED2_RXDLY is strapped high
(to 3.3V, not 2.5V though).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
