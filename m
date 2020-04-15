Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3751A8FED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 02:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733235AbgDOAyn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 20:54:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39256 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733230AbgDOAyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 20:54:41 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A422521;
        Wed, 15 Apr 2020 02:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586912079;
        bh=t/s3cFaprX7TQgkKtf3BVyw0MwfDpYj0dFVoO/TDuXw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eVHUoihtAmBgramO/GhT99Seqkul5d/u62tGrXDHYQvQSqbUU7Sw+ZUl0suUDOBjH
         Ib2qE7AMpG3vFcOfNBOrzXsQYevvUVThKSZpee18Yn8tRP5LgXr/QGWHYm+YK8gz1t
         UQJHwhWVButreXqgrcjjJoQkFuUrkhU+iHWlrva4=
Date:   Wed, 15 Apr 2020 03:54:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/4] dt-bindings: display: bridge: Convert simple-bridge
 bindings to YAML
Message-ID: <20200415005427.GY19819@pendragon.ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-3-laurent.pinchart+renesas@ideasonboard.com>
 <20200414220000.GA31265@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200414220000.GA31265@bogus>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Tue, Apr 14, 2020 at 05:00:00PM -0500, Rob Herring wrote:
> On Mon, Apr 06, 2020 at 02:23:16AM +0300, Laurent Pinchart wrote:
> > The simple-bridge driver supports multiple simple or dumb bridges,
> > covered by different compatible strings but otherwise identical DT
> > bindings. Some of those bridges have undocumented bindings, while others
> > are documented in text form in separate files. Group them all in a
> > single binding and convert it to YAML.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  .../bindings/display/bridge/adi,adv7123.txt   | 50 ----------
> >  .../bindings/display/bridge/dumb-vga-dac.txt  | 50 ----------
> >  .../display/bridge/simple-bridge.yaml         | 99 +++++++++++++++++++
> >  .../bindings/display/bridge/ti,ths813x.txt    | 51 ----------
> >  4 files changed, 99 insertions(+), 151 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
> > deleted file mode 100644
> > index a6b2b2b8f3d9..000000000000
> > --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -Analog Device ADV7123 Video DAC
> > --------------------------------
> > -
> > -The ADV7123 is a digital-to-analog converter that outputs VGA signals from a
> > -parallel video input.
> > -
> > -Required properties:
> > -
> > -- compatible: Should be "adi,adv7123"
> > -
> > -Optional properties:
> > -
> > -- psave-gpios: Power save control GPIO
> 
> Not documented in the new schema. Did you intend to change to 
> 'enable-gpios'?

Oops, I forgot to mention that, my bad. The psave GPIO isn't supported
by the driver, and isn't used in any upstream DT files, so I thought it
would be safe to drop it, and add support it later (possibly through the
enable GPIO) if/when needed. I'll mention it in the commit message.

-- 
Regards,

Laurent Pinchart
