Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9349B490AA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jan 2022 15:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbiAQOjs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jan 2022 09:39:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37166 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240019AbiAQOjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jan 2022 09:39:47 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21BB9596;
        Mon, 17 Jan 2022 15:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642430386;
        bh=3D0S8j+DLrEgC8YfibgQjlgxJKR+S5ED0SG0r3JAikQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TylAEn20+As0CQOET/l8gwfgdVcOMJo3rYfs1wAm0VlJgAukG0/y+IIcWfUeTLRaS
         JzyJJCXkPRYM8CWY08U2VKOMtD1Q0hlre/UHcy+pd93Yvo+F7/qex+8dw6RyxnMUr2
         rTvqMA6MIs3tc/I5wcp1Cfs5eo3FgtXcEFp+4t4o=
Date:   Mon, 17 Jan 2022 16:39:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add panel overlay for Draak and
 Ebisu boards
Message-ID: <YeV/pWU/o8leqre+@pendragon.ideasonboard.com>
References: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211212013351.595-4-laurent.pinchart+renesas@ideasonboard.com>
 <164242033029.10801.10154701138409780021@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164242033029.10801.10154701138409780021@Monstersaurus>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Jan 17, 2022 at 11:52:10AM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2021-12-12 01:33:51)
> > The Draak and Ebisu boards support an optional LVDS panel. One
> > compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
> > overlay.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/renesas/Makefile          |  1 +
> >  .../renesas/draak-ebisu-panel-aa104xd12.dts   | 32 +++++++++++++++++++
> >  2 files changed, 33 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> > index 982ca3e0e86f..5e831bd33828 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -76,3 +76,4 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
> >  dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
> >  
> >  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> > +dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
> > diff --git a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
> > new file mode 100644
> > index 000000000000..0c5dc3df5247
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Device Tree overlay for the AA104XD12 panel connected to LVDS1 on a Draak or
> > + * Ebisu board
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
> > +                       remote-endpoint = <&lvds1_out>;
> 
> I guess we can't use parameters in overlays yet? The LVDS reference
> seems to be the only difference between the two. But I guess even that
> might be hard to pass in as a parameter at boot, or run time...

Nobody is working on standardizing parametric overlays as far as I'm
aware :-( Support exists in the Rasperry Pi proprietary boot loader, it
could be used as a starting point, but we need someone to drive the
effort.

> > +               };
> > +       };
> > +};
> > +
> > +&lvds1 {
> > +       status = "okay";
> > +};
> > +
> > +&lvds1_out {
> > +       remote-endpoint = <&panel_in>;
> > +};

-- 
Regards,

Laurent Pinchart
