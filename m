Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F04586196F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 05:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbfGHDQd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jul 2019 23:16:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39770 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728603AbfGHDQd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jul 2019 23:16:33 -0400
Received: from pendragon.ideasonboard.com (unknown [210.160.37.25])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F8C0CC;
        Mon,  8 Jul 2019 05:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562555790;
        bh=TCTDoX46oBqy8Inp3/0TzEzIxNsKLKy2zEALHLlQl/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NONJyOdjJ/Hp+cUGaja110D0tDbo+w7qTWYf6muzbpgkQxMEwDucpaR7uHh1vSJF/
         OJIhmpUaUnWwSDEfiZNhyVe2dql65FfIqQauvPGP17GNN0vihTiTRFNkaDvATB7SQF
         SCzqgRPglnrxV8yrz1kTRwPhX7pXm3mEd4lPb2f4=
Date:   Mon, 8 Jul 2019 06:16:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/19] arm64: dts: renesas: r8a77965: Add CMM units
Message-ID: <20190708031601.GB5046@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-12-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190706140746.29132-12-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sat, Jul 06, 2019 at 04:07:38PM +0200, Jacopo Mondi wrote:
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
> index b701aeb4f438..aad9ea67c379 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2307,6 +2307,30 @@
>  			resets = <&cpg 602>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm3: cmm@fea70000 {
> +			compatible = "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea70000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 708>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 708>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			compatible = "renesas,r8a77965-csi2";
>  			reg = <0 0xfea80000 0 0x10000>;
> @@ -2457,6 +2481,7 @@
>  			status = "disabled";
>  
>  			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> +			cmms = <&cmm0 &cmm1 &cmm3>;
>  
>  			ports {
>  				#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
