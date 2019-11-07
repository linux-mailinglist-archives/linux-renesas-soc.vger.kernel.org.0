Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E25EFF367E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 19:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbfKGSAz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 13:00:55 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60012 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfKGSAz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 13:00:55 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79C1471D;
        Thu,  7 Nov 2019 19:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573149652;
        bh=3pKlQ2PufFLvWrmoVgmkXG3/3S10PQWiYBpBD09aE54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iyEKvbJs3KEBvDfeOnA0pTJzY1F+ToTQ2w+jDj4HDf/uRmBeumbalauALcypmCoto
         RARi6QIfbY9Q+p/IZn9OKpNjSfWDMuS7AikhFfHfED2nZn+SJ9osv/v9ojQyQLT73g
         Q/Dj3WGnp8gK6P+0wyogsGdyt/RzegPzuHr0JaWE=
Date:   Thu, 7 Nov 2019 20:00:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: display: Add bindings for LVDS
 bus-timings
Message-ID: <20191107180043.GA24231@pendragon.ideasonboard.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAL_JsqKWWCpEeBd4UFaqBVffS-OxUNAHfvtJKcGsLDR+f=Uytg@mail.gmail.com>
 <TY1PR01MB177060B843107361FEF44022C0A20@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177060B843107361FEF44022C0A20@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Fabrizio,

On Thu, Aug 29, 2019 at 02:38:06PM +0000, Fabrizio Castro wrote:
> On 29 August 2019 15:03 Rob Herring wrote:
> > On Wed, Aug 28, 2019 at 1:36 PM Fabrizio Castro wrote:
> >>
> >> Dual-LVDS connections need markers in the DT, this patch adds
> >> some common documentation to be referenced by both panels and
> >> bridges.
> >>
> >> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >>
> >> ---
> >> v2->v3:
> >> * new patch
> >> ---
> >>  .../bindings/display/bus-timings/lvds.yaml         | 38 ++++++++++++++++++++++
> >>  1 file changed, 38 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml b/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
> >> new file mode 100644
> >> index 0000000..f35b55a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/bus-timings/lvds.yaml
> >> @@ -0,0 +1,38 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> > 
> > (GPL-2.0-only OR BSD-2-Clause) is preferred for new bindings.
> > 
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/bus-timings/lvds.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Common Properties for bus timings of LVDS interfaces
> >> +
> >> +maintainers:
> >> +  - Thierry Reding <thierry.reding@gmail.com>
> >> +  - Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >> +
> >> +description: |
> >> +  This document defines device tree properties common to LVDS and dual-LVDS
> >> +  interfaces, where a dual-LVDS interface is a dual-link connection with even
> >> +  pixels traveling on one connection, and with odd pixels traveling on the other
> >> +  connection.

As you define a dual-LVDS interface as "a dual-link connection", should
this be "even pixels traveling on one link, and with odd pixels
traveling on the other link" ?

> >> +  This document doesn't constitue a device tree binding specification by itself
> > 
> > typo: constitute
> 
> Well spotted!
> 
> >> +  but is meant to be referenced by device tree bindings.
> >> +  When referenced from panel or bridge device tree bindings, the properties
> >> +  defined in this document are defined as follows. The panel and bridge device
> >> +  tree bindings are responsible for defining whether each property is required
> >> +  or optional.
> >> +
> >> +properties:
> >> +  dual-lvds-even-pixels:
> >> +    type: boolean
> >> +    description:
> >> +      This property is specific to an input port of a sink device. When
> > 
> > The schema should define what nodes these go in. The description seems
> > to indicate in 'port' nodes (or endpoint?), but your use in the panel
> > binding puts them in the parent.
> 
> Did you manage to read this?
> https://patchwork.kernel.org/cover/11119607/
> 
> Could you please advice on how to do this properly?
> 
> >> +      specified, it marks the port as recipient of even-pixels.
> >> +
> >> +  dual-lvds-odd-pixels:
> >> +    type: boolean
> >> +    description:
> >> +      This property is specific to an input port of a sink device. When
> >> +      specified, it marks the port as recipient of odd-pixels.
> > 
> > However, I don't think you even need these. A panel's port numbers are
> > fixed can imply even or odd. For example port@0 can be even and port@1
> > can be odd. The port numbering is typically panel specific, but we may
> > be able to define the numbering generically if we don't already have
> > panels with multiple ports.
> > 
> > Also, aren't there dual link DSI panels?
> 
> This is the result of a discussion on here:
> https://patchwork.kernel.org/patch/11095547/
> 
> Have you come across it?

Let me repeat my comments from that thread for Rob in order to
centralize the discussion here.

> Taking one step back to look at the big picture, what we need is for the
> source to know what pixel (odd or even) to send on each LVDS output. For
> that it needs to know what pixel is expected by the sink the the inputs
> connected to the source's outputs. From each source output we can easily
> locate the DT nodes corresponding to the connected sink's input ports,
> but that doesn't give us enough information. From there, we could
> 
> - Infer the odd/even pixel expected by the source based on the port
>   numbers. This would require common DT bindings for all dual-link LVDS
>   sinks that specify the port ordering (for instance the bindings could
>   mandate that lowest numbered port correspond to even pixels).
> 
> - Read the odd/even pixel expected by the source from an explicit DT
>   property, as proposed above. This would also require common DT
>   bindings for all dual-link LVDS sinks that define these new
>   properties. This would I think be better than implicitly infering it
>   from DT port numbers.
> 
> - Retrieve the information from the sink drm_bridge at runtime. This
>   would require a way to query the bridge for the mapping from port
>   number to odd/even pixel. The DRM_LINK_DUAL_LVDS_ODD_EVEN flag could
>   be used for that, and would then be defined as "the lowest numbered
>   port corresponds to odd pixels and the highest numbered port
>   corresponds to even pixels".
> 
> The second and third options would both work I think. The third one is
> roughly what you've implemented, except that I think the flag
> description should be clarified.

Rob, what's your opinion ? We could certainly, in the context of a
panel, decide of a fixed mapping of port numbers to odd/even pixels, but
the issue is that sources need to know which pixels to send on which
link (assuming of course that this can be configured on the source
side). We thus need a way for the source to answer, at runtime, the
question "which of ports A and B of the sink correspond to even and odd
pixels ?". This can't be inferred by the source from the sink port
numbers, as the mapping between port number and odd/even pixels is
specific to each sink. We thus need to either store that property in the
DT node of the sink (option 2) or query it at runtime from the sink
(option 3).

I like option 2 as it's more explicit, but option 3 minimizes the
required properties in DT, which is always good. Patch 3/8 introduces a
helper that abstracts this from a sink point of view (which I think is a
very good idea), so once we decide which option to use, only 3/8 may
need to be adapted, the other patches should hopefully not require
rework.

-- 
Regards,

Laurent Pinchart
