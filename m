Return-Path: <linux-renesas-soc+bounces-22706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F1FBBE33F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 15:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADD0B3BBE01
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 13:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D94D2D239B;
	Mon,  6 Oct 2025 13:43:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B08C2D239F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758218; cv=none; b=BWc+4xg/nfCwVGwCIOOaPUM2tvx5yAcfkLWw+njGkyzSxEkArLx4dhSfR8brgabMSIGWFfqLhHnw0870wqjeyjYajZMuEZIRCxS7I7onRfbS/pSBWHNa3/GRv/VvE/aMEQU18zo4rfC4pkCdy3e37wBCKlN9LbYqc8Nawl+hg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758218; c=relaxed/simple;
	bh=GWPhB7ZUdV7f1J58EehNLyYdtceaMJx9xcnivYhGU0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Okw1pRNVkQa9Jc9A+i7EFCHyjoZbPX8MBhvUrXEvNl+QLQb53Jsue6FouilgfVRbaw7Dwn4Zz46SiTVaXJfijHg00oNbYaQckkNXe5fWGwt45j7zmyojVFV1hN+auOgA1cyAJGjObSAYolNKunTQXyQmP6L758EJgDsdViZPsF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-51d14932f27so2520558137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 06:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758216; x=1760363016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a67E2/Ihlt/Uu1lKuZ2sBmUpA48B6MG/OEXHNzpezk8=;
        b=hStmnP9qk27U09WxgiFoDV7MTUH1c5UDiUAl04RKqGgwWIxfrc024p8Iu1977bYQ3v
         rnzcPcCt5Z90WqwlJanhnFghjzhcS9pkMZhbWJGIK0xUmEAd5ONtOzaT6DpyW7Rt/amb
         KFKR9k8v8UVwghOVFkJk2tLIDZCh60NoNWL77NtpjN/hiNjn9Ba6cClopWrba6PcTeKo
         tjhadJNHizTl/36woTEp+n0yq4ZDX/nd8DA+7dsY3nLxSvaneyX4A8pi9ZSohpg9eB3Z
         8hYR7q9JcyN4XV3a9nOWiJmBlCuSBrR7c5gFsIddlGuJuJQrOESZgvvQc0vWKi0eNN9d
         leGw==
X-Forwarded-Encrypted: i=1; AJvYcCX/DlZoLTNAfApK2/xck0e3hVTPzDVJ2VNHQKzG9JJkvJP2OvIBxFKw9AD8QTcj0+3A2oznept3oSl4mw5w5tvHqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQMwDBRPmzj5WULLXmFvnmW5d+d+V5FWgvL00boMwJpDZgBKw+
	yMv6T4rCYPdxwhFJe9TpjewhLzmWWD0hVXh6T4y/L141W1/LpY4hqyHB2z/eDvoh
X-Gm-Gg: ASbGncscRCIfv+g2Ufs5Ku+ffV4RZBn6ouGzB7XY73puqtbRalnZww1BkARVbZ74laR
	szQVcoLqsi9e6fDGSJlPVnpTYVrW8gwO/87gW1YvcX28ljtqDQQwPaIw55Xmz5mnxiVEQ33T9Wp
	3ha6rfbt3N22KA7do9dgspaKhzmqKIY7YLAHpJwN6KAubaylXpCmXs1aOOvVp3RL3GHsZfDyDhA
	HMcieuewufhOqn+4kL0LW88H0MzWTVqHo7eas6TkrvA7H4zxYUBXKw8ejfBLZxmsHrgu8cwlI3l
	bbdc5Vk96mjaNZ8gligjYMewQds4iNbL/wAN+ZXoBBaW0shl/t+nkhiDnSc+hR+RnbfW0Ts8P7I
	rop1OdPGmvUMtqTKL8HCrbLmsxUVtzHf53cToBc6LX31K9CpuvScitjQ6EKAFmjzD+osQSLlJTD
	F9lZXRS3m5
X-Google-Smtp-Source: AGHT+IEX5pWuB5hSpV4ucem1PAoxXL1uAITirYQMXcVP1rdN0faaO/ROOlwsTNi7i7s+Y58fcLmb/A==
X-Received: by 2002:a05:6102:38cf:b0:59a:79c:f277 with SMTP id ada2fe7eead31-5d41d10bc1fmr4397069137.17.1759758215682;
        Mon, 06 Oct 2025 06:43:35 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d3833f40sm11294137.1.2025.10.06.06.43.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 06:43:35 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-90f5eb2feb8so1020008241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 06:43:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbV5aUzW8eJJ2e5eH6krSTfTjAv9HlPL6nhobCOkeRfsfDMsKFfvxXdMQE6vozJ1FesRpWBvGxvrseB1evRycfEA==@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:508:aeba:ac31 with SMTP id
 ada2fe7eead31-5d41d002033mr4256282137.2.1759758214610; Mon, 06 Oct 2025
 06:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 15:43:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
X-Gm-Features: AS18NWClqzJN9dA6PiMr6EUhixU8-AfcKoTYj9pkzTaAb0NMa8OHnHTyzG2qTcI
Message-ID: <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC p.zabel

On Sun, 5 Oct 2025 at 15:15, Marek Vasut
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the update!

> V2: - Add RB from Geert
>     - Use ca. as abbreviation for circa (cca.)
>     - Switch back to udelay(), risp triggers this code from atomic context

See https://lore.kernel.org/all/20251003150819.GC344149@ragnatech.se/

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
> +        * (one cycle of the RCLK clock @ ca. 32 kHz).
> +        */
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> +               udelay(1000);

1ms is a bit long for busy waiting, so I'd really like to avoid this.

While the documentation does state this 1ms, I understand the
issue we saw in the field was fixed by
https://patch.msgid.link/20250922162113.113223-1-marek.vasut+renesas@mailbox.org
so perhaps we can do without this longer delay?

FTR, it looks like the reset controller documentation doesn't say
anything about the context from which it is safe to make reset calls?

> +       else
> +               udelay(35);
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

