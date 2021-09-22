Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46103413EF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 03:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhIVB2x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 21:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbhIVB2w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 21:28:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD51C061574;
        Tue, 21 Sep 2021 18:27:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E261F1;
        Wed, 22 Sep 2021 03:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632274040;
        bh=wHw4aECc6GA5msdzk/svp6qwlfpdjBC4nekMh5SK0lo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a+R4eiz4/Hwl2ufuEh0heLNWqYQ1dsLJOEEDzWfABwmGDQ2wPkZDyPKiUeRU1JbH5
         PZBJ4l6tc5yiWLv8UV9WZq3Nge3VWBD/lOEsiu6h7ZvTdP23ax4lmAbCqsWIaEla8L
         r+Z+zRRgpB6y/nm6owPalnD2qRTjsqGAYf6yWvfU=
Date:   Wed, 22 Sep 2021 04:26:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add
 binding for R-Car MIPI DSI/CSI-2 TX
Message-ID: <YUqGWa6q+wYq2vAt@pendragon.ideasonboard.com>
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
 <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
 <CAMuHMdVmTcERvHhLLDrZyC_TDLPU89ksitn0WduJkKqpePCKdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVmTcERvHhLLDrZyC_TDLPU89ksitn0WduJkKqpePCKdg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Sep 21, 2021 at 05:53:52PM +0200, Geert Uytterhoeven wrote:
> On Wed, Jul 28, 2021 at 6:26 PM Laurent Pinchart wrote:
> > The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
> > can operate in either DSI or CSI-2 mode, with up to four data lanes.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car MIPI DSI/CSI-2 Encoder
> > +
> > +maintainers:
> > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > +
> > +description: |
> > +  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> > +  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> > +  to four data lanes.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Functional clock
> > +      - description: DSI (and CSI-2) functional clock
> > +      - description: PLL reference clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: fck
> > +      - const: dsi
> > +      - const: pll
> 
> No interrupts?
> The hardware manual says there are 9 interrupts.

Who comes up with such insanely high numbers of interrupts ? :-)

What the hardware manual doesn't document is how interrupts are mapped.
There's indeed 9 of them, and there are 9 interrupt sources, but that's
all we know. I can easily add a

  interrupts:
    maxItems: 9

but I can add interrupt names without additional information. It may be
possible to deduce some of the interrupt mappings from experiments, but
not all of them. What do you think would be a good way forward ? Leave
the interrupts out for now as we don't have the information ? Only list
the interrupts but not their names ? Something else ?

-- 
Regards,

Laurent Pinchart
