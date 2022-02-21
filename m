Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49EE24BE211
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:54:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378160AbiBUOmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 09:42:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344379AbiBUOmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 09:42:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F23765B;
        Mon, 21 Feb 2022 06:42:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF0C0482;
        Mon, 21 Feb 2022 15:42:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645454546;
        bh=RL7Ns70rAF+Bkb03HTLNS6K1v/ctQIJYbnehlZszA6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SP0jCEz//2WhKEbnFIUdi4mHWlgJbcvVacjwNITvA4/CWwCiibviiviyfyELCqGeb
         UhIe19Rs0H1HVPXyZG/1igSQvMnWZQM3/8HWQbUtkknOesA3G6v26LQKBNnWW4+YPu
         dzX2K9dRjeB1VguY66RAfCWkfkFlELXK+xH7w1BQ=
Date:   Mon, 21 Feb 2022 16:42:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel
 .dtsi for overlay support
Message-ID: <YhOkyScHvAi5JQmH@pendragon.ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
 <164545430425.2976960.2974689638537387661@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164545430425.2976960.2974689638537387661@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 21, 2022 at 02:38:24PM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2021-12-29 19:31:33)
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
> > ---
> >  .../arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi | 39 -------------------
> >  .../boot/dts/renesas/panel-aa104xd12.dtsi     | 30 ++++++++++++++
> >  2 files changed, 30 insertions(+), 39 deletions(-)
> >  delete mode 100644 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
> >  create mode 100644 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> > 
> > diff --git a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi b/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
> > deleted file mode 100644
> > index 79fce67ebb1c..000000000000
> > --- a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0
> > -/*
> > - * Common file for the AA104XD12 panel connected to Renesas R-Car boards
> > - *
> > - * Copyright (C) 2014 Renesas Electronics Corp.
> > - */
> > -
> > -/ {
> > -       panel {
> > -               compatible = "mitsubishi,aa104xd12", "panel-lvds";
> > -
> > -               width-mm = <210>;
> > -               height-mm = <158>;
> > -               data-mapping = "jeida-18";
> > -
> > -               panel-timing {
> > -                       /* 1024x768 @65Hz */
> > -                       clock-frequency = <65000000>;
> > -                       hactive = <1024>;
> > -                       vactive = <768>;
> > -                       hsync-len = <136>;
> > -                       hfront-porch = <20>;
> > -                       hback-porch = <160>;
> > -                       vfront-porch = <3>;
> > -                       vback-porch = <29>;
> > -                       vsync-len = <6>;
> > -               };
> > -
> > -               port {
> > -                       panel_in: endpoint {
> > -                               remote-endpoint = <&lvds_connector>;
> > -                       };
> > -               };
> > -       };
> > -};
> > -
> > -&lvds_connector {
> > -       remote-endpoint = <&panel_in>;
> > -};
> > diff --git a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> > new file mode 100644
> > index 000000000000..6e9f447d8fe1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
> 
> Is this a device directly on the renesas board itself?

I would have included it in the board DT if that had been the case :-)

> I still wonder if
> 'extra' overlays should be in a subfolder here, or ... even potentially
> some more common location - but this can do for now I guess.

They should, but they should then be parametric, it's a whole other
story.

> And I see I gave this on v1, but /after/ you posted v2 ;-)
> 
> You can keep it though ...
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > @@ -0,0 +1,30 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Common file for the AA104XD12 panel connected to Renesas R-Car Gen3 boards.
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + */
> > +
> > +panel {
> > +       compatible = "mitsubishi,aa104xd12", "panel-lvds";
> > +
> > +       width-mm = <210>;
> > +       height-mm = <158>;
> > +       data-mapping = "jeida-18";
> > +
> > +       panel-timing {
> > +               /* 1024x768 @65Hz */
> > +               clock-frequency = <65000000>;
> > +               hactive = <1024>;
> > +               vactive = <768>;
> > +               hsync-len = <136>;
> > +               hfront-porch = <20>;
> > +               hback-porch = <160>;
> > +               vfront-porch = <3>;
> > +               vback-porch = <29>;
> > +               vsync-len = <6>;
> > +       };
> > +
> > +       port {
> > +       };
> > +};

-- 
Regards,

Laurent Pinchart
