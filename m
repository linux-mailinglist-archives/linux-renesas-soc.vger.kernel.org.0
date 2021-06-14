Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAA93A6E57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhFNStW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhFNStW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:49:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1E3C061574;
        Mon, 14 Jun 2021 11:47:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 050E38C4;
        Mon, 14 Jun 2021 20:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623696438;
        bh=EsfPWCtNCirnjhoQWDAg+XhtwxUKUM5bkZuZ+KLnxzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f5Osnmd3R+N+Cio29u7vFJ4TuoJ2HUVQGRZ6ObN0LfvGUdolqiHVRGCjw8HghI10c
         HIBwvg1EnNVij/IemojjrADbOHWCbgXn7+oLclg6RhcxzpELDiurUi+b+sPGN+0Q0+
         BscGVFA7HvB9JIW2W/rbbVsyLe0brScl05lwM2Lg=
Date:   Mon, 14 Jun 2021 21:46:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 09/14] arm64: dts: renesas: Add support for
 H3ULCB+Kingfisher with R-Car H3e-2G
Message-ID: <YMekIpKl6XIrs2Ad@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <15db05a1ea11c345acb20fda38edeb4ceac8c0e3.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <15db05a1ea11c345acb20fda38edeb4ceac8c0e3.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:22AM +0200, Geert Uytterhoeven wrote:
> Add support for the Renesas R-Car Starter Kit Premier and Kingfisher
> combo equipped with an R-Car H3e-2G SiP.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  .../boot/dts/renesas/r8a779m1-ulcb-kf.dts     | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 2a9119c8651815eb..4fa0d56602684faf 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -65,3 +65,4 @@ dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
>  
>  dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
> new file mode 100644
> index 0000000000000000..0baebc5c58b06a34
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> +/*
> + * Device Tree Source for the H3ULCB Kingfisher board with R-Car H3e-2G
> + *
> + * Copyright (C) 2021 Glider bv
> + *
> + * Based on r8a77951-ulcb-kf.dts
> + * Copyright (C) 2017 Renesas Electronics Corp.
> + * Copyright (C) 2017 Cogent Embedded, Inc.
> + */
> +
> +#include "r8a779m1-ulcb.dts"
> +#include "ulcb-kf.dtsi"
> +
> +/ {
> +	model = "Renesas H3ULCB Kingfisher board based on r8a779m1";
> +	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
> +		     "renesas,r8a779m1", "renesas,r8a7795";
> +};

-- 
Regards,

Laurent Pinchart
