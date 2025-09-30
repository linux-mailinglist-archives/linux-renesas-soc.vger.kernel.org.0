Return-Path: <linux-renesas-soc+bounces-22486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB4BACCFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 14:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB6797A54F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C032FB618;
	Tue, 30 Sep 2025 12:25:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE492FB60E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235114; cv=none; b=cT3aIyxhZrXI0ACQAgTScEfm6Mr1+dDsV9P7ANvoSPY98ffzPI5aKwx/Gx3VJsG6JlQONfGPk5aPL/tQW0muJgO4CRmOj/GO/TW9gu5MiGNTqHVVMt+D3hnMXAmGSZkC1DSYxSsqJLqVeFcEqtjIsSmc1JZea6lNUZiV5cpgPLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235114; c=relaxed/simple;
	bh=Rl+WInx8PaUwS8IuuiiJzhnJyCOnZbjGkwRrtsfYF/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nms52jzf7DvARIwFKmKHXJfwV3cD6TvQSLZnnkoty6Sr4NdHuFVxKG0aAhJZ3Zum9sQiqDZDhh3NWvc6xb1ooiqHgOhhpxPEQUsTjjb1uk61HHdSLlXH7TlAj58QuPwPJwGfs3wJM9PvpjP9V3PdSYH/yEV4c8QnfOUgfv6B7DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-890190a3579so1055940241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 05:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235111; x=1759839911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLhZG+hkus/w1b8eNphrVTh3mT7pWH0Bv6WyCP36MRw=;
        b=sH/KnemqLEtcStKguWwFTxuMN0P3pjwfpZPR81rK3akmV3IUjh91ltuJqoEj8RJo3K
         7/Os42jrmrNPbGtIOOTJ9+sZ0hFc06CEnXmwupynhrqyv3jB0mN+Gh/pN2yAE5XxU4Kt
         4w//we4rumWPIwom3Xq2oH/lfliWvvkHlV/id7AImQZLa2HC6wltLV9htAhrfDX6LNJr
         lQtrRyvf+44vr3JcPsPe+gELu+bTwhbIrku1PG21m/1eRY/O07L09Ii10MFVa4+GZoq1
         ONwwKwIuJFRvlJGdkcY5HiUJEnFGify2GGklbrVFAz9lYxcioUosNBanhRrxoInuItC8
         IHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7wx9kJjjr9bXCW2oCLIcZVo+dHiZYkHMmbTDjqtR/KEM1D9kAJFLA04dhjDlb2ri9Kz7+jEk7kZqt+WC/jrwdWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1s8pgzVqnZ20MsqUWe5Xcosf0k4EuFwA4MScjjDOMnQXzgbZP
	yoGis73WaU4OP5FTrDYmxJygtVETO/Nd7grK7oqlSVd7E9DzqCOWSE9ER6FXrqCH
X-Gm-Gg: ASbGnctxYUdhfvwkU/JFSJ0u428BXWdi8nIkT8yl9xIPF5JbkiRbYg3EnzakJ0LTuQh
	X175ARFvA1P4ICbm6yaCMM10mbYamEG3wnr15ddPf5yrsXtoBkq9xk4S/Vx2H0vkl1ojbmAimto
	rloqFDBiukIvIX1k6EMBnu9lxr/m8o8SnXfvNDnVzHqUTV3JJzRm3JfiNpIOhfc8uKhE2Q+iFi6
	cg8vxsfxYjg41zulCkP/ZJP4EyyiI4NV2H+v2gO/0wU94U5/ULMfRPsaoZo08u5uFiQCC6ijgr2
	tRgp4sVqR16jTTF3MTmMnYRhZBL34L5DTfayAIZN0tGmRjJSj3n2x6v3IblFPklokC9FipASBWR
	uNZLt5RkXw0M7hg6rBCcxxyHHigM+8OXvemQstPScVQ8k6zd7Up6K6Fjb1O9N8GJsHxGWUBMjqt
	6YM2qrwltvzbMmctPKeht2meA=
X-Google-Smtp-Source: AGHT+IHno9uUSj6hKMBKOIX7ZR2WxcRV8//ub+m3ibA957DqfNeg3eXf+60T1InrD8POypD/LhF+bg==
X-Received: by 2002:a05:6102:2acd:b0:522:f65e:c76d with SMTP id ada2fe7eead31-5acced25706mr7581891137.23.1759235110789;
        Tue, 30 Sep 2025 05:25:10 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3b700a82sm4347489137.17.2025.09.30.05.25.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 05:25:10 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54adce22b2cso2043175e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 05:25:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYw12pOim4qp9L2VJbDb3uzvfZs9wMIQF4a5pgGNzm7ufomIykFI8dtW4o2LmacHFpF/+vAYC7c2jaib0oA3VqQA==@vger.kernel.org
X-Received: by 2002:a05:6122:3c82:b0:544:75d1:15ba with SMTP id
 71dfb90a1353d-54bea23f988mr7144912e0c.8.1759235109983; Tue, 30 Sep 2025
 05:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 14:24:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXeO-gUn9wjedkCM36RSKDCZWM9xFr0V=iPu+QM3ARUg@mail.gmail.com>
X-Gm-Features: AS18NWCxLAVJQ1S9RTeuCdL6-zKzWFNTXwDLwA-hDIPiMJ2Ye2a24eC2rN3ikhk
Message-ID: <CAMuHMdVXeO-gUn9wjedkCM36RSKDCZWM9xFr0V=iPu+QM3ARUg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC shimoda-san

On Thu, 18 Sept 2025 at 05:06, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> after reset has been asserted by writing a matching reset bit into register
> SRCR, it is mandatory to wait 1ms.
>
> This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> whether S4 is affected as well. This patch does apply the extra delay on
> R-Car S4 as well.

Given
https://elixir.bootlin.com/linux/v6.17/source/drivers/phy/renesas/r8a779f0-ether-serdes.c#L219
I assume R-Car S4 is affected, too.

> Fix the reset driver to respect the additional delay when toggling resets.
> Drivers which use separate reset_control_(de)assert() must assure matching
> delay in their driver code.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, queuing tentatively in renesas-clk for v6.19.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>         /* Reset module */
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>
> -       /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> -       udelay(35);
> +       /*
> +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
> +        * On older SoCs, delay after SRCR has been written is 35us
> +        * (one cycle of the RCLK clock @ cca. 32 kHz).
> +        */
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> +               usleep_range(1000, 2000);
> +       else
> +               usleep_range(35, 1000);
>
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

