Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88993ACB53
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 14:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhFRMuk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 08:50:40 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:42593 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhFRMuk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 08:50:40 -0400
Received: by mail-vs1-f48.google.com with SMTP id l25so4872113vsb.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 05:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7yI/G2XBWO7r4y4HwKPFJth4lSh+L8e2nV7G0iq2sE=;
        b=VqK5wYK9BYK4t5hymb6oaF2sra/4dFOq6E+RlE7UDbcibF1kmbWgxG+/sOFB+2WKwQ
         hahqDirSqXd+9PWR47rbF10cKwP/th1pF5llh0A2Cw9OVlw+0y3XhenP/+qBmxFHtCNb
         Zo7WVxpiYZD3e3IpyT3EmDYk3vX4ttI/8lAmtxos6I5O6ESRMMjs7bl7uS+LhLL4Vuh4
         D0jvOvdAKna+wNtVKwzGamck5Ww15Y9bTUih5wFGD5s+u94BZEVSr1ANUzO63cYae8Um
         YsYqK70XE7IWKNrmfTl+y1tgUWkUNkTzG4p/gA3+c3xdcKOTNSIXR9SUQl1ctnweMGiS
         USWg==
X-Gm-Message-State: AOAM531UGnqvCzEiCOSt3ydlxOP/BBlvIkbV9qNn9ei9SAb5ZLIim0X0
        HKG/UvjURaRfPRS9atk1bsHEZ5T4qZLWWzA7hUl8PFOCeGs=
X-Google-Smtp-Source: ABdhPJxkQ2wGlymIQKni12Urlwo6YC9xh6Iccx9417XIGojasoUuM0SUUlIR4T2OBaZVjAT/zAXzLsLVB1cTqfTjA8I=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr6826262vsp.3.1624020509461;
 Fri, 18 Jun 2021 05:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180925163337.31212-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWX+HxXMB63BKpHcCh7fXAJRt9LfMFjbqM+zEvrK31MfQ@mail.gmail.com>
 <1451402408.292378.1624017668638@webmail.strato.com> <CAMuHMdV6TWUVwbBOfeDGTE28DUY609Nfd2bV3WU9+G4Ei-VfAA@mail.gmail.com>
 <YMyQbICEdv2Y7s3B@pendragon.ideasonboard.com>
In-Reply-To: <YMyQbICEdv2Y7s3B@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 14:48:18 +0200
Message-ID: <CAMuHMdVFncZic92+u+huODrAYH1=CcL1XD-QSNC0hDGb7ege3g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r8a77995: draak: Enable HDMI
 display output
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ulrich Hecht <uli@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Fri, Jun 18, 2021 at 2:24 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 18, 2021 at 02:07:48PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 18, 2021 at 2:01 PM Ulrich Hecht wrote:
> > > > On 06/18/2021 10:05 AM Geert Uytterhoeven wrote:
> > > > On Tue, Sep 25, 2018 at 6:34 PM Laurent Pinchart
> > > > <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > > > > From: Ulrich Hecht <uli+renesas@fpond.eu>
> > > > >
> > > > > Adds LVDS decoder, HDMI encoder and connector for the Draak board.
> > > > >
> > > > > The LVDS0 and LVDS1 encoders can use the DU_DOTCLKIN0, DU_DOTCLKIN1 and
> > > > > EXTAL externals clocks. Two of them are provided to the SoC on the Draak
> > > > > board, hook them up in DT.
> > > > >
> > > > > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > >
> > > > > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > > > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > >
> > > > > @@ -190,6 +225,43 @@
> > > > >
> > > > >         };
> > > > >
> > > > > +       hdmi-encoder@39 {
> > > > > +               compatible = "adi,adv7511w";
> > > > > +               reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
> > > > > +               reg-names = "main", "edid", "packet", "cec";
> > > > > +               interrupt-parent = <&gpio1>;
> > > > > +               interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> > > > > +
> > > > > +               /* Depends on LVDS */
> > > > > +               max-clock = <135000000>;
> > > > > +               min-vrefresh = <50>;
> > > >
> > > > Where do these two come from? They fail to validate with commit
> > > > cfe34bb7a770c5d8 ("dt-bindings: drm: bridge: adi,adv7511.txt: convert
> > > > to yaml").
> > > > I can't find where it is used in the driver, nor in the driver history.
> > >
> > > I have found a prototype patch in my archives that uses these
> > > properties. I guess the patch itself didn't make it into the final
> > > series, but the properties inadvertently did. I vaguely remember
> > > this was supposed to work around an issue with modes that use a
> > > higher clock than supported by one of the parts in the display
> > > pipeline.
> >
> > Thanks, I already suspected something like that...
>
> Sounds like a BSP attempt to model limitations of the DU and/or the PCB
> and implement them in the adv7511 driver. There's similar code in the
> VGA encoder driver that really doesn't belong there.
>
> > > I would say that if there are no issues with HDMI output, both the
> > > patch and the properties are obsolete.
> >
> > Anyone with a Draak to verify?
>
> I don't carry Ulrich's patch in my branch, and last time I checked, HDMI
> output was functional. Do you want me to retest ?

I guess no re-testing is needed, and the properties can just be removed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
