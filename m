Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DF8258CAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 12:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgIAKXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 06:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgIAKW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 06:22:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F3CC061244;
        Tue,  1 Sep 2020 03:22:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B816AAF2;
        Tue,  1 Sep 2020 12:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598955764;
        bh=G2KxxwOoj3SLhv+55AScVVlthMBdTAjzgzoR3gW/fpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hUU3u2VK3RPHLpz6FEx/Rt7Pr/x4znpdWCUJcYze2Weml+JL0bjRWL1SU3uuuKj4/
         HU00eonCUlfHgPigEjW+nwB/bOxlW+aoBhofBG7Hf6D+E8N2T7WqPUixxnvCEk1Snw
         /oC489rVMLHKIXGXMU/Q8+iXwKgIm30Q9Sxyhqf8=
Date:   Tue, 1 Sep 2020 13:22:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
 Document vcc-supply property
Message-ID: <20200901102223.GB5821@pendragon.ideasonboard.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
 <20200824230458.GA3489164@bogus>
 <TYBPR01MB5309756E7E19EF34562FAB5E86540@TYBPR01MB5309.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYBPR01MB5309756E7E19EF34562FAB5E86540@TYBPR01MB5309.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Wed, Aug 26, 2020 at 06:58:50AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
> > Document vcc-supply property
> >
> > On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> > > Document optional vcc-supply property that may be used as VCC source.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> > > ---
> > >  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > index 68951d56ebba..3248be31eceb 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > > @@ -79,6 +79,9 @@ properties:
> > >        The GPIO used to control the power down line of this device.
> > >      maxItems: 1
> > >
> > > +  vcc-supply:
> > > +    maxItems: 1
> >
> > Probably should be 'power-supply' to align with the 'simple' panels.
> > That's also to signify there's only 1 supply. Using 'vcc' would encourage
> > adding 'vdd-supply', 'vddio-supply', etc. A second supply I'll NAK because at
> > that point it's not a simple bridge with no configuration (it's arguably already
> > there).
> 
> Yes, I am ok with 'power-supply', since LVDS CODEC driver is  generic
> and also to align with terminology used in generic 'simple' panels.
> 
> In our case this Receiver converts LVDS signals to RGB signals and fed
> this signal to simple panel.
> On the receiver part, We need to supply  power to TTL output,  PLL and
> LVDS input. It all derived from the single power source.
> 
> Laurent, Please share you opinion on this.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

That is, I think it's a good idea to rename it, and I agree with Rob
about not adding a second supply.

I've applied the modified patch to my tree, and will send a pull request
this week.

-- 
Regards,

Laurent Pinchart
