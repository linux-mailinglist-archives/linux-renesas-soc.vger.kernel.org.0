Return-Path: <linux-renesas-soc+bounces-1839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2A83CB05
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 19:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3712529951A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 18:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D342F1339A1;
	Thu, 25 Jan 2024 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J7/SRfb0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49A3133983
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706207040; cv=none; b=JsS6CWkkhMm9KUlYQzmexHlqUuvujgsFXJfpqURxTHumpDHKOPL+OsunebFrE81jUAVZN7jgAKKuKWIozlga7jbTL8e6Zh22vhNgXabuVJihDrh98idNuAbArNUaHZZ8AVFzgrbRj11Din+2q6EGKfE/qYkTn7iBcEHVHd0Byeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706207040; c=relaxed/simple;
	bh=Vs/2etCJo4GCdGu7RqQwK5PVwhcqbfp0rOyfnq9PC90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nD5D8Z/N8VIw7EkmZP9pQ7y0plvOrij77FVR1WVuD7CBXOQV1fxn0FuI+kwM77W1kCWVxQka6VWEkWSa8RiFG7pGmDiy/xzI72oSr+SbGYTsS0sBN3gZo080LASXq2zdXBqyo0KNBuLD0KFOC/BivmSZvIyKj2z6FtgcAseLMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J7/SRfb0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cf0390eddbso55644421fa.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 10:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706207035; x=1706811835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8i43m8kTOqmnZB/XPL3iQaZB6nxd5Q27RjRsOK4XY8=;
        b=J7/SRfb04HzciVkCtoRGmguFl5DYEeuKDuzpMNtTEduLAtrX4hXIlob1LzSJUDodBK
         7YgXbs8wR266Gd1s5IAQRjL0B5nU4RFIX16Ua/3cjRT6DA2cwvu5ykkKVHzZgo98e7+N
         SaQaZBZ2lX4dqe1dDY+ixDzUaCCzdL5E1uNT0JUfxwW/ujNJqs8bJ8S83ahq9Vfv8ozs
         ZiPA4eWiAlOYBA8iXix9/at74WL/XUX3sKrbexAJJqOReiQfpnFwwhn9qgk2DSOuNF+F
         5VqmEskxNFumdr5Kq5ovEQ06KKkY0QCCXP+t40Ix57/5+368Q0A+FoA8/IhXa/qBaoA/
         LDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706207035; x=1706811835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8i43m8kTOqmnZB/XPL3iQaZB6nxd5Q27RjRsOK4XY8=;
        b=E0MhHsfwcsbkg3KF6AaqM7hh7OYoaYKkHZkIT2bunzrMTOrk4rqsNVmsISPyGPIRgj
         ND95aOz6meXhxbwIy1rdOw3afzq1Twj/+RK4Yc44r6esEd9L2AspiCUXPjqKwMpcuee5
         MThdy9S1upOfGaFCPokpRaDY4Rym+oRNdifsdsXYr+wKw5DnnROy03T3vnj9hvJvmsuO
         P8Ab7x6ZzTW5DkdJg6f2LTtZ7Amb4Tb/cLjaUefJWNjOSLuHkYtyqLRrA9kb70B6PhED
         AFAXN0yOdMSCKhQf+SXUWVQtjpTjS0+FeHvVqjL2AYQ1wb04s7Q+ubG8aZYVt+HA2Sbw
         zoaA==
X-Gm-Message-State: AOJu0Yxt18NRfBoN9J5xkx0P6m2by33HJEgoE5v0L/6KInGnzs7w+wOh
	e/4SG1224VooT/DJYDgKrLDGy4hY6KaqlbYd37t/PX24BQ+zRysXna8W7p1dsdo=
X-Google-Smtp-Source: AGHT+IEFf+ZEdGYf92I8e74Dc8NJstUZ2E+B/x+1bV7MBK9sjfS40qLqE91r5CyjxIE8T8Ipk3W5EQ==
X-Received: by 2002:a2e:9dc9:0:b0:2cd:3227:130c with SMTP id x9-20020a2e9dc9000000b002cd3227130cmr54273ljj.95.1706207035247;
        Thu, 25 Jan 2024 10:23:55 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id z2-20020a05651c022200b002cd40121a49sm335661ljn.36.2024.01.25.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:23:54 -0800 (PST)
Date: Thu, 25 Jan 2024 19:23:54 +0100
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
	linux-pm@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 10/15] soc: renesas: Introduce ARCH_RCAR_GEN4
Message-ID: <20240125182354.GK4126432@ragnatech.se>
References: <cover.1706194617.git.geert+renesas@glider.be>
 <a283913ba7a39ec2dae0ebf9fc2b06096f009511.1706194617.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a283913ba7a39ec2dae0ebf9fc2b06096f009511.1706194617.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2024-01-25 16:34:38 +0100, Geert Uytterhoeven wrote:
> Currently, all Kconfig symbols for R-Car Gen4 SoCs select the
> ARCH_RCAR_GEN3 SoC family symbol, which might confuse the casual reader.
> 
> Fix this by introducing a new SoC family symbol for R-Car Gen4 SoCs.
> For now this just selects ARCH_RCAR_GEN3, to avoid duplication, and to
> relax dependencies.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Once "[PATCH] i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4"[1]
> has been applied, ARCH_RCAR_GEN4 can stop selecting ARCH_RCAR_GEN3.
> 
> v2:
>   - Add Reviewed-by.
> 
> [1] https://lore.kernel.org/r/bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be
> ---
>  drivers/soc/renesas/Kconfig | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 1c14be3e46e58ef1..2367385d84b5a17d 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -38,6 +38,10 @@ config ARCH_RCAR_GEN3
>  	select SYS_SUPPORTS_SH_CMT
>  	select SYS_SUPPORTS_SH_TMU
>  
> +config ARCH_RCAR_GEN4
> +	bool
> +	select ARCH_RCAR_GEN3
> +
>  config ARCH_RMOBILE
>  	bool
>  	select PM
> @@ -245,7 +249,7 @@ config ARCH_R8A77961
>  
>  config ARCH_R8A779F0
>  	bool "ARM64 Platform support for R-Car S4-8"
> -	select ARCH_RCAR_GEN3
> +	select ARCH_RCAR_GEN4
>  	select SYSC_R8A779F0
>  	help
>  	  This enables support for the Renesas R-Car S4-8 SoC.
> @@ -266,14 +270,14 @@ config ARCH_R8A77970
>  
>  config ARCH_R8A779A0
>  	bool "ARM64 Platform support for R-Car V3U"
> -	select ARCH_RCAR_GEN3
> +	select ARCH_RCAR_GEN4
>  	select SYSC_R8A779A0
>  	help
>  	  This enables support for the Renesas R-Car V3U SoC.
>  
>  config ARCH_R8A779G0
>  	bool "ARM64 Platform support for R-Car V4H"
> -	select ARCH_RCAR_GEN3
> +	select ARCH_RCAR_GEN4
>  	select SYSC_R8A779G0
>  	help
>  	  This enables support for the Renesas R-Car V4H SoC.
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

