Return-Path: <linux-renesas-soc+bounces-1656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B189836C85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 18:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5BACB229DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 16:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9F040BEE;
	Mon, 22 Jan 2024 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NHOWNqQ/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E365A795
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936948; cv=none; b=IvlLrZw4qmLLtceZGb34Si1KTMgKZRfgc38XFXgQeKOWlAxX2VcL0i5nycL1ydf0yRp+FKpIdkkZElhfxABqWf+Mo+5hvX5UbgjCx3nTLSoMINqmaXOplkPrd+3E6CFIX1BlDyYsB2ogla6V2gQne9rgsPnoPQV6lKDC20DOX9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936948; c=relaxed/simple;
	bh=s2CEPgXF2dnPJQTkJBzncHW/CdQrBKXkUFM7T6qq52o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pexsiQHdRxOiircZ5NdEZGECLShlBKbLRbOBz6XX5Fjd3qoW5Y1RW3SCnXm7+WWZZRz/OnfYMWyjgRBcY8HgPUC6UgCcgPHGPjmVZru16l8dlLK4cuRFiLvVrg0r32TgGSlWtZ5JkMWH3s3CmHkymU0xf/fqwQ+qXWDK19ekUZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NHOWNqQ/; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbedb1ee3e4so2799467276.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 07:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705936945; x=1706541745; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vc0fzJAdCvYQscypRiFgQ18nWFhi2YTnJ0gQXl/95EA=;
        b=NHOWNqQ/NNciGkr4/qKhFa9YLhy46CaHtbbXoDJeb3h8rsHTo6N0KZzMiru7wiZ+i0
         oZzVJo7TuDUq0W9K3ocPNF2GZb/iYeYzoTTiLKmvomtk6WlROQRxAogdwGWL9hJciAtz
         E37BVcvwQf2BraesqttR//0rAcFn/CyLgIPFYXjKNSEgpsFPwLyrmMfti+QHC7Kzh+xB
         naLZMTpHMhD2LyXi7+7P8ia1sLGvZguZsQrV3c/FAOwHV/29VSGe+UCnWDb04j+8Vjm+
         WK/XR/b+kDgBpF9qRD5c1ZvqsQQVYCkGrnjp1nb1//N/QiCpnTJm0rWksZaV5UCrNjlD
         DDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705936945; x=1706541745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vc0fzJAdCvYQscypRiFgQ18nWFhi2YTnJ0gQXl/95EA=;
        b=slBTdSVzmjH9NuNUa0lEwaSmAXj03yp/MpL/dBRR9qnZhgkyGjYXfU/y3EbQ7hoAEp
         eNK+pNkp4hl7VXIGDdelp8/8U7J5mTc02Z936CZZBT64uWdWl6Okx0Gzij03KGfmkYLB
         TsfiZp9hRkDprFrPqSgj08lGcOt8Z3iSHyDaRMi2kNVYuDG3mFjlmRDiyDzwSoRbezmr
         VIZylqrHSlJdK7tWP6KUr9Veu4lnepJlvw2yxrGqDU0ck5iNJkePKLy2IDKJdJSAepK8
         BDmmNtp8SDsdQx6UVkAtZqkEj2GqqUagP0YgP7ZbfZGJzezqbGf/IduqNQX6VyLDXwel
         MmPQ==
X-Gm-Message-State: AOJu0Yw0bdMtbGYUCi3cDyFVnLOnbF3+9K+9Lrd9XFAmnnm+3++5RVMX
	PE5794iHnKYhM+wFsWl9eFYh78f5VR4tC7IuKuPjwN6m69H3gRGMHX+X3ceSy0SmzIX5lF6ab14
	cD6q7EyEwgb2XPX4sazIT9BOiA7L+3iMRTJHHA2wWN2CeHqYJ14A=
X-Google-Smtp-Source: AGHT+IGmvmbAGNSnSFXJ8ZKIH1QeBjdt527i6bLFKHt4ckhptNDJJNL2BiFBE/u/DZo+I321dEj84B5Sh0fW5BFj/LQ=
X-Received: by 2002:a25:820d:0:b0:dc2:3257:913a with SMTP id
 q13-20020a25820d000000b00dc23257913amr2201892ybk.17.1705936944993; Mon, 22
 Jan 2024 07:22:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5b440f84ab8b52499ab307c84154dcbc0f41d1d7.1705931035.git.geert+renesas@glider.be>
In-Reply-To: <5b440f84ab8b52499ab307c84154dcbc0f41d1d7.1705931035.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 Jan 2024 16:21:49 +0100
Message-ID: <CAPDyKFqNpivthZxfzoeDS0FABGxmJjJq4caYRHga6+c6nmR_uA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: renesas: rcar-gen4-sysc: Remove unneeded includes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jan 2024 at 14:44, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The R-Car V3U System Controller (SYSC) driver no longer needs these
> includes since the factoring out of the common R-Car Gen4 SYSC driver in
> commit e62906d6315f652b ("soc: renesas: rcar-gen4-sysc: Introduce R-Car
> Gen4 SYSC driver").
>
> The R-Car S4-8 and V4H SYSC drivers never needed these includes, as
> these drivers always used the common R-Car Gen4 SYSC driver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


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

