Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2517736BCA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 02:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhD0A1d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Apr 2021 20:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhD0A1d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 20:27:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF1FC061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Apr 2021 17:26:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFCA5E9;
        Tue, 27 Apr 2021 02:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619483208;
        bh=3n7T6sKxWp9H7PPcY27A3tXxy0cOwq/dcGJHVDkQGsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F+Q4KNaKAQlmlLg4ttjOoLjo4uoLF3bQjGKaqKx4t73MbUEhlzyi6Pk2esBsvDaOl
         hB0QOKzm30h4BcZz63QseObaA5MLNBeRY3av94wLkjM5+4pPVf3sh1Gwl898aTEb03
         ercW8wts2ymSybtP4qSIkhFWseXjUGEiJZznqePg=
Date:   Tue, 27 Apr 2021 03:26:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add port@0 node for all CSI-2
 nodes to dtsi
Message-ID: <YIdaQuNFj49C0SDS@pendragon.ideasonboard.com>
References: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se>
 <20210421150221.3202955-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210421150221.3202955-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Apr 21, 2021 at 05:02:21PM +0200, Niklas Söderlund wrote:
> The port@0 is a mandatory port, add or move the declaration to the CSI-2
> nodes top declared in dtsi files instead of depending on dts files
> adding them when describing the external connection.
> 
> This fixes validation warnings for DTB outputs that does not connect all
> CSI-2 receivers to transmitters and thus declaring all port@0 nodes in
> dts files.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  ...hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi |  2 --
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi            |  8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi            |  8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi            |  4 ++++
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi            |  8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a77950.dtsi            |  4 ++++
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi            | 12 ++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi            |  8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi            |  8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi            |  8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi            |  4 ++++
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi            |  8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts       |  2 --
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi            |  4 ++++
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi     |  3 ---
>  15 files changed, 84 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
> index c62ddb9b2ba565e9..3771144a2ce49a45 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi
> @@ -14,7 +14,6 @@ &csi20 {
>  
>  	ports {
>  		port@0 {
> -			reg = <0>;
>  			csi20_in: endpoint {
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
> @@ -29,7 +28,6 @@ &csi40 {
>  
>  	ports {
>  		port@0 {
> -			reg = <0>;
>  			csi40_in: endpoint {
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index d64fb8b1b86c3731..46f8dbf6890482d9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -2573,6 +2573,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;

I wonder if we should also add #address-cells and #size-cells. That
could simplify the board DT files, but on the other hand, as this is a
CSI-2 input, having multiple endpoints would probably be very rare. It's
probably good enough to leave it as-is.

Trusting that you've addressed all occurrences,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -2628,6 +2632,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index 5b05474dc2727884..d16a4be5ef77a21b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -2419,6 +2419,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -2474,6 +2478,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 20fa3caa050e5d5e..1aef34447abd1b3d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1823,6 +1823,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> index 8eb006cbd9af4c98..1f51237ab0a648fa 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2709,6 +2709,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -2764,6 +2768,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77950.dtsi b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
> index 25b87da32eebb6dc..b643d3079db1e7aa 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77950.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77950.dtsi
> @@ -192,6 +192,10 @@ ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  
> +			port@0 {
> +				reg = <0>;
> +			};
> +
>  			port@1 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> index 5c39152e45707441..85d66d15465ab2b6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -3097,6 +3097,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -3152,6 +3156,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -3191,6 +3199,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> index 25d947a81b294a81..12476e354d746d0e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2761,6 +2761,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -2816,6 +2820,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index ab081f14af9aa0fb..d9804768425a7603 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2499,6 +2499,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -2554,6 +2558,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 657b20d3533bd398..dcb9df861d749692 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2575,6 +2575,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -2630,6 +2634,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 5a5d5649332a8b1d..e8f6352c3665f44c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -1106,6 +1106,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> index 1ffa4a995a7ab8ae..7b51d464de0eac8b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -1439,6 +1439,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> @@ -1478,6 +1482,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 295d34f1d216d963..4715e4a4abe064cd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -298,8 +298,6 @@ &csi40 {
>  
>  	ports {
>  		port@0 {
> -			reg = <0>;
> -
>  			csi40_in: endpoint {
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 5010f23fafcc7f98..0eaea58f4210d89a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1970,6 +1970,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index e18747df219f8118..453ffcef24fae1be 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -349,7 +349,6 @@ &csi20 {
>  
>  	ports {
>  		port@0 {
> -			reg = <0>;
>  			csi20_in: endpoint {
>  				clock-lanes = <0>;
>  				data-lanes = <1>;
> @@ -364,8 +363,6 @@ &csi40 {
>  
>  	ports {
>  		port@0 {
> -			reg = <0>;
> -
>  			csi40_in: endpoint {
>  				clock-lanes = <0>;
>  				data-lanes = <1 2 3 4>;

-- 
Regards,

Laurent Pinchart
