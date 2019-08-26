Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 335EF9D97A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 00:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfHZWrm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 18:47:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57756 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfHZWrm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 18:47:42 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB5519A4;
        Tue, 27 Aug 2019 00:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566859661;
        bh=5FneaKNOaJ6gc1HCDlkYzgekoyT6FJ9a1i4rQZk/G64=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q77l1vMnetbiVN/hqkbVVfXAD+kTMJ38mjw6gRt05MANFlmT4HlwoO7DyVGFusuOo
         xTTzyk7bHrsTC+Fnf1feUNYglDXMosa8Md/TYj9swR4FqYuGkjHQNVES+ggCwfdc/p
         GYNWhQXH1pKuSu0W++YxwhftImTiWCLQkWGobEWY=
Date:   Tue, 27 Aug 2019 01:47:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/14] arm64: dts: renesas: r8a77995: Add CMM units
Message-ID: <20190826224734.GP5031@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-8-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-8-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sun, Aug 25, 2019 at 03:51:47PM +0200, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car D3 device tree and reference them from
> the Display Unit they are connected to.
> 
> While at it, re-sort the du device node properties to match the ordering
> found in other SoCs.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Apart from the issue with compatible string as pointed out for patch
03/14,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 183fef86cf7c..b91a20fbbbc6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -993,6 +993,22 @@
>  			iommus = <&ipmmu_vi0 9>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,cmm-r8a77995";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,cmm-r8a77995";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 710>;
> +		};
> +
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a77995";
>  			reg = <0 0xfeb00000 0 0x40000>;
> @@ -1003,9 +1019,11 @@
>  			clock-names = "du.0", "du.1";
>  			resets = <&cpg 724>;
>  			reset-names = "du.0";
> -			vsps = <&vspd0 0>, <&vspd1 0>;
>  			status = "disabled";
>  
> +			vsps = <&vspd0 0>, <&vspd1 0>;
> +			cmms = <&cmm0 &cmm1>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;

-- 
Regards,

Laurent Pinchart
