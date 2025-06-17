Return-Path: <linux-renesas-soc+bounces-18442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A92ADCC21
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 14:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7397C1784B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 12:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A5B2C032B;
	Tue, 17 Jun 2025 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORMG9S8A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CCB28C2D2;
	Tue, 17 Jun 2025 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165189; cv=none; b=ASOh3Lko24uvhMsBdVbS+4e1aFO6fHvtRf0+2RYyU83HbAk2B+SozUBEortQxnPh120rJ90LV0MSDUB8Gr6sHVK3L3YzjVDKaWHjREGvYmXIxDcQe4fN3Wdq6FbwEt+nuxjZ2SjQOPuK9RC3GQLBK+P2Q8nTEgfindJXr3XCs4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165189; c=relaxed/simple;
	bh=oYOeIAfsmU4t9r2TCrVIZpfx7hejLpjjsg6BpCI0j9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJXdFp9/slGbFGbNGkvFQTvzocfyPWqWPJQOMvog+tlc9o7LHaHL0+aEOT0Ga2oEVaiioUlJa2W6PUudl3KbbwQxuuP0+9T6ho9XLHxywkMch56p0njhz2WCEatbfbHgxXj1ma5TpEthbq66L5Z9Fxr8CaZ35TWWzgFfJsIj8sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORMG9S8A; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-528ce9730cfso1367022e0c.3;
        Tue, 17 Jun 2025 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165186; x=1750769986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=;
        b=ORMG9S8AviVWps2q7cE2qTujtqL3y/uL5aplY7pFiAH9qTSBls2RwtPaJiMJmARIeK
         AtTIHejHFlJ56wUQT9UF+HUA205bz0F5ON1zg4YWtJlGEXM4JNlR2TFcZi09ykZxRUl5
         pIAkKxarvVxANcFbDNWY6GUXb6yhazx1y6+2jojw+wiNZT2PF110J3QFfM9LtbrpLMVB
         SD1YNpNm3NwZkt2YjIh5MJp4p9d5UVKxQZ5jLXIV87P/Kp/XAB/9AbdNhA/n/vGWGZhs
         e92yE40k3oxrf4EKmcYHcuRZAmyEcVjdKD1lM2LW6obIZy/Iio18Pi7QTwyo4DyMgPMF
         qVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165186; x=1750769986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=;
        b=HofpYPYs9ptLzJcZotHvtvg1SL/K0PpkFCxuOcsggNaWgIQBkFQpC0qv94NDLjwItu
         37mdsX87YTirTUCvNU9ggQXjTBF1YIAhp0N3jNm5ir4s90A4toX6lyj5nn3xROZJrLfe
         ByHv7z6qUDBzRZtxFhpQMBRHr9QmZw+VdoFzw853xgzZ/rX+EnFzCg1UClRVlyAgBc8F
         Zykg+Jhsq6o1LLhaMOsDJLqbmfCZkPPftLsYGPyfadHWWNAZWk0/gj9ihjWqoJP+D4St
         FyDbwO8TnryYqp7AO3f3+xMtO44/rwV5m2FWccj5pt/5kYn+fte6Qzydx2WBAy0oaxwS
         gdug==
X-Forwarded-Encrypted: i=1; AJvYcCUUczxDnXsZLVuPzhPm+Ms5U01Ar1HG+S7DgD3ipwFyPwEsRa8hf9DIwYjtRM1YMqAVwYI1h9C5RuIBZzsl@vger.kernel.org, AJvYcCVOQALkpL0teT0Z4A2UxvkW8vp9yh/q4jZQg0E9rMxxuEtai4KKapEcu8DbN3EquYTVWiw4uThEprprFbS86ceukfg=@vger.kernel.org, AJvYcCXIuJvCwTo5OaELGFLQQCJS4tSpqeM7ZPG11QeegpCs2Xay6j3aAGG1HPj8nbepRbHOog+0z1M2BqHTRTpBiPsTwXU=@vger.kernel.org, AJvYcCXZNH3ieSC7kuEua8T11IAGnmNgdK8FTfOqI/zrABMwF3FTB4KnELnqIUeP9LNIdut9waidF2syXRtCZoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+9YTg5SwfgY6wiTTAf+y1QjEeyHYKFnSy3NUlzocAPGwAGZT
	3Bcs4q1u2P7/3Zkj1v00TO3B3Yev/1BN9tXzgmFWVQMWHrSxNjfI8Q+jWUd7jB+IhwpV+m+slzu
	k6a1zGp2y8VzktfQaisoeWA0UjQWh5tk=
X-Gm-Gg: ASbGncv5d3jeHrFmbelJT0RjFYrJCq6OQ22dHLuRO/4dlFGncOgOicIbJ8hCtSOQuxp
	3PA6uH8amFpFYIwXQl3YMUqhmCyer4F6eToyhHoIwUeTNiD2p4vmURRJ7K0vuuSPlPA1GY5D3BZ
	/yQkRDISFijcnW2NwPNESDP6PhVs4ddyMPf2Qx/P9IAA==
X-Google-Smtp-Source: AGHT+IFyDxk9ofOoSE1jUdDwuXC6uj68bPw86gFHeN0xbFulbam2J1M/auQRgbuNa5uXdcywAXE8tSUc/+x2hYqgo2M=
X-Received: by 2002:a05:6122:4586:b0:52f:47de:3700 with SMTP id
 71dfb90a1353d-53149677e4amr8402312e0c.5.1750165185838; Tue, 17 Jun 2025
 05:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613090431.127087-1-tzimmermann@suse.de> <20250613090431.127087-8-tzimmermann@suse.de>
In-Reply-To: <20250613090431.127087-8-tzimmermann@suse.de>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 17 Jun 2025 21:59:08 +0900
X-Gm-Features: Ac12FXy1YqAOwtksyoMPU_mcRXzK8GOxRWP5F_To6gWRQ1V5y95DviShSwJIG6g
Message-ID: <CAAQKjZOiz3Z42N_GEPzqU=CCfim+Z7oCuyxuji6Guj_dKYsimw@mail.gmail.com>
Subject: Re: [PATCH v5 07/25] drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, geert@linux-m68k.org, 
	tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2025=EB=85=84 6=EC=9B=94 13=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 6:05, T=
homas Zimmermann <tzimmermann@suse.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. No alignment required.
>

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 4787fee4696f..ffa1c02b4b1e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -11,6 +11,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/module.h>
>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vma_manager.h>
>  #include <drm/exynos_drm.h>
> @@ -330,15 +331,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *fil=
e_priv,
>         unsigned int flags;
>         int ret;
>
> +       ret =3D drm_mode_size_dumb(dev, args, 0, 0);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * allocate memory to be used for framebuffer.
>          * - this callback would be called by user application
>          *      with DRM_IOCTL_MODE_CREATE_DUMB command.
>          */
>
> -       args->pitch =3D args->width * ((args->bpp + 7) / 8);
> -       args->size =3D args->pitch * args->height;
> -
>         if (is_drm_iommu_supported(dev))
>                 flags =3D EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
>         else
> --
> 2.49.0
>
>

