Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186E53A6E63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbhFNSu5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233580AbhFNSu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:50:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB46C061574;
        Mon, 14 Jun 2021 11:48:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72C388C4;
        Mon, 14 Jun 2021 20:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623696532;
        bh=pEzM9+brJWe9OABxRVQIfo1YJ5jtmVd5zjXkDD3ijKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f1N7n11UGzO3PPmKzLO+dWpuMdCCRe3PbDI2hltfBi/fB1ws2edbIemznOhOPLJUP
         Gs7mvISg412e3rmM8QIhkmes5/u3s9T/muwmoPXo0Xfmr3sioDGMFYqr6lbzkT68vx
         g3jz4r44Bd0SUKdtaqIJDRcRS+mg0IkYYpC72xWE=
Date:   Mon, 14 Jun 2021 21:48:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 11/14] arm64: dts: renesas: Add support for M3ULCB with
 R-Car M3e-2G
Message-ID: <YMekgGdxJSdk881a@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <dfef77a16c752ad7078d6f8d0ee40e579b9a82ff.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dfef77a16c752ad7078d6f8d0ee40e579b9a82ff.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:24AM +0200, Geert Uytterhoeven wrote:
> Add support for the Renesas R-Car Starter Kit Pro equipped with an R-Car
> M3e-2G SiP.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts | 45 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 6a1061824a9f29f0..f29dd27692ba4a66 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
>  
>  dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-salvator-xs.dtb
> +dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts
> new file mode 100644
> index 0000000000000000..8f215a0b771b7c30
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> +/*
> + * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) with R-Car M3e-2G
> + *
> + * Copyright (C) 2021 Glider bv
> + *
> + * Based on r8a77961-ulcb.dts
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a779m3.dtsi"
> +#include "ulcb.dtsi"
> +
> +/ {
> +	model = "Renesas M3ULCB board based on r8a779m3";
> +	compatible = "renesas,m3ulcb", "renesas,r8a779m3", "renesas,r8a77961";
> +
> +	memory@48000000 {
> +		device_type = "memory";
> +		/* first 128MB is reserved for secure area. */
> +		reg = <0x0 0x48000000 0x0 0x78000000>;
> +	};
> +
> +	memory@480000000 {
> +		device_type = "memory";
> +		reg = <0x4 0x80000000 0x0 0x80000000>;
> +	};
> +
> +	memory@600000000 {
> +		device_type = "memory";
> +		reg = <0x6 0x00000000 0x1 0x00000000>;
> +	};
> +};
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 722>,
> +		 <&versaclock5 1>,
> +		 <&versaclock5 3>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.2",
> +		      "dclkin.0", "dclkin.1", "dclkin.2";
> +};

-- 
Regards,

Laurent Pinchart
