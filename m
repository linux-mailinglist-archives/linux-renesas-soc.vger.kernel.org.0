Return-Path: <linux-renesas-soc+bounces-1659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C9836C0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2B61C263C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 16:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8134A4644A;
	Mon, 22 Jan 2024 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HqOfl1dD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1D546538
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937393; cv=none; b=EvD0ohBI3bZ3QLDskKY+EhZpjLVM+49yxt1aQ3UjV5aAHoXHDoB8QWN8gAIsXiilvfvYHj4dGESzvCw+TKasifj/JKoNFsdTqiO4ayi6qmJ//grPhkfH4iplfLuY+xsvWX3p6lwJYAhmSzFHz0CaqG9mmSFESnswTLGU/itby80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937393; c=relaxed/simple;
	bh=QRpOYSiXKVu4WY9UgLHXZSDzt3fib5qhj8BTa6ShOYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k54F+nCmyiCr1fTx3AX0lhrDko4bywHAyMWMo251VM8Bbjy0be4I5bmWrqlXd4wCMLArf1sPoN0AXSZJwpQuou2tvsi/0eU4Jm/Gyi03WN+K4ygcMlTBdkujhsUu+N2QqQ86bxQ8PZ7DhBnLopYRssdCcGjxLG9tspOrZb6dcv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HqOfl1dD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e6ee8e911so4324373e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 07:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705937389; x=1706542189; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PjHCwDqqynyNDfI4CsLqb7p6zM2rBXUy1mfrXhxDOcA=;
        b=HqOfl1dDsBqEDG7uBv/Zb7WamuSsyuTDQYS2n4vcsxxSsV3ZoNMWGB0V84Whm8HfaZ
         6D/MjGoG7+plQ3J9eVPPPFtrWAWHRtgdQ5RmcvccUUzMFoQZdVyIRIa/BJBRzX6srTpN
         iBLt9HxcP60cNPHlfAflSDMbV08+vlY/DA2/de3JsbiIdroGdCXspTJOID2N1uH5NeJq
         aLHWmb8xeiCkWnHlbm585IauxJ/Ik8nHKMTMk13Doh+MyvqE9qZe4tGAVrA7MyUgfBWy
         Eeiu33TcgNkqo02SdZyUB7eHKbsUImMmjQtxUMNvlFAPDll3pgpfgIuWSh4J//KRBh7H
         34vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705937389; x=1706542189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PjHCwDqqynyNDfI4CsLqb7p6zM2rBXUy1mfrXhxDOcA=;
        b=loQ05MusysV6SQvDGA/XBKq+zaKp+dvpW8Uj5aYWlBlosvreeTNhriYKddPassu5b7
         qW4jhQcr5PZGiR9PP8SJx0iPwtOO2JkVizMkGl9a78RQClminvuO/XpEoKPhf2MhF57r
         X3bHCI1YGawRwCCje4mzRa3BAEvRiNtU6rSPcqVjzw0IbNf/MhKG3OgsXehqKE3XTXGn
         3v1moz4H6ZBQrNAV174p1aS6wlb8GmDQlwj76Zn2XMy2+xXX6QcUS0Gxk4DB6jv2gq4C
         Wr5DW6l/9TWSgCRAJgtXnjd2JMB7IvEyt6b9phrRaJF/j+mr9wZo3DDTcseAMuQ5fIXV
         olow==
X-Gm-Message-State: AOJu0YyQP0BFkUKaroLiVPxsmx2TWSlDcKoVXAsC1N7ly2eQuA0qZtaO
	4xEICTh+Q+sXwsL+p0HftXXGBJFHOXSevEoSIhvbw8zfBhFCkwtdITCWIywmzg0=
X-Google-Smtp-Source: AGHT+IFXl2JyOQOHksyYBMdJESKJeXW+R3iD09zRIbUcSQe+FbknpFZX2T+2eY9dmsxyR4vlcdMSvg==
X-Received: by 2002:a05:6512:2210:b0:50e:6b4f:9809 with SMTP id h16-20020a056512221000b0050e6b4f9809mr2137723lfu.20.1705937389662;
        Mon, 22 Jan 2024 07:29:49 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id n1-20020ac242c1000000b0050ecae41c51sm2041721lfl.135.2024.01.22.07.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 07:29:49 -0800 (PST)
Date: Mon, 22 Jan 2024 16:29:48 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Disable staging
Message-ID: <20240122152948.GG4126432@ragnatech.se>
References: <7f1fa862cb508a5d29947380b72324be027ac76f.1705933596.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f1fa862cb508a5d29947380b72324be027ac76f.1705933596.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2024-01-22 15:27:30 +0100, Geert Uytterhoeven wrote:
> After the DT conversion of SH-Mobile and Armadillo-800-EVA display
> support, and the removal of the EMMA Mobile USB Gadget staging driver,
> there is no longer a need to enable support for board staging or any
> other staging drivers.
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
>  arch/arm/configs/shmobile_defconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index c47a638172a89bfd..091e1840933cf2c6 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -191,8 +191,6 @@ CONFIG_DW_DMAC=y
>  CONFIG_RZN1_DMAMUX=y
>  CONFIG_RCAR_DMAC=y
>  CONFIG_RENESAS_USB_DMAC=y
> -CONFIG_STAGING=y
> -CONFIG_STAGING_BOARD=y
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_ARCH_EMEV2=y
>  CONFIG_ARCH_R8A7794=y
> -- 
> 2.34.1
> 
> 

-- 
Kind Regards,
Niklas Söderlund

