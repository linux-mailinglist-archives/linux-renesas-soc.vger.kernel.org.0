Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6EAF9D957
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 00:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfHZWnr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 18:43:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57602 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfHZWnq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 18:43:46 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 377B69A4;
        Tue, 27 Aug 2019 00:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566859424;
        bh=Ft2t79/UsLexer01RGnEmaG21HIbugJ0/z9QPp7bb9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W0r/n9YWIJ8DBjacOulPrNVKTKOrHwbMRrmXuyZ7wVPKPeguMN2c56SnFbECMnJK+
         ThGOSPD6e1KQ7YH6RM4XnuSnDF4VJUL8ek6T5qYN3ARpUMenmmHxzSOdtBzVrXbkOy
         crEPEBGXTUXu6MiHz53Rectj1nGkwUteimstRSzk=
Date:   Tue, 27 Aug 2019 01:43:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] arm64: dts: renesas: r8a7796: Add CMM units
Message-ID: <20190826224337.GL5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-4-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

Should you squash this with the patches that add CMM units to the other
SoCs ?

On Sun, Aug 25, 2019 at 03:51:43PM +0200, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car M3-W device tree and reference them from
> the Display Unit they are connected to.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Apart from the issue pointed out by Geert,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 3dc9d73f589a..8d78e1f98a23 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -2613,6 +2613,30 @@
>  			renesas,fcp = <&fcpvi0>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,cmm-r8a7796";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,cmm-r8a7796";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm2: cmm@fea60000 {
> +			compatible = "renesas,cmm-r8a7796";
> +			reg = <0 0xfea60000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 709>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 709>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			compatible = "renesas,r8a7796-csi2";
>  			reg = <0 0xfea80000 0 0x10000>;
> @@ -2766,6 +2790,7 @@
>  			status = "disabled";
>  
>  			vsps = <&vspd0 &vspd1 &vspd2>;
> +			cmms = <&cmm0 &cmm1 &cmm2>;
>  
>  			ports {
>  				#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
