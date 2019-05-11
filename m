Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD721A901
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 20:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfEKSQg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 14:16:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57000 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfEKSQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 14:16:36 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A15B1D5;
        Sat, 11 May 2019 20:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557598594;
        bh=Kr04MM9lJmSdj809aI84vsTDqNZ1JuvQC3abMC/R/9Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QpDYFcoLCkUWvh/oeemPj4/2KvjPyJLqpPQhF9/u4MfvHDI3q2TDbSgBStryvqtG3
         5gyvK0QO/q6p/BOp0yaPSjolIlHpCuY8/uhxC3+XGP4FvUmC7CrzJPRg/V+nbgDy2w
         tQPV3InqkSS1R8YQWkmfRwzxIIr/Y4SjCSXmjutQ=
Date:   Sat, 11 May 2019 21:16:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [RFC 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20190511181618.GD13043@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190508173428.22054-2-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, May 08, 2019 at 07:34:20PM +0200, Jacopo Mondi wrote:
> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
> 
> CMM is the image enhancement module available on each R-Car DU video
> channel.

Not on all of them, V3M and V3H don't include a CMM module.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/display/renesas,cmm.txt          | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.txt b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> new file mode 100644
> index 000000000000..d7674417edb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> @@ -0,0 +1,24 @@
> +* Renesas R-Car Color Management Unit (CMM)

It's called Color Management Module in the documentation (hence the CMM
abbreviation)

> +
> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> +
> +Required properties:
> + - compatible: shall be:
> +   - "renesas,cmm"

There's a CMM in R-Car Gen2 with a different feature set, so I think you
need at least two compatible strings. As far as I can tell SoC-specific
compatible strings are required.

> +
> + - reg: the address base and length of the memory area where CMM control
> +   registers are mapped to.
> +
> + - clocks: phandle and clock-specifier pair to the CMM functional clock
> +   supplier.
> +
> +Example:
> +--------
> +
> +	cmm0: cmm@fea40000 {
> +		compatible = "renesas,cmm";
> +		reg = <0 0xfea40000 0 0x1000>;
> +		power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +		clocks = <&cpg CPG_MOD 711>;
> +		resets = <&cpg 711>;
> +	};

-- 
Regards,

Laurent Pinchart
