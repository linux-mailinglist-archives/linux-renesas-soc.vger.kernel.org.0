Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F59B3A6E55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbhFNSsz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:48:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41192 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232994AbhFNSsy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:48:54 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83F188C4;
        Mon, 14 Jun 2021 20:46:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623696410;
        bh=nrWPA+ySSyTiXfx6OEUhgaMuTDHX5FFVCMYevvI7Zao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eu03jZ9/MTCuacIAvz+89TanmJPhHYaKIMIW8J1yxjeDdMHkXwSE09YB6w8EhlBHH
         H7pVlL4JUaBHOfie76yGt9pQ6K90DZLqsgMjOiLh4RgG2suj2EIVSFufkRja78lhkN
         Oj4UZW55ERw59bsRAQWfr5RVH5kBkeR/5uItu+zQ=
Date:   Mon, 14 Jun 2021 21:46:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 08/14] arm64: dts: renesas: Add support for H3ULCB with
 R-Car H3e-2G
Message-ID: <YMekBi2wzeo2WssK@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <d091337a5ed190dc564d2b512be39b95949fda57.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d091337a5ed190dc564d2b512be39b95949fda57.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:21AM +0200, Geert Uytterhoeven wrote:
> Add support for the Renesas R-Car Starter Kit Premier equipped with an
> R-Car H3e-2G SiP.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts | 54 +++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 5a689a1d10821f1d..2a9119c8651815eb 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -64,3 +64,4 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
>  dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
>  
>  dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
> +dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts
> new file mode 100644
> index 0000000000000000..e294b6bda28c68c8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> +/*
> + * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) with R-Car H3e-2G
> + *
> + * Copyright (C) 2021 Glider bv
> + *
> + * Based on r8a77951-ulcb.dts
> + *
> + * Copyright (C) 2016 Renesas Electronics Corp.
> + * Copyright (C) 2016 Cogent Embedded, Inc.
> + */
> +
> +/dts-v1/;
> +#include "r8a779m1.dtsi"
> +#include "ulcb.dtsi"
> +
> +/ {
> +	model = "Renesas H3ULCB board based on r8a779m1";
> +	compatible = "renesas,h3ulcb", "renesas,r8a779m1", "renesas,r8a7795";
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
> +		 <&versaclock5 1>,
> +		 <&versaclock5 3>,
> +		 <&versaclock5 4>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.2", "du.3",
> +		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
> +};
> -- 
> 2.25.1
> 

-- 
Regards,

Laurent Pinchart
