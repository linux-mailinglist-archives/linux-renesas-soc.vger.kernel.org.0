Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22E13612BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 21:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234717AbhDOTJv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 15:09:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50858 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbhDOTJv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 15:09:51 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 452C189A;
        Thu, 15 Apr 2021 21:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618513766;
        bh=INJUqYChGzaADsZcMlE0KVTNy5xAuq64jBEaD2riYD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XFLQ5ymwmWOPUH4e++viERDpFMCmvRqLyVVjRCOoA3Wl3varwFEunZ2h3vKWoLEu0
         uXCQOyr8xYR9Gq5KJU6sQLDqqhpPdQOkZomFu6LIdkl8fWHnawvao5Ha2hsdRBh1ox
         jAvi/naiFHcU0yvsX7jFdOU8u3Yt3qdLnSVKa3D8=
Date:   Thu, 15 Apr 2021 22:09:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v4 4/7] arm64: dts: renesas: r8a77970: Add csi40 port@0
Message-ID: <YHiPZCjChv2iZ4/y@pendragon.ideasonboard.com>
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
 <20210415122602.87697-5-jacopo+renesas@jmondi.org>
 <YHhR/YR6Ecp6yU4D@pendragon.ideasonboard.com>
 <CAMuHMdWXM=0W_GbJpOqCUhTKzjaYu9S81M9u=j+8KM0sFG7Atw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWXM=0W_GbJpOqCUhTKzjaYu9S81M9u=j+8KM0sFG7Atw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 15, 2021 at 06:47:48PM +0200, Geert Uytterhoeven wrote:
> On Thu, Apr 15, 2021 at 4:47 PM Laurent Pinchart wrote:
> > On Thu, Apr 15, 2021 at 02:25:59PM +0200, Jacopo Mondi wrote:
> > > Declare port@0 in the csi40 device node and leave it un-connected.
> > > Each board .dts file will connect the port as it requires.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > The port exists at the hardware level, so including it here sounds good.
> > The DT binding even makes the port mandatory :-)
> 
> But the latter is subject to change?
> 
> [PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is not mandatory
> https://lore.kernel.org/linux-devicetree/20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se/

I've replied to that patch, it's not a good idea.

> > > --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > > @@ -1106,6 +1106,10 @@ ports {
> > >                               #address-cells = <1>;
> > >                               #size-cells = <0>;
> > >
> > > +                             port@0 {
> > > +                                     reg = <0>;
> > > +                             };
> > > +
> > >                               port@1 {
> > >                                       #address-cells = <1>;
> > >                                       #size-cells = <0>;

-- 
Regards,

Laurent Pinchart
