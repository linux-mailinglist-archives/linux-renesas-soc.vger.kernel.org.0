Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD23D37A7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 19:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbfFFRGh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 13:06:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45210 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFRGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 13:06:36 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0D5F33B;
        Thu,  6 Jun 2019 19:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559840794;
        bh=yrw/9KOLoEUVWxEhMblAvAUvO3su/JSHGOAF3wrqZos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZsV1WhCgU4QaA18SYmc4GYiMvuzfyuBxRxk/+h3WdCWTzrsEemEipV2lFpzVt2yuk
         h8jiIcDTc7kWwsh98HZs9JdZ6MvagQbNaQpODV2JnJodoKbSFaqTPnC+qC0MhS+XP6
         HmWGsNs9YaFOHWrNHsrYV4Ra03LxC10EU/MdgRH0=
Date:   Thu, 6 Jun 2019 20:06:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/20] arm64: dts: renesas: r8a7795: Add CMM units
Message-ID: <20190606170620.GQ12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-11-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-11-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:10PM +0200, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car H3 device tree and reference them from
> the Display Unit they are connected to.
> 
> While at it, re-sort the du device node properties to match the ordering
> found in other SoCs.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 36 +++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index abeac3059383..83edd9f12caa 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -2825,6 +2825,38 @@
>  			renesas,fcp = <&fcpvi1>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm2: cmm@fea60000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea60000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 709>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			resets = <&cpg 709>;
> +		};
> +
> +		cmm3: cmm@fea70000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea70000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 708>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			resets = <&cpg 708>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			compatible = "renesas,r8a7795-csi2";
>  			reg = <0 0xfea80000 0 0x10000>;
> @@ -3028,9 +3060,11 @@
>  				 <&cpg CPG_MOD 722>,
>  				 <&cpg CPG_MOD 721>;
>  			clock-names = "du.0", "du.1", "du.2", "du.3";
> -			vsps = <&vspd0 0 &vspd1 0 &vspd2 0 &vspd0 1>;
>  			status = "disabled";
>  
> +			vsps = <&vspd0 0 &vspd1 0 &vspd2 0 &vspd0 1>;
> +			cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> -- 
> 2.21.0
> 

-- 
Regards,

Laurent Pinchart
