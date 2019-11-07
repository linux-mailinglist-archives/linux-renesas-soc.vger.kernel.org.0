Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48128F3908
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 20:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfKGT5v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 14:57:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33782 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbfKGT5v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 14:57:51 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 637DB71D;
        Thu,  7 Nov 2019 20:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573156668;
        bh=y5iPhWRhTcprb2K2OhqWRg6hzAu2VplximOa2LWgJ4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=slI55OXZvK5QvSN0ZfOJnelJqe1sGWF1yeb4tYqEfev1ExvpLOj4JIURgBH+aeNXL
         3fmbpyB/mSjKtmBSyO5uVeOfvFR/Dv7uWEZVQi9SL8IcWKLLD+JyOeWmgoKyI8ub5F
         8NCYJeEosR9t1PMebzcJ+4gYwbc5a+RlH2lPOSzE=
Date:   Thu, 7 Nov 2019 21:57:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, sam@ravnborg.org
Subject: Re: [PATCH v3 7/8] [HACK] arm64: dts: renesas: draak: Enable LVDS
Message-ID: <20191107195737.GL24983@pendragon.ideasonboard.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1567017402-5895-8-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

The subject is wrong, it should be

[HACK] arm64: dts: renesas: ebisu: Enable LVDS dual-link operation

On Wed, Aug 28, 2019 at 07:36:41PM +0100, Fabrizio Castro wrote:
> Enable and connect the second LVDS encoder to the second LVDS input of
> the THC63LVD1024 for dual-link LVDS operation. This requires changing
> the default settings of SW45 and SW47 to OFF and ON respectively.
> 
> This patch is based on Laurent's dual-LVDS work:
> https://patchwork.kernel.org/patch/10965045/
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> v2->v3:
> * new patch
> 
> Geert,
> 
> no need to review this patch unless they like the idea behind this
> series.
> 
> Thanks,
> Fab
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index b38f9d4..38b9c5a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -87,11 +87,20 @@
>  
>  			port@0 {
>  				reg = <0>;
> -				thc63lvd1024_in: endpoint {
> +				dual-lvds-even-pixels;
> +				thc63lvd1024_in0: endpoint {
>  					remote-endpoint = <&lvds0_out>;
>  				};
>  			};
>  
> +			port@1 {
> +				reg = <1>;
> +				dual-lvds-odd-pixels;
> +				thc63lvd1024_in1: endpoint {
> +					remote-endpoint = <&lvds1_out>;
> +				};
> +			};
> +
>  			port@2 {
>  				reg = <2>;
>  				thc63lvd1024_out: endpoint {
> @@ -489,7 +498,7 @@
>  	ports {
>  		port@1 {
>  			lvds0_out: endpoint {
> -				remote-endpoint = <&thc63lvd1024_in>;
> +				remote-endpoint = <&thc63lvd1024_in0>;
>  			};
>  		};
>  	};
> @@ -507,6 +516,14 @@
>  		 <&x13_clk>,
>  		 <&extal_clk>;
>  	clock-names = "fck", "dclkin.0", "extal";
> +
> +	ports {
> +		port@1 {
> +			lvds1_out: endpoint {
> +				remote-endpoint = <&thc63lvd1024_in1>;
> +			};
> +		};
> +	};
>  };
>  
>  &ohci0 {
> -- 
> 2.7.4
> 

-- 
Regards,

Laurent Pinchart
