Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C24B319B4C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2020 19:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732262AbgDARhs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Apr 2020 13:37:48 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44522 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgDARhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Apr 2020 13:37:48 -0400
Received: by mail-oi1-f193.google.com with SMTP id v134so192760oie.11;
        Wed, 01 Apr 2020 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zsQ+CdOVb24V2BAprd8p1XllEy9+EN0Dhep/xWpJ87Q=;
        b=ajprIKKwv+dueHWTPMNqkQe2LuNgg4lh96IinPEFHmrCeJTFtViEZUxW9z2QWE/PDH
         Sx2D3ZDf1DwThSCl3I+xZUXxOdQM3YS1LnSnwaYyvUYYoH36qP/eq5tzoUwnhHdBX8Yn
         su38DI78spLbvC8/1PSh6bzXv0uCioZLfkNVZpHiWsYMnzPdt2Clt8yVEXQw1zdIFrRV
         lvA9OQ5fuHszWv7f+yfgmhzfwTdEK2OwfBNcOVcnM12x5l2e7gDjIcq2isr/61mT7f6U
         7f9cfk1IiIY4ss1cNbtcbQjYupvAkuPlgDLmbUqg5KQ4+DbjusR80Fpb129eS5AwN/u4
         1Bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zsQ+CdOVb24V2BAprd8p1XllEy9+EN0Dhep/xWpJ87Q=;
        b=KHYrTz1eVv6O5+hVfSgMtVKGg7+mIuixqY0jb4rIOGU5Bf1Ef/21M+StWaVid2fXaP
         L9eioU5321tBWAqwBBftu2/IxM5JyZIXYLBrxyOXdFcANZfowbFMMStomE5F4k9XO6/u
         CeS/MuR2IgHWW48I2MEjwiB1uFtiSRwfwYhRl4SByQ+EMsV2QeWSf+SW1XrHYwQbp/Yb
         J2uC0de5q+AafCKL9AZr1eX/Qd7ww7mYFx325W8ZZytaLTAS8iq93tRF+15tMffQkjNa
         G6cDEt3h0asMixRnAkg3SzlTcHBd1QZsrRUuHwAJSDI1jXCsfR92CbIBbJF6awMe8DiM
         qVTA==
X-Gm-Message-State: AGi0PubgAEpbnD56REQg/eMudRorwKAP++DGSQgyuQzBL2YEXmVTELnm
        PkxJKgC0gZKoKxz6oeJ+OY7AO1TMsdDSdW4BXjU=
X-Google-Smtp-Source: APiQypLVoagopL2LC5fv3WBtfUn4dJ6lfyRk+nZW8iJ4g+qJWR3D3El0wlnEgwGCNQ77KzGiyo/Iso2KZOY63vUG27E=
X-Received: by 2002:aca:cf0d:: with SMTP id f13mr3508187oig.162.1585762666999;
 Wed, 01 Apr 2020 10:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <1584886352-4132-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXhi_1rxpB3zXO+KwtY+36dh+_O8NqVfyLs5mU1+Vy6Og@mail.gmail.com>
In-Reply-To: <CAMuHMdXhi_1rxpB3zXO+KwtY+36dh+_O8NqVfyLs5mU1+Vy6Og@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 1 Apr 2020 18:37:20 +0100
Message-ID: <CA+V-a8ujOD1k+Oc2f+tSHPvt128oO9hT3zEFHghnxq5RAOMb7w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a774c0-cat874: Add support for
 AISTARVISION MIPI Adapter V2.1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.


On Wed, Apr 1, 2020 at 10:45 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Sun, Mar 22, 2020 at 3:13 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > This patch adds support for AISTARVISION MIPI Adapter V2.1 board connected
> > to G2E board. Common file aistarvision-mipi-adapter-2.1.dtsi is created
> > which have the camera endpoint nodes for imx219 and ov5645 so that this can
> > be re-used with other G2x platforms.
> >
> > r8a774c0-ek874-mipi-2.1.dts file enables the required VIN/CSI nodes and by
> > default ties ov5645 camera endpoint to CSI2.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Changes for v2:
> >  * Dropped #{address,size}-cells
> >  * Dropped unit address and reg for port
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> > @@ -0,0 +1,75 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the Silicon Linux RZ/G2E 96board platform (CAT874)
> > + * connected with aistarvision-mipi-v2-adapter board
> > + *
> > + * Copyright (C) 2020 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +#include "r8a774c0-ek874.dts"
> > +#define MIPI_PARENT_I2C i2c3
> > +#include "aistarvision-mipi-adapter-2.1.dtsi"
> > +
> > +/ {
> > +       model = "Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875) with aistarvision-mipi-v2-adapter board";
> > +       compatible = "si-linux,cat875", "si-linux,cat874", "renesas,r8a774c0";
> > +};
> > +
> > +&i2c3 {
> > +       status = "okay";
> > +};
> > +
> > +&vin4 {
> > +       status = "okay";
> > +};
> > +
> > +&vin5 {
> > +       status = "okay";
> > +};
> > +
> > +&csi40 {
> > +       status = "okay";
> > +
> > +       ports {
> > +               port {
> > +                       csi40_in: endpoint {
> > +                               clock-lanes = <0>;
> > +                               data-lanes = <1 2>;
> > +                               remote-endpoint = <&ov5645_ep>;
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +&ov5645 {
> > +       enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
> > +       reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
> > +
> > +       clocks = <&cpg CPG_MOD 716>;
>
> I'm still a bit puzzled here.
>
> CPG_MOD 716 is the CSI40 module clock, which runs at 25 MHz, and is
> presumably output to the CSI0_CLKP/N pair? Or is its rate controlled
> by the CSI driver?
> On the MIPI board[*], that signal becomes MIPI1_CP/N.
> However, the MIPI board also has a "Clock Source Selection" header,
> which allows you to choose one of:
>   1. The fixed 24 MHz crystal, which is apparently used for the imx219
>      camera, as described by imx219_clk above, and matches the wanted
>      clock rate specified below?
>   2. CSI1_CLK,
>   3. CSI2_CLK.
> The last two become CLK0/1 on the CAT874 board, which are driven by
> TPU0TO0/1.
>
Yes my bad for not looking into this earlier, for both ov5645 and
imx219 I do short
pins 3-4 and 5-6 of J14, so for both the sensors the clocks should be
fixed clock
of 24Mhz, so I changed it imx219_clk to osc25250_clk and passed the same to
ov5645 node. (imx219 sensor can take in a external clock from 6-27Mhz [2])

> Which setting do you use for the ov5645 camera?
>
> > +       clock-frequency = <24000000>;
>
> After your patch for the ov5645 driver, this should be replaced by
> assigned-clock-rates?
>
After v4 [1] it was decided that the frequency should be set by driver itself,
so I'll be revisiting ov5645 driver.

[1] https://patchwork.linuxtv.org/patch/62185/
[2] https://publiclab.org/system/images/photos/000/023/294/original/RASPBERRY_PI_CAMERA_V2_DATASHEET_IMX219PQH5_7.0.0_Datasheet_XXX.PDF

Cheers,
--Prabhakar

> The rest looks good to me, but I'm not a multi-media/camera expert.
>
> [*] https://github.com/Kevin-WSCU/96Boards-Camera
>
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
