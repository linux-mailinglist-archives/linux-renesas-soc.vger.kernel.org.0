Return-Path: <linux-renesas-soc+bounces-22487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65747BACE35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 14:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172901726F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070012FC876;
	Tue, 30 Sep 2025 12:40:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA08E2FC00C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759236004; cv=none; b=AXd9nHBpFLT43yWaiZx0nW0fUOgfuM17136jA0zTgsLA49qdaQ1bQ2z0hNs2017wkCIzj6OHvO73J1sxuPO+viFOMp96GrSA8l9opVP5XmxvASM/ckVMYf83qf1xC34yycubh6Uklv2ETqBCl/2F8jVj9damkuqrlEaBD0uU4X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759236004; c=relaxed/simple;
	bh=GXQB96bE0zEd8993DIrSt2OVhCsFyOqLR7Jg32C8ae8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0bhy3pjBN1kHbP9ghO/6nKvh8yijtn+ETmqEtrCJ59iV/ojsYeCvih5jnHiBEX1dJIYO7WtRD8VkyqthvZpZmiX0vEtcDowP9e8IejFusYId8quoj/gtTCuOpoUcU45I3Ce4VDMKdvmpBMfSTWBNvc8AXkCQ4S/nQmtNTvAaVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8e286a1afc6so3441300241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 05:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759236001; x=1759840801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfS1Jf1f/1r9RWyL6t03hbkwSL2mPImc6nfWL2Sk4VM=;
        b=BYAotTAmUvLTZ+GfHk+ROd5LUPpx9KJQ9QrvwAi8WlsoYfugsw6/YZcW/LiAQrL0xg
         zE4QNcrOW5OSYoVwuKMqXAkGvn9B500eu1u450ObHLXhvKoFQzVtoMu+KIBv69PTMQZJ
         afSEgj47nqL3+AonZ1IgQv52xal/4QI69jwtfsIrB3OVouZ0Qtdjc31EhkOsMsWHGA+N
         Z5QKhik82RSur4LGX/qSbNgNzjD81Xi7Lmsj5pSBh0Cvx2fyWQeY4Rgqo/v92QFCS5NX
         Fl3Gisj2Flks25iwR8JaTY1zriiO6QFu9SGP1euHeycuaCVYoh/2EJpcSxpBbLkImSRJ
         BDIA==
X-Forwarded-Encrypted: i=1; AJvYcCXSkHe5+X226ThXexFmd6LPvcF51OwvIH3LXt5oloPmD18uQ8nkPqP9pENt7TLUyGrHTnwVjjLtBzN4GH41Lef1/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQjlgiRYoGlm5wSjOa447fEzX5W9iOySJktQqVhEg1xp3gP10
	SSadWG6Th8e67wIELRqE0w+0YOvEtY0/yITA6cQgP/cfkkdBEGcanOhMLbySirDP
X-Gm-Gg: ASbGnct6dVUVAg1/adSh2m2UxA+ez5agjRG/FC/Es0wTr0aVqDYvW+y4Ao6+O4LVTx4
	5740ew/3tKrhKUc7sg8ZOobvEJtWlccSPwosM5cX57rkC6mVW3/L27e7U4k5UqHOTdLphF3eVXa
	VAwNN07dMB2Lllu9CvxfN4GvGrAaSiQ+6PvyNPoP/gJg22DfzbOQ61gaWAvwdOM3gmgbRLvvWO7
	NzO65OpqCIUuhKkYnYuEcStzXL96kCp0aEB8yjm4LOv0IQuMej8Uz/Ig5/zFJ12EAcvCFWlf1Pe
	lPzu3OZDlZdwlz5FD7eLesUfaeIqmlF4gUQL+r4rAa78ldq2/cjTrFwPH0RL5lKINj/HOhOniMv
	tuunao/T6XvNEA2o4IW/Cimixxv9p3dSTy/L7fcdgjIomBkW2cMMGj4l4Ze93T6OMNoD3FzrzBz
	NgIlxmU7iH85y47Qsp1Vg=
X-Google-Smtp-Source: AGHT+IEEIFfDcfHxCndko7u8hZXhbDrVcEWDCGw1fN+iRSjInlwcFpqKv/zkdX9Ihxab5MBoNkozdg==
X-Received: by 2002:a67:ec59:0:b0:584:7aa3:a329 with SMTP id ada2fe7eead31-5ceceea84d8mr1423393137.4.1759236001253;
        Tue, 30 Sep 2025 05:40:01 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54de11f1139sm1284306e0c.27.2025.09.30.05.40.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 05:40:00 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5565a83f796so4783213137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 05:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSVOMWYUeqClY+hj2MPXyHy+mkhGxiw0bQStGpGhGL7DkBm+E8Ll8tJV2yiOhGx4zArwx60JgrtVL/xmG37d4++Q==@vger.kernel.org
X-Received: by 2002:a05:6102:33cb:b0:59f:54cb:205a with SMTP id
 ada2fe7eead31-5ced8765283mr1513391137.13.1759235999948; Tue, 30 Sep 2025
 05:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922162113.113223-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922162113.113223-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 14:39:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRgPSG+f0DyR0pDvBf2zDWLKVUWnQTfVohskNKqHD40w@mail.gmail.com>
X-Gm-Features: AS18NWAWfUchS0KY7_kZj5i7BhpV5L3ORtcNpOjrQEl1tzKxw1bTwgFJye0pobw
Message-ID: <CAMuHMdXRgPSG+f0DyR0pDvBf2zDWLKVUWnQTfVohskNKqHD40w@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Sept 2025 at 18:21, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> On R-Car V4H, the PCIEC controller DBI read would generate an SError
> in case the controller reset is released by writing SRSTCLR register
> first, and immediately afterward reading some PCIEC controller DBI
> register. The issue triggers in rcar_gen4_pcie_additional_common_init()
> on dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW), which on V4H is the first
> read after reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc).
>
> The reset controller which contains the SRSTCLR register and the PCIEC
> controller which contains the DBI register share the same root access
> bus, but the bus then splits into separate segments before reaching
> each IP. Even if the SRSTCLR write access was posted on the bus before
> the DBI read access, it seems the DBI read access may reach the PCIEC
> controller before the SRSTCLR write completed, and trigger the SError.
>
> Mitigate the issue by adding a dummy SRSTCLR read, which assures the
> SRSTCLR write completes fully and is latched into the reset controller,
> before the PCIEC DBI read access can occur.
>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -676,53 +676,47 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>
>  #define rcdev_to_priv(x)       container_of(x, struct cpg_mssr_priv, rcdev)
>
> -static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> -                         unsigned long id)
> +static int cpg_mssr_reset_operate(struct reset_controller_dev *rcdev,
> +                                 char *func, bool set, unsigned long id)

const char *

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
and queuing tentatively in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

