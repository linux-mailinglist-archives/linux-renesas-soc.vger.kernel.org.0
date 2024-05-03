Return-Path: <linux-renesas-soc+bounces-5091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4311B8BAD73
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 15:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDC181F2277F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2024 13:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B38153BF6;
	Fri,  3 May 2024 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mbnuzj+F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815A15357D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 May 2024 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714742128; cv=none; b=rZcBfdIvrqCVMIsrDVXKyIBl5gKCVwqHlFvkO363ueqrMD/LI2H3pJ02y0AW437N1yCQI4fx+3dPm7CbRinADHN7qJzzb118himqmZ/1Asm0Kpa8yguIvsXcm6xUn7COoSBA47J+meq5BfDsZtMCFbm+MnIqMCBX6fRQVA4NvCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714742128; c=relaxed/simple;
	bh=xrqzZwgdph5DRS4i3SCKXCa1JY0Gomt5Ypf74Pq1OsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6hK8IsduxLYsMlnpH2ms8Kk/DUydHYs59UkXcG4LzBFCYLWMcdRQbglPD1+JGLzUiPxloE9v5qgerzbLggDOAzPz4vI/DtjK66ISw21s3Uf1FPLBeEEdseEWTyXHmHALJlo+v4Wa7W1yEoEcPtBMoNW7+DbCzF1OXUE4zscUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mbnuzj+F; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so2268822276.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2024 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714742126; x=1715346926; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yRI9l6TRFX4cl/D/dHvxIPz5B9asZPit4lxB7Ww5SAs=;
        b=Mbnuzj+F1O2ftcNQQa2gjKwnUIEzNWptcRetBceho0Y5Aa8AJhE/TqlCMOjfFt/M06
         LZ4McigjWo0z4CA2xJGkMjOGRNpBJ2+h53A2VJAJpsKsqyC6Ktn0LzTOYk/SXmEsBmgs
         v0XPoc+nMYnPxKy1KT77c5XS9JwIITbHaby7NRXwSdubet8A+jjQ8tiEb8BNkSwTVgpd
         +CiquOg/lyTUnwkHHDdwj8lqAJCZ8DL/exZO3hqVIN1Zc6yablOs35WHNXnU1ZJmTyo1
         xQ4iVz4vjrfdD3HXBMZTrdF2Tc3RHFv93D3EkvxgxMW2EPHkzYVy+tKgfgSmHMbk7pCe
         vHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714742126; x=1715346926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRI9l6TRFX4cl/D/dHvxIPz5B9asZPit4lxB7Ww5SAs=;
        b=PbnBBAvQLFTiiWrL3gvYtQfNcq8p3dK1m5O5FmWX5A2BhnA80rptDswLl53EnkKDyc
         6ez28g5F2crNKaHFyDkAVFtWGHA2wDR3izV7yI3tJocnE/dqX2/nkW4Uw89ykoulRi+m
         osI2XbwhkbDRZuXKvcmC1yxvjPAJ2rEORkcskknWw0WfmJL5gI7S68xRNqWKg9kCfNXA
         cxPCAh+XUHPkHjy5BgukGFQp/YboV0fQgBTQF5TerMXsZj7xBT5CffbzYb31DLOH2A9S
         muD8+/+rD0LhgHFE+KRPXUKnh198puWNokBVnxHvlHbW1ujjTWdXdQbQ0KXqUrrewX5k
         rCNw==
X-Forwarded-Encrypted: i=1; AJvYcCU581WD2fBeZIRgVyQAXFKUx8dYYqf6t/f24sb3tr1XDl2AkoLN4ijCmYDgn+2cvC2gmt7URVgry6wjovaMsjyVrJHQ0tKdJdG0+UIZt1/tiOk=
X-Gm-Message-State: AOJu0YxOR6soQE5shW9VISTBqPxs6Lkiibg2w5bis3M28Dm8romSXIrx
	R/zo0Q13Epeq62za+ONtBkcg2QBxo/e8MB4wNZ2RKtDF6ZkF5TLeZ+6HlO6VBqA85DFnEyiESx+
	ncoygUCqDVJ9IuiqTFh6TiZ89XHqzwSUf0vLE8QeNSMvBefT4
X-Google-Smtp-Source: AGHT+IHAuATqJlUN1KaAG6j30rTHBUQbuirlBENRxW4a0MCgvAe9RQrcnJ1n9j7vzbMqMlM2SL8OuwZJN888gEQV8HM=
X-Received: by 2002:a25:aacb:0:b0:de8:a500:ffdb with SMTP id
 t69-20020a25aacb000000b00de8a500ffdbmr1856096ybi.26.1714742125931; Fri, 03
 May 2024 06:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430093724.2692232-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240430093724.2692232-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 May 2024 15:14:50 +0200
Message-ID: <CAPDyKFrPZ5XF93MD+g03UQP1d4WSPoop=VyAhzwLu9KV436KkA@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: renesas_sdhi: Set the SDBUF after reset
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Hien Huynh <hien.huynh.px@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2024 at 11:37, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> For development purpose, renesas_sdhi_probe() could be called w/
> dma_ops = NULL to force the usage of PIO mode. In this case the
> renesas_sdhi_enable_dma() will not be called before transferring data.
>
> If renesas_sdhi_enable_dma() is not called, renesas_sdhi_clk_enable()
> call from renesas_sdhi_probe() will configure SDBUF by calling the
> renesas_sdhi_sdbuf_width() function, but then SDBUF will be reset in
> tmio_mmc_host_probe() when calling tmio_mmc_reset() though host->reset().
> If SDBUF is zero the data transfer will not work in PIO mode for RZ/G3S.
>
> To fix this call again the renesas_sdhi_sdbuf_width(host, 16) in
> renesas_sdhi_reset(). The call of renesas_sdhi_sdbuf_width() was not
> removed from renesas_sdhi_clk_enable() as the host->reset() is optional.
>
> Co-developed-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Changes in v3:
> - shortened the comment introduced in renesas_sdhi_reset()
>
> Changes in v2:
> - fixed typos in commit description
> - limit the comment lines to 80 chars
>
>  drivers/mmc/host/renesas_sdhi_core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index f84f60139bcf..d9503f9f6e96 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -589,6 +589,9 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
>                         sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
>                         priv->needs_adjust_hs400 = false;
>                         renesas_sdhi_set_clock(host, host->clk_cache);
> +
> +                       /* Ensure default value for this driver. */
> +                       renesas_sdhi_sdbuf_width(host, 16);
>                 } else if (priv->scc_ctl) {
>                         renesas_sdhi_scc_reset(host, priv);
>                 }
> --
> 2.39.2
>

