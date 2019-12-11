Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8D111BABC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 18:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLKRz6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 12:55:58 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49962 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730370AbfLKRz5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 12:55:57 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FD4F52B;
        Wed, 11 Dec 2019 18:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576086954;
        bh=Xh8Msu7NfCacjtzXsP75EtbAtj7l4hIO0d+X4rXQKHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wn9VaWIebbTpcjz1pxtTdkJlBg3o5lMdDz5Cmjs02vW6tgQU/WtHFvNA1ENb2mRkF
         TxrH/uu+LkL3zYChBcTpTsnVQIOmzfM5vfO8eXW+A4lxnQYw7sAFUP4qPYWtzsWJOx
         sCrpVokZ1hdlXmmdFT5fq6RlaTxQkxh9qGFaZok8=
Date:   Wed, 11 Dec 2019 19:55:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] arm64: dts: renesas: Rename r8a7796* to r8a77960*
Message-ID: <20191211175546.GB4863@pendragon.ideasonboard.com>
References: <20191211131311.23661-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191211131311.23661-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Wed, Dec 11, 2019 at 02:13:11PM +0100, Geert Uytterhoeven wrote:
> CONFIG_ARCH_R8A7796 was renamed to CONFIG_ARCH_R8A77960 in commit
> 39e57e14d7eaf818 ("soc: renesas: Add ARCH_R8A77960 for existing R-Car
> M3-W"), to avoid confusion between R-Car M3-W (R8A77960) and R-Car M3-W+
> (R8A77961).
> 
> Rename the DTS files as well, for consistency.
> 
> Note that DT binding headers, definitions, and compatible values were
> not renamed, to preserve backward compatibility.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> I think it makes sense to do a similar but slightly different rename
> dance for R-Car H3:
>   - Config symbols:
>       - CONFIG_ARCH_R8A7795 => CONFIG_ARCH_R8A77950 (ES1.x)
> 			       CONFIG_ARCH_R8A77951 (ES2.0+)
>       - CONFIG_PINCTRL_PFC_R8A7795 => CONFIG_PINCTRL_PFC_R8A77950 (ES1.0)
> 				      CONFIG_PINCTRL_PFC_R8A77951 (ES2.0+)
> 	(auto-selected based on CONFIG_ARCH_R8A77950/CONFIG_ARCH_R8A77951)
>   - Drivers:
>       - drivers/pinctrl/sh-pfc/{pfc-r8a7795-es1.c => pfc-r8a77950.c}
>       - drivers/pinctrl/sh-pfc/{pfc-r8a7795.c => pfc-r8a77951.c}
>   - DTS:
>       - r8a7795-es1.dtsi => r8a77950.dtsi
>       - r8a7795.dtsi => r8a77951.dtsi
>       - r8a7795-es1-h3ulcb-kf.dts => r8a77950-h3ulcb-kf.dts
>       - r8a7795-es1-h3ulcb.dts => r8a77950-h3ulcb.dts
>       - r8a7795-es1-salvator-x.dts => r8a77950-salvator-x.dts
>       - r8a7795-h3ulcb-kf.dts => r8a77951-h3ulcb-kf.dts
>       - r8a7795-h3ulcb.dts => r8a77951-h3ulcb.dts
>       - r8a7795-salvator-x.dts => r8a77951-salvator-x.dts
>       - r8a7795-salvator-xs.dts => r8a77951-salvator-xs.dts
>   - Unchanged (auto-selected symbols, drivers and compatible values are
>     the same):
>       - CONFIG_CLK_R8A7795
>       - CONFIG_SYSC_R8A7795
>       - drivers/clk/renesas/r8a7795-cpg-mssr.c
>       - drivers/soc/renesas/r8a7795-sysc.c
>       - drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> 
> Advantages:
>   - Allow reducing kernel size (due to dropping pfc-r8a7795-es1, 47 KiB)
>     by not enabling support for R-Car H3 ES1.x,
>   - Closer correspondence with the R-Car Series, 3rd Generation
>     documentation, which uses 5-digit part numbers.
> 
> Disadvantages:
>   - The DTB files are renamed.
> 
> Thanks for your comments!

I have no objection.

> ---
>  arch/arm64/boot/dts/renesas/Makefile                        | 6 +++---
>  .../{r8a7796-m3ulcb-kf.dts => r8a77960-m3ulcb-kf.dts}       | 4 ++--
>  .../dts/renesas/{r8a7796-m3ulcb.dts => r8a77960-m3ulcb.dts} | 4 ++--
>  .../{r8a7796-salvator-x.dts => r8a77960-salvator-x.dts}     | 4 ++--
>  .../{r8a7796-salvator-xs.dts => r8a77960-salvator-xs.dts}   | 4 ++--
>  arch/arm64/boot/dts/renesas/{r8a7796.dtsi => r8a77960.dtsi} | 0
>  6 files changed, 11 insertions(+), 11 deletions(-)
>  rename arch/arm64/boot/dts/renesas/{r8a7796-m3ulcb-kf.dts => r8a77960-m3ulcb-kf.dts} (76%)
>  rename arch/arm64/boot/dts/renesas/{r8a7796-m3ulcb.dts => r8a77960-m3ulcb.dts} (90%)
>  rename arch/arm64/boot/dts/renesas/{r8a7796-salvator-x.dts => r8a77960-salvator-x.dts} (94%)
>  rename arch/arm64/boot/dts/renesas/{r8a7796-salvator-xs.dts => r8a77960-salvator-xs.dts} (94%)
>  rename arch/arm64/boot/dts/renesas/{r8a7796.dtsi => r8a77960.dtsi} (100%)
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index bc54041590a7ca05..6ba67ae59e052326 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -9,9 +9,9 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-h3ulcb-kf.dtb
> -dtb-$(CONFIG_ARCH_R8A77960) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
> -dtb-$(CONFIG_ARCH_R8A77960) += r8a7796-m3ulcb-kf.dtb
> -dtb-$(CONFIG_ARCH_R8A77960) += r8a7796-salvator-xs.dtb
> +dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-m3ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-m3ulcb-kf.dtb
> +dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-m3nulcb.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77960-m3ulcb-kf.dts
> similarity index 76%
> rename from arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> rename to arch/arm64/boot/dts/renesas/r8a77960-m3ulcb-kf.dts
> index 2df50eb11f165aac..611dd2d4fae98d29 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77960-m3ulcb-kf.dts
> @@ -6,11 +6,11 @@
>   * Copyright (C) 2017 Cogent Embedded, Inc.
>   */
>  
> -#include "r8a7796-m3ulcb.dts"
> +#include "r8a77960-m3ulcb.dts"
>  #include "ulcb-kf.dtsi"
>  
>  / {
> -	model = "Renesas M3ULCB Kingfisher board based on r8a7796";
> +	model = "Renesas M3ULCB Kingfisher board based on r8a77960";
>  	compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
>  		     "renesas,r8a7796";
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a77960-m3ulcb.dts
> similarity index 90%
> rename from arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> rename to arch/arm64/boot/dts/renesas/r8a77960-m3ulcb.dts
> index 9e4594c27fa6c553..d041042a56192ab2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77960-m3ulcb.dts
> @@ -7,11 +7,11 @@
>   */
>  
>  /dts-v1/;
> -#include "r8a7796.dtsi"
> +#include "r8a77960.dtsi"
>  #include "ulcb.dtsi"
>  
>  / {
> -	model = "Renesas M3ULCB board based on r8a7796";
> +	model = "Renesas M3ULCB board based on r8a77960";
>  	compatible = "renesas,m3ulcb", "renesas,r8a7796";
>  
>  	memory@48000000 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
> similarity index 94%
> rename from arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> rename to arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
> index de37e91e3b7ac31d..ecfbeafeaf367f15 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dts
> @@ -6,11 +6,11 @@
>   */
>  
>  /dts-v1/;
> -#include "r8a7796.dtsi"
> +#include "r8a77960.dtsi"
>  #include "salvator-x.dtsi"
>  
>  / {
> -	model = "Renesas Salvator-X board based on r8a7796";
> +	model = "Renesas Salvator-X board based on r8a77960";
>  	compatible = "renesas,salvator-x", "renesas,r8a7796";
>  
>  	memory@48000000 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
> similarity index 94%
> rename from arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
> rename to arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
> index a1cbfef2053fe408..249896a38fdcc7a8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dts
> @@ -6,11 +6,11 @@
>   */
>  
>  /dts-v1/;
> -#include "r8a7796.dtsi"
> +#include "r8a77960.dtsi"
>  #include "salvator-xs.dtsi"
>  
>  / {
> -	model = "Renesas Salvator-X 2nd version board based on r8a7796";
> +	model = "Renesas Salvator-X 2nd version board based on r8a77960";
>  	compatible = "renesas,salvator-xs", "renesas,r8a7796";
>  
>  	memory@48000000 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> similarity index 100%
> rename from arch/arm64/boot/dts/renesas/r8a7796.dtsi
> rename to arch/arm64/boot/dts/renesas/r8a77960.dtsi
> -- 
> 2.17.1
> 

-- 
Regards,

Laurent Pinchart
