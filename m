Return-Path: <linux-renesas-soc+bounces-24589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1468C5971D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4391B3A3284
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 18:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CB73590D2;
	Thu, 13 Nov 2025 18:20:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83DD346791
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763058020; cv=none; b=Y8x/ShiZwT2aiuppjMVSwZN3BtWpABL8S10eDEilImZ0pLvuwV6qv1ar1xlIHofsMFuREbgMlH2yfYGqzpoPqu/rssVXtYsM3Un3xlpVXsFxoF+a2hmqCrwVbY8HC06Opf1JsIG3I2C5Toy3M0+ep07n90vbUCbnzR0ljDGdiI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763058020; c=relaxed/simple;
	bh=q4Pni98XzUAF/l2bWun5gxCY4hAH8sNECZ2AvGITWiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bslY5YyUIshYuSCVnygcCG1GwoKpj2SeuZUQdUr11KYywHTLPRwgVEBKg2ZZligTN6U11GlEfVXSulctRUjfetlfxi1O93/JrABnmiFVURWiE8rQt/Zr9tOGou+YLmEQ2U3dxePpErLx1w9VM5WmgF+tHfSI2qXuMHQErJoZ8pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b09d690dcso419981e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058017; x=1763662817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uS/kxH5JVnFFcogceq0XBHqgyC93uzre0sinNeAFlM=;
        b=FP5kntiN5TlrsNSDZTsUFqwT62XKUMmhGzw1Vvtf3Z9RDxqW7QxOFDccYfBoAsv2Os
         1Xl2xT6lG5XHWDWlQ073iaX+V0mimxNtLthONRXjwsTclPkHwBk9gGl5UhJ65DbGrR5R
         nAeGcdxfPtx9dNkDGDJRSgMK6f7rMQq8FAW6zb9SUhOyPaNOup61O08l/N4Wf7rRIGY2
         9ykhhXO+LFgqAJvhDCl2cDfnUagiaVqzpvD44owaN31NooXOviP838yxJWP/0ZETpTAN
         7tvNVHzK8sXsRYebcGxsSAM0+AfIQkeptV2efPeLFmHhytFRaNC1funYt46m49SQAeeu
         BwHw==
X-Forwarded-Encrypted: i=1; AJvYcCUDlgDv2lp3zOMGNmIU84dLV3E0VsOY0QkuXCFGOy1clJDV/vxsMvQ/UQN+KOpvqJkSfvPBgVYbDQ+hr25+X384jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkUcqp3+HAYStDFKh3DMRaklFDOfzSJqtvvgMoKjsWQo3P20r6
	8o/WQturJE47iKJ/A0iOXIwqcxN4DN87wuvLCImfFutm/ieiqn+myp3CoXg5fGuYjw8=
X-Gm-Gg: ASbGncsyjobV2ypxA+2NkLCcTXJRUcFxQeVWxJH2xUFBWgHv/wqgpn83hKtGAm+InO4
	RtQDnYQwhdHgNfAxXpm48+QeiFClAPcGUTkqDEzdRw4PGaDfQbBQ0w2jyO22zNyWWz9C4IKtTNu
	02DnNKnJw8jhmqLUBcysWK5EN/l9AukskjP+ABnkoHgPWwStG0M9Q96MzXsj7sOkm94fZ2oEODD
	x+ivn4j1nz/IWnmrEE3FKuM5AcIZnHo45KDOH0PPduIwWwGlfJ07vfJ7im8C1X2cWXeZPKv748N
	p5j7jntT+6HYa9kw154sZtAhPi5hq6INYJ+BlDc6ffh8YYDwuYnpxlasNSf+EOB154OVFopDEoC
	PxFeMa4YNDD8MPfGlv+xmcCgR+AecOSVEen0j6WleblrRcLR7YcXCfyLMd1WkJi8Rv4AfY4/Y1I
	l91dl9E8Qsk/icpj/28JKs5Y/+3QOFt0z7J2kLKA==
X-Google-Smtp-Source: AGHT+IGtcdlPrZiNUMI9Ojm9Xah9Gh/QC2SKCkajdr2PZw7h+E6RY2o53MjGx+TTRI1kxhBykQoULA==
X-Received: by 2002:a05:6122:1783:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-55b1bd94471mr392476e0c.4.1763058017094;
        Thu, 13 Nov 2025 10:20:17 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f35db02sm908871e0c.9.2025.11.13.10.20.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:20:16 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dfc2a9b79aso270630137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 10:20:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcaUphs60y2GrEi7S1Tt/Vr0X4UpH87x5mB1DM7Dsvdi6CmCGSSE9/TawYAJ6UAE9Jnnx8lXCwqzVCCWJzQW3ceQ==@vger.kernel.org
X-Received: by 2002:a05:6102:94b:b0:5db:ef7e:8dc9 with SMTP id
 ada2fe7eead31-5dfc5651308mr396910137.22.1763058016686; Thu, 13 Nov 2025
 10:20:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com> <20251027154615.115759-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251027154615.115759-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 19:20:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
X-Gm-Features: AWmQ_bleUQW3hiCX1KSxLvD3JgUUV41Fe_nAwW--UKlxTY2D9OsiAP6kBwTqJBI
Message-ID: <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
Subject: Re: [PATCH 01/19] clk: renesas: r9a09g047: Add RSCI clocks/resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 27 Oct 2025 at 16:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add RSCI clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -218,6 +224,106 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(5, BIT(13))),
>         DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
>                                                 BUS_MSTOP(5, BIT(13))),
> +       DEF_MOD("rsci0_pclk",                   CLK_PLLCM33_DIV16, 5, 13, 2, 29,
> +                                               BUS_MSTOP(11, BIT(3))),
> +       DEF_MOD("rsci0_tclk",                   CLK_PLLCM33_DIV16, 5, 14, 2, 30,
> +                                               BUS_MSTOP(11, BIT(3))),

According to both the clock list and the clock system diagram, the
parent clock of rsciN_pclk and rsciN_tclk is CLK_PLLCLN_DIV16?

The rest LGTM, so with the above clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

