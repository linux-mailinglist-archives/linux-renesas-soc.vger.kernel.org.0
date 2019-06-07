Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61C8D398AF
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Jun 2019 00:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbfFGWag (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 18:30:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730078AbfFGWag (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 18:30:36 -0400
Received: from pendragon.ideasonboard.com (unknown [109.132.30.162])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 761E9334;
        Sat,  8 Jun 2019 00:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559946634;
        bh=TVcF39DakO89LqGPGv5S/y5Maujvp3sb4JgJNHyACIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JYAmczn8uttCedmd+1NrTM41d7zAgQmJxP4/SlUjYK3NYC4xIsRyW5kTTgkryMSGZ
         fJbrtXOai66AonEnj5dz4QSHcltwjdySvGPfq14ROxnN7RT7cnHyuhpeWs1MQfzIr6
         KEw5t8Co1ee68twgEwMEaIqmbS3aNXDmdbS+0ZMc=
Date:   Sat, 8 Jun 2019 01:30:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 02/10] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190607223020.GB5110@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-3-laurent.pinchart+renesas@ideasonboard.com>
 <63985327-c796-c8cc-50c8-f486942e3161@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <63985327-c796-c8cc-50c8-f486942e3161@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Jun 07, 2019 at 11:15:06PM +0100, Kieran Bingham wrote:
> On 28/05/2019 15:12, Laurent Pinchart wrote:
> > The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> > dual-link. In dual-link mode both input ports are used to carry even-
> > and odd-numbered pixels separately. Document this in the DT bindings,
> > along with the related rules governing port and usage.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/display/bridge/thine,thc63lvd1024.txt          | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > index 37f0c04d5a28..d17d1e5820d7 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > @@ -28,6 +28,12 @@ Optional video port nodes:
> >  - port@1: Second LVDS input port
> >  - port@3: Second digital CMOS/TTL parallel output
> >  
> > +The device can operate in single-link mode or dual-link mode. In single-link
> > +mode, all pixels are received on port@0, and port@1 shall not contain any
> > +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> > +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> > +endpoints.
> > +
> 
> Your cover letter details 4 different modes of operation for this part.
> 
> Do you anticipate the other combinations {Single-in, dual-out; dual-in,
> dual-out} being supported? Perhaps that would be defined by the relevant
> endpoints being connected or not ?

I expect that someone might need those modes at some point, but I
haven't specified them on purpose, as I don't like writing DT bindings
that can't be tested. I however expoect that those additional modes can
be derived from the connected endpoints.

> You state that in dual-link mode, both port@0, and port@1 shall contain
> endpoints, so that implies that you only expect to support dual-in with
> the 'dual-link' property. If that is correct, should it be stated
> explicitly?

What do you mean by the 'dual-link' property ? The patch series defines
no such property.

> Otherwise,
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >  Example:
> >  --------
> >  

-- 
Regards,

Laurent Pinchart
