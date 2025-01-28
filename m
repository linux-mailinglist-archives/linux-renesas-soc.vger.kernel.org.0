Return-Path: <linux-renesas-soc+bounces-12624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F6A20856
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 907A37A1977
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF33D19AD90;
	Tue, 28 Jan 2025 10:16:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE7D51C;
	Tue, 28 Jan 2025 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738059401; cv=none; b=ImMQMdCtV/WlaZoCjbKot6qKG4JlmDaymZ8td1Y1ZlcMpN3iHann6io5MASSThMdcQt0/FN0sUjvCLNWZAA2qH94bwFtxrxpNVZOQX+r7Ehp65JJyVTE5TvTNkGpuLzLQG9y1u2GgNHoyPmd+ix681ABqqxgpxhWtZZRQ3ps+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738059401; c=relaxed/simple;
	bh=Ug4R1wAZOcal9g8ymBs7tSGa47W0ZPEJzahioUobgOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E18ocie76U7RqJHZBPGeXlUDGzrl8zKa4/yXaZKqfjMDryZ5dRNXjb+a4kWgeRx7SCy6JKXFF4UxttD98AwkecLQFE3HqR4PoUyARdbJrnx3Sc24KAvllRuJQZ+Fv+CRrmSS7//xiKyJwUoyLNyygJtR50zl7iBxe4SGcnQ4GX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afe6a8d2e1so3024509137.1;
        Tue, 28 Jan 2025 02:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738059398; x=1738664198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmiyNeVSTSXH4G/zBzYO5og1V1z8cST0/iTMEIo4EZ8=;
        b=A/yCHCsiWkmiLJwAuJxKtxq9qmDUlXGbwOktB3EXSyNMl4AHlUPqVtNZYDrLbF/p/x
         DmxOy9GxiG4usXvuX1jDlsqMBG5wVe3/FXBBuF8lq0sttrkpQ6MjZQPXQOgy7dXKDvlL
         N50pZQfJUdUvFzoXd0Znerx/Kw1Gsk93s/PuqF1BMXEmZcDLKoWD1vZ74+Yl6/yFOsI2
         iN/sLDiMdBoZ/oiGCt9J9SAEc8+PV9Ci3BUBRVWcabYPfxY0Ikls/aPPs9x56eeeVlVz
         /itfiMmUr4u7qw0OMPDX4XjB6+FH5dY4KynHLVCTrOoxS91gNaNJs3+dbqDZE6GvzRQ1
         8JQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9RHhL7Z9Co+EJ5FWtzOBFHhXk/gyssXOFCf+6P4ujIWFTrkyvFH3au7f4hbAvxxaOtiTKjdNINxU=@vger.kernel.org, AJvYcCV2oCIgEKTUpQbzkHVWEG9HB4VO92cSbPjzyvBQ6xmPAmQAyFCDAxZk66hN8Xa/+iC7OwmEGnBT2TywDMZlD5gjapU=@vger.kernel.org, AJvYcCWBnTU2kCwEKtsPlr0/5WyTsTk1uG7L6iHwTFAyrOOQPzR9h4yt6IRE+TdBicccaNLA9xc3P/Pc@vger.kernel.org, AJvYcCWD85uwze/gI+GvLDFbja26gqXJ13dVJxROSU2bLwDVjsjCHPArUJMkRNaBY/qRDdOKTcoz7MIlGN4yWI5K@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8ooq0rn3Y26eZYa+29SOyDVOXN3px+tm1SdoBGP4/b3zcA79
	lyZhXmLaSwbh5B4+7y7pLsUF7eq78tya6qyBUgLQDV6LCqhBiN805U/CPdUm
X-Gm-Gg: ASbGnctfhiOK2mCei7TxzT9wg3yk/JhyfcXr3WiCH9f4+b8InFW8cMxjteawngMy8gy
	vi/EdSk5TXJoe1mloYqTXergroLLNsjCfZ2+w0QTQTTmRygsheMMNJJGwxa2h/XDEjXFyAAYKEL
	XUMEiZkbgsAdbR/W9k3P75Qw949eIbIandNdDRTVNyYcDKNQgNU+jkhh4g6T6bTHgc0Yytjs4jP
	RQkdT7mpRwPaNFD/OvnkU5B5iHgma8z6NdjHn4iBaqxWXpXBhDKSLU4bLPWWYWWNDBTYpys7q7t
	Nw1D79ibXwgYcHwMx6SCmxrm23Cd5ZfPYDRvrw3ApM5lzM2EiiJsyg==
X-Google-Smtp-Source: AGHT+IGQEbLPxohBgEsiSo6efn30ExtHyksy1Ks4gQVr9w53M7APDOZuyghIokoskDu0Cwkg/6b2eQ==
X-Received: by 2002:a67:ec8a:0:b0:4b2:bcae:a721 with SMTP id ada2fe7eead31-4b752da331amr1977366137.11.1738059398347;
        Tue, 28 Jan 2025 02:16:38 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9964320sm2425346241.0.2025.01.28.02.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 02:16:38 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4afe2f6cecdso3157963137.1;
        Tue, 28 Jan 2025 02:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1jxvUnTMzq8aXexM+VhaZkSrBcw2/b2NZSa85ta+jLG6QV5qficxkJZMWcUsPr8dnExMVHjGXMK97wVu0@vger.kernel.org, AJvYcCVuaC8/wZ9mIEe2LJg9LmnOqXQoGkxcwisfbMlYwWiuUI9MromTCaYIMomepxO+DkFy24XghMyEeOc=@vger.kernel.org, AJvYcCWlVM8Uu/F1ruKdBFW7gDVaQquSU8EapYzrt90WbCGBucM9R/0NviHuMc19DpGjwjtuIqJPWh1R@vger.kernel.org, AJvYcCXD0MZe0Cyjuufbk1FpXv3ygbj+bhUoR1sM4/3+n92K1luoUFIP7wez0ekXP8EdTIBaWxbM4CuGtCfacss59jPn5+M=@vger.kernel.org
X-Received: by 2002:a67:ff07:0:b0:4b6:8cf4:9a23 with SMTP id
 ada2fe7eead31-4b7529c704bmr1796968137.0.1738059397863; Tue, 28 Jan 2025
 02:16:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127173159.34572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250127173159.34572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 11:16:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG26aZk342M83y3EObyYSYZAGsHNBCp-EajAbx+o-k1A@mail.gmail.com>
X-Gm-Features: AWEUYZmqNZERbDMPdz9vHlSlX9PexAp1QSK3wJD9VrWtptZMVp6Jxgw9bJOINIw
Message-ID: <CAMuHMdVG26aZk342M83y3EObyYSYZAGsHNBCp-EajAbx+o-k1A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a07g043: Fix HP clock source for
 RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Jan 2025 at 18:32, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> According to the Rev.1.20 hardware manual for the RZ/Five SoC, the clock
> source for HP is derived from PLL6 divided by 2. This patch corrects the
> implementation by configuring HP as a fixed clock source instead of a MUX.
>
> The `CPG_PL6_ETH_SSEL` register, which is available on the RZ/G2UL SoC, is
> not present on the RZ/Five SoC, necessitating this change.
>
> Fixes: 95d48d270305ad2c ("clk: renesas: r9a07g043: Add support for RZ/Five SoC")
> Cc: stable@vger.kernel.org
> Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Fixed build warning for non-ARM64 arch, sel_pll6_2 defined but not used.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

