Return-Path: <linux-renesas-soc+bounces-14084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9632AA54E08
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4AC83A72CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2A2188724;
	Thu,  6 Mar 2025 14:43:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E0CDF71;
	Thu,  6 Mar 2025 14:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272209; cv=none; b=j7aB2QWhtTgMhC8zaLykSGMsRqFwMJGlC+o+kkP2b8MFENk4hc0KJb5sYbzGhuR3zzeKBC7nwDo2vRoZU15kemXs56+h/mW4s/qsvaCH+CMvO3pSmx3l+udPA85aHA1PPTsedY87jAi9cX1S3ELDcaEAeqCOfEN+Vm63LOJd0LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272209; c=relaxed/simple;
	bh=5Z1DMv21sdf0Ne/VuvH+jXpSrvdILbGxdSvlin/45XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl9NG+oLdota9NJ2r16dN1aytLZfsg1ilDQ0f2BHcHDn5diF/ASjbwGLlHKb+tCZBwzWTndc3gOxyUHrTkiCUzgo+9lh7kqZ0gbMZpnsWWaYVnY+pi6f7TgbpCHdH6O7GfcmRWRL1SiM2ynag/mdvSDtKKOtvuGiJvsf1nGupvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523cbce3fecso686387e0c.0;
        Thu, 06 Mar 2025 06:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272206; x=1741877006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUTS2miX6PVep9uVrOr0nGVc9hTpNXk1WYhPSxq21w8=;
        b=JAOrzSO+11dlk6lppgZ84K0uruNNedjx9l01cSEQ3ZVwgJAXZQ34ysDIjCHq9fPT9m
         m4Fpin3RvU7ivqzFoV6/HFNdrnVq5BBfwOZ4U6LAnD0Sp8rre3Tl949aNvYmCwTLn81+
         yrJt1xa0LpXHa0J6xPlytIR8F2kf4oZcVxPcOgEOv9jL76AgDvrrrqvfjxkzmY19YQBt
         2MjHWnwhy+tki3IbvWkxHS/93K8+4qKcUTiYesWyQiPL12Q+zLckBCHAxO4IvQ5i80y8
         ko5PnSy3WDydjjTMgsHF54nF26ZiYQTKVs8XbQgpyjpsdSJzPA0Ab9TSbmHNxMVfl8FA
         64Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV0+sOo5Ba2ZQklVS8Eej9c20JzU6y0yw+M/b8b7IzDj1vqtN8ZXpmbpAKjgJau76iTAmaJOQsjmKHAm/XiCcnXgds=@vger.kernel.org, AJvYcCVQMKAT7lUm470rauYkR0HFfXmQsrN5cGAX3fitn5Z/A0KIvitsbfEIxpVBAWq97N+qlPT/zhq/CaM=@vger.kernel.org, AJvYcCWCJ75FHLmDgqa8lWUnB5RZG+1bbegRvyhBJ+thGm0tJzM+0DfyCuY4DsmsOFqG4R7iH2rXhj8wvKShVxwC@vger.kernel.org
X-Gm-Message-State: AOJu0YwP5ytV2rT5hhtGTnEO/N7EJFyumeCYZ1KWv7pUBcEKWdq/UFyF
	/SPQBZPuCl1XpdkZqtCVFe6oCeFAYa5XQo1iUhSApodRrRc3ZLOnwyGuVTvUTHA=
X-Gm-Gg: ASbGncsHWDo9WEuo7E9Z3YVtdnkjUL+dymyUbGPbm14s2d9iIkfmidWrqKsYoKs9bti
	kcmsn+/v/oNqHuyugNL3l7IUwv+oNDFZFhM5GXYoq4HbKJ8jFQ+fvQtSbuhYifSdIckX7Qjdhvu
	lKnj+j+bAwYBbpf3P+61yRD1FgoTvyALVvN+mU2Ef8cx3ET2Zfu9KGBEoBKs58kBIxOumywk2V0
	TwCoBT9ZVtL8SURdulHiVtxfFd7dR63xYuMU+706TPqJFBTVBmFgI7gXTxRbi3bDqlB+t306Wvp
	c83XYtq3lmG5NGeHIO4sk/gfd8n9bTlYZzGZLnzxy3PAEXElwRVW+wvUrljsqRJrEUVSs9JaBq5
	Jw9PIOsc2ICg=
