Return-Path: <linux-renesas-soc+bounces-22137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F861B90700
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF8C23B2CA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 11:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949282EC54B;
	Mon, 22 Sep 2025 11:37:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB7E22259D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758541041; cv=none; b=Xc4wacMAhYeLUhp37931/vrkucdxPAus/NtSQ5Ho2p5aKCHzlMIkJ6liYtgTiR9sa+ysbSitwZDhlkMDJIUBizlWA0Gg38c8wtlHTQRdyoWgqIMbJU7bZ8s0Was1wzqBAOuzdk0bcs3upkhjFMWRvi6i21m9/n9V8pPkIjb7rCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758541041; c=relaxed/simple;
	bh=KjAb3biKs5IKYFkpcrM0PPHOxjgtBLExqjXICPKzEok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/8OlphendiKhFbMIFJjw1D3bliCeWjJXKwKtACKChP02j110WD6TqUhFZjMzB5A3/VBK0UjRu6UZ4cCZDi3ZgR5lvQv8zG16Y4PJRyo04TGivQVjuaBwBTqz+w4vSRfx9HYvfYWoxCevUDKZULrySCC1DPA3GV1IKVWrghLPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5a46c3b3a5bso98920137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758541038; x=1759145838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROYCyCVqLUt5LfTOrqhdvPKBx0e3pCdCYXBB1uXy4gw=;
        b=dQ8wu8m4GqJwy7uCEDwSl59gphI6hFFhpZD5MIBBKSUUwSdV2CHmJ6iFiziM9c5Lmc
         glBnEe16U0ryJNt/6dFpJbJKPanNkWFzUy4tFOTXKdJpn0YYFFqSKOhiAmHbc4wuSjK0
         s7jMTRdO3/MmZ/fDIhr0fJVeusNlM8TEsqnh99P+sy9KQhd3v4cserQxhfDfQqWk3TLp
         2D9k4/FEwP4A/cXspqHhPp8IQ7ZOIdQ2uaUQ+hGsdObMooDEyfv04fo4FlibBrwkabZl
         oLk6AP1et8VotI3sQAV7TuQ2lu/sVW7Z60B7Lh4tYqenjCX0DEAx6b1JI5N5OzoQ/Nry
         N7+g==
X-Forwarded-Encrypted: i=1; AJvYcCWvl3jHtQykL4yMAxtKRTMoKwrvmLR42YVcfDqidgv2i8IU/taN1sMYWDpYGcvfzbWi8NNTUzAtLqA+70LRoPinSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc8sO/b/dBrchZr96hKxvLIIF9RFvPU7jgEDwep7KAPUdRur12
	VAn8CnZPXw0UT8JcTY4bTRzt3xOtT03eEIAGBYFpOYDQmqUr7PukWpMadbLVgbCn
X-Gm-Gg: ASbGncsOSh4UuQhZvF3GmoVHwp1tAZNJt0BkM5ofmoeJwOiK6F3+KN5ZH5M5jPPXbJQ
	qrs0FHcApxJO2R3VlBPOVtRL+I0/WW7KBQacZd83iEtcvV+xlA3Y8fJhFE1RCxY0K0AXGpZytFb
	0SIxFIDOEIFaZ2sfHUSLVH9dxdzEy0BzrEwOfbwrNOwmIU+nb2Ue/RP0J2JbzvY2Y9NYywK6Gy4
	pvNmq51MqtIDLuvm/ol1UQzyAJmfOWJXxLGxK/d+BwliMHcnlIn/A/4rpHAUTOvVMeYa+Z5C0ni
	HM4N6NDfYiwFfBBRxcrz8siEYzr4Czwp3uyYtVT21EGZSyGqB7qcmeN46cAaALKIEdYWegmXsPC
	uBI3eCFwNSb+9qkwvXrJGXiAC4Nux2R4EKBmo5z7y5BfVXmxeM0jj/kyrTHyE
X-Google-Smtp-Source: AGHT+IFQXZa5c5+Gn+p6q3jsee2oGlNzQ+4Bbe98itL/Y2UU0v32XBJeewKY7yA7AMaXQ82VlBXQgw==
X-Received: by 2002:a05:6102:3c8d:b0:519:534a:6c20 with SMTP id ada2fe7eead31-588f5e88e22mr3344173137.30.1758541038423;
        Mon, 22 Sep 2025 04:37:18 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a8685e515sm1926339e0c.21.2025.09.22.04.37.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:37:18 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8e401b11bfaso1525190241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:37:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNpELbhU4iS58+rWmJ9VfTTcuvT97tKkNk0sHaAy5rm/RBMaiY0WtMboccUZX77Jvm0VQyRD4WbZwIsOsXnwXd6g==@vger.kernel.org
X-Received: by 2002:a05:6102:4487:b0:520:a44f:3ddf with SMTP id
 ada2fe7eead31-588df58f328mr3311481137.10.1758541037754; Mon, 22 Sep 2025
 04:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:37:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWgaU9MvR+Aa4VGHJz+U_ksyP2w6+TmuEYPrGFEOtNg5g@mail.gmail.com>
X-Gm-Features: AS18NWB0ZbiLxBQ1qIPMQCacT6038FORzoGIYENzCu_TZOfhMidXT2cF4wVG2p4
Message-ID: <CAMuHMdWgaU9MvR+Aa4VGHJz+U_ksyP2w6+TmuEYPrGFEOtNg5g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

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
>
> Fix the reset driver to respect the additional delay when toggling resets.
> Drivers which use separate reset_control_(de)assert() must assure matching
> delay in their driver code.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

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

s/cca/ca/ (I can fix that myself).

> +        */
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> +               usleep_range(1000, 2000);
> +       else
> +               usleep_range(35, 1000);
>
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);

LGTM, but wait for more feedback?
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

