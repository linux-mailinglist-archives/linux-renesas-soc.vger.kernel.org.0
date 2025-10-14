Return-Path: <linux-renesas-soc+bounces-22992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A95DBD80D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 10:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94D853BE3E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 08:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2353430F54D;
	Tue, 14 Oct 2025 08:01:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D96237713
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428881; cv=none; b=gGcYRhM2DeyJlQ59MZwJJ3xQFh5Z3Q+B5fX22WN/OBfmKUihHjfhy8grAIqLjBnlWE3SyZgA1SK1qmoAfobLw1s4UCo/tmEypOI2Rff8VxX9ORnI47QoVT4SzgeN6YSxs6zF3HWf8p3EhBZ9o+jdWTsv1GbFV7KZiZ5MGIqpZ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428881; c=relaxed/simple;
	bh=NB3yDfsRy4c2nsKTYr/2W55KabUQwS/trTEX9f41G+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZ8rwqGH8ctiMwzKFl6zVcwW2hmhe6CQPy8fQQPJEBaMvFVso3rduLITlgovZSg2aa5EnsKik/zf2rNF9+i/XYsKTziTfNV7gqI/rkfcDAL2EF2lai8JgADwP6GIdLsfqyC8jhK0d5a+T51phB7gmIK623qO8P1zIz9YIL4q7W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8e3eaa30c71so3567048241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 01:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760428878; x=1761033678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9A6h8OlO+sRs7kmpWSCpGtEIoodYXxSOMIPCV9kNdY=;
        b=uj8yCTrAEtd5zDfb8Qgon7UKJKg77n5kw2LG2w0RAxoAIcKpakVoptcLp9dBoaaFaa
         znZE0Cw2TWriWR45wZB6OaGgpuXIjPjrgNWDRn6D9wpwkIkPnzfM0qdK5QS1c7gpDmfQ
         frmB6MxaHZ2rkHPs+N9LFsxEkTE/HyBkqyE1HeDgg34LbSx+x3h3xavgM4pUAsS9Fq+y
         KgviKO9eHPonCjCnfUmos96yMOR1taxDBej/VeHKTG23KRRY/jiZtQYKA3LTFur8ya19
         a+Hkg5PUfu0mPCTGWQp8hYnHg5sYecob0hHLZXncDk6E+V+ZNKBnQs4/9+47AB0/QKqk
         aiCg==
X-Forwarded-Encrypted: i=1; AJvYcCWCD3Xf9DyPidDKMTsxzEWL1zDEcrx47twbNm//uHFK7GqBHdOvOyKFOHd0FtYnNW48+JoosDZmpt/v62BukdOwJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjzOrAiUH93/D1TzW6XeFtXAJnIzXnl4cdzmpu8TWSF7GrhliA
	Uaz1+WpsIX/ranK72ixtzc0yf2lrQFrFhzlT9o/RzdvrIzPVT4/u4ObFpIBssngO
X-Gm-Gg: ASbGncveWdkaI0EbJd8IRVxxJ55BcpafGWw02MPrqwiHnydGrwdqRzTDUIrvV3p/q8L
	7yEc/f+PNuN5o6CtqaNPL5ETJWPLwu7ZzGuillHP3wML5kDdZyIEIeZIV1CaBA1p4RJiSxlw3Zw
	Vrjn8sPN4+46jyLUGYziDUKtZYi9ulagPh5LVvSw8AHvLnuCz9U7VF5urDC0sPyYkCvEUAytajS
	4X3bBv+8rV93B6OJsO+6U8ktss1UmOuSfTvh+Oy/ryWLKWdAxRdU5lAsTnLL7Hk62IQWiBZt6m0
	F46c8l9bVS/xGQ01DRIDqNHJmR9Qt7jhzXb8w81wVmDwi4TVT2C71EVpA92MUj7Or2ms7GyARBD
	s3sbQ4kLP/pFLkD9lCbHkIMNUW7Sl0OfNAUk1BQnyJYAUKzXj0qisEOkbxcZadfrdT+Tg7QR0w/
	eHm0uTTTtTmBI4qBjQWs1rQZbG
X-Google-Smtp-Source: AGHT+IEYdZqLe0+h/BLdgOXHPM85jw+oGtWdS/g+yYMehbl/bTXBq9B2+cL4QvmgOLxqurs0aMvBpg==
X-Received: by 2002:a05:6102:ccc:b0:5d5:f79b:e93b with SMTP id ada2fe7eead31-5d5f79be98dmr6953330137.32.1760428878083;
        Tue, 14 Oct 2025 01:01:18 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc927cf3sm4213800137.15.2025.10.14.01.01.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:01:17 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5b62ab6687dso5018451137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 01:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVnBWSf5SxiSe9RfXQd72AFu/f4c4kAVLm74nA2+bpiw6FsACARWUHvRWZYIISYzXST9GpxIrT/T+nE14a1RfjNQ==@vger.kernel.org
X-Received: by 2002:a05:6102:dd0:b0:59d:ad3:e1dc with SMTP id
 ada2fe7eead31-5d5e2202cfdmr9463488137.8.1760428877073; Tue, 14 Oct 2025
 01:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
In-Reply-To: <20251010-rzv2h_isp_clk-v2-1-2c8853a9af7c@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 10:01:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-1fktGHiNGxpTVqxigDqNenV_2oxsdm1MN++ix1_wSg@mail.gmail.com>
X-Gm-Features: AS18NWAbvI2-hyhwdeTKYm-p_fgx_uUVgfTeoO9pCR-j5hiEYG51qrZuvEO8XNU
Message-ID: <CAMuHMdX-1fktGHiNGxpTVqxigDqNenV_2oxsdm1MN++ix1_wSg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for ISP
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	fabrizio.castro.jz@renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Oct 2025 at 11:43, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Add entries detailing the clocks and resets for the ISP in the
> RZ/V2H(P) SoC.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
> - Dropped the dt-bindings patches since the macros weren't needed
> - Squashed the separate patches adding clock and reset definitions
>   into a single patch
> - Link to v1: https://lore.kernel.org/r/20250506121252.557170-1-dan.scally@ideasonboard.com

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -377,6 +379,14 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
>                                                 BUS_MSTOP(3, BIT(4))),
> +       DEF_MOD("isp_0_reg_aclk",               CLK_PLLDTY_ACPU_DIV2, 14, 2, 7, 2,
> +                                               BUS_MSTOP(9, BIT(8))),
> +       DEF_MOD("isp_0_pclk",                   CLK_PLLDTY_DIV16, 14, 3, 7, 3,
> +                                               BUS_MSTOP(9, BIT(8))),
> +       DEF_MOD("isp_0_vin_aclk",               CLK_PLLDTY_ACPU_DIV2, 14, 4, 7, 4,
> +                                               BUS_MSTOP(9, BIT(9))),
> +       DEF_MOD("isp_0_isp_sclk",               CLK_PLLVDO_ISP, 14, 5, 7, 5,
> +                                               BUS_MSTOP(9, BIT(9))),

Moving up, too.

>  };
>
>  static const struct rzv2h_reset r9a09g057_resets[] __initconst = {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

