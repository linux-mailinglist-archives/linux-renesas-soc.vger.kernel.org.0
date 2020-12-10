Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1E02D553A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 09:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387534AbgLJIUa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 03:20:30 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42670 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732316AbgLJIUa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 03:20:30 -0500
Received: by mail-oi1-f194.google.com with SMTP id l200so4849624oig.9;
        Thu, 10 Dec 2020 00:20:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TaPHHMTSK/auXG+X2mOHMxp6LodsgMdXRI8sRszzevQ=;
        b=YZl8k+2jN6Edx2mSUcF/sMF2pW8Ppmqu7ywmNUlLktky+NQhGutLtS6/6R0qzTl4Xo
         hRkoc+lphjij54bc82dA2cyGlTPGDBGEmnROEcnaa5VKwBFgFJXf0IoeEvy+PaMUjjfl
         aKv6dIeic7SpDmNx+nkOwG+ZHBqXbBhV2QIHxc9SieXvrZyToAmDX2QGm3FOevK/V7vr
         dF+YkU4c+3i+QkuMVL9boKi2eLes2nokGCP3o50uXasUavqiRwr/aXmFqaaP69ca3AoU
         iQcBpenO0XdiScQvWTC2+Neh+i7ZS2PDgvw+3NiPUVWVWFTEOGokd0Plh1o2cv2cx519
         ZRew==
X-Gm-Message-State: AOAM532ATVW/hQs0h7xvg/uyFukKJi+T4vLxyktE0EBaj1MzFu7TTtgp
        JsVHrU6Wj9QZzhhNKneRacp53KiPv3Y+gnw4I1U=
X-Google-Smtp-Source: ABdhPJyxjpQ9By0aw9MLe5DrcQMDpZrvoHuSkwcjExaRyhjF+g3Y8o2p1B3O7nbO8eFzQmfolU0l8CnnPdJAs76/wso=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr4745926oib.54.1607588389125;
 Thu, 10 Dec 2020 00:19:49 -0800 (PST)
MIME-Version: 1.0
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
 <TY2PR01MB3692AE2EBAE6876F1CA26A34D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <f19f7c3cf1d25e55a40825d6048ab9134b7d3502.camel@fi.rohmeurope.com>
In-Reply-To: <f19f7c3cf1d25e55a40825d6048ab9134b7d3502.camel@fi.rohmeurope.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 09:19:38 +0100
Message-ID: <CAMuHMdVL5MrHr7P=WCN4vqLaD6km7TocC5FK_dNJdnTMV+YBwg@mail.gmail.com>
Subject: Re: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>
Cc:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Matti, Shimoda-san,

On Thu, Dec 10, 2020 at 8:33 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Thu, 2020-12-10 at 04:44 +0000, Yoshihiro Shimoda wrote:
> > > From: Geert Uytterhoeven, Sent: Wednesday, December 9, 2020 10:30
> > > PM
> > <snip>
> > > > --- a/drivers/mfd/bd9571mwv.c
> > > > +++ b/drivers/mfd/bd9571mwv.c
> > > >
> > > > @@ -182,6 +272,8 @@ static int bd9571mwv_probe(struct i2c_client
> > > > *client,
> > > >         product_code = (unsigned int)ret;
> > > >         if (product_code == BD9571MWV_PRODUCT_CODE_VAL)
> > > >                 bd->data = &bd9571mwv_data;
> > > > +       else if (product_code == BD9574MWF_PRODUCT_CODE_VAL)
> > > > +               bd->data = &bd9574mwf_data;
> > > >
> > > >         if (!bd->data) {
> > > >                 dev_err(bd->dev, "No found supported device
> > > > %d\n",
> > >
> > > While BD9571MWV and BD9574MWF can be distinguished at runtime,
> > > I think it would still be a good idea to document a
> > > "rohm,bd9574mwf"
> > > compatible value in the DT bindings, and let the driver match on
> > > that.
> >
> > In this driver point of view, we can use such the DT bindings,
> > however, in the board point of view, it's difficult to describe
> > which chip is installed on r8a77990-ebisu.dts. So, I'd like to
> > keep this runtime detection.

To clarify: I meant to document and add the compatible value, but
treat both compatible values the same in the driver, and still do runtime
probing.

> First of all - I don't want to insist changes here so my comment can be
> ignored. I would definitely like seeing the support for BD9574 in-tree!
>
> But as a 'nit':
> I don't know what are the difficulties you are referring to so it's
> hard for me to comment this. Without better understanding of board dts
> files - I think BD9574MWF should really have own compatible as I
> understood it is different from the BD9571MWV. Relying on product code
> probing sounds like something that may easily break when/if new
> variants are produced. ( I've seen new HW variants using the same
> ID information being produced in previous companies I've worked. Sure

Yes, this happens from time to time, unfortunately.

> ROHM wouldn't do this but still... :] ). And producing boards where DTS
> does not allow describing the correct components sounds like asking for
> a nose-bleed to me... If probing of IC type fails AND there is devices
> with wrong PMIC information burned in DT - then fixing it can be a
> nightmare. So I would really try make DTS files such that they can be

The issue we're facing is that older Ebisu-4D boards have BD9571, while
newer boards have BD9574.  The schematics say "BD9574MWF-M (tentative
ver:BD9571TL1_E3)", so it looks like both parts are pin-compatible
(ignoring missing pins for AVS, LDO1, LDO2, and LDO6 on BD9574).
Hence arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts has a device node
compatible with "rohm,bd9571mwv".  If we have runtime probing, we can
keep on using that for both variants.

> changed to match the actual board. (Perhaps introduce the compatible
> for BD9574MWF - make this driver to match both of the PMICs - leave the
> runtime probing here for now - and in parallel work with the DTS files
> so that eventually the probing can be removed(?) That was my 10 cents
> on this topic :] )

Exactly. Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
