Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3953A6855
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 15:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhFNNu1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 09:50:27 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:44699 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbhFNNu1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 09:50:27 -0400
Received: by mail-vs1-f46.google.com with SMTP id x13so7796139vsf.11;
        Mon, 14 Jun 2021 06:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GcUfUlFIX4X4dWFAdI2Q98BKdpaJeSWFg0rExRnnbb8=;
        b=OWqhB7ncZVWiVKD5R5J5J2TDaczs5eO0RSiZLuQ6qdfY+Mw+Tr2H4BHW1JjvUZNifR
         uGbEqbS4a8AQ84ejMO5UpigrCinNhkonrS/0jSRpwXE13yAHv/JTazKrIFOEli2eW1DK
         ncObJIq1B/q0nGl57neeJ9NrV4rgdzIkk1K4iKBY4bqfrPhVhNcNYQRKNXCnq+WD6ALa
         eebujpFkdTmG9FxsFsaaPIxrYsQ+Me497rGNoy6ZeR1aRBZwiyVbPEXlw4+bUvGbCv3q
         G2qdIE9wOZc+lyQpu65031AqQQzLF2b5c9ngAUwZMqI9PLMe2VPgCr9Xe+xaHTv7e6i4
         VycQ==
X-Gm-Message-State: AOAM530AKFo55iNd1w6BGuZML+1NpCHcmil8CWLl/t/3MGTxmJmk2ltl
        /mxKBJnRUTCDM48HTic7a9ygScqtn4pTnYRTi6gUiu5nEMU2ZQ==
X-Google-Smtp-Source: ABdhPJwCC2KVGlegTOg8+zG7cvtNxNdCnuGV8omrsx/Fg0zaZVvX3ewGZ5uUKPOCYJy2uY1ILtvKNyaobuXRc7PF90s=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr18250891vsp.3.1623678495006;
 Mon, 14 Jun 2021 06:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
 <20210611113642.18457-5-biju.das.jz@bp.renesas.com> <CAMuHMdUthmAbwNrBKeEBzqBUN6HYR=Fuz5ALpK+iGY_kUQpV1A@mail.gmail.com>
 <OS0PR01MB59227529257477835867FEFA86319@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59227529257477835867FEFA86319@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 15:48:03 +0200
Message-ID: <CAMuHMdX2CR=3wpQbAXsmCBw=jWy7OQG7ur0MhTxaoVkz413Jcg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a07g044: Add DMAC support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Jun 14, 2021 at 3:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a07g044: Add DMAC support
> > On Fri, Jun 11, 2021 at 1:36 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Add DMAC support to RZ/G2L SoC DT.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > > @@ -8,6 +8,10 @@
> > >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> > >  #include <dt-bindings/clock/r9a07g044-cpg.h>
> > >
> > > +#define CH_CFG(reqd, loen, hien, lvl, am, sds, dds, tm) \
> > > +       ((((tm) << 22) | ((dds) << 16) | ((sds) << 12) | ((am) << 8) | \
> > > +       ((lvl) << 6) | ((hien) << 5) | ((loen) << 4) | ((reqd) << 3))
> > > +& 0x004FF778)
> > > +
> >
> > I assume the above will be removed?
>
> Basically the macro simplifies the channel configuration values in Table 16.4 page 569 of the hardware manual.
>
> Client driver will use MID+RID, and pass (Src address or dest address along with the channel configuration values
> For configuring DMA channel.
>
> For eg:-
>
>                 ssi0: ssi@10049c00 {
>                         compatible = "renesas,r9a07g044-ssi",
>                                      "renesas,rz-ssi";
>                         reg = <0 0x10049c00 0 0x400>;
>                         interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
>                                      <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>;
>                         interrupt-names = "int", "rx", "tx";
>                         clocks = <&cpg CPG_MOD R9A07G044_CLK_SSI0>,
>                                  <&audio_clk1>,
>                                  <&audio_clk2>;
>                         clock-names = "ssi", "audio_clk1", "audio_clk2";
>                         resets = <&cpg R9A07G044_CLK_SSI0>;
>                         dmas = <&dmac 0x255 0x10049c18 CH_CFG(0x1,0x0,0x1,0x0,0x2,0x1,0x1,0x0)>,
>                                <&dmac 0x256 0x10049c1c CH_CFG(0x0,0x0,0x1,0x0,0x2,0x1,0x1,0x0)>;
>                         dma-names = "tx", "rx";
>                         power-domains = <&cpg>;
>                         #sound-dai-cells = <0>;
>                         status = "disabled";
>                 };
>
> Please let me know your thoughts on this.

How will this work with (existing) drivers?
E.g. drivers/tty/serial/sh-sci.c:sci_request_dma_chan() already knows the
source and destination addresses.
The other CHCFG bits may be new, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
