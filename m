Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CD33B1C7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 16:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhFWObq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 10:31:46 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:37499 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbhFWObp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 10:31:45 -0400
Received: by mail-vk1-f177.google.com with SMTP id o198so551041vkc.4;
        Wed, 23 Jun 2021 07:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4zLP8Lzz+0qOLc6xIklg3T8AfAgg7V88EpKSHAjjsNY=;
        b=VwlRDXQhFReFAB4NqYHCDs7uFtBfAknzupf2ycUzsCxSimlM6qYoY5vFVZpzP8UGjd
         bmr2wk0D319GN08fkx5Qi0qEZKoZYETp/8CUa+7TwsZmntmiYGM/diOrxtfzCoYYag6M
         pRvIs4YhUZu7cVs4ZWgzzgAVKxvCYwlwDhXMwAgBHKZSTHAahquhUjlKmWk3gkh7tIQE
         HZ1jswNQO27l/37PiZb5rfR9R3uEqhGG0FFv1FlytGJmb2v+yNsQ3HrRzh2u3a/MVR6i
         D6wSrT8BaBJPMyWKH+TnpzZg589ZzJkQkzD5JS8PkXyO2M8LA1Xwukb7Jqhc+oOj3Sye
         HFGw==
X-Gm-Message-State: AOAM532duGJF5hjWRlVGuRk657gyhzzCUD1mddQEbbY5jjBxPL9nMYRx
        MhD1Mbi0azKt/NgNOvMj5JUyC2kiPit+zqeoY70=
X-Google-Smtp-Source: ABdhPJwKQtxd9FI1MugpOvBaepnBWwy2HkNEuTC9CSN+34BNYMxIsa2iKwG2XysCM5/jB0JFoMhjcf0gJS7M4lhpZXo=
X-Received: by 2002:a1f:1a41:: with SMTP id a62mr337115vka.5.1624458566857;
 Wed, 23 Jun 2021 07:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-2-biju.das.jz@bp.renesas.com> <20210622165851.GA3840386@robh.at.kernel.org>
 <OS0PR01MB5922ECC2B573F1F8E170744F86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAL_JsqK_6_LUD-ffkDCuDEds2RiYftJfynZyPN4io3Lt3MnQ4g@mail.gmail.com>
In-Reply-To: <CAL_JsqK_6_LUD-ffkDCuDEds2RiYftJfynZyPN4io3Lt3MnQ4g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 16:29:15 +0200
Message-ID: <CAMuHMdV0YrdUL6WGBTwxi1jQvakfmKNTB-8dv1LcAqMz-w356g@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L USB
 PHY Control bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Wed, Jun 23, 2021 at 4:13 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Jun 23, 2021 at 7:38 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L
> > > USB PHY Control bindings
> > >
> > > On Mon, Jun 21, 2021 at 10:39:33AM +0100, Biju Das wrote:
> > > > Add device tree binding document for RZ/G2L USB PHY control driver.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > > +        compatible = "renesas,r9a07g044-usbphyctrl",
> > > > +                     "renesas,rzg2l-usbphyctrl";
> > > > +        reg = <0x11c40000 0x10000>;
> > > > +        clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> > > > +        resets = <&cpg R9A07G044_USB_PCLK>;
> > > > +        power-domains = <&cpg>;
>
> Also, are these all resources of the usbphyctrl block and not just
> resources you happen to want in the driver? For example, the
> power-domain should be the power island that this block resides in.

It's a clock domain, not a power area: the block goes into power-save
mode by stopping the module clock controlled by the CPG.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
