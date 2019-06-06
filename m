Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A71737A87
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 19:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbfFFRHq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 13:07:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728459AbfFFRHq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 13:07:46 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AE9333B;
        Thu,  6 Jun 2019 19:07:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559840864;
        bh=jIgrrc/BYHMcZej8K1iYKUaWSzykg4ahNGIRZ7DmNec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LY084Z/iztQzTZlB9cTK88taqZNTrLsY3IUH74gm2Y+u9nP+FRlIwHpTTpzlBw/E4
         PrXNgmyeOTUGEt9LgdyhwW2E0j0F4YTUkbIRxD2aPXo4xO3D/Oj8b4BBWmmEFbl0W0
         FDAK39WC+auueEBPc23u0qbYcGUYhewo6yC6D+v8=
Date:   Thu, 6 Jun 2019 20:07:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/20] arm64: dts: renesas: r8a77990: Add CMM units
Message-ID: <20190606170730.GA27525@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-13-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-13-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:12PM +0200, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car E3 device tree and reference them from
> the Display Unit they are connected to.
> 
> While at it, re-sort the du device node properties to match the ordering
> found in other SoCs.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index a69faa60ea4d..87453ddbc7e3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1656,6 +1656,22 @@
>  			iommus = <&ipmmu_vi0 9>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> +			resets = <&cpg 710>;
> +		};
> +
>  		csi40: csi2@feaa0000 {
>  			compatible = "renesas,r8a77990-csi2", "renesas,rcar-gen3-csi2";
>  			reg = <0 0xfeaa0000 0 0x10000>;
> @@ -1695,9 +1711,11 @@
>  			clocks = <&cpg CPG_MOD 724>,
>  				 <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> -			vsps = <&vspd0 0 &vspd1 0>;
>  			status = "disabled";
>  
> +			vsps = <&vspd0 0 &vspd1 0>;
> +			cmms = <&cmm0 &cmm1>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;

-- 
Regards,

Laurent Pinchart
