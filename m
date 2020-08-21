Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F8E24D6D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 16:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgHUOBZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 10:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgHUOBW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 10:01:22 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FA8C061573;
        Fri, 21 Aug 2020 07:01:22 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id a34so1081291ybj.9;
        Fri, 21 Aug 2020 07:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jw01XlkZuO1lBRa3ozBQbunEgaoyU0nIhFJxWLCaKKw=;
        b=MZYyfGkwxqet+LIKS37OT1iprToOJ/dwyf/SF/td+iRm9s2FgIuVLvusrR0L4eN0tN
         Q7s+QK2Zee28lz5+3Z633qYxtYB23vl9N+F19LevUsoza9ylA+UmpE0taoTvggPSaflz
         L5+bSA49fnMUra1QhgHGWTWDlWtP+Hs2MdCEYxCkkvzeligvUMxOSX4LZpSNoumO6kC4
         mxMnzk2i2t3qh7rgkXpAEd2V2aclL4Ou5J/r6wxG7/C6rN4Y7IXstl+qEqdc+hEe4D55
         OWQHW5v+FpOQeU1HCl3JFK+HUCnw6xA+s8oXti293C2SE/rBF+K5B3yeGO2mlr0mHQ6b
         r6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jw01XlkZuO1lBRa3ozBQbunEgaoyU0nIhFJxWLCaKKw=;
        b=UNoJwq6ZGrQeUFJ1MeP+TpXHHaeT3ZExeAwYceUFDewU8Wuka9moRYNMQkxQ1GYAaQ
         L60cxxLFkQNq9isUWLrqAiPnY1Ww84RGrS4aEpl3BhvrYgA7GTV4unsOQ0v8nBCxN6Mv
         DHpEwzlaSy8drWTlG8N0RCJoxzEIstgFE0NMC7+VVatQtqlScEL8t46YWNf47cYGzgXM
         7k/aQvWFUuR7+DJqkXXejBQFIQk+lO5xcxUhRloNHy2fA+aY0pAH/64eLdNMn9YrdyZa
         AxXYHrY3HuSoabf43GWP3syLvAL/F1J+TrLxKuUB8yOZXPHncO7KHTT7gLVNsQVJ5KCe
         Uwdg==
X-Gm-Message-State: AOAM533/F1w5FDH3IuPLZ7y+IXTwNjSTIAifKCcM2hsfFiLHyN/hbgeH
        lFoyDd0TUpNpI1OSo4qrRqoFavUFrCQgsZbNcws=
X-Google-Smtp-Source: ABdhPJwrn7PoYxKIN5mQSBTB2hrhv1LQJ6Tmd/jaX3wqgNKylI4z5b+QmwAMppF2FJIgyyrU6GyU5izHH/3uDRToysc=
X-Received: by 2002:a25:e712:: with SMTP id e18mr3686224ybh.395.1598018481678;
 Fri, 21 Aug 2020 07:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200816193316.7641-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWVOv3LC_wWi1r9EHtnmT=w8d1HgDTP3aPD7uEZcb5ZYg@mail.gmail.com>
In-Reply-To: <CAMuHMdWVOv3LC_wWi1r9EHtnmT=w8d1HgDTP3aPD7uEZcb5ZYg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 Aug 2020 15:00:55 +0100
Message-ID: <CA+V-a8skSHQCh3Ng68APvAfi_OeHq1QOWgsRu8Ghay=FOPC7-g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: r8a7742-iwg21m: Add SPI NOR support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Fri, Aug 21, 2020 at 2:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Sun, Aug 16, 2020 at 9:33 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add support for the SPI NOR device used to boot up the system
> > to the System on Module DT.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21m.dtsi
>
> > @@ -70,4 +80,28 @@
> >                 groups = "mmc1_data4", "mmc1_ctrl";
> >                 function = "mmc1";
> >         };
> > +
> > +       qspi_pins: qspi {
> > +               groups = "qspi_ctrl", "qspi_data2";
> > +               function = "qspi";
> > +       };
> > +};
> > +
> > +&qspi {
> > +       pinctrl-0 = <&qspi_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       status = "okay";
> > +
> > +       /* WARNING - This device contains the bootloader. Handle with care. */
> > +       flash: flash@0 {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
>
> #{address,size}-cells are not needed, unless you list legacy partitions
> (i.e. partitions not contained in a "partitions" container).
>
Agreed will drop it.

> > +               compatible = "sst,sst25vf016b", "jedec,spi-nor";
> > +               reg = <0>;
> > +               spi-max-frequency = <50000000>;
> > +               m25p,fast-read;
> > +               spi-cpol;
> > +               spi-cpha;
>
> Perhaps you want to add the partition layout, too?
>
will do.

> > +       };
> >  };
>
> With the above fixed/clarified:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
Thank you. I shall post this lone patch fixing the above.

Cheers,
Prabhakar

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
