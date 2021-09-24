Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9981241702A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 12:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245617AbhIXKRq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 06:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245629AbhIXKRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 06:17:44 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB29C061756;
        Fri, 24 Sep 2021 03:16:11 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id j195so4665913ybj.8;
        Fri, 24 Sep 2021 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=My9M0v7qJhbKsrz/7FTz5JGmb9fs1Ll7Beio5FnmHqc=;
        b=YXpeYDae0HLvjQhtS08y9UCK5rk2yskTekAF+77BlUR2G1BXDzQiQsChN/YVeBOmiw
         AD7G40dwZZbyVKZakxDb/XPn8pk0la1bPLuMvGI3YmXy7g9sA/DCra6PIdGERVWAGGox
         sUU9mJM5zklL7FItdg+4wNHHC3WGJ3ONSufasnNCaHUvO2+Nex/Y38zoBBm956bR1G7J
         tXAqkgXBVTEviU2uPPLunTqw7GtyBn+wu6u+21OOQr+rNEyIriTu9zf8jDi19Rv7T9b0
         QNX0V5HhIi5qsO9Oe8p7nvcGnWhnNbXLhzhJwMROGYOoxOucKhA/FJ5ciC7HN6zca9zT
         1eCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=My9M0v7qJhbKsrz/7FTz5JGmb9fs1Ll7Beio5FnmHqc=;
        b=NX+BMvZsPGgaRp1cdaOMtBGzVHCYzytXq0V8NYdOPnjay5JYsXn4xQp3n/fOxFvs87
         6t4Z68N/eKzFc8Mpm6Obnqxp+hELkCxYKEWqOaF1yTcjL3h5xNFEdo6jO19qbsXl60/e
         YMSLc6xP0thiu1HGY+99evHda+UVEeEUwahomD3se8UhepR/E00P7Ljq2Xo5EeeVO0ds
         T5jYaYp3jSKA8BaIq/G/O6lWRxK9l/gPYqGO7XY1FLRTwNWPwX4Za9joc+K241KLZD4S
         tHaALm1jPAC3QAso0h38KsfGfMPN7zjFXxFrrdwoGbHS5LDkq8x+u+JerJzZ+G008DY/
         lLeg==
X-Gm-Message-State: AOAM533OzPFHTv9Pwy80vwAHjbXKHhr65rn8NY4TtOFdkdjBidki/7rR
        VyPqjgMkC69OdmJWekmS05WxvBfa0jAZr3Cgh+q/10/HR2M=
X-Google-Smtp-Source: ABdhPJzOsCp59nNEvA0+FdeZHX2GiqipgQnOyqjACI1KSED6R6ANfZmlw+qLPmifqe/mnbjx/mN83lAochr9vEgr/xw=
X-Received: by 2002:a25:880f:: with SMTP id c15mr1028557ybl.543.1632478570530;
 Fri, 24 Sep 2021 03:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210922212049.19851-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWskGB9btFdnSy10862NeMSJtqOBvMeTxV14Ddzs7JzBA@mail.gmail.com>
In-Reply-To: <CAMuHMdWskGB9btFdnSy10862NeMSJtqOBvMeTxV14Ddzs7JzBA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 24 Sep 2021 11:15:44 +0100
Message-ID: <CA+V-a8uTNOh3CZYSscZcr24DQYO3eF7Ldb9FcYEg8LsiHFhpgw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable CANFD
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Fri, Sep 24, 2021 at 10:07 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Sep 22, 2021 at 11:21 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Enable CANFD on RZ/G2L SMARC platform.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > @@ -139,6 +153,32 @@
> >         pinctrl-0 = <&sound_clk_pins>;
> >         pinctrl-names = "default";
> >
> > +       can0_pins: can0 {
> > +               pinmux = <RZG2L_PORT_PINMUX(10, 1, 2)>, /* TX */
> > +                        <RZG2L_PORT_PINMUX(11, 0, 2)>; /* RX */
> > +       };
> > +
> > +       /* SW7 should be at position 2->3 so that GPIO8_CAN0_STB line is activated */
> > +       can0-stb {
> > +               gpio-hog;
> > +               gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
> > +               output-high;
>
> While this drives the STB signal correctly, I find it confusing.
> According to the datasheet, the STB signal is active-high, so it has to
> be pulled low to disable standby.
agreed.

> So to reflect the meaning of the STB line, I would write:
>
>         gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_HIGH>;
>         output-low;
>
will re-spin the patch 3/3 as above.

Cheers,
Prabhakar

> > +               line-name = "can0_stb";
> > +       };
> > +
> > +       can1_pins: can1 {
> > +               pinmux = <RZG2L_PORT_PINMUX(12, 1, 2)>, /* TX */
> > +                        <RZG2L_PORT_PINMUX(13, 0, 2)>; /* RX */
> > +       };
> > +
> > +       /* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
> > +       can1-stb {
> > +               gpio-hog;
> > +               gpios = <RZG2L_GPIO(42, 3) GPIO_ACTIVE_LOW>;
> > +               output-high;
>
> Likewise.
>
> > +               line-name = "can1_stb";
> > +       };
> > +
>
> The rest looks good to me, so with the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
