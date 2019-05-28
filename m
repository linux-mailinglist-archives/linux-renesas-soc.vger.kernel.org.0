Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 431FC2C8B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 16:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbfE1OZl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 10:25:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49178 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfE1OZl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 10:25:41 -0400
Received: from pendragon.ideasonboard.com (85-76-65-42-nat.elisa-mobile.fi [85.76.65.42])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CCE1D85;
        Tue, 28 May 2019 16:25:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559053538;
        bh=YLzxT/s846qNEU0acFlKY1y1PUpU4zC/e1HRGXxyAns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hLnGGXop7msWoEgaShqpFmS/oTno5Qbk2KizlXGYzQcyL3m1GQhBNUbY1HmFNy5d/
         e1GRZGuOPjY/Qldi1iuyFmrpmiDkE+ZoCjn8V/kidIWGVRYfvBygxscZHddK5eIQsd
         Ly4So5lolB+tNVEoH8yoAlHliaaZiD0hl1MQUzWo=
Date:   Tue, 28 May 2019 17:25:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com
Subject: Re: [RFC 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20190528142520.GA14336@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-2-jacopo+renesas@jmondi.org>
 <20190511181618.GD13043@pendragon.ideasonboard.com>
 <20190528123725.bqyutp4lxny4sraa@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190528123725.bqyutp4lxny4sraa@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Tue, May 28, 2019 at 02:37:25PM +0200, Jacopo Mondi wrote:
> On Sat, May 11, 2019 at 09:16:18PM +0300, Laurent Pinchart wrote:
> > On Wed, May 08, 2019 at 07:34:20PM +0200, Jacopo Mondi wrote:
> >> Add device tree bindings documentation for the Renesas R-Car Display
> >> Unit Color Management Module.
> >>
> >> CMM is the image enhancement module available on each R-Car DU video
> >> channel.
> >
> > Not on all of them, V3M and V3H don't include a CMM module.
> >
> >> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> ---
> >>  .../bindings/display/renesas,cmm.txt          | 24 +++++++++++++++++++
> >>  1 file changed, 24 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.txt b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> >> new file mode 100644
> >> index 000000000000..d7674417edb4
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> >> @@ -0,0 +1,24 @@
> >> +* Renesas R-Car Color Management Unit (CMM)
> >
> > It's called Color Management Module in the documentation (hence the CMM
> > abbreviation)
> >
> >> +
> >> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> >> +
> >> +Required properties:
> >> + - compatible: shall be:
> >> +   - "renesas,cmm"
> >
> > There's a CMM in R-Car Gen2 with a different feature set, so I think you
> > need at least two compatible strings. As far as I can tell SoC-specific
> > compatible strings are required.
> 
> I assume you meant "SoC-specific compatible strings are NOT required" ?

Correct, sorry.

> Could you otherwise specify why do you think we need a per-SoC
> compatible, since there are no platform specific data (for now, at
> least, but considering the CMM seems identical in all SoCs I hardly
> think we will have any in the near future).
> 
> Ack on the gen2/gen3 specific strings though.
> 
> >> +
> >> + - reg: the address base and length of the memory area where CMM control
> >> +   registers are mapped to.
> >> +
> >> + - clocks: phandle and clock-specifier pair to the CMM functional clock
> >> +   supplier.
> >> +
> >> +Example:
> >> +--------
> >> +
> >> +	cmm0: cmm@fea40000 {
> >> +		compatible = "renesas,cmm";
> >> +		reg = <0 0xfea40000 0 0x1000>;
> >> +		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> >> +		clocks = <&cpg CPG_MOD 711>;
> >> +		resets = <&cpg 711>;
> >> +	};

-- 
Regards,

Laurent Pinchart
