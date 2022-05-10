Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406AF521069
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 11:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237846AbiEJJSw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 05:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235954AbiEJJSv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 05:18:51 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBD6712E1;
        Tue, 10 May 2022 02:14:52 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id hh4so13069065qtb.10;
        Tue, 10 May 2022 02:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A15r4+EoT4EZyVbRMp20MyCJWBQTiIY9T0jy9XAyUCg=;
        b=kKgnXMA0woR0Gk3oqEREb6H8Yx+o1yONVy23XkIohYL4nAGFM/lLLp3XMdP0UlWNtx
         hGLM1xwTl2q/nuhpB/QmP/L/5pMRgVJMEYP1ba+ZSTgz5RQqODBDvCblC+kXU//88yYe
         zOGqZuewYP646F6qivNTzkmfiqme7iR8A4TvfXO5ds0h3VHkHaktChcd0z6Qbf8LGSF1
         ecDGDQXCr4IsWWo9mswh6Q3mmHnZLcr4Ia8M21DjzqzoRvDxauPK87TH0HfpSCVpjbjg
         /d59BLIplYDLEsP3IU2lSdqutgsfhAetGWcgF5z1mcIGsmqyVoNyz9EvRDzdp7qqtoBa
         V7yA==
X-Gm-Message-State: AOAM533sDSpic21lfmwfuyhCD3a5DcUS6C9m/KwsCdVrp/6JCAqYPkrx
        drpv9dkPbOtuWYzhrSw6OmOVm0wRRbm0rg==
X-Google-Smtp-Source: ABdhPJx1SPSCgiqGe2ex8QmEmRx1KNFqBXBFKOgh3G0DthXPGHeOxaPJEPdAoz8oGrqhcp6WRemxUA==
X-Received: by 2002:a05:622a:1cc:b0:2f3:e619:8088 with SMTP id t12-20020a05622a01cc00b002f3e6198088mr1439035qtw.261.1652174091815;
        Tue, 10 May 2022 02:14:51 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id a36-20020a05620a43a400b0069fc13ce212sm8203502qkp.67.2022.05.10.02.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 02:14:50 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id r11so29529245ybg.6;
        Tue, 10 May 2022 02:14:49 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr17702940ybu.604.1652174088988; Tue, 10
 May 2022 02:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220509154943.25422-1-miquel.raynal@bootlin.com>
 <20220509154943.25422-3-miquel.raynal@bootlin.com> <CAMuHMdUQafhSHA6vz2FP4=CLodEB3uK2p2W6fu_xK8kA+pMGFA@mail.gmail.com>
 <20220510110257.11ac55f1@xps13>
In-Reply-To: <20220510110257.11ac55f1@xps13>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 May 2022 11:14:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2KHuh2d_cw6xZEiZv+-v8P_YFfzxr2qLdC=HKaLr2ZQ@mail.gmail.com>
Message-ID: <CAMuHMdU2KHuh2d_cw6xZEiZv+-v8P_YFfzxr2qLdC=HKaLr2ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
To:     Miquel Raynal <miquel.raynal@bootlin.com>
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Miquel,

On Tue, May 10, 2022 at 11:03 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> geert@linux-m68k.org wrote on Tue, 10 May 2022 10:52:41 +0200:
> > On Mon, May 9, 2022 at 5:49 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > This NAND controller is part of a well defined power domain handled by
> > > the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> > > and exclusively use the runtime PM API to enable/disable the clocks.
> > >
> > > We still need to retrieve the external clock rate in order to derive the
> > > NAND timings, but that is not a big deal, we can still do that in the
> > > probe and just save this value to reuse it later.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

> > > @@ -1365,12 +1347,27 @@ static int rnandc_probe(struct platform_device *pdev)
> > >                 ret = devm_request_irq(&pdev->dev, irq, rnandc_irq_handler, 0,
> > >                                        "renesas-nand-controller", rnandc);
> > >                 if (ret < 0)
> > > -                       goto disable_eclk;
> > > +                       return ret;
> > >         }
> > >
> > >         ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> > >         if (ret)
> > > -               goto disable_eclk;
> > > +               return ret;
> > > +
> > > +       devm_pm_runtime_enable(&pdev->dev);
> > > +       ret = pm_runtime_get_sync(&pdev->dev);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       /* The external NAND bus clock rate is needed for computing timings */
> > > +       eclk = clk_get(&pdev->dev, "eclk");
> > > +       if (IS_ERR(eclk)) {
> > > +               ret = PTR_ERR(eclk);
> > > +               goto dis_runtime_pm;
> > > +       }
> > > +
> > > +       rnandc->ext_clk_rate = clk_get_rate(eclk);
> >
> > Personally, I would do this before requesting the interrupt.
> > But I guess it's fine to do that here, too.
>
> What do you mean by "do this"? If you are talking about getting the

Getting the clock (which could -EPROBE_DEFER, in theory) and its rate.

> rate of the clock it's only needed when initializing the timings which
> happens later in the probe path and has no relationship with the
> interrupts at all. Anyway, I will move all of that earlier so that we
> don't have a possible situation where the device is not clocked when
> accessing it.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
