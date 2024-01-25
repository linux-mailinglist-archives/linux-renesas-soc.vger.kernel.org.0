Return-Path: <linux-renesas-soc+bounces-1841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2801F83CB22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 19:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC922290734
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 18:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D17130E25;
	Thu, 25 Jan 2024 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="spBhsF0y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20121BDD3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706207429; cv=none; b=C43Q+9B5AuIAKdhxgSMcWND+d4MGq2A0ftQEk6eldW51Plz/cSQZKU50aUNdXxNoqRZtfwBV3X6yVnkL+h89p9glVegV8ayQfMeZXfCeN6Ad8L0LU2UMaOR8sh79a5osHkiI9NQwf21ghiLrteqkZVkokDIOrN21cflFtQcygcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706207429; c=relaxed/simple;
	bh=lPjy6VQqMKElXtf5nZFY9Lry3O2q5FBPwvsQEsu/InU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9KWgNrtB46VYBGKf/U2UYFLttl+7ZsbGEndxCsZEmiTs1jY0o/jbA1uavjzAWWN8uqcGrKMt91qlLeUkf+FwyWSIRerY9mTUDSe9Wb1dEfPgBafDtp6YgQzvH/VGjI8zGEJJfFEZ0NvDGZ+pwnvzBoEMFx8zyC7v172AZc6K2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=spBhsF0y; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso8941015e87.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 10:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706207426; x=1706812226; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aosz9lRTTKi0DDOgo0QxTBp5Yhit1oC2yInRcqjAB8w=;
        b=spBhsF0ysWXcFVt/sAep/q1meOE6oXNdfUJZ77XnlnP2tMvcsvKk6dfKo09pSsvrYj
         Qlo9kyR4wCHzQM2SemEoJBePZFBQ3y1uRctC108ugEbsbE1RzXkoCe2bkFODZPYGyr0u
         tKBqBIKifYb7Z5y5AeKL5Ypw4XOuUx26vhbdPGMbDQzR3oFfkRd1sf1mpx3yNZWygR5h
         5PmNyFKHwo2RHN9hezXpIhwXPWEM9XRtnIjMVr1UaHHMsISqn05B1YLoyI/6EMgA9H7T
         yQ/d6YPnW9w7Y7NDDz4sDCosE71POU71da9MhhjpnuJ7toS60quMG++FmdyTCo+Q3GMp
         /KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706207426; x=1706812226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aosz9lRTTKi0DDOgo0QxTBp5Yhit1oC2yInRcqjAB8w=;
        b=feeWjwWjqoa5IePOrFKVIh87/J1D4yD31ejH+a0ISnHdsABMxc1umr3gTzW8El9ZQQ
         KZnMOwJ96/hLG+VDuhi8zNrIFExbdeaQ9RYIgaU3bgBIM8Ih8Ft0ncp6Uh8YSgSxzRFA
         p7obHwEdlbbudE0VUzNe8yP3rfih5dVYEc+xY1kKS+bVsIuU0sbFSo47ZRpljapGOIAH
         x4mL0ZmMUQrgZ29fvQBTJ5L2pXFVJR37FG8Dfoo6dGXEWmPbiw61BNQnieqKKPR3yFaV
         EaC/yIjuOaqvRCkk1uBkMDFMrLrFtWzzJm+JERQpcppJjlueIcqN4RtsHqrRoSIlhcSP
         aHIg==
X-Gm-Message-State: AOJu0YwK5Q5blD6ZQS7LPg9sS8uAsOHniJyHR93eSa9Snin80O+Xgren
	mEy0KLyp089InHXqJEhJcscvhf7DZov67Lw7axBpFrLNbv84FEEYNSQn5EKR/Gxr6/OH+Qxh5Sr
	9sSRduQ==
X-Google-Smtp-Source: AGHT+IE+NMDxjok+Oe1ksEq8hxLYwLRW9bpk+k3gwbF2qoFplervjDGzLGRb4ntmXigsnh9Io0L/Sw==
X-Received: by 2002:a05:6512:ba1:b0:510:1bd5:8ef with SMTP id b33-20020a0565120ba100b005101bd508efmr83756lfv.189.1706207425707;
        Thu, 25 Jan 2024 10:30:25 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id j13-20020a056512108d00b005101e4600cfsm190689lfg.252.2024.01.25.10.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:30:25 -0800 (PST)
Date: Thu, 25 Jan 2024 19:30:24 +0100
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
Subject: Re: [PATCH v2 12/15] soc: renesas: rcar-rst: Add support for R-Car
 V4M
Message-ID: <20240125183024.GM4126432@ragnatech.se>
References: <cover.1706194617.git.geert+renesas@glider.be>
 <13dc9f014e27db5092b3cc23edddf4b5e01a6645.1706194617.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13dc9f014e27db5092b3cc23edddf4b5e01a6645.1706194617.git.geert+renesas@glider.be>

Hi Geert,

On 2024-01-25 16:34:40 +0100, Geert Uytterhoeven wrote:
> From: Duy Nguyen <duy.nguyen.rh@renesas.com>
> 
> Add support for the R-Car V4M (R8A779H0) SoC to the R-Car RST driver.
> 
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Early firmware versions may not enable WDT resets, so you may need to do
> s/rcar_rst_gen4/rcar_rst_v3u/ for testing.
> 
> v2:
>   - Add Reviewed-by.
> ---
>  drivers/soc/renesas/rcar-rst.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
> index 98fd97da6cd4330d..7ba02f3a4a4fbb9f 100644
> --- a/drivers/soc/renesas/rcar-rst.c
> +++ b/drivers/soc/renesas/rcar-rst.c
> @@ -117,6 +117,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
>  	{ .compatible = "renesas,r8a779a0-rst", .data = &rcar_rst_v3u },
>  	{ .compatible = "renesas,r8a779f0-rst", .data = &rcar_rst_gen4 },
>  	{ .compatible = "renesas,r8a779g0-rst", .data = &rcar_rst_gen4 },
> +	{ .compatible = "renesas,r8a779h0-rst", .data = &rcar_rst_gen4 },
>  	{ /* sentinel */ }
>  };
>  
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

