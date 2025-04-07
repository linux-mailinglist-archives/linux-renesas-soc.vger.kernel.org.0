Return-Path: <linux-renesas-soc+bounces-15496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4EA7E5FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91887445230
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C78A20550F;
	Mon,  7 Apr 2025 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mR/eUC+Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733FF209F5A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 16:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041939; cv=none; b=Y9C8I/KmWnHxFn/x6yAjNqVFr5b4fzABn246eX0ovHflGswG7/CXcM5whpLkZk/3n332dxucm0E2tDcX73AYVh3arqGzC8bdopKwiA4zKgHEk/FpbTKxrlVBKX+pvId0/tTrUUxjkH/dCJhXCRifhDv2S0dhM+11OcIzVE3qE5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041939; c=relaxed/simple;
	bh=ZWK4F5pkiuvCsD2a+W7pEbXy54LrutSpignndw+AF3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3Ratw7ha5C+eHRvWVe8DYMAj/BGRpxbkjJEVyDw1m+vH9HpocK9uAPdwZa/+f792WwDND7UM7LJZVQO15aEfTTMQT1hat4Z/IXe7wfww3C38TqkjuLwCTNVFvoMpPcKj4/g1erIu08t8R0o9I9lxKSn2XehbNK+m7h6hFscMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mR/eUC+Q; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fee63b9139so40447757b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041936; x=1744646736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tUJomVxK9lUe1I+H3yOlCnm1A1CRl+UuxJsXdwrQjHg=;
        b=mR/eUC+Q3FX2t3epG5Ji5tglS0MMkiNm2vdz6275vexf04lYnGHyAwcB+ytYZ1dQQJ
         QgC4xt5OQnCgBa4nOkhSeV4vHyL0IsU5OLbg8lynXH/rueVA2eh/F1CJlTjyQ2SFtSTS
         ZOrM6Ba2cvKQEWl1sry7P+puYt5WAfcph6Oe1S/a/uw9S8Pb8ABjFQCMyWO5Spf+UGeb
         mkQ6r3hjQOh1o6L9diTLhSbF4LJLMHOfDY5lXKd8B32n3Vxp/aUCfI4AaiPrYT2FdgIS
         4TJxIKP8qd2OXSp/gGmUMa+AzoJwnBys/tmqAhNNoZK9PBWXJotnRbv18uf9Ab3my2xr
         xB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041936; x=1744646736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUJomVxK9lUe1I+H3yOlCnm1A1CRl+UuxJsXdwrQjHg=;
        b=JBNyXMVX2Cpkcn29bEJ9GjZmWv9JDWc0QJeXLsK1yHsR0rFZw49p7p7EQF5vN+2Dtz
         CsYveLoGFOiGPLiacas3DZfpUfpod++01ngipQ7cJvspf7AxCob8RdvneVwDrVU6V2QG
         0pMMyAOfsxtErMagFCg3dUc3UEiZsKyC8oaxzcdvrkx15sWsJqvuJLwRH51VU91vQLQ3
         39+uiLtzy2DpifyyZ2Q6ZkSrMgvf+443VzyIFEU8RGj0tBPqJ5s4gSenzFcIZJTdVO4I
         cpCPTOCs79nftimIgvFS7a6Qb4YYsameUwOHs8Mz1rP8mj2Yw6rFaEf+VYcZHMCohTtO
         Pn9g==
X-Gm-Message-State: AOJu0Yy6uBb8dCsIHTUptT0wxp+PJz+yyaOBII/PBOszeX+IHN3gFKgT
	8zb/ubN986HQ11xYo3F2sqtrlkYzdtnerfvPsdbpBPzPxrjY4KoCjc6Tb+6psgLMwEBfkSCZmxF
	SJDzDv0r6DPIZaKE8QAT4eQ4UTTe0Ec7Fzsc6EQ==
X-Gm-Gg: ASbGncsxz0mwf7CN5sRnwI5XICge/f1KTCCdDwaw6QTXa60ld+jh8lq8fN1URm4FrGn
	oiDppXlurB8l8XgDBLg8bWHsNGdnPYDe75xE82B1wr1l2VgWvtdzff6OVsK8O+dakeK5mwkA1Nv
	Xklzy7+tJ8tckNWMoGWx2ShVf17Ts=
X-Google-Smtp-Source: AGHT+IE5IIpGhJ3lxaYQndkRiN7XRvbQi05HhF3dU3/Cu76gPC7qI1JSQCWf2xHlhqowdnt6+Q28QG9tfwYBGNmeHZg=
X-Received: by 2002:a05:690c:6f11:b0:702:66cd:10be with SMTP id
 00721157ae682-7042d57dc3bmr327997b3.14.1744041936276; Mon, 07 Apr 2025
 09:05:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331064400.16677-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250331064400.16677-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:04:59 +0200
X-Gm-Features: ATxdqUHgvmOJJ1NJLmLUKmjL5ZYT7OOW4ygQlvFHRtO9JYlUwIXiz-e05ukyeTE
Message-ID: <CAPDyKFoQTRO1Ax8wa2HZqngG_0gk7rJ4x5aNE1fcDS-Ln_YGRA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: improve registering irqs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 08:44, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The probe() function is convoluted enough, so merge sanity checks for
> number of irqs into one place. Also, change the error code for 'no irq'
> because ENXIO will not print a warning from the driver core.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Tested on a Renesas Spider board (R-Car S4)
>
>  drivers/mmc/host/renesas_sdhi_core.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 8c83e203c516..4642fdb8bf65 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1240,15 +1240,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>
>         sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_all);
>
> -       num_irqs = platform_irq_count(pdev);
> -       if (num_irqs < 0) {
> -               ret = num_irqs;
> -               goto edisclk;
> -       }
> -
>         /* There must be at least one IRQ source */
> -       if (!num_irqs) {
> -               ret = -ENXIO;
> +       num_irqs = platform_irq_count(pdev);
> +       if (num_irqs <= 0) {
> +               ret = num_irqs ?: -ENOENT;
>                 goto edisclk;
>         }
>
> --
> 2.47.2
>

