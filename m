Return-Path: <linux-renesas-soc+bounces-20609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4DB29FC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 12:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B43CB16E524
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 10:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2B8315797;
	Mon, 18 Aug 2025 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kD86IGkO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E027319860
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514548; cv=none; b=daR46h4gIfd13R+q8QKDX5uj6+YQ0fjkM6lToQUSLE0bMoinWWEwAZuMjGa0vfMamvk4evypZzp6+ySuS3VJ/hZCMxPVE4ql/bKwdZzy7SVPwvN/ON4fXhtYGNSWu6QFjPTtvoHI6sCkBfB/fktIiJUalfHZu0ZAfqPXIlP5R2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514548; c=relaxed/simple;
	bh=iHvNIYoVtM0gtmhzVNDj0P+hg4qdzTTYa8AKTvPgEcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4u0y8nO/VaQ+K6k04wS2OzD8QT1zztxaWeEI0/npoTiAuEn8Tb756wgJBrK7xnz7sI8RY/Xy83rj0LnvaT2h2ogqysZz+mm/K3+gkOhEd+JzUiMOM4Y/gVqMBlihe6UCLsKpZO4TI+Fnlu88OkAucUg62hoJpbGjY2fHhGbt78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kD86IGkO; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e934c8f9657so846278276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 03:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514546; x=1756119346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JC9hJ08acql9I6gPRIBiwIU0+h4AM1URG+SiBRg5N5k=;
        b=kD86IGkOKItmRd329e72CKnck5nAbNNmZzBh9bnP9JskvN8mK988Jzq1r9hlPxUNcm
         eN8ER1Zy0j87jBEc8DE/gKmbHPOXLfEtqUBaqMn6bzrqrz706iwqX/Nkpb+AGWwInPKl
         Z9v63vCuFIqj/GJl9OZssy+mXhN8NZlKNPw8WLIMqgzbTn5BzfPSgALOqkApl6pNdJQ5
         uuwXe9eXJF8pOX0Ust/y7/sl0NUBkJ/ODtEAQz64xZy3p4rcbrHD0tYHo7DO7SGKfONF
         YqrSwaAT+mhRSBh2jwONGhd2NKdVmAcpgj9qx7rAuSu8vwT2scAEd56kff8O1m9S/ItT
         0yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514546; x=1756119346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC9hJ08acql9I6gPRIBiwIU0+h4AM1URG+SiBRg5N5k=;
        b=ftTsOnN+C87hiXDVsCE2s7G3z+kD66zNI+dpp1OYc17VjJCRs54xgJ1GBTMb9Dgx+X
         B7vMFnBtFI+D9C5nq0iEWRucn80SFtAB6M60rccdmr9iC9TLOkOgnPXx3JEaSUcu18Q4
         gkZzuIiM2hUMkW0uj/tgdnKxEjSE8ZdfJiNC/3dwi1q9y44aSDG7GGGjdtGf9nDQV86f
         BybH6jr5jcnQe7WMneaKg3rHCOUCLd0G0OrKhatel6pxDJlPaIy++k22LNcK84eJGaYF
         YKMq4OMQ5j6LK8dQgHNyA3csv19+NWemTINdB9+PUXMGOQ7c6pwS6lPEwONK1f48+MuG
         BkFw==
X-Forwarded-Encrypted: i=1; AJvYcCXRnTUqVlr6jT/DxXu33cagIsK0jcu+YOMQSjEsA6ZJ7xlOH60WOOiW4CgPM1SKWq8ToQ2QzteCuHgiuuKgpSKh3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YySg/CDbzkkG9e53uV1iWp9nktZIOIR98UNUtZRI9Tfm2qtn/Ds
	QW+z5QDH75SSN5isoGHeOQfnVWn6rOMi1+13xnmtG4kZuVPiOp/T+V1JgikMfcI0x7sIZ866nNF
	2wTV1EqsQyN4DBVDSs/6N5Ebzc52kiFFbjlq+gqVWJymyy7yPVlGp
X-Gm-Gg: ASbGncv+sYtf02EyQcMBBMlqqonuc+WufN84r2NJzYYLcWXk3YuHkKjJeQZUcWX1G4B
	qLZIwOPhuR/ccDvYqZ5MmNwU2AyCX61WZqlOj/pEOXGohzCApv9OBAVnert+5WcqGXiTxrlsaG1
	BUwZ9kM7CK96FS9+R4SFICf3NHHhnmxKm5zemZ3mnJx2w5y4hY111PsptAmyTXykC/3zga5iGMZ
	b+DCK0w
X-Google-Smtp-Source: AGHT+IEJTkVP+1K5o7GJEioZhNvRiV/+3+KOjFOMU5W0tfTvsqjZdrEBlWJvBYcKuor7yLdO8Lk+wVhX68UKDrA8wAs=
X-Received: by 2002:a05:690c:3609:b0:71c:1673:7bb7 with SMTP id
 00721157ae682-71e774aaa16mr105428807b3.13.1755514546131; Mon, 18 Aug 2025
 03:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Aug 2025 12:55:10 +0200
X-Gm-Features: Ac12FXwQkLY8qn_v81dOCAFgoFZ2JHmLbmrbQI4CNQWFczXEWLCAbRxpDcxVexw
Message-ID: <CAPDyKFozdeAku=c7HM10ARL6-uJv43LaEa80+gSHa-uBNGmnVA@mail.gmail.com>
Subject: Re: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Jun 2025 at 22:39, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Wrong actual clock reported, if the SD clock division ratio is other
> than 1:1(bits DIV[7:0] in SD_CLK_CTRL are set to 11111111).
>
> On high speed mode, cat /sys/kernel/debug/mmc1/ios
> Without the patch:
> clock:          50000000 Hz
> actual clock:   200000000 Hz
>
> After the fix:
> clock:          50000000 Hz
> actual clock:   50000000 Hz
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Note:
> For HS400, the division ratio is 0. I don't have a board with HS400 mode
> to verify the fix.
>
> I believe for HS400 Mode,
> SDnH = 800MHz
> Divider 2 = 400MHz
> Division ratio 0 = 400 / 2 = 200MHz
>
> and for HS200/SDR-104
> SDnH = 800 MHz
> Divider 4 = 200 MHz
> Division ratio 1:1 = 200MHz
>
> Please correct me, if it is wrong.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index fb8ca03f661d..a41291a28e9b 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -222,7 +222,11 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>                         clk &= ~0xff;
>         }
>
> -       sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk & CLK_CTL_DIV_MASK);
> +       clock = clk & CLK_CTL_DIV_MASK;
> +       if (clock != 0xff)
> +               host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
> +
> +       sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
>         if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
>                 usleep_range(10000, 11000);
>
> --
> 2.43.0
>

