Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF113E8F1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 12:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237209AbhHKKzH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 06:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236433AbhHKKzG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 06:55:06 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DF9C061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 03:54:43 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w1so4584825lfq.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gCKI26Pw+LVd2MxOniW0A3sFMsr4KaDcRktx1wVvKNw=;
        b=ogByPWZIziqeABD6epIlpgfBCRI2+C+j5yF5N6YGVRJs9KhwyyUV4/+EL07vDdKc0q
         ZNbMEYwD/T7VSIudyaqjlV/aztsUCE4wUo72wcfRuE8+AVyer6CuG5uHbtUu+oEpyhmp
         9PJWwGcFBqdlUabL2sCHI1ZFfzqjg6f8kyiLWJj/ZqLKm6GhM+INdQiIaN9RtodJYp1Q
         iyIoBJlADA4B9r7sc6tRFSs9fQHos+hqSbOS98vH8gHJEQWtaKlWZ4iJYaLY/mB4eVlf
         jDSHejszybU+evpABMtIGmLzRIWGUQXmEZPcJKUR515Oo7bC4hfinVcVvtEk3Hcuupxq
         LYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gCKI26Pw+LVd2MxOniW0A3sFMsr4KaDcRktx1wVvKNw=;
        b=hGrDcSn1viCoLESy11tGTCuVeOfTQMy8B3zKjaRaoOf8WxXwlBohRjFj8UEKp//d1V
         k7vvKOgmqhwbEOWfHxmlkoZgU3TAmFlznO9uJU1PlCptwbxubcB2sQs+vZfZH1RagHb4
         ZSPnE2ddNHiync8cwOUZiDsQh5Yjx8YmPN8tKCDanZlmZcL1gLdAHbnDkNmU/lzvrsjB
         m/cchQdZR5KlX0Fb0nfuR/udZdiGZSFEUi01iJ+5pVvPPn81BQcayCjxY7cK/jV/41+O
         5AVR8pguOL+Sk+6+ECm5M1s58KDYVZgZ0QiYXJzuXxbrTTZLrBvGscKOt17FntW0SDIK
         tC7A==
X-Gm-Message-State: AOAM5313EC+VDqZHx2Hf6euMwHeskR8P24sNFP9zFh1PyNQIjIFODpQy
        n0NimDVEz3Hs1OiPqL7evXvqhphvcYzUZQ==
X-Google-Smtp-Source: ABdhPJwNHQ8cQTb4g0nB+4cqAy4TcuF9GmaBNFqbV4DWBG51cdmyiNt+/qBeEpOw+hp92yV1+VLgIQ==
X-Received: by 2002:a05:6512:2618:: with SMTP id bt24mr25701066lfb.180.1628679281724;
        Wed, 11 Aug 2021 03:54:41 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id z8sm1509320ljn.11.2021.08.11.03.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 03:54:41 -0700 (PDT)
Date:   Wed, 11 Aug 2021 12:54:40 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Make CLK_R9A06G032 invisible
Message-ID: <YROscAK0MQzx9DC/@oden.dyn.berto.se>
References: <4f3d30c730c30546f702715ffc648922a8156703.1628672649.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f3d30c730c30546f702715ffc648922a8156703.1628672649.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-08-11 11:06:40 +0200, Geert Uytterhoeven wrote:
> When configuring a kernel including support for Renesas ARM/ARM64 Socs,
> but excluding support for the RZ/N1D SoC, the user is always asked about
> the RZ/N1D clock driver.  As this driver is already auto-selected when
> building a kernel including support for the RZ/N1D SoC, there is no need
> to make the CLK_R9A06G032 symbol visible, unless compile-testing.
> 
> Align the symbol description with the other symbols.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-clk for v5.15.
> 
>  drivers/clk/renesas/Kconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index 7b450650bcaee124..6d0280751bb16e89 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -153,9 +153,7 @@ config CLK_R8A779A0
>  	select CLK_RENESAS_CPG_MSSR
>  
>  config CLK_R9A06G032
> -	bool "Renesas R9A06G032 clock driver"
> -	help
> -	  This is a driver for R9A06G032 clocks
> +	bool "RZ/N1D clock support" if COMPILE_TEST
>  
>  config CLK_R9A07G044
>  	bool "RZ/G2L clock support" if COMPILE_TEST
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas Söderlund
