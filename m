Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B04E48975D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 12:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244676AbiAJLZu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 06:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244744AbiAJLYw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 06:24:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF9AC061748;
        Mon, 10 Jan 2022 03:24:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38F5FA50;
        Mon, 10 Jan 2022 12:24:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641813888;
        bh=pT4kpZtRjG/XYUDv0R6rkcHFJD85Vbhdj6E1bYBn0QQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iJv3GtOIJzLQnGlmrJlUb4JaeqcWe23bhSeJBUkFwpTYdiay78V9m1UtRtJcbYW2C
         HZzpG+67fQw1DGo8Zjfh8CvmqAzoaJzksKfo8W1KZsxDuo/rt60otwWU1IbkSH7qFr
         0z0EmRl19G77ds5Yho/Asntw99Qg44bdYXjrgFaE=
Date:   Mon, 10 Jan 2022 13:24:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: Remove empty lvds endpoints
Message-ID: <YdwXd85SyKJ9Bqt2@pendragon.ideasonboard.com>
References: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXjeEmXmv4LJ5eTCGM+2hLCX5-QvYfGaY0vaaOyGXEahg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXjeEmXmv4LJ5eTCGM+2hLCX5-QvYfGaY0vaaOyGXEahg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

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

Me too :-)

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

While files are you referring to ?

> > base-commit: 2b534e90a1e31c7fc9536b512b72274cc3575f4c
> 
> Why does this depend on a commit in drm-next?
> DTS changes are supposed to go in through renesas-devel and soc.

Because it happens to have been developed there, that's all. There's no
specific reason.

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

Probably something completely unrelated that I had in my tree when
generating the series. You can likely ignore that, sorry for the noise.

-- 
Regards,

Laurent Pinchart
