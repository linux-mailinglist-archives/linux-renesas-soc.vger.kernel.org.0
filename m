Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45815F2564
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 03:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfKGC2N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 21:28:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47308 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfKGC2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 21:28:13 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7B57329;
        Thu,  7 Nov 2019 03:28:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573093690;
        bh=g8WCwZH0F1Be0j0AjbbhXu+pCdV/dxFX9Y1zX3Y9JE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bxv8j5xOQ1YZTjo6AFlNB4lz27SBs4nQrZ7GbjDNGMl01tt8r8KWijppWCcHeeOpI
         L1P39vChxcZYH110na1olQ3GwoymnwRpB18vdsgOpVNbSMCdj9/W78e3pEPx99tgGq
         i9eua8vTCyKExw7O3dFoLsHzJyKDFX/DSIoLGhkY=
Date:   Thu, 7 Nov 2019 04:28:01 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rcar-gen3: Replace "vsps" by
 "renesas,vsps"
Message-ID: <20191107022801.GJ4878@pendragon.ideasonboard.com>
References: <20191105183504.21447-1-geert+renesas@glider.be>
 <20191105183504.21447-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191105183504.21447-4-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tue, Nov 05, 2019 at 07:35:04PM +0100, Geert Uytterhoeven wrote:
> The Renesas-specific "vsps" property lacks a vendor prefix.
> Add a "renesas," prefix to comply with DT best practises.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on '[PATCH 2/3] drm: rcar-du: Recognize "renesas,vsps" in
> addition to "vsps"'.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(once 2/3 will be upstream)

> ---
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi    | 2 +-
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi    | 2 +-
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi    | 3 ++-
>  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 3 ++-
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi    | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 3 ++-
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 3 ++-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi    | 2 +-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi    | 2 +-
>  11 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index 34a9f472fbb43072..0a48b53c3f9dcd69 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -2640,7 +2640,7 @@
>  			clock-names = "du.0", "du.1", "du.2";
>  			status = "disabled";
>  
> -			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
>  
>  			ports {
>  				#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index fe78387e4bb866ec..2ef0e136c84dcd25 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -2486,7 +2486,7 @@
>  			clock-names = "du.0", "du.1", "du.3";
>  			status = "disabled";
>  
> -			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
>  
>  			ports {
>  				#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index c7bdc3606323fc97..40aceb6681474f0d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1813,7 +1813,8 @@
>  			clocks = <&cpg CPG_MOD 724>,
>  				 <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> -			vsps = <&vspd0 0>, <&vspd1 0>;
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
> +
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> index 14d8513d2a47336f..29b20e8aca5863e4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> @@ -30,7 +30,7 @@
>  };
>  
>  &du {
> -	vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd3 0>;
> +	renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd3 0>;
>  };
>  
>  &fcpvb1 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index fde6ec122d3b4006..c7b4ece0ab3ee03f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -3184,7 +3184,8 @@
>  			clock-names = "du.0", "du.1", "du.2", "du.3";
>  
>  			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
> -			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>,
> +				       <&vspd0 1>;
>  
>  			status = "disabled";
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index b9db882b0351155c..95fa1608add896bf 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -2824,7 +2824,7 @@
>  			clock-names = "du.0", "du.1", "du.2";
>  
>  			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>;
> -			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
>  
>  			status = "disabled";
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index bdbe197774d2f659..fb48dabb25adaf77 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2500,7 +2500,7 @@
>  			clock-names = "du.0", "du.1", "du.3";
>  
>  			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm3>;
> -			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
>  
>  			status = "disabled";
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 0d0558e53533f0dc..c47608c3e0fa066f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -1121,7 +1121,8 @@
>  			clock-names = "du.0";
>  			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
>  			resets = <&cpg 724>;
> -			vsps = <&vspd0 0>;
> +			renesas,vsps = <&vspd0 0>;
> +
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> index 4d86669af819f089..53a01265233901fe 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -1496,7 +1496,8 @@
>  			clock-names = "du.0";
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 724>;
> -			vsps = <&vspd0 0>;
> +			renesas,vsps = <&vspd0 0>;
> +
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 67a6824a962c57a1..8283eb311eac6334 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1791,7 +1791,7 @@
>  			reset-names = "du.0";
>  
>  			renesas,cmms = <&cmm0>, <&cmm1>;
> -			vsps = <&vspd0 0>, <&vspd1 0>;
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
>  
>  			status = "disabled";
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index e6ee2b709ba61bd3..d969d7347cf872a4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1024,7 +1024,7 @@
>  			reset-names = "du.0";
>  
>  			renesas,cmms = <&cmm0>, <&cmm1>;
> -			vsps = <&vspd0 0>, <&vspd1 0>;
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
>  
>  			status = "disabled";
>  

-- 
Regards,

Laurent Pinchart
