Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAB6637A81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 19:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbfFFRHO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 13:07:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45250 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFRHN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 13:07:13 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C1F333B;
        Thu,  6 Jun 2019 19:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559840832;
        bh=8jnTChS9a9/y2qNxbcbUHVURhtm0bSPBvqcESaDenko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u4RTer8NI0W4uXgRle1ZcKEoEY+i+uZmshkm7TGYP3qSdZK4BZenljRoneUmQAl4O
         FjPALEyS0lLVw9W7FydsZtSzJM/+j2mdQz3SrkzRYldWd+S7eCaYJpPytqCtNm8/44
         hz8SBUS3Kmi1pn0kgS187+lB1wvNX3xfNKt+CFfA=
Date:   Thu, 6 Jun 2019 20:06:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/20] arm64: dts: renesas: r8a77965: Add CMM units
Message-ID: <20190606170657.GR12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-12-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:11PM +0200, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car M3-N device tree and reference them from
> the Display Unit they are connected to.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 9763d108e183..a90854685b33 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2026,6 +2026,30 @@
>  			resets = <&cpg 602>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm3: cmm@fea70000 {
> +			compatible = "renesas,cmm-gen3";
> +			reg = <0 0xfea70000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 708>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 708>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			compatible = "renesas,r8a77965-csi2";
>  			reg = <0 0xfea80000 0 0x10000>;
> @@ -2177,6 +2201,7 @@
>  			status = "disabled";
>  
>  			vsps = <&vspd0 0 &vspd1 0 &vspd0 1>;
> +			cmms = <&cmm0 &cmm1 &cmm3>;
>  
>  			ports {
>  				#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
