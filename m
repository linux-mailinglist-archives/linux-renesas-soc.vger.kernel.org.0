Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233DB393D23
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 May 2021 08:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhE1Gf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 May 2021 02:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhE1Gf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 May 2021 02:35:27 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D9BC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 23:33:53 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s25so3826897ljo.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 23:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Wp4A+xDRdTw8eNosv/yKNhhsYPrK+AroKbWEnOgZO3c=;
        b=IfC4opZQkmWIgGRMkLX6NCbQb1UUyVNb+l2r4e3hmSxIAjaIJSHYNmgkZVLw2gUzZw
         uxDaDbNqZAQWB1wDSAHJ6RwYeeCucJu8EZvGwzw+MYAYCePNVyI8frv/RAwOWW2Hy2Yk
         8QwTlEx70CqTx/rYnop3GBf+Vy3OdBqttTOmlGfqXoSWIDQu2P0SBwFlD9ov07l6pElQ
         T8Xe8vwpLKn4C8rCeKyCgLDzFyz6a0s1iIQael+2eladrhdmWcCjtw4FlUIZOsUOhsPB
         AWiDrHF9YJo8xhOeT8iA/ReSZwB9vWS23KnNk3HRgUqlbodvR5EwUeyOrAGTv8HniRSz
         PJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Wp4A+xDRdTw8eNosv/yKNhhsYPrK+AroKbWEnOgZO3c=;
        b=C3X6A1khtqI9cf3e7Vf+6Tsr75FwdyvT7/s99iJlmUwuNBgs3RemqhwoE6hoF5zbV8
         nbD5wxHqPVCOc215bTUHh/8rJkZsiR1MYl8kqv3Dn03UK54XM5b4K2Lnq+BFksO2SjTp
         +dIpNe8kRQUXqsYeRwp3YWtHoclsduVnzTtrv+7tNx+6fxy7vz580od8x5H1oaqmKZQu
         Fmj3zsdJvldniiMN+BqfO/Y3eHqCR9vWXbm6Qw+S1zQ2V9VWmStbN4ZTuk5LxpRjgddx
         nzBTNq5/HHX4DD7a+9bn94fI1QFRaDCJ5y/xFf5unq+BO3spwIwR6o/2eXY8ma9d41qG
         WvBw==
X-Gm-Message-State: AOAM530jA5nc/jXOCbxqigOS7yX5pRAVWywEe+sRKWjz4xZfwU5Ia+Qr
        yiqi4MJb/+1u8H2HNCVp0h26Ug==
X-Google-Smtp-Source: ABdhPJzULijxvePwPYEx/rtEikuQ6p7AgkPhQih3wbBtXvtX7c3K7RW4JZeryoIFKs/koBTvzHPNWQ==
X-Received: by 2002:a2e:9d43:: with SMTP id y3mr5151501ljj.85.1622183631832;
        Thu, 27 May 2021 23:33:51 -0700 (PDT)
Received: from localhost (h-62-63-236-217.A463.priv.bahnhof.se. [62.63.236.217])
        by smtp.gmail.com with ESMTPSA id a15sm92496lfg.112.2021.05.27.23.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 23:33:51 -0700 (PDT)
Date:   Fri, 28 May 2021 08:33:50 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: Add missing opp-suspend properties
Message-ID: <YLCOzlbK1UEwhKfX@oden.dyn.berto.se>
References: <45a061c3b0463aac7d10664f47c4afdd999da50d.1619699721.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45a061c3b0463aac7d10664f47c4afdd999da50d.1619699721.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2021-05-27 15:42:42 +0200, Geert Uytterhoeven wrote:
> Tag the highest "Power Optimized" (1.5 GHz) Cortex-A57 operating point
> table entries for the RZ/G2M, R-Car M3-W and M3-W+ SoCs with the
> "opp-suspend" property.  This makes sure the system will enter suspend
> in the same performance state as it will be resumed by the firmware
> later, avoiding state inconsistencies after resume.
> 
> Based on a patch for R-Car M3-W in the BSP by Takeshi Kihara
> <takeshi.kihara.df@renesas.com>.
> 
> Fixes: 800037e815b91d8c ("arm64: dts: renesas: r8a774a1: Add operating points")
> Fixes: da7e3113344fda50 ("arm64: dts: renesas: r8a7796: Add OPPs table for cpu devices")
> Fixes: f51746ad7d1ff6b4 ("arm64: dts: renesas: Add Renesas R8A77961 SoC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Somehow I failed to send this patch, which is a contextual dependency for
> "[PATCH] arm64: dts: renesas: r8a7796[01]: Fix OPP table entry voltages"
> https://lore.kernel.org/r/b9e9db907514790574429b83d070c823b36085ef.1619699909.git.geert+renesas@glider.be/
> 
> To be queued in renesas-devel for v5.14.
> 
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 1 +
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 1 +
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index c3d312af6fe95f2c..78c121a89f11b8ae 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -76,6 +76,7 @@ opp-1500000000 {
>  			opp-hz = /bits/ 64 <1500000000>;
>  			opp-microvolt = <820000>;
>  			clock-latency-ns = <300000>;
> +			opp-suspend;
>  		};
>  	};
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> index d21be2f195b3be18..63bb395a6a64499a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -75,6 +75,7 @@ opp-1500000000 {
>  			opp-hz = /bits/ 64 <1500000000>;
>  			opp-microvolt = <820000>;
>  			clock-latency-ns = <300000>;
> +			opp-suspend;
>  		};
>  		opp-1600000000 {
>  			opp-hz = /bits/ 64 <1600000000>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 941f18e5f5d29cda..c8b73108a4c8185d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -64,6 +64,7 @@ opp-1500000000 {
>  			opp-hz = /bits/ 64 <1500000000>;
>  			opp-microvolt = <820000>;
>  			clock-latency-ns = <300000>;
> +			opp-suspend;
>  		};
>  		opp-1600000000 {
>  			opp-hz = /bits/ 64 <1600000000>;
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