X-Google-Smtp-Source: AGHT+IEFTut9cn2GDd24OgwSJAM2WTxPxVzI97cvUXieVhoF3qUJxmVF8A3r+JTAuL5TrHKe7hsw3Q==
X-Received: by 2002:a05:6122:2011:b0:520:5e9b:49b3 with SMTP id 71dfb90a1353d-523c614d999mr4981039e0c.3.1741272205794;
        Thu, 06 Mar 2025 06:43:25 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8cbbdb3sm194312e0c.48.2025.03.06.06.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:43:25 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso722134e0c.3;
        Thu, 06 Mar 2025 06:43:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZvbGAiKFWFCoPzmNLuj7SdS97ZLRNKNoNmAXQTlHlXPQfwpt7CC1hKmcQE6dfdgGSWGip/P+Mj+MijdGYXVD1zQQ=@vger.kernel.org, AJvYcCWMPoWpRX5mMGxyCUjMga9HfPdJeN8OHZj/h8MHpXPXZI9Ngwr3hmocTq+nl97DRcd4Nc8TQ8PGThm7dzH4@vger.kernel.org, AJvYcCXYsXzAWAD3en6dJMoZWs9vDdWn+zT1S07C4ObXkHK1HoGHEzxlcys3nGR7N7D7u1hIyOTle72T+vM=@vger.kernel.org
X-Received: by 2002:a05:6102:160d:b0:4c1:869b:7db4 with SMTP id
 ada2fe7eead31-4c2e27b2c9bmr4823796137.9.1741272203957; Thu, 06 Mar 2025
 06:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250228202655.491035-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250228202655.491035-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:43:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHpSiVzTeGKZ6tQiHp=6qdzeS6yc9inhQENwVEcSt=eQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jql0xtkZCUNZvipqcOLg7G1CwUSQ5JTJb7udm5La-IerxFIp1PkKoR1tUY
Message-ID: <CAMuHMdWHpSiVzTeGKZ6tQiHp=6qdzeS6yc9inhQENwVEcSt=eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h-cpg: Add macro for defining
 static dividers
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 28 Feb 2025 at 21:27, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Unlike dynamic dividers, static dividers do not have a monitor bit.
> Introduce the `DEF_CSDIV()` macro for defining static dividers, ensuring
> consistency with existing dynamic divider macros.
>
> Additionally, introduce the `CSDIV_NO_MON` macro to indicate the absence
> of a monitor bit, allowing the monitoring step to be skipped when
> `mon` is set to `CSDIV_NO_MON`.
>
> Note, `rzv2h_cpg_ddiv_clk_register()` will be re-used instead of generic
> `clk_hw_register_divider_table()` for registering satic dividers
> as some of the static dividers require RMW operations.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

I understand this is in preparation of adding GBETH/XSPI clocks, and
thus related to "[PATCH 2/4] clk: renesas: rzv2h-cpg: Add support for
static dividers"[1]?

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -25,6 +25,14 @@ struct ddiv {
>         unsigned int monbit:5;
>  };
>
> +/*
> + * On RZ/V2H(P), the dynamic divider clock supports up to 19 monitor bits,
> + * while on RZ/G3E, it supports up to 16 monitor bits. Use the maximum value
> + * `0x1f` to indicate that monitor bits are not supported for static divider
> + * clocks.
> + */
> +#define CSDIV_NO_MON   (0x1f)
> +
>  #define DDIV_PACK(_offset, _shift, _width, _monbit) \
>         ((struct ddiv){ \
>                 .offset = _offset, \
> @@ -130,6 +138,8 @@ enum clk_types {
>                 .parent = _parent, \
>                 .dtable = _dtable, \
>                 .flag = CLK_DIVIDER_HIWORD_MASK)
> +#define DEF_CSDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
> +       DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable)
>  #define DEF_SMUX(_name, _id, _smux_packed, _parent_names) \
>         DEF_TYPE(_name, _id, CLK_TYPE_SMUX, \
>                  .cfg.smux = _smux_packed, \

However, Biju's patch adds a new composer DEF_SDIV(), and we end up
with not using DEF_CSDIV() at all?

[1] https://lore.kernel.org/20250303110433.76576-3-biju.das.jz@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

