Return-Path: <linux-renesas-soc+bounces-1481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B2829A3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 13:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B0741C219AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 12:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393A3481C2;
	Wed, 10 Jan 2024 12:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dow3B3Qq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DED481A8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 12:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd0f4797aaso44141501fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jan 2024 04:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1704888800; x=1705493600; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sul2vRO9Fzn0UMSUus+BZBPqeYHWDQxaw3bzygHSyZc=;
        b=dow3B3QqOsxKcMN8u6YtSwngg1uPhkDfLTzE6xqyTLYP9fJAW8gmqcPVTAhEfMKOwh
         eGCDBNruVrs+0DiLbp3RrQhPH1BaP5SqUR8VFvgXQB3tsjdYI/M2gxkVSrK/7xKvCkT3
         zAsZwAFt+3MeN9furOUkEqrVEZT0BL8CE77KGfZ0/0AtiOcvRHjPqliWLCrYVTUsJXdt
         kaYcnx5qTKN7PVzEBRhZ28XQ0f0AiYlljgyIO3oEACeFJ+ezLYnO+Y6uJ4ZbwvjXTLxu
         55o13QqpbxiOSF9DmYWFnYwBoYDp5UBl/laKBzH/3Nlz6F0ayPvouU2IPnFZQ5S1vjxC
         wjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704888800; x=1705493600;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sul2vRO9Fzn0UMSUus+BZBPqeYHWDQxaw3bzygHSyZc=;
        b=v7xXUJ4f0Wig8rDyGeL6mtil1Ux9mRB0TSZAR61chL5gMWX291plWvu3FyD+r4M6cd
         TM9vc+Xz4LL/KE6VtFobq2LK4KxOOmabQWhf4zQfItKI/D3iHL/qD7jH4TLbZQmVbHuR
         oDbFRHebBDCLDX8/lVX8bLMIOdFyOFXPnS3luMou+RFX3R1B+IgTDbHfmRebntsI3RLr
         NaT+/FVGCX1nata6kllWsrLu2vi9jVDE1BXtS32Pl2YxiRRl0NNnq1w0cVLdBkS+61Sw
         nrNbqF/pHg0wCa+V9FJJIKkbpaP2QiRh1t9ES6/UHpDGT4HgdH+bN3W8SX6IJyX2MxIC
         135Q==
X-Gm-Message-State: AOJu0YyVaJ+jkBTK1e0859HBa9/Zu/JyFvlYX19Pz2pQguzuS6JE3XQ6
	SVYzavEtT1tOiIZ4c6ZWNxBgOZCmekiE4g==
X-Google-Smtp-Source: AGHT+IF1BKGjGmz8LspFign6ek2eCcSN5Ct8qEn/F4AJ37X/svKfK3A0NBeEYN5c5XQWGzNUoY3rlA==
X-Received: by 2002:a05:6512:3991:b0:50e:b1b7:9301 with SMTP id j17-20020a056512399100b0050eb1b79301mr396237lfu.81.1704888799672;
        Wed, 10 Jan 2024 04:13:19 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id d8-20020a193848000000b0050e7d58e58csm659305lfj.174.2024.01.10.04.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 04:13:19 -0800 (PST)
Date: Wed, 10 Jan 2024 13:13:18 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 07/15] clk: renesas: rcar-gen4: Add support for FRQCRC1
Message-ID: <20240110121318.GG1625657@ragnatech.se>
References: <cover.1704726960.git.geert+renesas@glider.be>
 <b7ec45c86c2bd17cf3b3de43194c4821b606e483.1704726960.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7ec45c86c2bd17cf3b3de43194c4821b606e483.1704726960.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-08 16:33:46 +0100, Geert Uytterhoeven wrote:
> R-Car V4H and V4M have a second Frequency Control Register C.
> Add support for this by treating bit field offsets beyond 31 as
> referring to the second register.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Tested by enabling CLOCK_ALLOW_WRITE_DEBUGFS and checking the impact of
> CPU core clk rate on CPU core speed on R-Car V4M.
> ---
>  drivers/clk/renesas/rcar-gen4-cpg.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
> index c68d8b987054131b..a2bbdad021ed8e95 100644
> --- a/drivers/clk/renesas/rcar-gen4-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.c
> @@ -179,7 +179,8 @@ static struct clk * __init cpg_pll_clk_register(const char *name,
>   */
>  #define CPG_FRQCRB			0x00000804
>  #define CPG_FRQCRB_KICK			BIT(31)
> -#define CPG_FRQCRC			0x00000808
> +#define CPG_FRQCRC0			0x00000808
> +#define CPG_FRQCRC1			0x000008e0
>  
>  struct cpg_z_clk {
>  	struct clk_hw hw;
> @@ -304,7 +305,12 @@ static struct clk * __init cpg_z_clk_register(const char *name,
>  	init.parent_names = &parent_name;
>  	init.num_parents = 1;
>  
> -	zclk->reg = reg + CPG_FRQCRC;
> +	if (offset < 32) {
> +		zclk->reg = reg + CPG_FRQCRC0;
> +	} else {
> +		zclk->reg = reg + CPG_FRQCRC1;
> +		offset -= 32;
> +	}
>  	zclk->kick_reg = reg + CPG_FRQCRB;
>  	zclk->hw.init = &init;
>  	zclk->mask = GENMASK(offset + 4, offset);
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

