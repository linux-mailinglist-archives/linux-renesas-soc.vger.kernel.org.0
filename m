Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5DEA81591
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 11:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfHEJft (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 05:35:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46978 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfHEJfs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 05:35:48 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A559B2F9;
        Mon,  5 Aug 2019 11:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564997745;
        bh=9lyHNth0BO3OFQvy53sY8ChramaGr6/aYpcQayRs7Wk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eD6hF6pNE4bGlluLrMGZh1kev4mdIMcD6210/F7TcCD0TUmHaq+x3qIKSNpNLjI9O
         cnLNzSztiNtar/f+edH9FcfE2L3wsdjsgGvImAuR1LSyQQTdl0Gz3LscYddaQXoudC
         YclyoiDWszwHtibWSIFQLKCqKqh7obs/JjZw3NfI=
Date:   Mon, 5 Aug 2019 12:35:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document
 renesas,swap-data
Message-ID: <20190805093543.GB29747@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802074428.GB5008@pendragon.ideasonboard.com>
 <TY1PR01MB17706A4FF4C26CD4BDA1A5DAC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17706A4FF4C26CD4BDA1A5DAC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Mon, Aug 05, 2019 at 08:59:51AM +0000, Fabrizio Castro wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 02 August 2019 08:44
> > Subject: Re: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document renesas,swap-data
> > 
> > Hi Fabrizio,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Aug 02, 2019 at 08:33:59AM +0100, Fabrizio Castro wrote:
> > > R-Car D3, R-Car E3, and RZ/G2E support dual-link mode.
> > > In such a mode, the first LVDS encoder emits even data, and the
> > > second LVDS encoder emits odd data. This patch documents property
> > > renesas,swap-data, used to swap even and odd data around.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > index dece79e..8980179 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > > @@ -52,6 +52,11 @@ Optional properties:
> > >    mandatory for the first LVDS encoder on R-Car D3, R-Car E3, and RZ/G2E SoCs,
> > >    and shall point to the second encoder to be used as a companion in dual-link
> > >    mode. It shall not be set for any other LVDS encoder.
> > > +- renesas,swap-data : when in dual-link mode, the first LVDS encoder normally
> > > +  emits even data, and the second LVDS encoder emits odd data. When property
> > > +  renesas,swap-data is specified, the data emitted by the two encoders will be
> > > +  swapped around. This property can only be used in conjunction with property
> > > +  renesas,companion.
> > 
> > From an LVDS encoder point of view this is more a configuration option
> > than a description of the hardware. Wouldn't it be better for the LVDS
> > sink to report which of the odd or even pixels it expects on each of its
> > endpoints ?
> 
> Yes, that would be my preference too, and it would be better, I am just not entirely
> what's the best place for this information though
> 
> > The LVDS encoder driver could then query that at runtime and
> > configure itself accordingly. Ideally this should be queried through the
> > drm_bridge_timings structure (or through a similar mean), not through
> > DT. An LVDS sink that has a fixed mapping of odd/even pixels to
> > endpoints wouldn't need the information to be specified in DT at all.
> 
> Isn't drm_bridge_timings specific for bridges?

Its name makes it specific to bridges, but the information it contains
could equally apply to panels. I would thus use it for both, possibly
after renaming it.

-- 
Regards,

Laurent Pinchart
