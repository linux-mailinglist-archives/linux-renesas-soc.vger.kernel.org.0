Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66083A0D02
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 09:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236912AbhFIHDn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 03:03:43 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:43748 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbhFIHDn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 03:03:43 -0400
Received: by mail-vs1-f44.google.com with SMTP id s22so12305917vsl.10;
        Wed, 09 Jun 2021 00:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nPGO9/KeQ6w5z6ANe/Ck93Gtpb7H7AIw4HClfuQsFoo=;
        b=gfUfk/M9ZiaEH6d00jzUW5HkxmUYg+9z12QXae0gpi9LhvI8iYZglgL7TGOxkbWRwY
         1A1zd5vzyHjTaaNcwwFic6wBsbUxcCqPGW/NWzHRRJnJ1U5jpXCXXC8m2B7jSRQx4UD0
         YHimnYnkYLOOZysuMZVuXG3tpj7rD5NzhQkkANaPbZwUWblCx9C999A5BRekBQLrckuV
         j6mMe2hDMgnl8mVqMOGy3jvtQyxeDRir5GoXaowfZnGzlucD2NAf69JwWS17BO4rvZQt
         aICZ96Su9FNwszMjC0vhGnuqMjT0MCwdc1IG7EGDMEyTh3RLn3aU2JnCOxmSu0oXru76
         CgOQ==
X-Gm-Message-State: AOAM5310ClW0Vh+5aEeBYaRFT5z/qy0I7uIWYca1SiqvQppIzakhodP8
        rAaOYBkmNH0pgp5eYLFJpOgrS8+6OHZjUu4qt28=
X-Google-Smtp-Source: ABdhPJxBssBLQH4Oyat2dIV6cv0p73zA6BcP2IGB+Q2mCpR4KfIXGirrxOnXNb/TVnJ5/pLQtR73NbH4+H+nNqXUZU0=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr3842919vss.18.1623222093214;
 Wed, 09 Jun 2021 00:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210603221758.10305-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <OS0PR01MB592232BFAF59D5C81CCBE6C7863B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592232BFAF59D5C81CCBE6C7863B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 09:01:21 +0200
Message-ID: <CAMuHMdWCVsMOnURjS8BP9KW=nYW6q9hEfdb_x5_hLei=1DWp3g@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jun 4, 2021 at 3:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: [PATCH v2 11/12] arm64: dts: renesas: Add initial DTSI for
> > RZ/G2{L,LC} SoC's
> >
> > Add initial DTSI for RZ/G2{L,LC} SoC's.
> >
> > File structure:
> > r9a07g044.dtsi  => RZ/G2L family SoC common parts r9a07g044l1.dtsi =>
> > Specific to RZ/G2L (R9A07G044L single cortex A55) SoC
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi

> > +             cpg: clock-controller@11010000 {
> > +                     compatible = "renesas,r9a07g044-cpg";
> > +                     reg = <0 0x11010000 0 0x10000>;
>
> What about WDTOVF_RST(0xB10) and WDTRST_SEL(0xB14) registers, this registers to be handled by WDT driver.
> Unfortunately it is in CPG block.
>
> So do we need to map the entire CPG registers or up to 0xB00?
>
> Geert, Prabhakar: Any thoughts?

As the registers are part of the CPG block, I think they should be
covered by the CPG node.  You can handle them in the CPG driver, through
functions called from the WDT driver (cfr. rcar_rst_read_mode_pins()).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
