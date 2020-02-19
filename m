Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A0816488F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 16:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgBSP23 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 10:28:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgBSP23 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 10:28:29 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7190452B;
        Wed, 19 Feb 2020 16:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582126107;
        bh=S3hwt9TMlVU5HobaEOMv2lev0QevEyU32s/7zeGqV60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SwuUYcaWCm3YnE//Co/L6TqBj4PgYw+ftIDyWbzrq0jRZi90EJNqALCUFa6rRyl4j
         ei2wh/Ch+LjBo00a+jgwl8k+pdFrEPzyhJoYCUS9SacAWr1DqGLDoEg5G38ksZb1L8
         q/pYiUl23hrjNle51MAmeMmv555nbLHAX/kKvqpA=
Date:   Wed, 19 Feb 2020 17:28:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] ARM: dts: rzg1: Add reset control properties for
 display
Message-ID: <20200219152808.GS5070@pendragon.ideasonboard.com>
References: <20200218133019.22299-1-geert+renesas@glider.be>
 <20200218133019.22299-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200218133019.22299-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tue, Feb 18, 2020 at 02:30:17PM +0100, Geert Uytterhoeven wrote:
> Add reset control properties to the devices node for the Display Units
> on all supported RZ/G1 SoCs.  Note that on these SoCs, there is only a
> single reset for all DU channels.
> 
> Join the clocks lines while at it, to increase uniformity.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  arch/arm/boot/dts/r8a7743.dtsi  | 5 +++--
>  arch/arm/boot/dts/r8a7744.dtsi  | 5 +++--
>  arch/arm/boot/dts/r8a7745.dtsi  | 2 ++
>  arch/arm/boot/dts/r8a77470.dtsi | 5 +++--
>  4 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 1cd19a569bd0fb66..e8b340bb99bc3031 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -1669,9 +1669,10 @@
>  			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";

Same comment as for 1/4.

>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
> index 1c82dd0abd76c4c9..def840b8b2d3c0c4 100644
> --- a/arch/arm/boot/dts/r8a7744.dtsi
> +++ b/arch/arm/boot/dts/r8a7744.dtsi
> @@ -1655,9 +1655,10 @@
>  			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
> index 3b413658eb8d8fac..7ab58d8bb74010d6 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -1510,6 +1510,8 @@
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
> index 6efcef1670e15a95..f5515319227609a4 100644
> --- a/arch/arm/boot/dts/r8a77470.dtsi
> +++ b/arch/arm/boot/dts/r8a77470.dtsi
> @@ -942,9 +942,10 @@
>  			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			status = "disabled";
>  
>  			ports {

-- 
Regards,

Laurent Pinchart
