Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B0B490A94
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jan 2022 15:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234662AbiAQOhU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jan 2022 09:37:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbiAQOhU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 09:37:20 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFC67596;
        Mon, 17 Jan 2022 15:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642430238;
        bh=u2+aYAumvOB7Ig8ofv93mYXrMSiR+CQIzlWpljIOtfM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eCqdqWW5NGzNNUczMBxBySUjFvEiff29gI/Q9U8N9zBhVtrsB4GuYq6tW8J+iTsJC
         QTFenLZMstTkjG+1FJESyUj6Mp/eNQLTkt48iax3D0TMJKeqAtcfad3xIKJd07boHK
         sXaegWZ9wL/FCBukvqAGDUWf3cZd+F5QUjvGmxbo=
Date:   Mon, 17 Jan 2022 16:37:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: Add panel overlay for
 Salvator-X(S) boards
Message-ID: <YeV/Egsq3ZyBb1v3@pendragon.ideasonboard.com>
References: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211212013351.595-3-laurent.pinchart+renesas@ideasonboard.com>
 <164241995870.10801.12606918126467572976@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164241995870.10801.12606918126467572976@Monstersaurus>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Jan 17, 2022 at 11:45:58AM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2021-12-12 01:33:50)
> > The Salvator-X and Salvator-XS boards support an optional LVDS panel.
> > One compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
> > overlay.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/renesas/Makefile          |  2 ++
> >  .../dts/renesas/salvator-panel-aa104xd12.dts  | 32 +++++++++++++++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> > index d1c5c21d8d14..982ca3e0e86f 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -74,3 +74,5 @@ dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
> >  dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
> >  
> >  dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
> > +
> > +dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> 
> dts/renesas/ is quite busy with platform support already.  If overlays
> are added which could theoretically be anynumber of external devices ...
> should they be under a sub-directory here? I think it would make make
> overlays both easier to identify, and easier to find.

I don't mind. I'd like to know Rob's opinion on this.

I would also prefer naming the device tree overlay sources .dtso, but
that doesn't seem to have gained any traction upstream.

> > diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
> > new file mode 100644
> > index 000000000000..ca2d579fe42f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Device Tree overlay for the AA104XD12 panel connected to LVDS0 on a
> > + * Salvator-X or Salvator-XS board
> > + *
> > + * Copyright 2021 Ideas on Board Oy
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&{/} {
> > +#include "panel-aa104xd12.dtsi"
> > +};
> > +
> > +&{/panel} {
> > +       backlight = <&backlight>;
> > +
> > +       port {
> > +               panel_in: endpoint {
> > +                       remote-endpoint = <&lvds0_out>;
> 
> Of course, overlay are always going to be very platform specific though
> ...
> 
> Which I guess is why you have the panel itself broken out which seems
> like a good idea, as that could then be used by multiple platoforms? (at
> least within the renesas structure so far)

It can be used with any Salvator-X(S) board, yes.

> Seems like overlays are still a pain ;-)

Not more painful that patching the .dts to enable the panel :-)

> > +               };
> > +       };
> > +};
> > +
> > +&lvds0 {
> > +       status = "okay";
> > +};
> > +
> > +&lvds0_out {
> > +       remote-endpoint = <&panel_in>;
> > +};

-- 
Regards,

Laurent Pinchart
