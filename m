Return-Path: <linux-renesas-soc+bounces-1657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C23836BD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360D81C25500
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 16:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66AB46424;
	Mon, 22 Jan 2024 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Y7e96axF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144735BAF0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937217; cv=none; b=EXFSkWCrdKd9mcwAxEjOMPAEOtYxDLih4ZiifgA12Ilc+RGgQNH1NxK8TJ86LQmbXu8781fci41gk5F3VhacC7AJ6VByKvsvBrQlvhIID4I3RdD+yhcR8cO94e6D1m8T34Z0OiHwrxN0QRbzfCitUdCw5OFz1Icojcf5Y4U50z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937217; c=relaxed/simple;
	bh=Z1EVLX63G+WkbjKr492KwFFsPOKWDV0QAZ12/V2x5eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhSz8VHnmjd82DnEZa+buphPKi2UZm5V9PGCeWChd4HzenmFIXy5FMhXxFiqm+FgMWkhsCJKstLwhwQLMZovLuosstx29oMkliRQlib9VrJo4HNk+D9s39ypJSJ8kTGAEysLzfgiDL6QqD1brMFjXI915cClHVaJ9kndMsW3HSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Y7e96axF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50e67e37661so4481260e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 07:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705937211; x=1706542011; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uhSC6XuresrDfgru+sp06u+6WUpqJQ0xiyuzeihUlLI=;
        b=Y7e96axFoAsrjvkdnQdMH7YbwHMxkv/6Qucb7PF6cExHUIaEeJ6av0J+6MaGmwlgRL
         /5+cvhvimn0DqjqNvHedITu1UcsNFBlqNAi1r5mYpxa1DIxf+WUSnvQqxLEe7YoZBJOD
         c3SXdzLMr3IAEWXnwcZ5Jmp+ih/jSQHkKk6m8Kl0fJuHqRe7eHg0fu7/NTE+2NrjCEXw
         NWl9d/Mh4YwEP/L9iZCf5Gb6CiTG3ZTvtSfpmA6ngJD4mdt+UrfVcGgJBd2wNSO3oYA8
         /3nB63yZ7vPs4KBInJLwutOnrNA0ek8i/h2h01CU9IoAJgQGzmohsOs+7CoHcBOIyMSS
         gbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705937211; x=1706542011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhSC6XuresrDfgru+sp06u+6WUpqJQ0xiyuzeihUlLI=;
        b=c777k/F4akSxdhPGVw4wKPSeBhbHRvNn3P4bxzQtrtLibDikjTK03Gh4a//wO/L6Le
         c3m0YvqRAgVWXHF/dwomLrNSFjm5NppbLBD6YnAijVGDbW9mDXbT6pPdw3Apx29ZIh0M
         HKUHPb6W03DvmP3KmySIWCeeukrd5/F6YbKt4sPkli0XAvZcSmQjh5ye24jaAlXa4kRM
         GhbwtHpq0QtqPakb0gWfdeU/HpuWyJhfwRrS3RQ4vgfAiAlIe+DfaZd12jvgpDsU0PZa
         p6e7Ej+aMN8P7c6nqxbTRjxCvzGOn+K3jWZAxlg5YILSLmdS2jUMc3FDP6bnvebb09Nm
         lV9A==
X-Gm-Message-State: AOJu0YyeLTWr7XXKo5iZ18v/TFmIQztpoNWAaWWOZ5JbmCNUsJWFcJBD
	6qy2laDt2K3A7FFiIcP9h/NatvXQd5+yvNxohQkF4bjSYOQqQuRlQPi1rcZNMrE=
X-Google-Smtp-Source: AGHT+IEFvyTGOnyAc7bq7nyDEqnQfQDJ0E/4goZpL2WmENaJWiw7+i8XUNuppTLV+6pmn3Lv9sDOlw==
X-Received: by 2002:a19:f014:0:b0:50e:7e55:466 with SMTP id p20-20020a19f014000000b0050e7e550466mr1850513lfc.118.1705937211154;
        Mon, 22 Jan 2024 07:26:51 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24bd0000000b0050f097a6e55sm2020542lfq.177.2024.01.22.07.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 07:26:50 -0800 (PST)
