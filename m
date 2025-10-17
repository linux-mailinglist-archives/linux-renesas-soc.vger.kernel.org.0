Return-Path: <linux-renesas-soc+bounces-23239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B449BE8D9A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 15:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E34E3A494F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 13:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE3D1DDC1D;
	Fri, 17 Oct 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MCsH9JqH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33153469F3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 13:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707851; cv=none; b=Yzcd1yYiuNT/Bqwbp/WxDIyukG2ShDXcpDxPwmjEiE5cB9AdFiel+afPg8SaOP1UFwfonn8PJMFDsgovjsJwhX2vHKQPBZOy0EYU7qX+Bi64Ctor2WxKtAM6CCfvqmwBNGlNVx4wCUPo5cnNCydlD0I0U5+5A36kGKT4zf065Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707851; c=relaxed/simple;
	bh=ZLJ7IUyXufEocFPryGY1hojv1hZQsh9Uj9GaYGkEwr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAqmu4JNRZ3jUAcwrpUBDM1SN7PDftv07P9a6IiCuvK1JRcYqAwf8XoVPCuMGK7ymVoTaTUGsdYbdx6zWubAb4cp99JgUV3WCgaczfTXfkSO3NgaZTs2+ItWsIgnPG1Ddaginu69fypkNAugZ/BwKtzRtb2jzLL56Bf9pat4Mqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MCsH9JqH; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-780fe76f457so22606297b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760707847; x=1761312647; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QHxcRD3TuvdrKpFi85Y2nID1/TFiVbXCPwnmjQCKM4c=;
        b=MCsH9JqHxa4Ni2pcjNBQEs1Lctot43RtueluZj7MMi/LC2yPFTd147FPnzmm0r3kTj
         zMtQxfwQqXy2RREuZxpJ3AHpSQQ/hzBbaqgU9tfP/xUJ+zZ/UhtXhOSpC+TG2snBuDn1
         mC4xUmb3yFAgsYLZoqBpoQJb14xul6eXABe804XXgPnT9zaHlWlYTrLEaIvcau/mdq9k
         9pkKijmazGUkZgkGct3p83fFnkfpxYOsD44nK8mISNSiBJ1bjvPXapaJCwZ07InllYPy
         /Pmba1JZNbCvpJG+xwjmTbo9QFTm3Meyy1NEE3+1rYRULRjVuw/PhgnkzcXi4Cts6i40
         QeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707847; x=1761312647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHxcRD3TuvdrKpFi85Y2nID1/TFiVbXCPwnmjQCKM4c=;
        b=RyCqJekil8DXwF23ZQwVgAHDnGxvC8v6iBg6vBhILy1xcLl9itL9HmW6hITx8saG94
         8cQ7rjmN6OK0ocZ+bW1kUoYI6ltyv8B/LgyTbcS54XB5SseMfS6Zriy5nHiTT/7n4KO8
         itE0m5cLaUK1oR3W6za/QGqWZIVN2V33UbwiUjhZsrmsHzu+GU9w6urMDgJSP6QSag9s
         FnLVQq/2LX0UA9KTfmDtFIM7FJwmsg0XLkMT/k9SpqIoODnvkv0vUHX7DTNypbYSpdBf
         vSaKrcJWmvrfu6Ru6QAC0RKdrpSCgtS8eOiKXhIzjtBmk5B7EeTMEHGz33Vd17ZAW1Vr
         5Rlw==
X-Gm-Message-State: AOJu0YzhgxemtZf3Sgc0cso6P0S9WYBhHvRg1stQbtEw4/Fp5kEOKBiT
	3zNYLCf5Cu18bGC08Frl17gtIwqnUzCliSUHaCe/GFgii+zn20HPt4s9fz2ZhvHzOhIkQbrFNpF
	vKFI2+iQQVZ2+R+lNEvS9bmUkJVD7vyyCDtNsdkAVdA==
X-Gm-Gg: ASbGncsmdVElFptc9QD4Q/TmHShmh0K3us99sZfpBEVMSKMktW3sICn5OXJD7prHiJe
	fvR7o+eg5TKgsQsXTFaeiPMZ+cmUfKe346r/HVCpSWvv1tiEOvBCBy+0i6m7WaOUzZppLRamUhK
	rplTR1gg0Ew2JUqac2LW2+/J5HZe3NnSBV5jafif0Rcqc1NE0gUEG86goI4xiu+odnhG+mz6GQe
	lnyCyG1Gg75NyBcTZwtIpsPzr+8sqiORdvXLHnsTCrkgcBkVaMYKCBgBDf22w==
X-Google-Smtp-Source: AGHT+IEh1Q8BQTUAezAQ54PPKSM6CJ+S6rgBfiV+ZkyPFZoubPsABBu/bd/m3/6F3igXzEdzFK/HtMhcvBca1Iz6srk=
X-Received: by 2002:a05:690c:6308:b0:780:e0ac:5246 with SMTP id
 00721157ae682-7836d16addfmr64752717b3.14.1760707847445; Fri, 17 Oct 2025
 06:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923161915.3172-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250923161915.3172-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Oct 2025 15:30:11 +0200
X-Gm-Features: AS18NWDfBdIMUEuWE_8bRmEi2vdOeTrIKmJDYd0sSCasQXgjfBn-14kl0lOpprw
Message-ID: <CAPDyKFroUEASykqp-cPHnhDLOvox9jPQHCGucpTx6KMjwK9Qkw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: enable bigger data ports where available
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 18:19, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> R-Car Gen2 SoCs have a 32 bit dataport, V3M even 64 bit. Make use of
> the bigger size in the rare case DMA is failing.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Tested on a Renesas Lager board (Gen2) and Eagle + extension board
> (V3M). SDHI driver was hacked to avoid DMA and use PIO.
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 9e3ed0bcddd6..73c84fd8a2d8 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -124,7 +124,8 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
>
>  static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> -                         TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
> +                         TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
> +                         TMIO_MMC_64BIT_DATA_PORT,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>                           MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>         .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 822a310c9bba..543ad1d0ed1c 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -60,7 +60,8 @@ static struct renesas_sdhi_scc rcar_gen2_scc_taps[] = {
>
>  static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> -                         TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
> +                         TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
> +                         TMIO_MMC_32BIT_DATA_PORT,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>                           MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>         .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
> --
> 2.47.2
>

