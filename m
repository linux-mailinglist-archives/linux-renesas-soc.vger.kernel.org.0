Return-Path: <linux-renesas-soc+bounces-12663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3FA20B53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C5661888111
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 13:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448CE15CD41;
	Tue, 28 Jan 2025 13:32:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2181F94C;
	Tue, 28 Jan 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738071145; cv=none; b=A1A+xmoB2zQFn/02la6b03dxPJOXolaByzpYmuU14IzoeT7ZA4WrMiYhfmHcch+5NDIMu3QMhdEcvVjfaElH9DStSyCwCm21O0UddyQ09pueuWpi7iAMNEsyXuMAXIiMwbxcNDvqrv9DW4r2WcdyAf7+VvOgmj1k8CRovFHrjkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738071145; c=relaxed/simple;
	bh=Rcob++w3J4FyoU8Qmy36x+YthxPl5xawdy5+UmBYgW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGYdrV7lGG4jVzdUWyFrErC/yrhWz9RKBf8qZaIz6zHe4Fod8ldpt5x/Dwx6eyLpSKRBBdvCkrChEkLbML8O5r+XJYb+YB8Tj2A5TRd3ULr4d3iKwQ+QFX4QLXid29NII2ih1z+k2ko+NDJ1gVOhXZjbI84WAGxbsAURuv+ghTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6e9586b82so489011185a.1;
        Tue, 28 Jan 2025 05:32:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738071141; x=1738675941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoYphFEhFbc9jRFu1jDXUoVHw/GdPwP+DE0az4SLHiU=;
        b=PRGgX3r5jV5WEI2EKuMpqboMIt22KSCg0Q7LN8ls7f5XegwEseiNujbPnlgQIWqgOh
         tADh0haW5rixcUHUJkqauxJfYV17VnlJvXhR1EuysrxDrY4SAQ2X4UZwltmWutGDB1bW
         r21YvgfKj0MllDZZHM4kPd9Aa60vf4awd7mRVtEusM6nn/I9kMew3vfijqyy631Mv+WB
         UpxyjoqtprtrX0kZbFyWwOrtTJLZPpzKWwFBZmFLovSdjAOAQ94mLJKp01GOEvZ3lKUF
         1EC63+Kx2TtvqclVVvQAAfCr08WAJ6Z8rvZo3Jw8xwmhkn/ls8bWvCRDBhvJfjsApPdB
         C9tA==
X-Forwarded-Encrypted: i=1; AJvYcCU8NVIwT6wF+VTuXR/DFKzKz3R0yuHNy7NKfp5BTGfJseriKyZJ5GiRcecFu9/nks7h6zu/kTcPIo8GWJ2scjFvfY4=@vger.kernel.org, AJvYcCW1srNN8sfvYQSW5G/pocpzw29XzPdFJoiF9iWu+bH8GI8+DDMnFJIZYasAOwPGRF82gaVFl0jSizQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+WrfD2DHtUGCfpfYrcr5YaOV7Ij2V6L+aQLa+/ly2gPpAWvA0
	tzgjjeo6aOjYgR9FcWm2jkgWiA1GVf3Rfu/DVj53o43wpRtTk4z4YoLRd801
X-Gm-Gg: ASbGnctN2ZCwqv2ShqIY42f+xoFg8Erf3tOSViaD6aV3h8dehagwgHqYxnly1gWopcc
	qgXeXH7An8K564n1l3SisWqha83v6Dv30jYI3qsG/TCcownp0R28DwS8wPZWNZIUfb9Axd3I54x
	EdJXao0eLoSxEfvEOdwySq8L0q2dow9BUysGd+hASBWSG4fyxKQESSLtrtpS8tbQTq/ZWZayXLx
	A8ER3DRDh4SbgSxhk5aRs4jUxvUiqSqHQU0kPqobKMIrJNyi+37Vp7MOHmVpYYtMifP6tTVcJeQ
	w9fOAjw05ZPZDykfCuYdQlAUumuRC+3X6KA0ehQXBUZPXF7Ik9txBQfvsw==
