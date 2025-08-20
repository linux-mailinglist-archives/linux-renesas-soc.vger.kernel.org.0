Return-Path: <linux-renesas-soc+bounces-20763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAABB2E29C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 18:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 070CE3B0705
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 16:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B9B3314B1;
	Wed, 20 Aug 2025 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8Oq1XSA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726032A3FA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708230; cv=none; b=HbpedUh+1cPoaO20KKBUgOesglIjiy2h3Kx+J+yV/1XbqlEZq6xxur0/IjCOR8mNk6Bym179q+15odS7aCTligK96jjWmYbeZxvjOpKdmN3w+RS4gRkDOKSRqPiruvVMrSjeOoPp0/knnp7uagIt1CX1vCJ9cv5hXBmsN6URTwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708230; c=relaxed/simple;
	bh=WzdI1oYR8phntwLqYeaeesclKsoSMLbv6invCVoupTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBBn1sqXcelJYaXn/qAB0S1d8yB0p0GVGG9YbmDOGlfVTcqhDYrMwdp9qjSDoL8IiddEXFrV/FXZDPA9vk+jeMxpPfRflWxI7f5JygwTN4BAsH7dGG7LeL861lJ6VThoRtXirkbC+GFuety5lA0BcvtfSX62WiCteveY07uN17Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8Oq1XSA; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71d6083cc69so106707b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Aug 2025 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755708228; x=1756313028; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iQkujuB9vAN8hQhansFuXhh+VaQyrPhFjEbmZzXzSUg=;
        b=d8Oq1XSADB9peoTNPzST92bNBvOHz4O/SNw91zXmMQI52huCoUHHpYB6nhdh+NzsEi
         9VNTQtkJ3nc0fMifYFgdiWeqtPNGsmgaIHp/h4hxiPSrMCVx5k//MfwlszunXMicRhJ3
         8Ekt4wJRsDfrxlTlWk1Th2dkpc6Bp1vmogfgB7McT+3ZIdj0iABEb6AYyWno8AV3IjL+
         Uw/aACyYvDJ6l/I2NM1draQrPbKE89GS4VEIg33trLGq8HhxucePG5J6fYaZirI4ftC4
         zt1VPIUwbDjbOBOZD91/Sn5qwSoCOo4EHUYzXT3zNW+z/0KZl07khfbfyWTiciGczeHH
         JdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755708228; x=1756313028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQkujuB9vAN8hQhansFuXhh+VaQyrPhFjEbmZzXzSUg=;
        b=k6qpSqR4LSgZzJWDGBeI0GdVkTagk/USJqGstCx1FbPTCijyvdiR7tj1BtjmJ4Rlk+
         2okZ0pA5X0J2jfSHFgxFCIPCuBxA4BEdjVOOeQAUJffMw/wB7Yh1Mf+xzSLDSRyNrCOV
         swCf/DduOz9zQyjIETXfysv01oOCs4WL+S72CzAOMuTbV+6QK/6ojrQuiYgQ3zL6ifRJ
         5RgeAFCuy6O3nm2n23i77mNBDOC/sGZoYPNH2FXwhapxk2vX9iQQNTC6xtkp6mpzsUId
         fEfSY2EUankW0lxV37igDtPq/qtGXZgnfIYbDJqyWO3OIdYP/4WedDgFF67i3ySgajkt
         2hgA==
X-Forwarded-Encrypted: i=1; AJvYcCVpFxEkSPWT6HPLa0JPs7zlMU7VqphPwkh4H5+cFTjic/iBwyWDfaMCHSZqyCrFUNsILxyJ2+WypSISVfP00JAvjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoipriyOPQsCnfzFEAj2XKGOAEXj77mYFViEL5Y3p0cgc7fO12
	g+hA278gDRvRbYtNq2WVIGB4Zc5PtvQbCCGHIq/Ww6TFTdpPH+k/YCZLM7cpA6r6BLkjaqQTzIU
	EO5cLukWq2kmKKaLrNaCaXKCPf4vesVK6qQqxSRcHPg==
X-Gm-Gg: ASbGncszZ93U+tS6URo8eSQjO9iCL5Cw5NFj3LCYw3mQLOO929tk3Je4Z7hqwwREeQS
	+n2Q/a1Q7YaPgWcSBpRGU7ChL8SusUdONzuKTLlzAoT3MkvzeQyhvCdFQo9nuF5IMdnIKfAQg2N
	JNgBFrdaF/w+xNajeoEBQEI4BfvgHI9Nc2L0/N+6dB21hAdXRmBia78zY0n/g+Xu4ZkkO5lrxrj
	kRia2LCYLDLLELtwXw=
X-Google-Smtp-Source: AGHT+IE+Wt0j9bfvOyDxK4S5Sk+LF+v0ZkAtLY2D0aSLiBwAJ5C8bcVtX4TZmLbwWs4GZF94qJmrCp4P6UaXDpFQvm8=
X-Received: by 2002:a05:690c:f89:b0:71f:9c53:bac6 with SMTP id
 00721157ae682-71fb322b56fmr47409967b3.36.1755708228116; Wed, 20 Aug 2025
 09:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820104808.94562-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250820104808.94562-1-biju.das.jz@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 20 Aug 2025 18:43:11 +0200
X-Gm-Features: Ac12FXzu7BIyKdX6LwKtLISsnZF2ODfTKPqrr4vIhUqGLfAqz8wea0u8ZAdXy40
Message-ID: <CAPDyKFqvbWVxGU4mvffSJq_QgY33TXi=ezXxbvKyXe5eUFbqqQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: renesas_sdhi: Replace magic number '0xff' in renesas_sdhi_set_clock()
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 12:48, Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the magic number '0xff' with CLK_CTL_DIV_MASK macro for finding
> actual clock in renesas_sdhi_set_clock().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index a41291a28e9b..f56fa2cd208d 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -223,7 +223,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>         }
>
>         clock = clk & CLK_CTL_DIV_MASK;
> -       if (clock != 0xff)
> +       if (clock != CLK_CTL_DIV_MASK)
>                 host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
>
>         sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
> --
> 2.43.0
>

