Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF8AD2CC94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 18:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfE1Qth (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 12:49:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56012 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfE1Qtg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 12:49:36 -0400
Received: from pendragon.ideasonboard.com (85-76-139-52-nat.elisa-mobile.fi [85.76.139.52])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE62ED85;
        Tue, 28 May 2019 18:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559062174;
        bh=lEjKHqijMGwDHdIFV6IpbBri4b6BDlrFy94f6LaA38A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nsxe+QaRjPfxPWCTv0FrcyqunWIXMU9NCc2DwkM9vMbXRQYjMAoRz706YMVXjxA+4
         hi99ceJwx1OhxcxNTArKZkFUI3eUjtLXzNqK+hafc3cJtKpocn8+je55RClVLM5Iqs
         0RPEFiHFiSH808Ia/TXa3pYzX6WXxvV2HO1z76ts=
Date:   Tue, 28 May 2019 19:49:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190528164916.GA17874@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528163730.GA9610@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528163730.GA9610@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Tue, May 28, 2019 at 06:37:30PM +0200, Sam Ravnborg wrote:
> On Tue, May 28, 2019 at 05:12:28PM +0300, Laurent Pinchart wrote:
> > Add a new optional renesas,companion property to point to the companion
> > LVDS encoder. This is used to support dual-link operation where the main
> > LVDS encoder splits even-numbered and odd-numbered pixels between the
> > two LVDS encoders.
> > 
> > The new property doesn't control the mode of operation, it only
> > describes the relationship between the master and companion LVDS
> > encoders.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> > Changes since v2:
> > 
> > - Clarify when the companion property is required or not allowed
> > 
> > Changes since v1:
> > 
> > - Fixed typo
> > ---
> >  .../devicetree/bindings/display/bridge/renesas,lvds.txt    | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > index 900a884ad9f5..2d24bd8cbec5 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> > @@ -45,6 +45,13 @@ OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> >  
> >  Each port shall have a single endpoint.
> >  
> > +Optional properties:
> > +
> > +- renesas,companion : phandle to the companion LVDS encoder. This property is
> > +  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> > +  the second encoder to be used as a companion in dual-link mode. It shall not
> > +  be set for any other LVDS encoder.
> 
> If the D3 and E3 socs do not mandate the use of dual-link, then what to
> do in the DT? Because according to the above this property must be
> specified for D3 and E3 SOC's.

This property doesn't enable dual-link mode, it only specifies the
companion LVDS encoder used for dual-link mode, when enabled (through
communication between the LVDS encoder and the LVDS receiver at
runtime).

Jacopo had a similar comment so I suppose this isn't clear. How would
you word it to make it clear ?

> > +
> >  
> >  Example:
> 
> Always good with examples, maybe it comes later.

Good point, I'll fix that.

-- 
Regards,

Laurent Pinchart
