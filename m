Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5A849D226
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 19:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237240AbiAZS6g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 13:58:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:59724 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiAZS6f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 13:58:35 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D254478;
        Wed, 26 Jan 2022 19:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643223514;
        bh=rvsqL/3XvWs9plwH/YhVRZkIJ3zfYCZfStAlgtWaVeM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hs8VbJNGEA3dP409dMSPg52YiEOwzcbFra0S4u6Rkzi4ieTR6wBn9ADPrTHXRl7KM
         DFRsdpZu4rhheNtPPsQFU4azEGV3bOGE4AIgVNplrqMA4sq452zR2pRJZ0OrcJguCy
         YodkN5e4rcyqzBWD+jhni5Xrh6S3uanJNWE6zWOM=
Date:   Wed, 26 Jan 2022 20:58:15 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel
 .dtsi for overlay support
Message-ID: <YfGZx9qHQdF8TzcT@pendragon.ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWWRLdm+dAmso0dgf5QPqqV=txH-4Tryfm0USp7jZdbkw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Jan 26, 2022 at 01:18:56PM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 29, 2021 at 8:31 PM Laurent Pinchart wrote:
> > The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
> > boards as an optional external panel. It is described in the
> > arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
> > DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
> > board device trees, with other minor modifications, to enable the panel.
> >
> > This is however not how external components should be modelled. Instead
> > of modifying the board device tree to enable the panel, it should be
> > compiled as a DT overlay, to be loaded by the boot loader.
> >
> > Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
> > declaring a panel node only, without hardcoding its path. Overlay
> > sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.
> >
> > This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
> > is currently unused. As overlay support for this panel has only been
> > tested with Gen3 hardware, and Gen2 support will require more
> > development, move the file to arch/arm64/boot/dts/renesas/.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
> 
> > - * Copyright (C) 2014 Renesas Electronics Corp.
> 
> > +++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> 
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> 
> Shouldn't you keep the year? Not much has changed.

Indeed.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I see you've reviewed the whole series. Can you pick it up ?

-- 
Regards,

Laurent Pinchart
