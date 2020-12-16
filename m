Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B12B2DC57D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 18:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbgLPRl4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 12:41:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43028 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgLPRlz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 12:41:55 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1BC02CF;
        Wed, 16 Dec 2020 18:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608140474;
        bh=aOJsCU7xbWDjHaoMAighgp9XhXEnmkY/CAzNpq6x3rk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=arauI8BpRdPdeeCEY5lJTmgvX4CkZxN75ZmB4XgSO+TN3RhCLQNa8pYUsbOjxrlui
         SQHTIp4S2AgPUQctVs1cmidkF5rSEnBhUYuovR9dwRdL3UHNf4QGBmNfZUtWaPBHzh
         aApovK9sk+L8MFOEvOlXn4hVv/+BJkRo8VEbHm0A=
Date:   Wed, 16 Dec 2020 19:41:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r8a779a0: Add FCPVD support
Message-ID: <X9pGs3NwNQcmzu1f@pendragon.ideasonboard.com>
References: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
 <20201216170018.861710-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216170018.861710-2-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Dec 16, 2020 at 05:00:16PM +0000, Kieran Bingham wrote:
> Provide FCPVD support for the V3U.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index 6cf77ce9aa93..ba6fbbd8710e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -117,6 +117,22 @@ gic: interrupt-controller@f1000000 {
>  			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>  		};
>  
> +		fcpvd0: fcp@fea10000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea10000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 508>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 508>;
> +		};
> +
> +		fcpvd1: fcp@fea11000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea2f000 0 0x200>;

This doesn't match the node address (the former being correct I
believe). With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			clocks = <&cpg CPG_MOD 509>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 509>;
> +		};
> +
>  		prr: chipid@fff00044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xfff00044 0 4>;

-- 
Regards,

Laurent Pinchart
