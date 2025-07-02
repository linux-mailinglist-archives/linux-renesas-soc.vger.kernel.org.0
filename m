Return-Path: <linux-renesas-soc+bounces-19039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF19FAF59E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 15:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F257164BB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 13:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD6F275863;
	Wed,  2 Jul 2025 13:46:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA6323F404;
	Wed,  2 Jul 2025 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463999; cv=none; b=RbIR0Zde9QLVUHidwoq6cquY6TqP/5uKgzZx2Fo1fySX4Geevlmnf9rK1w993QblKMCfN/yOcWazMGEu6QuWffxC2Od/IZ4WHvDmBceo7aPsOD+6ICzGvMN1uv13SDb7tKXUFY31HLvAhmn12yrUc0hJUIUg8+ow8UfkueNv93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463999; c=relaxed/simple;
	bh=34bL3484h8f6EhyPZ85OIedeYYI1+zm1EbhL4IbB30I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQDtVSOTIvdVVpf8dwOOhtSc9ugE2pEuXqYmGUHK96YAt9LFpa5t1k6K2qwUg+rNC0M46w0fyozuPnL9l7aJRPJ8/u8by5MZIEor5zyQFybiYgt8RrZmbR2j2J7StS+/E7s4wWCPvZXNkDmO2GjRky65p3l/Sk515wdG+eb3Ics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-884f7d29b85so847805241.1;
        Wed, 02 Jul 2025 06:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463996; x=1752068796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pfd6cAoRrTzkfPu1LB5UQmhr5tgGtIZITSglHPrqe8=;
        b=oaF4SjqBVG+fVcg3BqkW2484UMvITxL8IgXGEppRufeLmdrS7M8DiSqLmajrYFD0hR
         q6Ax+T30GjHT4GJ7nzysaaOvnAEWJ31SRzFmzuVXFn88i8NCerOMQuIsdnRK+vq/qff5
         xI86o/0gXsfkVdtmxbGpPvdosSEBjtt6mGBqLt/W6KquVKecmPJ7sLmRT/nDYvYlXdHv
         WAeSIXwTPXT5vGgkXIcy7R0IRl9PQ3A5wbjfeRac3uLdSTruf+39uwZLX/2EdVJeAYiO
         FJtwKT+HbltRmFrRQ99EdbjykLQzbDsgFyxgKFeCKfcCUheTomDiY8SgENasMaGnMHjj
         s/KA==
X-Forwarded-Encrypted: i=1; AJvYcCVGzuYD32WWHOYVjpnQHjmnqDQVQUVaAUZKhq/KdijGUQD6SB4Igxp9iST+9NJTmoG+ZMSGSsQnbDCc@vger.kernel.org, AJvYcCWjb+VYZKN9XVy8/fXrdcoD5XGecHzgpHLU7RrBjhkjkenNwtx5R+fW/Grtj077vJsjFcbCR6Hyt7jqEXCZ@vger.kernel.org, AJvYcCXa/rKvWKFesbqAbInrKo4IiG/A1AsWnJc9pEPVQ2fqQpsDMaGFV6GU6a/hwihcl3euwXSyBF98PsSx@vger.kernel.org, AJvYcCXqmzh0BOT4udXhsoyR5q/2YbAwiCeW/XrYaK+/M2o6a8CUNyJy3a5IjDVJgOAjsEFsD9Iep4JT73yWv6C4n83j2OE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUJ/v9TWkwfLPKoswLCvoe+gZ7mjxtXoY75ZkWCyed5ONRnP+w
	p/O/dlikewXxzahzV4Wbi25V3EXS7Br6vtZqS+Bwde0OVXyEooKSpMS5/90EDlve
X-Gm-Gg: ASbGnctvt0jbfc20g5/abC6ArGiw8ICNDgcWjONLYsEO40HuKWb/lZL4T/8j/eRxGEb
	xih52/Vf4pRBTlL1EJM/d+6GSIPz6P0XojnDiD4t1fZaUT0FMEd9Cakf8AGDJx1jmbgUPkiqKup
	EaqrpdaBiCRiq5hqmkoo6Q23b7FWR8+iuUw4zcLxTj6wRDuZ8ngYxX/BsnAOhu83KX7UMJ4PChD
	/rvA+M/90M+KMXZrkW74ZLddTzj+rErQglACz8HnyR0/EeBR14dcHZ5jQzLh6dRZjRq2zu8kc9j
	aliGX1kVPTu8ejXyXxMAK5nnoxA1FX/IqVhwV00U5l+Hu8dx0RnlguB0auQGA6ivxKOKYfj7HAZ
	UTOnDy6MdRnsAbxNwx/dDLvCEz4Xy
X-Google-Smtp-Source: AGHT+IEohexNHyUpRphuhFKRsi616M5d22xtSQItSZvEfraV7LENT1M+SI8dv/JcrrMEtAc56i7CrQ==
X-Received: by 2002:a05:6102:f9a:b0:4e6:fb90:1e21 with SMTP id ada2fe7eead31-4f161074096mr1445161137.2.1751463995870;
        Wed, 02 Jul 2025 06:46:35 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4cc5f0e6sm1866801137.30.2025.07.02.06.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:46:34 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-531466622beso2161714e0c.1;
        Wed, 02 Jul 2025 06:46:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+yGUJ4BI/JaJM/v+8KVFjysXR3VviN+ffpBrOrVQNVQeCnKAOANm2PvupyO9YSzNWsP1vL721GzfT@vger.kernel.org, AJvYcCUgTDrHVeI9bMlcT1ALeRAuaReGdAvkfFw8nRaO0BZZHSA/HspWAeM/L2SsTiidG2oUg6NYMqD9/6ucHEDa@vger.kernel.org, AJvYcCUgqWY1Ca/su4OErLMqJCb7b+ziUxVsNxzwX2afxNGk3+4QC94M/xOPU4PpXWd0SOwpBgqcBhODrW7g@vger.kernel.org, AJvYcCXYbEdHioFQojHEZaG/VNuqyvqsvyCjqxpLUCnaf9RptboDgz6zqx72cJEFg8HO+UbkbdZ8RvRClIH8w4FHYf0sa44=@vger.kernel.org
X-Received: by 2002:a05:6122:3a18:b0:529:f50:7904 with SMTP id
 71dfb90a1353d-53458522f9amr2051964e0c.9.1751463994163; Wed, 02 Jul 2025
 06:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250625141705.151383-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250625141705.151383-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 15:46:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnDhhJ+G5GvMZw+7WGBdiMfWHPXSwkwOqnK5XtKdyS1A@mail.gmail.com>
X-Gm-Features: Ac12FXwkY5d7-POGtnUoMsKJ0PzgjY7e_snj97RCbehrlRkDnq1wpHABoeePNjc
Message-ID: <CAMuHMdWnDhhJ+G5GvMZw+7WGBdiMfWHPXSwkwOqnK5XtKdyS1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a09g077-cpg: Add RIIC module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 25 Jun 2025 at 16:17, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RIIC module clocks for: iic0, iic1, and iic2.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> @@ -154,6 +154,9 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>
>  static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
>         DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
> +       DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
> +       DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
> +       DEF_MOD("iic2", 501, R9A09G077_CLK_PCLKL),

Shouldn't that be 601?
(MSTPCRA => xx, MSTPCRB => 1xx, MSTPCRG => 6xx)
If you agree, I can fix that while applying...

>         DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
>         DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
>  };

The rest LGTM, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

