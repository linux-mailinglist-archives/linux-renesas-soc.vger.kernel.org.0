Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC98A3A6E67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhFNSvW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhFNSvW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:51:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1AD8C061574;
        Mon, 14 Jun 2021 11:49:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F2508C4;
        Mon, 14 Jun 2021 20:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623696557;
        bh=YQo0xnKbxrTuUBhQzTbPS41bX9HJidilTg+ndNejr+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T73M5UqGtmg5k3ncZoS+u/4Huxyu4EQRDpSPmfC5B3bRIN0qO7IgLWQ/RKJ3a8dHK
         rLUohbN+oRAz+nKB1k73wus3XTZhS0DTlzy+gzaTjdzRukCnqDNP4xexD1rqbPm0yw
         4FrwsxB9mWWYoU18YGtvb/UskHsT7ZV0Les2sSAQ=
Date:   Mon, 14 Jun 2021 21:48:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/14] arm64: dts: renesas: Add support for
 M3ULCB+Kingfisher with R-Car M3e-2G
Message-ID: <YMekmf4JHoQA6Hvc@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <82fcc6ca4df7a8c40c34ce7bd39c3d9ab171f2bf.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82fcc6ca4df7a8c40c34ce7bd39c3d9ab171f2bf.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:25AM +0200, Geert Uytterhoeven wrote:
> Add support for the Renesas R-Car Starter Kit Pro and Kingfisher combo
> equipped with an R-Car M3e-2G SiP.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/Makefile           |  1 +
>  .../boot/dts/renesas/r8a779m3-ulcb-kf.dts      | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index f29dd27692ba4a66..5c73eb7baeadc8c4 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
>  
>  dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
> new file mode 100644
> index 0000000000000000..6bacee1d2ef5c857
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: (GPL-2.0 or MIT)
> +/*
> + * Device Tree Source for the M3ULCB Kingfisher board with R-Car M3e-2G
> + *
> + * Copyright (C) 2021 Glider bv
> + *
> + * Based on r8a77961-ulcb-kf.dts
> + * Copyright (C) 2020 Eugeniu Rosca <rosca.eugeniu@gmail.com>
> + */
> +
> +#include "r8a779m3-ulcb.dts"
> +#include "ulcb-kf.dtsi"
> +
> +/ {
> +	model = "Renesas M3ULCB Kingfisher board based on r8a779m3";
> +	compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
> +		     "renesas,r8a779m3", "renesas,r8a77961";
> +};

-- 
Regards,

Laurent Pinchart
