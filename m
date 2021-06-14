Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271803A6E53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhFNSsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:48:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41186 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhFNSsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:48:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADF0E8C4;
        Mon, 14 Jun 2021 20:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623696368;
        bh=KBdF3KGcAs87JoC2/pIuxQ/UW+F+UMf+JXEsHoliXpE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nXWXhBjMp4vDTtIbJm/K9i3KijqeVD1B//s/X0PkEu0WVz3rwERmEfHc9p+0wGRXB
         onZ9786MUdFH4g5k7i+ofHNkrB43x3GnJdOp6F35WoXiCx/QpPGSkO5PpXfzOAePQi
         60zC8w8lC7c4X+cQxNrjRglJQ541wFzzwPBif3cA=
Date:   Mon, 14 Jun 2021 21:45:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 07/14] arm64: dts: renesas: Add support for Salvator-XS
 with R-Car H3e-2G
Message-ID: <YMej3BSjxeiRxLWg@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <fda1bc3516ac98084089b5565b486a0a41b3a62c.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fda1bc3516ac98084089b5565b486a0a41b3a62c.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:20AM +0200, Geert Uytterhoeven wrote:
> Add support for the Renesas Salvator-X 2nd version development
> board equipped with an R-Car H3e-2G SiP.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  2 +
>  .../boot/dts/renesas/r8a779m1-salvator-xs.dts | 53 +++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index f2de2fa0c8b890fb..5a689a1d10821f1d 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -62,3 +62,5 @@ dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
>  dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
>  
>  dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb

How about preserving the alphabetical order of the Kconfig symbols ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> diff --git a/arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
> new file mode 100644
> index 0000000000000000..084b75b046802339
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> +/*
> + * Device Tree Source for the Salvator-X 2nd version board with R-Car H3e-2G
> + *
> + * Copyright (C) 2021 Glider bv
> + *
> + * Based on r8a77951-salvator-xs.dts
> + * Copyright (C) 2015-2017 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a779m1.dtsi"
> +#include "salvator-xs.dtsi"
> +
> +/ {
> +	model = "Renesas Salvator-X 2nd version board based on r8a779m1";
> +	compatible = "renesas,salvator-xs", "renesas,r8a779m1",
> +		     "renesas,r8a7795";
> +
> +	memory@48000000 {
> +		device_type = "memory";
> +		/* first 128MB is reserved for secure area. */
> +		reg = <0x0 0x48000000 0x0 0x38000000>;
> +	};
> +
> +	memory@500000000 {
> +		device_type = "memory";
> +		reg = <0x5 0x00000000 0x0 0x40000000>;
> +	};
> +
> +	memory@600000000 {
> +		device_type = "memory";
> +		reg = <0x6 0x00000000 0x0 0x40000000>;
> +	};
> +
> +	memory@700000000 {
> +		device_type = "memory";
> +		reg = <0x7 0x00000000 0x0 0x40000000>;
> +	};
> +};
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 722>,
> +		 <&cpg CPG_MOD 721>,
> +		 <&versaclock6 1>,
> +		 <&x21_clk>,
> +		 <&x22_clk>,
> +		 <&versaclock6 2>;
> +	clock-names = "du.0", "du.1", "du.2", "du.3",
> +		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
> +};

-- 
Regards,

Laurent Pinchart
