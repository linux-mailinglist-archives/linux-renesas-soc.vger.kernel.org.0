Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FFC3ACAC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 14:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhFRM0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 08:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbhFRM0t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 08:26:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20CCC061574
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 05:24:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D5E83F0;
        Fri, 18 Jun 2021 14:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624019075;
        bh=PIMpLBIVXVDppMCIxwV57kcqIXHF1sTevb67khDBMic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZLk+LWRtEx96zxrraWVfMNLaY9BP1Xjoa16cQfBSjrHMmn1bxI5RUlodAUO42b0yD
         SumnyZxJQes752jdABhLDfuPgofPUXTkBDJejdISjQNk4PxoVsSE7q8R/igfulzDoC
         peu6pT565uYWzqStTprElpHg5WnSv0nmSMFscJa8=
Date:   Fri, 18 Jun 2021 15:24:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 4/4] arm64: dts: renesas: r8a77995: draak: Enable HDMI
 display output
Message-ID: <YMyQbICEdv2Y7s3B@pendragon.ideasonboard.com>
References: <20180925163337.31212-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180925163337.31212-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWX+HxXMB63BKpHcCh7fXAJRt9LfMFjbqM+zEvrK31MfQ@mail.gmail.com>
 <1451402408.292378.1624017668638@webmail.strato.com>
 <CAMuHMdV6TWUVwbBOfeDGTE28DUY609Nfd2bV3WU9+G4Ei-VfAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdV6TWUVwbBOfeDGTE28DUY609Nfd2bV3WU9+G4Ei-VfAA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Fri, Jun 18, 2021 at 02:07:48PM +0200, Geert Uytterhoeven wrote:
> On Fri, Jun 18, 2021 at 2:01 PM Ulrich Hecht wrote:
> > > On 06/18/2021 10:05 AM Geert Uytterhoeven wrote:
> > > On Tue, Sep 25, 2018 at 6:34 PM Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > > > From: Ulrich Hecht <uli+renesas@fpond.eu>
> > > >
> > > > Adds LVDS decoder, HDMI encoder and connector for the Draak board.
> > > >
> > > > The LVDS0 and LVDS1 encoders can use the DU_DOTCLKIN0, DU_DOTCLKIN1 and
> > > > EXTAL externals clocks. Two of them are provided to the SoC on the Draak
> > > > board, hook them up in DT.
> > > >
> > > > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> > >
> > > > @@ -190,6 +225,43 @@
> > > >
> > > >         };
> > > >
> > > > +       hdmi-encoder@39 {
> > > > +               compatible = "adi,adv7511w";
> > > > +               reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
> > > > +               reg-names = "main", "edid", "packet", "cec";
> > > > +               interrupt-parent = <&gpio1>;
> > > > +               interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
> > > > +
> > > > +               /* Depends on LVDS */
> > > > +               max-clock = <135000000>;
> > > > +               min-vrefresh = <50>;
> > >
> > > Where do these two come from? They fail to validate with commit
> > > cfe34bb7a770c5d8 ("dt-bindings: drm: bridge: adi,adv7511.txt: convert
> > > to yaml").
> > > I can't find where it is used in the driver, nor in the driver history.
> >
> > I have found a prototype patch in my archives that uses these
> > properties. I guess the patch itself didn't make it into the final
> > series, but the properties inadvertently did. I vaguely remember
> > this was supposed to work around an issue with modes that use a
> > higher clock than supported by one of the parts in the display
> > pipeline.
> 
> Thanks, I already suspected something like that...

Sounds like a BSP attempt to model limitations of the DU and/or the PCB
and implement them in the adv7511 driver. There's similar code in the
VGA encoder driver that really doesn't belong there.

> > I would say that if there are no issues with HDMI output, both the
> > patch and the properties are obsolete.
> 
> Anyone with a Draak to verify?

I don't carry Ulrich's patch in my branch, and last time I checked, HDMI
output was functional. Do you want me to retest ?

-- 
Regards,

Laurent Pinchart
