Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944D5521036
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 11:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbiEJJHH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 05:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238370AbiEJJHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 05:07:06 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FED2AD76F;
        Tue, 10 May 2022 02:03:04 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4D96FFF816;
        Tue, 10 May 2022 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652173382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kvSmQXPf6d/ybJwRZBOSyK1Ahdihg697cloZ8a3+FlA=;
        b=E6z4yXfFnbe7TIseAnbqONIabiLG0CYFKhWVHeYS0M1qwCCSRQ2HUFKsjdCRucV19Uk9uS
        y5fsn/ZS4PC0euz9ncUrEariqOIOqSRtOtEn/SEyJZEM6SgHCVu+8C8JClHf1/rmXhDjd1
        M1dM/9SMPsbRJ2rTp3lvcdzXwDLulHubTjE9H2dt8fRwgXWU4ukiUoHtf2WGlUXfw7qHAS
        ulaWFGr2WTQs3l5V64iHYYgE1vqBiD/CBEp2vdve6/nwCr+Rgk2oH93LltE7rs9cC5mH90
        kVXGsGDvWkGDowDCmFjS9DH7WGGHqOXhTVFjhcZxc+hPuptrw34VSTP4mSj/hg==
Date:   Tue, 10 May 2022 11:02:57 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
Message-ID: <20220510110257.11ac55f1@xps13>
In-Reply-To: <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
References: <20220509154943.25422-1-miquel.raynal@bootlin.com>
        <20220509154943.25422-3-miquel.raynal@bootlin.com>
        <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

geert@linux-m68k.org wrote on Tue, 10 May 2022 10:52:41 +0200:

> Hi Miquel,
>=20
> On Mon, May 9, 2022 at 5:49 PM Miquel Raynal <miquel.raynal@bootlin.com> =
wrote:
> > This NAND controller is part of a well defined power domain handled by
> > the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> > and exclusively use the runtime PM API to enable/disable the clocks.
> >
> > We still need to retrieve the external clock rate in order to derive the
> > NAND timings, but that is not a big deal, we can still do that in the
> > probe and just save this value to reuse it later.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c =20
>=20
> > @@ -1335,29 +1336,10 @@ static int rnandc_probe(struct platform_device =
*pdev)
> >         if (IS_ERR(rnandc->regs))
> >                 return PTR_ERR(rnandc->regs);
> >
> > -       /* APB clock */
> > -       rnandc->hclk =3D devm_clk_get(&pdev->dev, "hclk");
> > -       if (IS_ERR(rnandc->hclk))
> > -               return PTR_ERR(rnandc->hclk);
> > -
> > -       /* External NAND bus clock */
> > -       rnandc->eclk =3D devm_clk_get(&pdev->dev, "eclk");
> > -       if (IS_ERR(rnandc->eclk))
> > -               return PTR_ERR(rnandc->eclk);
> > -
> > -       ret =3D clk_prepare_enable(rnandc->hclk);
> > -       if (ret)
> > -               return ret;
> > -
> > -       ret =3D clk_prepare_enable(rnandc->eclk);
> > -       if (ret)
> > -               goto disable_hclk;
> > -
> >         rnandc_dis_interrupts(rnandc); =20
>=20
> This touches the hardware, so the device must be operational.
> Hence please move the pm_runtime_*() calls up, to make sure the device
> is accessible.
> Sorry for missing that before.

Oh crap, I moved the pm runtime calls below to reduce the amount of
error handling but I clearly overlooked that function call here.
=20
> >         irq =3D platform_get_irq_optional(pdev, 0);
> >         if (irq =3D=3D -EPROBE_DEFER) {
> > -               ret =3D irq;
> > -               goto disable_eclk;
> > +               return irq;
> >         } else if (irq < 0) {
> >                 dev_info(&pdev->dev, "No IRQ found, fallback to polling=
\n");
> >                 rnandc->use_polling =3D true;
> > @@ -1365,12 +1347,27 @@ static int rnandc_probe(struct platform_device =
*pdev)
> >                 ret =3D devm_request_irq(&pdev->dev, irq, rnandc_irq_ha=
ndler, 0,
> >                                        "renesas-nand-controller", rnand=
c);
> >                 if (ret < 0)
> > -                       goto disable_eclk;
> > +                       return ret;
> >         }
> >
> >         ret =3D dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> >         if (ret)
> > -               goto disable_eclk;
> > +               return ret;
> > +
> > +       devm_pm_runtime_enable(&pdev->dev);
> > +       ret =3D pm_runtime_get_sync(&pdev->dev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       /* The external NAND bus clock rate is needed for computing tim=
ings */
> > +       eclk =3D clk_get(&pdev->dev, "eclk");
> > +       if (IS_ERR(eclk)) {
> > +               ret =3D PTR_ERR(eclk);
> > +               goto dis_runtime_pm;
> > +       }
> > +
> > +       rnandc->ext_clk_rate =3D clk_get_rate(eclk); =20
>=20
> Personally, I would do this before requesting the interrupt.
> But I guess it's fine to do that here, too.

What do you mean by "do this"? If you are talking about getting the
rate of the clock it's only needed when initializing the timings which
happens later in the probe path and has no relationship with the
interrupts at all. Anyway, I will move all of that earlier so that we
don't have a possible situation where the device is not clocked when
accessing it.

>=20
> > +       clk_put(eclk);
> >
> >         rnandc_clear_fifo(rnandc);
> > =20
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds


Thanks,
Miqu=C3=A8l
