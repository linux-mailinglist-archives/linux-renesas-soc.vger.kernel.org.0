Return-Path: <linux-renesas-soc+bounces-1660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB399836D19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 18:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3BD5B2CF62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 16:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0155A40C0C;
	Mon, 22 Jan 2024 15:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Gn7qjNT4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523873D963
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937420; cv=none; b=jYz3c8zPK+gJlInQQ8JsUu435zBgj1BlCvw+rXtn2iKXxVH+Ph15rKUmLLAcA6kVDloLvEUZad8zHshUymYZvX7PpVgsBZiHqG/fCUwHlUxRqi+U4y1gsTtTSO8snXCuQJWqKhAZ9NlRAHBfas8hurgTji1Iv2msSElnLdoV+GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937420; c=relaxed/simple;
	bh=kCZwEZ+wJzaFpV0EvhZAbU5dHsRbuDW5t+QH4LLvk0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdRgRYO5O2RiX1fTfRluJMn3crNq83AwaB5VFINHglScaYjtKMHPG9hmCX3Cwtu0f8EsvjeRXGFwJc3tzp4hhwUN+2ndR/FLPgV/QaSpa0kMEYRV+w5rj+/8NXyEZAsOPznGShr7E26nDI6ucywQlZk7Rwu4+WNFlTId+IiQl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Gn7qjNT4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso3856238e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 07:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705937417; x=1706542217; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aj8EWz+HrScAIC1mY+rzX6PdMR8LuWkCs7D/5OXYQSs=;
        b=Gn7qjNT411KL1J2ICi4DDdCM1tEO26CZ1dQ4EF9o9mI8HNlLD/6LWJhpss8UOWcZOi
         CYO5cx0bQtkrizyuL7xmAA/8IkNzDqaNua3cG3B5xn76yCPtIJr3bSqwH1DTjxzk5Kh7
         DXUedQip93BkPOdxzf2MT2tll6BY1t2ILIwLPD12O9FVD9NgwzrvYd4wQU5zsyHG1cfp
         XNeApjzzEWvQ+F7fIy89TjC1DMnFfvE2l2d1ZHYjxb3H9dq437gHHNVDo3Vo+iYWHn+R
         E5Y9BNmciMC2YnsEnDgu0z8mBWA1WKTb+WkZ0yoqDutbGqy4K6qTSEhFy/4uVafWeW8W
         glwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705937417; x=1706542217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aj8EWz+HrScAIC1mY+rzX6PdMR8LuWkCs7D/5OXYQSs=;
        b=ih1nn6n2x30D+/xRCz3b2cYjvdR7QQJBzJNb/JZkTCJvOU3aM/Qk4CxN0FDlnNeOIk
         Dm63QGgMOzj7PmGq2R7kDJUjlHh923aTk5f1h7h9DRfwPBjz46meqsuSUk7yhOSi3oxo
         0lzdGtIsimXh4y8xhpGrKC6JfeEvYzFs4aRMLdq7tHooCqgAUlF3lO8ypAcGMWSkHM1h
         qMW+vmn+jjPF4gR7s42AO4mP4vV4zkXiaDC2HqnsXasURmiPvb1VPhWNO+0zzI8C9WMT
         Pby1kfsA2hLMRhH8P+yKKz1jb4C/3jZytLMycUvQONVSwGZJCnbir+736RuKDaM3Y3X0
         5RPw==
X-Gm-Message-State: AOJu0YwZZ1Wbodl5Yje6HYKtA+nzECwHsw0b6AW573g40plx9lsjZkQE
	LiHjfipRVld5+qNUxcBM8Qu8y1qLS0CNvw6hTe3RuK4VdpqhV0cidJyVvtJ0Fls=
X-Google-Smtp-Source: AGHT+IERzrZnFY8TRrAZ09lXGpKp5t0M6UvuKvOc0P77gSkXTOZ0JqkAiGKf/UTyoTaOsreCPkshnA==
X-Received: by 2002:ac2:5b41:0:b0:50e:7bbf:f365 with SMTP id i1-20020ac25b41000000b0050e7bbff365mr2107258lfp.31.1705937417129;
        Mon, 22 Jan 2024 07:30:17 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id k17-20020a192d11000000b0050e9323408csm2058818lfj.57.2024.01.22.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 07:30:16 -0800 (PST)
Date: Mon, 22 Jan 2024 16:30:16 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Disable board staging
Message-ID: <20240122153016.GH4126432@ragnatech.se>
References: <64c1d4613d5dfc1f70816f2136d66b75c8e39c1f.1705933656.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64c1d4613d5dfc1f70816f2136d66b75c8e39c1f.1705933656.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2024-01-22 15:28:59 +0100, Geert Uytterhoeven wrote:
> After the DT conversion the SH-Mobile and Armadillo-800-EVA display
> support, and the removal of the EMMA Mobile USB Gadget staging driver,
> there is no longer a need to enable support for board staging drivers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v6.9.
> 
> EMMA Mobile USB Gadget staging driver removal submitted in "[PATCH v2
> 0/4] staging: Remove EMMA Mobile USB Gadget and board staging support"
> https://lore.kernel.org/r/eec1bfb2878237888a8c3bc866d18dc53900739f.1705932585.git.geert+renesas@glider.be
> ---
>  arch/arm/configs/multi_v7_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index ecb3e286107a4c1a..4299f8f8aa9b6b40 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -1047,7 +1047,6 @@ CONFIG_KEYBOARD_NVEC=y
>  CONFIG_SERIO_NVEC_PS2=y
>  CONFIG_NVEC_POWER=y
>  CONFIG_NVEC_PAZ00=y
> -CONFIG_STAGING_BOARD=y
>  CONFIG_CHROME_PLATFORMS=y
>  CONFIG_CROS_EC=m
>  CONFIG_CROS_EC_I2C=m
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

