Return-Path: <linux-renesas-soc+bounces-15672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923FA82613
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 15:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A3727B97CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 13:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A7B266565;
	Wed,  9 Apr 2025 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gu86Sccr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F446265CDF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204464; cv=none; b=FB2GfUz4hFasOOgQDpch6V3GINBOcHkSuj+N6MdJYJQ7eDJOd1qafY0eJU1kgposZUAdqOYEth+lvgjiuXZeGbIL5HNkPiRgy6pj98ao8azBGdmmYRfDxEgWVO7U3fC76cqrRnVXqjVdCwdfSlnKCAu5uwmCftB6QOB7aYLx3zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204464; c=relaxed/simple;
	bh=ySJvfaqcIjQusXoLi91ha5mTlR84r6YRHDDkPiChFbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Muj28Wwjygol2AyDRbLUzqQJcHt7v23QQfkuXkS7ZQkwKh4d8+eb7VyNNX3hp7BKym6rnPf5320QD/T337A+8bf2gWM9Ks0SEM1If7MQ/uCXbCr9SdNEaAD9sJwePfx8YAkBPvAXmGXuqmLuQ5/8L1IOSe0tUj/+HLpVXBs5O/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gu86Sccr; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-700b17551cdso66949837b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Apr 2025 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744204461; x=1744809261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UvXD6Vit4/XQjMh5TPDqTHybFGmBm72KRNvjczpWe7Q=;
        b=gu86SccrI2mowXYBUQ9vRdTFzp+jPCXJ0LvIHDye9QRh6X8Y3/w2IM7ZjC45p6vnS2
         I1VHRGJ7lEYqb2oMINlJo3okQIppjBaPR+d85hSg+syW02zF3zHLYMGnrgHc129UohHg
         pA2PFd+OxPLbU6i03KEjAHNOmWh5a6Nbve8aXRY5DgSuF1x5Lrp7fR/MX87cMAH79xZ3
         dJYU5muk03TKFQmaW+oqy5nOUHKCVL5h6QYJuBN/B4KxOHS0lAvbV5oPcspfyqwFN7iu
         M03Kr7XO3PujPxVHoSAGeNiRJ1MOi132ixv5P3Pfxx7OZZmH+cY+yWzUcFUMzbNrE3wS
         bpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204461; x=1744809261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvXD6Vit4/XQjMh5TPDqTHybFGmBm72KRNvjczpWe7Q=;
        b=Ex9je7JSzJ0COneotyDiJRpv5gCEmM0SNJo1j5g6Odnx7UsgrDphWEMKjkfFdsJ12t
         wH5g2HFoj5r4MJvDZ4MCC8ZmBWbllt29W7o+MH7XmHa1cXinQjPE4cpVqZOujvSVR6zb
         e/Dq+XT7BQobu8pSZkhQ+TLqGCFC6D1cokpKLH0bqv5+J7+m3lSvysnXQwyZBRdWBF2E
         Hcu1pTWLGyiNDri+1elNxJW5BvPTfKpZQy+bBayTbmDgslld3DEeXX0yhNv0l0uHZWtR
         CELcSH+hh/Otml3k99to/rpYYo5U7hBYP2ek7EiFEFhQNUMrt/m3+SK6wH7CvGQpoFMR
         oCfA==
X-Forwarded-Encrypted: i=1; AJvYcCXxaTfiJ4mLfd54PnHjCRwO8PMUNi/vyR45H6ql65HlmJ/qzFAbCexOnuD4+c2TvykrV5UfXEgq8Ucb3DVI4/xAhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu6+MdOJTZQe8hH1y4ObuLyH496zMfVLas4PvVny261451z3Vg
	xdbNqYI4RfmFWXbhgjC7LnGowW3lzXIPDVeF8RifAE5qz1Hau0mO8c3C0GBrRtbva1PjY/INe1l
	X5LzsF/zk/fs9qTNmvF/7DiUYhs8FCZflGf8v+w==
X-Gm-Gg: ASbGncviwEr9vD9h0tyqsoWJCVc6d9bUxrQ06XD1lN1c0mrOht4zZTVONbx19TGH7AY
	4+koM+kPMAuOC9klNcmJwPcVktIuGOpWwhyiySzlW8Ovp/0G6qSUI6FwnZY/6KoL/6qEr+uzY6t
	RS7ykcHbwuLZfPeBuk/spGwE6TCQWW/aXa5w==
X-Google-Smtp-Source: AGHT+IF0dYUcGFOQShsjgMB7MWZa3hGFQ5HoYrn3mxhacjMhN42yQdkHkcaUjnE7l38towq7w5aGVEUc5+fQUoqpduA=
X-Received: by 2002:a05:690c:6608:b0:703:c38a:229e with SMTP id
 00721157ae682-7053ae70ab2mr35235947b3.26.1744204461697; Wed, 09 Apr 2025
 06:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407092144.35268-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250407092144.35268-1-biju.das.jz@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 15:13:46 +0200
X-Gm-Features: ATxdqUEjkzeXMVIPgTN-2xEByLyfZHo9DXGRUHrwmDK1e9Gasj0zeSRmlDSOjOU
Message-ID: <CAPDyKFq9rrGDMP7npb1m+dcszTKo9X14sdbwbSEdGRudJ-fUFg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Use of_get_available_child_by_name()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 11:21, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Use the helper of_get_available_child_by_name() to simplify
> renesas_sdhi_probe().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index fa6526be3638..e26e7995754e 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1166,12 +1166,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (ret)
>                 goto efree;
>
> -       rcfg.of_node = of_get_child_by_name(dev->of_node, "vqmmc-regulator");
> -       if (!of_device_is_available(rcfg.of_node)) {
> -               of_node_put(rcfg.of_node);
> -               rcfg.of_node = NULL;
> -       }
> -
> +       rcfg.of_node = of_get_available_child_by_name(dev->of_node, "vqmmc-regulator");
>         if (rcfg.of_node) {
>                 rcfg.driver_data = priv->host;
>                 rdev = devm_regulator_register(dev, &renesas_sdhi_vqmmc_regulator, &rcfg);
> --
> 2.43.0
>

