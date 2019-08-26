Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4869D96B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 00:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfHZWqF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 18:46:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57674 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfHZWqF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 18:46:05 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47C1D9A4;
        Tue, 27 Aug 2019 00:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566859563;
        bh=SWj3spkwkOtYX8YrJap0S99T5V3UGXz7NDMFec8t+/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GRXcRZTVF+SUiyl1YUHYf6U9ibc5kaCtFoPU7a/QbSW6QY7pEMHCEwyoStK6MnRRo
         xxxo6C22MJz73z2csXObfDkGBpMbfTYMP11ezzxtxIVQ6zDI2MKJyEmz5lK/M3YYBN
         41pZj8UkpvnYuVWXqu2hnuK5f+QF7ce+GVZupa/Y=
Date:   Tue, 27 Aug 2019 01:45:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] arm64: dts: renesas: r8a77965: Add CMM units
Message-ID: <20190826224557.GN5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-6-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Aug 25, 2019 at 03:51:45PM +0200, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car M3-N device tree and reference them from
> the Display Unit they are connected to.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Apart from the issue with compatible string as pointed out for patch
03/14,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 4ae163220f60..8cf0d049203d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2320,6 +2320,30 @@
>  			resets = <&cpg 611>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,cmm-r8a77965";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,cmm-r8a77965";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm3: cmm@fea70000 {
> +			compatible = "renesas,cmm-r8a77965";
> +			reg = <0 0xfea70000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 708>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			resets = <&cpg 708>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			compatible = "renesas,r8a77965-csi2";
>  			reg = <0 0xfea80000 0 0x10000>;
> @@ -2470,6 +2494,7 @@
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
