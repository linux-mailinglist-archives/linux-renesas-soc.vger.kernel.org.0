Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CED2330D25
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 13:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhCHMNq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 07:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhCHMNZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 07:13:25 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A3EC06174A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Mar 2021 04:13:24 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id i26so4136296ljn.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Mar 2021 04:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tYCvtO8iMVB5iPbtiDZmSmAw4lbQ7OVzGyIvjyPqOQ8=;
        b=DrbtGgiGALf1pY2+Z47IPJQ2JyKupSXgyGdpYABVBSxUDIaT463Zx2B3dqfNPQ6YtA
         g8skN1c0CDtNb13K7Cyy4awVpzK4GEZFq5DdQY0ihPJtXTzDh5mhCuejf97KT+0S8GR1
         6wnkCUh4VU5Sg53LiYbPMzjGL8+us4I62P35PSoioSImgY6nbxKpAwiKTlfO9+CVYmcV
         IC6B4TtrQI9zclIA5atGRPfjUfypp655gXhKPm0OsmzN+k3M73LKVCIXXk5svzmM/uDk
         +eO0Ys21R3oq0vt8dziZhVaHDJ2Ts8zEu4OUvqe/Ulzz/5ojc6LhlvX7AgLgY85FSaFa
         /1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tYCvtO8iMVB5iPbtiDZmSmAw4lbQ7OVzGyIvjyPqOQ8=;
        b=LXlzwJdRSAyKy+lecKT3pTQZ7+58Gb/8VqvCnq4HqYrTgC0E2K1OqiCxnAtsBu/BZ3
         kZd1k/uNb/K117qM5IhUF/LZe177EiBKhSSxGUjF0OZHUJuahq4UJvKJ53o6J9ZFm8Ze
         HcsFp8E3mmxsyG5OQnGujoqxNHAoR8S1oXsGt2eFmhrW8zC8mf5bxSMn4GI/y521zSld
         O3PS/AzZ9LGYglVMCzqGlPUBKJ+Hs3RCKJ5HycfSrs6g44yb19sAptjcHRwBC6OMFPJW
         lj7g8rG/hIadKl7VZj6hkqtzALyF1WxPV46z9RyITO7vsf9Wk6xaxgy612BDDnOscCZQ
         3Uqg==
X-Gm-Message-State: AOAM531GXWWDcDcHJOXIcectQPQVebz6goSf6ZyGDo5ycmzKOKntX/Ax
        hXB1iyL8ffQ9z2oYXMJjAVOd7g==
X-Google-Smtp-Source: ABdhPJxdf4OVrX0dwGSVB64hVjrniQsMiOU4QQOuou/XhzKDAw87roBB+c/+2hnpemuT/9sKPEfK8Q==
X-Received: by 2002:a2e:3818:: with SMTP id f24mr14267039lja.466.1615205603220;
        Mon, 08 Mar 2021 04:13:23 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id r16sm1334617lfr.223.2021.03.08.04.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 04:13:22 -0800 (PST)
Date:   Mon, 8 Mar 2021 13:13:22 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] clk: renesas: r8a779a0: Add TMU clocks
Message-ID: <YEYU4t3mNrh4mb76@oden.dyn.berto.se>
References: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
 <20210305143259.12622-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210305143259.12622-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2021-03-05 15:32:57 +0100, Wolfram Sang wrote:
> Also add CL16MCK source clock for TMU0.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/clk/renesas/r8a779a0-cpg-mssr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> index 228068823caf..53bc2db0f3fc 100644
> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -144,6 +144,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
>  	DEF_FIXED("vcbus",	R8A779A0_CLK_VCBUS,	CLK_PLL5_DIV4,	1, 1),
>  	DEF_FIXED("cbfusa",	R8A779A0_CLK_CBFUSA,	CLK_EXTAL,	2, 1),
>  	DEF_FIXED("cp",		R8A779A0_CLK_CP,	CLK_EXTAL,	2, 1),
> +	DEF_FIXED("cl16mck",	R8A779A0_CLK_CL16MCK,	CLK_PLL1_DIV2,	64, 1),
>  
>  	DEF_SD("sd0",		R8A779A0_CLK_SD0,	CLK_SDSRC,	0x870),
>  
> @@ -192,6 +193,11 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
>  	DEF_MOD("sdhi0",	706,	R8A779A0_CLK_SD0),
>  	DEF_MOD("sydm1",	709,	R8A779A0_CLK_S1D2),
>  	DEF_MOD("sydm2",	710,	R8A779A0_CLK_S1D2),
> +	DEF_MOD("tmu0",		713,	R8A779A0_CLK_CL16MCK),
> +	DEF_MOD("tmu1",		714,	R8A779A0_CLK_S1D4),
> +	DEF_MOD("tmu2",		715,	R8A779A0_CLK_S1D4),
> +	DEF_MOD("tmu3",		716,	R8A779A0_CLK_S1D4),
> +	DEF_MOD("tmu4",		717,	R8A779A0_CLK_S1D4),
>  	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
>  	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
>  	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
> -- 
> 2.29.2
> 

-- 
Regards,
Niklas Söderlund
