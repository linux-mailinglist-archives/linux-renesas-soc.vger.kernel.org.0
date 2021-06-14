Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CE73A6E61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbhFNSu3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:50:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41222 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233732AbhFNSu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:50:29 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C84F58C4;
        Mon, 14 Jun 2021 20:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623696505;
        bh=A+3d5IM85O68k6CIknelDfe6zO8XOSrnhnA981RTipA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V8X6/6IKLIotzSydROLWGjzlQHeokFYJZ1LsvUOKqPgAWjIl3H3oPcuftTpFoharM
         S8DKEFEIHSiHo18cUW5TxZtDPzlxUyul0FFiPrR+K+9AsyuFRn8+lyxOkENB+BrGy+
         +B2qFEO/s3rWmKv0xV2JSGdsubFlO0aitHiyUjws=
Date:   Mon, 14 Jun 2021 21:48:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 10/14] arm64: dts: renesas: Add support for Salvator-XS
 with R-Car M3e-2G
Message-ID: <YMekZeHidc7/vx4m@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <1b467e9c9ae580f7a555c42493b95029223b18e8.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b467e9c9ae580f7a555c42493b95029223b18e8.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:23AM +0200, Geert Uytterhoeven wrote:
> Add support for the Renesas Salvator-X 2nd version development
> board equipped with an R-Car M3e-2G SiP.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  2 +
>  .../boot/dts/renesas/r8a779m3-salvator-xs.dts | 46 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 4fa0d56602684faf..6a1061824a9f29f0 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -66,3 +66,5 @@ dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
>  dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-salvator-xs.dtb

Same comment as or 07/14 regarding alphabetical ordering.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


> diff --git a/arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts
> new file mode 100644
> index 0000000000000000..4ab26fd7233d62fc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> +/*
> + * Device Tree Source for the Salvator-X 2nd version board with R-Car M3e-2G
> + *
> + * Copyright (C) 2021 Glider bv
> + *
> + * Based on r8a77961-salvator-xs.dts
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a779m3.dtsi"
> +#include "salvator-xs.dtsi"
> +
> +/ {
> +	model = "Renesas Salvator-X 2nd version board based on r8a779m3";
> +	compatible = "renesas,salvator-xs", "renesas,r8a779m3",
> +		     "renesas,r8a77961";
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
> +		 <&versaclock6 1>,
> +		 <&x21_clk>,
> +		 <&versaclock6 2>;
> +	clock-names = "du.0", "du.1", "du.2",
> +		      "dclkin.0", "dclkin.1", "dclkin.2";
> +};

-- 
Regards,

Laurent Pinchart