X-Google-Smtp-Source: AGHT+IFPZN+BAl+1Xx7uda9ttkMph0aOWO5eArLJCVKwa/pE3jou1M0FYAlSIC7ORvljfpfjgh8JQA==
X-Received: by 2002:a05:620a:2589:b0:7be:3f22:2d9e with SMTP id af79cd13be357-7be63288d01mr8054976485a.48.1738071140728;
        Tue, 28 Jan 2025 05:32:20 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9ae8a5fbsm506958185a.31.2025.01.28.05.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 05:32:20 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6e9586b82so489005485a.1;
        Tue, 28 Jan 2025 05:32:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMAFqeyVh2b4peENsblWWDiifaG9JWBqTifwLKk2/CyPTdbM5g2vCbIcwU0BLoVWJeakGeC+lrSYA=@vger.kernel.org, AJvYcCW3mLypZsOTigWQX1NFiv/cTukMuZplab1gnigomYkPW6oaiDcPEyrn8eBahqkvunNxb8O5OE+0ZJcHnNovhvCSCJQ=@vger.kernel.org
X-Received: by 2002:a05:620a:414c:b0:7b3:5858:1286 with SMTP id
 af79cd13be357-7be6328843bmr8086119185a.47.1738071140073; Tue, 28 Jan 2025
 05:32:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com> <20250126134616.37334-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126134616.37334-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 14:32:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfxSRsaBQ-wRq0C6j5znQUQPSzhPigLyvU+DTOHyckfA@mail.gmail.com>
X-Gm-Features: AWEUYZmFmEs1W8cN-Td6unwO9WNq7EGFAHZkt_575ac36_sNZhFTIUpxnEdq7GA
Message-ID: <CAMuHMdXfxSRsaBQ-wRq0C6j5znQUQPSzhPigLyvU+DTOHyckfA@mail.gmail.com>
Subject: Re: [PATCH 4/7] mmc: renesas_sdhi: Add support for RZ/G3E SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The SDHI/eMMC IPs in the RZ/G3E SoC are similar to those in R-Car Gen3.
> However, the RZ/G3E SD0 channel has Voltage level control and PWEN pin
> support via SD_STATUS register.
>
> internal regulator support is added to control the voltage levels of
> the SD pins via sd_iovs/sd_pwen bits in SD_STATUS register by populating
> vqmmc-regulator child node.
>
> SD1 and SD2 channels have gpio regulator support and internal regulator
> support. Selection of the regulator is based on the regulator phandle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c

> @@ -1053,6 +1165,23 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (ret)
>                 goto efree;
>
> +       rcfg.of_node = of_get_child_by_name(dev->of_node, "vqmmc-regulator");

If this node becomes required on RZ/V2H and RZ/G3E, and controlled
through status, you also need:

    if (!of_device_is_available(rcfg.of_node)) {
            of_node_put(rcfg.of_node);
            rcfg.of_node = NULL;
    }

Or introduce of_get_available_child_by_name()...

> +       if (rcfg.of_node) {
> +               rcfg.driver_data = priv->host;
> +
> +               renesas_sdhi_vqmmc_regulator.name = "sdhi-vqmmc-regulator";

Name conflict in case of multiple instances?

> +               renesas_sdhi_vqmmc_regulator.of_match = of_match_ptr("vqmmc-regulator");
> +               renesas_sdhi_vqmmc_regulator.type = REGULATOR_VOLTAGE;
> +               renesas_sdhi_vqmmc_regulator.owner = THIS_MODULE;
> +               rdev = devm_regulator_register(dev, &renesas_sdhi_vqmmc_regulator, &rcfg);
> +               of_node_put(rcfg.of_node);
> +               if (IS_ERR(rdev)) {
> +                       dev_err(dev, "regulator register failed err=%ld", PTR_ERR(rdev));
> +                       goto efree;
> +               }
> +               priv->rdev = rdev;
> +       }
> +
>         ver = sd_ctrl_read16(host, CTL_VERSION);
>         /* GEN2_SDR104 is first known SDHI to use 32bit block count */
>         if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