Date: Mon, 22 Jan 2024 16:26:50 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] pmdomain: renesas: rcar-gen4-sysc: Remove unneeded
 includes
Message-ID: <20240122152650.GE4126432@ragnatech.se>
References: <5b440f84ab8b52499ab307c84154dcbc0f41d1d7.1705931035.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b440f84ab8b52499ab307c84154dcbc0f41d1d7.1705931035.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-22 14:44:41 +0100, Geert Uytterhoeven wrote:
> The R-Car V3U System Controller (SYSC) driver no longer needs these
> includes since the factoring out of the common R-Car Gen4 SYSC driver in
> commit e62906d6315f652b ("soc: renesas: rcar-gen4-sysc: Introduce R-Car
> Gen4 SYSC driver").
> 
> The R-Car S4-8 and V4H SYSC drivers never needed these includes, as
> these drivers always used the common R-Car Gen4 SYSC driver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pmdomain/renesas/r8a779a0-sysc.c | 12 ------------
>  drivers/pmdomain/renesas/r8a779f0-sysc.c | 12 ------------
>  drivers/pmdomain/renesas/r8a779g0-sysc.c | 12 ------------
>  3 files changed, 36 deletions(-)
> 
> diff --git a/drivers/pmdomain/renesas/r8a779a0-sysc.c b/drivers/pmdomain/renesas/r8a779a0-sysc.c
> index 04f1bc322ae7b671..54cdf250f7c2d143 100644
> --- a/drivers/pmdomain/renesas/r8a779a0-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a779a0-sysc.c
> @@ -5,19 +5,7 @@
>   * Copyright (C) 2020 Renesas Electronics Corp.
>   */
>  
> -#include <linux/bits.h>
> -#include <linux/clk/renesas.h>
> -#include <linux/delay.h>
> -#include <linux/err.h>
> -#include <linux/io.h>
> -#include <linux/iopoll.h>
>  #include <linux/kernel.h>
> -#include <linux/mm.h>
> -#include <linux/of_address.h>
> -#include <linux/pm_domain.h>
> -#include <linux/slab.h>
> -#include <linux/spinlock.h>
> -#include <linux/types.h>
>  
>  #include <dt-bindings/power/r8a779a0-sysc.h>
>  
> diff --git a/drivers/pmdomain/renesas/r8a779f0-sysc.c b/drivers/pmdomain/renesas/r8a779f0-sysc.c
> index 5602aa6bd7ed1529..6ed13cd1cb249df5 100644
> --- a/drivers/pmdomain/renesas/r8a779f0-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a779f0-sysc.c
> @@ -5,19 +5,7 @@
>   * Copyright (C) 2021 Renesas Electronics Corp.
>   */
>  
> -#include <linux/bits.h>
> -#include <linux/clk/renesas.h>
> -#include <linux/delay.h>
> -#include <linux/err.h>
> -#include <linux/io.h>
> -#include <linux/iopoll.h>
>  #include <linux/kernel.h>
> -#include <linux/mm.h>
> -#include <linux/of_address.h>
> -#include <linux/pm_domain.h>
> -#include <linux/slab.h>
> -#include <linux/spinlock.h>
> -#include <linux/types.h>
>  
>  #include <dt-bindings/power/r8a779f0-sysc.h>
>  
> diff --git a/drivers/pmdomain/renesas/r8a779g0-sysc.c b/drivers/pmdomain/renesas/r8a779g0-sysc.c
> index b932eba1b8042d8f..249cf43af45b6445 100644
> --- a/drivers/pmdomain/renesas/r8a779g0-sysc.c
> +++ b/drivers/pmdomain/renesas/r8a779g0-sysc.c
> @@ -5,19 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corp.
>   */
>  
> -#include <linux/bits.h>
> -#include <linux/clk/renesas.h>
> -#include <linux/delay.h>
> -#include <linux/err.h>
> -#include <linux/io.h>
> -#include <linux/iopoll.h>
>  #include <linux/kernel.h>
> -#include <linux/mm.h>
> -#include <linux/of_address.h>
> -#include <linux/pm_domain.h>
> -#include <linux/slab.h>
> -#include <linux/spinlock.h>
> -#include <linux/types.h>
>  
>  #include <dt-bindings/power/r8a779g0-sysc.h>
>  
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

