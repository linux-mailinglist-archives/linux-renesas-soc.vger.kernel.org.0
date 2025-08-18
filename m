Return-Path: <linux-renesas-soc+bounces-20610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C222EB29FE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA70E3B00A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 11:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6836E2C2358;
	Mon, 18 Aug 2025 11:00:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D702877FB;
	Mon, 18 Aug 2025 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514847; cv=none; b=OKv2QlQn36VmTx9VpTcFuFPXn5E95rrW58K9XI0BOP1htamzjGhNTI5GRJ1JuwPIiwIVryVIBG+R/9sMG7R6w5iaakQJqKA4hMZy19ofMLTeeeSrbQuzFLvAk2GBvFEFLMISY5fkzrCLhc1orcG7QDe1TRFSxIikN6X1KcplVjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514847; c=relaxed/simple;
	bh=RbrfUulgvtPSV8etcDyWwRW3ch/eMAY72nRtjUWiU8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HU/yYGvqvuHhPmN94v8sK+WeDulrxlqdJkXccGsJBRGrw4xf/jP7trDsSiqETWg+eR6C38yRlddJLnTC6zsxI+VYtERW/H/vfOfhANAfiFz4DIgaVWigq9mBDxyw2hE/T1xxSGBfBWi/V55VgO1eQx/uDwjbhrCP4QPZmme0hFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-53b17531009so1252108e0c.3;
        Mon, 18 Aug 2025 04:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514844; x=1756119644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plE3Vb+AIpRujCyDm2rxlOVen/ii4JSJJa6Lxd+bP8w=;
        b=F/j0mK5o0DguS3dkCZW54OXszOYlRFaIc0+j8OcsdykrhvYvh7Nzi58NLv7B2jJgQQ
         bSIZYCOM65GmhCRRCOfwBYliu8wctiL+eOdlBtB6GoFUyXnMIP/jBC1kNFHGz+cJjuRd
         nA5Vr+Hg7OosqwJMaoKRd3sr4A5TUqS+Ot1Z82GX6GVpN09Na7XJL1QOdDub356WHn9e
         h+WGEHRdPmq+uP1CF+T5b1QUskmbLaZghHuSA/1MvlQL4qh/iw518b7PK+0jfi/aO22y
         UuwQJUnMSraVyHePC3qgAz+BLRxZoC9qtk13S0jgyzVbjHKwcdoNWP8zPYenbbqwQ7F8
         NN+A==
X-Forwarded-Encrypted: i=1; AJvYcCUlmNi6+kN3uefglQBkumng/sFsAUIshl5Y6qR6Mc+3rT7k8JxoKUxGCLjlt/ERDZNx/itWIZvX0XU=@vger.kernel.org, AJvYcCVwWt6vpy7caDcin9t7SrcstWvSK3QrMyXfNsdSGAdEa5wkxMSNsCBUAYIhChnlWN7yG2f/fcPKSX2yboV9paeAiTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc796Dr5UD4796scVdN2QgU8WJb3IiaLAxDl3OL8MAlYhFquXs
	r7ii60otQDHgY9fKA6ekp5rDDIwZUa3nVobXjwubeYi50k0NH9ZSolAU60yrZIey
X-Gm-Gg: ASbGncvAXPGAPvBfP/8Vz59wxl/G2Q2whK1l+V36EXn4//XJApl8/cu7F7+CAxTKUUk
	ksHJpCmPbEyMgPyyrU6UuKIVuL+uJyf9FHnSR8RIKjNYXlSa+tU7BzBN4rPIxfPSn0W0eJNZziV
	PtbXygcfeRL0/8UEV4kKM0A7y4a5IFUP3Le5uOotH4MkOOzgfZNwhLQljP39CfhILpjoY7wSUKz
	5mSL7E5vO58oZEdoMfaHLGcO9bANKL6gGnaSthRUIEXDGB5A4yT+IUuHnQM4VxRYIqtrGxt96Qi
	6+y+4eFQ0h4mbRltaTlc4vG7UpTx9OCkVuM6tJ9/g7mdojES1GBIrKl2QV5/oYLN6K8rH9JQGhI
	YtsYWKu+4qjruVVsoXAy8dUPAdlXlSiHlNVlej/QuzlgYH+3qVw4prZZ9YSZIr7M0Ce3gOLE=
X-Google-Smtp-Source: AGHT+IFVD2R7GaWGaIrKyEsz7oDzk1+06DvwmkAX2blx1hHlXW9Rymk4XRrMeLPTilDVBL29O081tg==
X-Received: by 2002:a05:6122:4f97:b0:531:4041:c4c5 with SMTP id 71dfb90a1353d-53b2b866f32mr3238104e0c.7.1755514841760;
        Mon, 18 Aug 2025 04:00:41 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd99c6bsm1885833e0c.8.2025.08.18.04.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 04:00:41 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-50f8bd52e06so1227797137.3;
        Mon, 18 Aug 2025 04:00:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCXT/0MbWa1vUhgAdWXB2Q/gGU49rHGqEkq5G9AX5PM+MX4+f1Ck40AHrlU5v5/B/QLgZCdoqNhG8=@vger.kernel.org, AJvYcCUsFawBvX2XOli2ztRg32R7uSB5JS1f23FK5nDsol97595HozpXJim/f/11uHkEGb+1MWa/axfwdBhSef0vaHDuszA=@vger.kernel.org
X-Received: by 2002:a05:6102:b15:b0:4fd:3b67:4572 with SMTP id
 ada2fe7eead31-5126cb46251mr3684513137.15.1755514840548; Mon, 18 Aug 2025
 04:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 13:00:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwuK8zKm+j4KEZaGcABSaNmmy7CKUFa+8r0t43obYTEg@mail.gmail.com>
X-Gm-Features: Ac12FXxVvj9GCtdNBq17QDSntgoupM8yR_J4TU7haNJjKCbcMj1krY_iNwHXfTI
Message-ID: <CAMuHMdWwuK8zKm+j4KEZaGcABSaNmmy7CKUFa+8r0t43obYTEg@mail.gmail.com>
Subject: Re: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 29 Jun 2025 at 22:39, Biju Das <biju.das.jz@bp.renesas.com> wrote:
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

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -222,7 +222,11 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>                         clk &= ~0xff;
>         }
>
> -       sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk & CLK_CTL_DIV_MASK);
> +       clock = clk & CLK_CTL_DIV_MASK;
> +       if (clock != 0xff)

Perhaps CLK_CTL_DIV_MASK?

> +               host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
> +
> +       sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
>         if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
>                 usleep_range(10000, 11000);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

