Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6812DB16E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Dec 2020 17:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbgLOQ2Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 11:28:24 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:53229 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729543AbgLOQ2X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 11:28:23 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 8F5011BF204;
        Tue, 15 Dec 2020 16:27:37 +0000 (UTC)
Date:   Tue, 15 Dec 2020 17:27:48 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support
 for 8-bit ov7725 sensors
Message-ID: <20201215162748.2pz6ujwwwdgkyoyv@uno.localdomain>
References: <20201126103053.29881-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201126103053.29881-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201215114949.teyhlmyhejck7jw2@uno.localdomain>
 <CA+V-a8sTXULENp+prOd10vEwYz9wiKkAhyaEPf79QGGvtLc2hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8sTXULENp+prOd10vEwYz9wiKkAhyaEPf79QGGvtLc2hQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Dec 15, 2020 at 03:57:32PM +0000, Lad, Prabhakar wrote:
> Hi Jacopo,
>
> Thank you for the review.
>
> On Tue, Dec 15, 2020 at 11:49 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hello,
> >
> > On Thu, Nov 26, 2020 at 10:30:53AM +0000, Lad Prabhakar wrote:
> > > The 8-bit ov7725 sensors can also be connected to the camera daughter
> > > board.
> > >
> > > This patch creates a separate dtsi file for ov7725 sensors and is included
> > > in r8a7742-iwg21d-q7-dbcm-ca.dts. The user can set VINx_SENSOR depending
> > > on the cameras connected.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |   7 ++
> > >  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi    | 112 ++++++++++++++++++
> > >  2 files changed, 119 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725.dtsi
> > >
> > > diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > index 1ab4f9771a34..915ff5fd437c 100644
> > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > > @@ -11,6 +11,7 @@
> > >
> > >  #define SENSOR_NONE          1
> > >  #define SENSOR_OV5640                2
> > > +#define SENSOR_OV7725                3
> > >
> > >  /* 8bit CMOS Camera 1 (J13) */
> > >  #define CAM1_PARENT_I2C              i2c0
> > > @@ -40,6 +41,11 @@
> > >   * VIN2 interface and also the ov5640 node connected to it)
> > >   *      #define VIN2_SENSOR          SENSOR_NONE
> > >   *
> > > + * To tie VINx endpoints to ov7725_x endpoints set VINx_SENSOR to
> > > + * SENSOR_OV7725 for example if ov7725_3 is connected to the VIN3
> > > + * interface set the below (this disables the ov5640_3)
> > > + *      #define VIN3_SENSOR          SENSOR_OV7725
> > > + *
> > >   */
> > >  #define VIN0_SENSOR          SENSOR_OV5640
> > >  #define VIN1_SENSOR          SENSOR_OV5640
> > > @@ -47,6 +53,7 @@
> > >  #define VIN3_SENSOR          SENSOR_OV5640
> > >
> > >  #include "r8a7742-iwg21d-q7-dbcm-ov5640.dtsi"
> > > +#include "r8a7742-iwg21d-q7-dbcm-ov7725.dtsi"
> >
> > Mmm, can't we alternatively include one .dtsi or the other depending
> > on a define symbol ? The .dtsi describe pluggable expansion boards,
> > they cannot be mixed, right ?
> >
> Since the cameras on the daughter can be mixed and matched a much
> better version of the patches [1] which handle this case elegantly has
> been posted by Geert.
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20201126134031.4115211-1-geert@linux-m68k.org/

Oh, I see the discussion know, sorry for the noise.

>
> Cheers,
> Prabhakar
