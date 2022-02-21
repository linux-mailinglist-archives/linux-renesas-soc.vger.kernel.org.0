Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B11194BE1EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377318AbiBUOKh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 09:10:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377334AbiBUOKh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 09:10:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359DB1EAC2;
        Mon, 21 Feb 2022 06:10:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30616482;
        Mon, 21 Feb 2022 15:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645452610;
        bh=aSIlbDL/J6e3p5bE2XO7uV7zmWzv7EZKF4BCxXEeiEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ktih+se3nlK+jtt+mucaOeyuYPaO1AHl94I2bn1GRQX4HMkdUgzBCnoC4fLAdrLAR
         jOSwHIPz/JqhJ3QdNgupTPLhxRrgrOHLedgUpSuVoi3MKWSGDDU2RUks2hePLpEJJQ
         id5uRbHVI8uNjEhmstzKDQf7YyjHKubEZaj7MSwg=
Date:   Mon, 21 Feb 2022 16:10:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: Remove empty lvds endpoints
Message-ID: <YhOdOHnz6wWGrfbb@pendragon.ideasonboard.com>
References: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXjeEmXmv4LJ5eTCGM+2hLCX5-QvYfGaY0vaaOyGXEahg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXjeEmXmv4LJ5eTCGM+2hLCX5-QvYfGaY0vaaOyGXEahg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 10, 2022 at 11:10:59AM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 29, 2021 at 8:18 PM Laurent Pinchart wrote:
> > Endpoints node must have a remote-endpoint property, as endpoints only
> > exist to model a link between ports. Drop the empty lvds endpoints from
> > SoC dtsi files, then should be instead declared in the board dts or in
> > overlays.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> I'm interested in hearing Rob's opinion about the general idea...

Let's see if Rob could find a few cycles to spare then :-)

> > ---
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 --
> >  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 --
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ----
> >  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 --
> >  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 --
> >  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 --
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 --
> >  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 --
> >  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 --
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 ----
> >  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ----
> >  11 files changed, 28 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > index 6f4fffacfca2..9a8c1bd923af 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -2771,8 +2771,6 @@ lvds0_in: endpoint {
> >                                 };
> >                                 port@1 {
> >                                         reg = <1>;
> > -                                       lvds0_out: endpoint {
> > -                                       };
> 
> As there are several DTS files that refer to this label, this change
> will break them?
> 
> > base-commit: 2b534e90a1e31c7fc9536b512b72274cc3575f4c
> 
> Why does this depend on a commit in drm-next?
> DTS changes are supposed to go in through renesas-devel and soc.
> 
> > prerequisite-patch-id: 98434eb22c020924bc338316e54a7b42ea339e9f
> > prerequisite-patch-id: ce261c9865255051f2c2107a930b0f15ce862703
> > prerequisite-patch-id: 500ab746415c5421e41128c2b0db35987d8d7a49
> > prerequisite-patch-id: ad2d5ad025f9cfa0dc453d7e0b2aa96b4514afd7
> > prerequisite-patch-id: ac76bcc0f7b278863e362db083a7d64bbd0bd030
> > prerequisite-patch-id: c7a7c3a6b9dbbae18a768160db70d7010ea71ca5
> 
> While Google does not index by commit ID or patch ID, at least the
> base-commit can be found easily in linux-next. But even with some
> scripting, the prerequisites cannot.  What are these prerequisites?
> Do you have lore links?

-- 
Regards,

Laurent Pinchart
