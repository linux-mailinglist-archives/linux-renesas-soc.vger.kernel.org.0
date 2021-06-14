Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD3B3A6E46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 20:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbhFNSkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 14:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhFNSkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 14:40:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5132AC061574;
        Mon, 14 Jun 2021 11:38:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCF9E8C4;
        Mon, 14 Jun 2021 20:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623695911;
        bh=HxuZ3VL94V0553m6WHgSB70p3uAwjhQ53V/YAm494sg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o0f/52osaBNFZXs8Yw+YFcOgbDqIQkkw4Zrjn5WmzcycdQO5IkxjmjioxfdOa/qOS
         GJpFBHG/ps6/RM60ixTBrQYRqYpj+Kyk/MOUZV2SpWgRMY2hBCYrRZQuRnZlUfVWSM
         vdLZJoOsB3plTGln7czl/5GfB5wozLQxi6evyxoI=
Date:   Mon, 14 Jun 2021 21:38:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/14] pinctrl: renesas: Fix pin control matching on
 R-Car H3e-2G
Message-ID: <YMeiE0xMW5zpgpRM@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <ab1acd836e990c536ff3a8c715ce57363d3ff8cb.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab1acd836e990c536ff3a8c715ce57363d3ff8cb.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:16AM +0200, Geert Uytterhoeven wrote:
> As R-Car H3 ES1.x (R8A77950) and R-Car ES2.0+ (R8A77951) use the same
> compatible value, the pin control driver relies on soc_device_match()
> with soc_id = "r8a7795" and the (non)matching of revision = "ES1.*" to
> match with and distinguish between the two SoC variants.  The
> corresponding entries in the normal of_match_table are present only to
> make the optional sanity checks work.
> 
> The R-Car H3e-2G (R8A779M1) SoC is a different grading of the R-Car H3
> ES3.0 (R8A77951) SoC.  It uses the same compatible values for individual
> devices, but has an additional compatible value for the root node.
> When running on an R-Car H3e-2G SoC, soc_device_match() with soc_id =
> "r8a7795" does not return a match.  Hence the pin control driver falls
> back to the normal of_match_table, and, as the R8A77950 entry is listed
> first, incorrectly uses the sub-driver for R-Car H3 ES1.x.
> 
> Fix this by moving the entry for R8A77951 before the entry for R8A77950.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I wonder if this means we could drop the second entry in the quirks
array, in sh_pfc_quirk_match().

> ---
>  drivers/pinctrl/renesas/core.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
> index 5ccc49b387f17eb9..9adb97065704270d 100644
> --- a/drivers/pinctrl/renesas/core.c
> +++ b/drivers/pinctrl/renesas/core.c
> @@ -571,17 +571,21 @@ static const struct of_device_id sh_pfc_of_table[] = {
>  		.data = &r8a7794_pinmux_info,
>  	},
>  #endif
> -/* Both r8a7795 entries must be present to make sanity checks work */
> -#ifdef CONFIG_PINCTRL_PFC_R8A77950
> +/*
> + * Both r8a7795 entries must be present to make sanity checks work, but only
> + * the first entry is actually used, for R-Car H3e.
> + * R-Car H3 ES1.x and ES2.0+ are matched using soc_device_match() instead.
> + */
> +#ifdef CONFIG_PINCTRL_PFC_R8A77951
>  	{
>  		.compatible = "renesas,pfc-r8a7795",
> -		.data = &r8a77950_pinmux_info,
> +		.data = &r8a77951_pinmux_info,
>  	},
>  #endif
> -#ifdef CONFIG_PINCTRL_PFC_R8A77951
> +#ifdef CONFIG_PINCTRL_PFC_R8A77950
>  	{
>  		.compatible = "renesas,pfc-r8a7795",
> -		.data = &r8a77951_pinmux_info,
> +		.data = &r8a77950_pinmux_info,
>  	},
>  #endif
>  #ifdef CONFIG_PINCTRL_PFC_R8A77960

-- 
Regards,

Laurent Pinchart
