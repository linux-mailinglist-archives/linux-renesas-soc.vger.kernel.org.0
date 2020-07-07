Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2B1217749
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2020 20:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgGGS7K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jul 2020 14:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgGGS7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 14:59:10 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0782BC061755
        for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2020 11:59:09 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u25so25437490lfm.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2020 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0SoZNG9J5zYc37hDNFK0XWZNxJ2AV9yXQ2Pa2Qg9c8k=;
        b=JESe+H82PffmghDGikuDfT0cqtwQenRgqtPaiGeVTmM8qJTKZkUuPYFaKK4f94eUSa
         e0kpDM/z216aT0WrlBRD2+r8S8VcM6s1+PE3VqJt1nxSdkB11LxUNU3JRU/jxazzB7Rz
         dkpODD/h6zlZMWyUlzpTvEuUlJI6qpPpnM231UQ/r28du4bkuMPj7zfEOfs3nAtB2GZA
         lkBESpt/7ohbPSf8Etm2GzeOkFiArA/4FOGS+xv/QSDu7mExgEYXvE7rJWI4vMQHdeUA
         N6kbQiVlvqneOmt4Ixm2m7wiEwbnMS2jo+NUpP5F2FVbe278g28yXKBYPM1zHWNTTSgy
         WGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0SoZNG9J5zYc37hDNFK0XWZNxJ2AV9yXQ2Pa2Qg9c8k=;
        b=eJDoahrzEbCk85m5Yg1ZyJ17iFlueGBgoDhFKcysLr6ObimtN1vbhpaxFmW/7UM+yM
         wpCdhIKeOqQUD1uqH0xywUKrE86vVtYulYOEw1I1NctTWYWHhCCtiaZJJzjIddf7R/oA
         ZU5WQiKKNd0hBqCYoXf+qEBVCGn70JfJ7IQKtIW0TLqq6uEJ5S4E47uadqm8hhexgvAA
         kOuhBhkXCRXisaWrlg1TWb663JEGYgmO1a08fgmsvZmgNCujNWnmsZiKQw5ru0SYvxrq
         6GrkFgGahyNOX933hyrbCjEY+ZL4pLAnsKr0Yd3PrU10vUbc8Q3Ed/uIusvrrcZ64kIV
         JAGw==
X-Gm-Message-State: AOAM530ApezqJxRPUx3QFqhycq2ds0DXx/yXsqE55/W5INBlu5Yq0Cgc
        7UWoAuELiJusnLCLe4pnPX0Vgw==
X-Google-Smtp-Source: ABdhPJz+JrjhVu3OGYdBIXQ5I1K0cE3q6FGXUvVLU+M9Moa6qiEvlUapOqYhzc2mrm2GVo4sPHOmFw==
X-Received: by 2002:a19:8055:: with SMTP id b82mr34036469lfd.178.1594148348471;
        Tue, 07 Jul 2020 11:59:08 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id x24sm338912ljh.21.2020.07.07.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:59:07 -0700 (PDT)
Date:   Tue, 7 Jul 2020 20:59:07 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: Restructure Makefile
Message-ID: <20200707185907.GD3875643@oden.dyn.berto.se>
References: <20200706154015.29257-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200706154015.29257-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-07-06 17:40:15 +0200, Geert Uytterhoeven wrote:
> Make the Makefile for building Renesas DTB files easier to read and
> maintain:
>   - Get rid of line continuations,
>   - Use a single entry per line,
>   - Sort SoCs and boards alphabetically,
>   - Separate SoCs by blank lines.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.9.
> 
>  arch/arm64/boot/dts/renesas/Makefile | 69 ++++++++++++++++++----------
>  1 file changed, 45 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 21cc6346908226ad..5f00f90a89bd6a6a 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -1,30 +1,51 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb \
> -			       r8a774a1-hihope-rzg2m-rev2.dtb
> -dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb \
> -			       r8a774a1-hihope-rzg2m-rev2-ex.dtb
> -dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb \
> -			       r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
> -dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb \
> -			       r8a774b1-hihope-rzg2n-rev2.dtb
> -dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb \
> -			       r8a774b1-hihope-rzg2n-rev2-ex.dtb
> -dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb \
> -			       r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb
> -dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
> -			       r8a774c0-ek874-idk-2121wr.dtb \
> -			       r8a774c0-ek874-mipi-2.1.dtb
> +dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
> +dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
> +dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
> +dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
> +dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
> +dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
> +dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
> +dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb
> +dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2.dtb
> +dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2-ex.dtb
> +dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb
> +dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874.dtb
> +dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874-idk-2121wr.dtb
> +dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874-mipi-2.1.dtb
> +
>  dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-salvator-x.dtb
> -dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
> -dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
> -dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-ulcb.dtb r8a77951-ulcb-kf.dtb
> -dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb r8a77960-salvator-xs.dtb
> -dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb.dtb r8a77960-ulcb-kf.dtb
> +dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb-kf.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-x.dtb
> +dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-xs.dtb
> +dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-ulcb-kf.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-x.dtb
> +dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-salvator-xs.dtb
> +dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb-kf.dtb
> +
>  dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-ulcb.dtb
> -dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
> -dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb r8a77965-ulcb-kf.dtb
> -dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
> -dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb
> +dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-xs.dtb
> +dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
> +dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-v3msk.dtb
> +
> +dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
> +dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-v3hsk.dtb
> +
>  dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
> +
>  dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
