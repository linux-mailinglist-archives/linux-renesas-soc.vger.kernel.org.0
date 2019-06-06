Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9CE37A12
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 18:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFFQwX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 12:52:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44896 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfFFQwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 12:52:23 -0400
Received: from pendragon.ideasonboard.com (unknown [109.132.30.162])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EE7033B;
        Thu,  6 Jun 2019 18:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559839940;
        bh=4mgK5rlkC0Kg4xqsp46YeuIphWIE4WWfImrJeArJBQs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bKlQSfkhFOtrbVAQU8MUF0RcPAgnXc92KmqC4bk2Qmmr4qVnwO9rrGX6Bhm+XSWIG
         HQRBQAruWLH7dlCZsnK7AMcZamw/ReQKKmTFtBL7fQybco5o5k5OyuYIq1+h7R4Pgs
         BMh4WJXTY/3OTCipIi8YA8HET2AamsmE4UK0e9NE=
Date:   Thu, 6 Jun 2019 19:52:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/20] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20190606165206.GI12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-2-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:01PM +0200, Jacopo Mondi wrote:
> Add device tree bindings documentation for the Renesas R-Car Display
> Unit Color Management Module.
> 
> CMM is the image enhancement module available on each R-Car DU video
> channel on Gen2 and Gen3 SoCs (V3H and V3M excluded).
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/display/renesas,cmm.txt          | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,cmm.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,cmm.txt b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> new file mode 100644
> index 000000000000..d8d3cf9ce2ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,cmm.txt
> @@ -0,0 +1,25 @@
> +* Renesas R-Car Color Management Module (CMM)
> +
> +Renesas R-Car image enhancement module connected to R-Car DU video channels.
> +
> +Required properties:
> + - compatible: shall be one of:
> +   - "renesas,cmm-gen3"
> +   - "renesas,cmm-gen2"
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
