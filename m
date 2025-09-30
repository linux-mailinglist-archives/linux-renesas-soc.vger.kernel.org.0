Return-Path: <linux-renesas-soc+bounces-22480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCBBBAC767
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F068D3B4E42
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778B82F83C5;
	Tue, 30 Sep 2025 10:24:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9372F3C3D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227896; cv=none; b=RZkruQw7Ineo72Zrx9VjjfUD33nd2+aiG8npJ0I8k8/eQf6IiE5UG1nG8tXWLHzXdvMr7KQddC7KOdhyw7NWGGT0RlzQbdhBemlYTQuT/FxIUitnT2qCTfJfD38s18n8i6act/F5PhaR0rcAC8LbXMTb7jHbMVH0pDGWi0CNzuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227896; c=relaxed/simple;
	bh=NIsKp5GbFDcQPhLDJfZxN1nX/4KGoPsrwSotfE5mvdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+hxR1LzB26RYU2O7XseNa5fEIeg63rFOpBc0UcJEySDSu1lP5i5iCyyM6aDFuPLuD0P29oA8ifRAyX9/wgefsJmwfY5aMZwcg7abb1IjvrgrmnMQTBC+ZzMtWiGdOtKk04B9nCXEqDowaweM6cG6uJpWDhrvtFLRWrQGwszrPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8c0e2d1efd5so1747022241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 03:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759227893; x=1759832693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gxwjnDPmLXoIEs1Rv4slGC0A9yr0/IqjZP6qkVdinM=;
        b=iU66M2Q2hl32+IoiJ4YVtO1Nzm/DIBDLLYBN6KeGHnLFr0bzAP9JeYMWbPB4WTgKmi
         4B6jqDO4ofUf9Mn0r9ImcjCQ83aMESHVUSpCWZBJuNtKtMQ97CCpyuiSWRcEk0qxkSe0
         FTiO9Kpa8ttQN4M/CTmK2V8erRM1gfy44q8zZ65PfFzA1NeTy6U9BClFUgRWKU6Gyk2L
         f4sv04LOZ/058mQlZ1XRgzBMIUpWofyE7AEcRb+beS4DQb+h7V0JI+SwFFooeCo50ZZV
         V0jVO5zjhGMUjbFapmw0+USh7RAWKhhcsg+YmOF+Obm/T6gcFHl0Rfcy9232ynE09K1P
         NyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrlf0/mg/gSOAVmjxGwpbcr0l5VfkUf30D5yMSGhCaoqKXuyb1lJ7sMOzEWes2KoqmpK/Yd/ZWCJvfJu6GuDi+iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqsAtx4ZHQ1KK2Voy1iFjWw2KBG8Pxt3cTctbcg9cMK8m4//I8
	WDu1aOK9scPmcaiUsoBUYfwvk48lb2clxUXRCHMtGSh0dRsvgWaWTMRf523fIYdn
X-Gm-Gg: ASbGncsZzavWqAGgu77QWOKmN0yR2B3k3TidhRJ5mmKhHEdjuOINyxtqOQE2x7fVT48
	8R/rw86ndu1C2b1bZFB2UmFKGTAdW9ChXYFwaqpQ4HMss4eM8f8eT+C5R1qwCkoS8drGJcRkupo
	a8GLwafha1HYu+BeJVswIguUy2e5O2vhfT8R34fpu+a78UeEH0S0gVUil9ioE4eYmaI6L6gjvUp
	kcjBOvlTo/odRmaU5c5M3OFG5FaC6c3q1o8sHKyrFNqKSK7IyHr1VTfp5BPNNiJZS0ZD3rJjeAe
	BGZF/mcQl/Wx1YrwPIY360i96DBpg9hz4DEGnazPAecdsqd9F6B1QSy0WuAHfML9bnXAxYX8fCR
	9ujefdCa/cZamQ8f3eJpomoz+Bo5fDz8WGBmNKjPmgH04Yo7Xcoh2ygLtRN6FgkDGMMO7K5JbhA
	0SWUIuBirYhbiPQ62qT49D3dBDvHcgkA==
X-Google-Smtp-Source: AGHT+IF9OluQiHS0LAfWRlLtF2dvatN1B7awflUMdUHIp93J9BaH4sWc8xcO8nfL72c6ZREdz+SipA==
X-Received: by 2002:a05:6122:1699:b0:54b:bf2f:bcd7 with SMTP id 71dfb90a1353d-54bea2c22e8mr7821880e0c.11.1759227893470;
        Tue, 30 Sep 2025 03:24:53 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54c45bff024sm1726609e0c.9.2025.09.30.03.24.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 03:24:53 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8e1d6fd99c1so2008170241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 03:24:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWnuY/tEsOgXe/aUGm135OGlxsAj6emFIuog0rnayo467wQ0Ezqclb9JQUszAz58QncVOj/+RxjT7XVQST6htJtQ==@vger.kernel.org
X-Received: by 2002:a05:6102:b12:b0:525:42d2:790d with SMTP id
 ada2fe7eead31-5acd15c52c7mr8052194137.25.1759227892840; Tue, 30 Sep 2025
 03:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 12:24:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5bn1CjqNKvrtgEUTq8iQPZyg4UVh44s=6Z81XF1-F5Q@mail.gmail.com>
X-Gm-Features: AS18NWBEbbL7niL2f1QYLCCmEF_wzKXMQ4DUWPDaBIb8c5eMNT8LD5RKrVsYWOY
Message-ID: <CAMuHMdV5bn1CjqNKvrtgEUTq8iQPZyg4UVh44s=6Z81XF1-F5Q@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: renesas: rzg2l: Drop the unnecessary pin configurations
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 9 Sept 2025 at 12:42, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> There is no need to reconfigure the pin if the pin's configuration values
> are same as the reset values. E.g.: PS0 pin configuration for NMI function
> is PMC = 1 and PFC = 0 and is same as that of reset values. Currently the
> code is first setting it to GPIO HI-Z state and then again reconfiguring
> to NMI function leading to spurious IRQ. Drop the unnecessary pin
> configurations from the driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -541,9 +541,16 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>                                        u8 pin, u8 off, u8 func)
>  {
>         unsigned long flags;
> -       u32 reg;
> +       u32 reg, pfc;
>
> +       /* Switching to GPIO is not required if reset value is same as func */
> +       reg = readb(pctrl->base + PMC(off));

I am updating the commit to move this assignment inside the spinlock
below.

>         spin_lock_irqsave(&pctrl->lock, flags);
> +       pfc = readl(pctrl->base + PFC(off));
> +       if ((reg & BIT(pin)) && (((pfc >> (pin * 4)) & PFC_MASK) == func)) {
> +               spin_unlock_irqrestore(&pctrl->lock, flags);
> +               return;
> +       }

To ease backporting "[PATCH v2] pinctrl: renesas: rzg2l: Fix ISEL
restore on resume"[1], I am rebasing this commit on top of the latter.

>
>         /* Set pin to 'Non-use (Hi-Z input protection)'  */
>         reg = readw(pctrl->base + PM(off));

[1] https://lore.kernel.org/20250912095308.3603704-1-claudiu.beznea.uj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

