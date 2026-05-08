Return-Path: <linux-renesas-soc+bounces-32277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGTJNmO2/Wm4hwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 12:09:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802D4F4CA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 12:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE92730B7724
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 10:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067ED389E1A;
	Fri,  8 May 2026 10:02:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6AC33262F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234538; cv=none; b=l/L229VvrDK5fUOfwjFSEuBoYogUybcXmixsn6vivsl0utn03Vsu19fvu6srynm/eX3P6mM5mnsRU9ztfRWyXp2FvluAXEDBxRhJ6v7N2o0TYdh8hXcZJT2Gkux3wJytfwjumUI7bfZ6is1Ch4IB4vjG29I0HN+oL/pTpyvJIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234538; c=relaxed/simple;
	bh=xvmoJSJ1vW711/dM2ob3bppJLYip6cz95f5WmwJa1pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8kqgLPlJxXSSkNlIlcVKIPzfr3j8oONAA0qDOlodgC144XcgKC8vFr+4Tuos00BF/eWLbeTJgQnWIXrR7lfOtnv8eIg7Pnl/DPQt0y6S6h8Rci8iWGDp13KKJeONZKpiwFbwvqsr+WSHD5n8dDhLwqZvbEybIfHhX10EKMDYVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so516582241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 03:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234532; x=1778839332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcl8IC5svK1OXmJv9TpTHeh/oYwzMHlG3MjWZjSCGcQ=;
        b=Ay9iWHiAHJCeqagAylW1gNl8AIRQquK7ADww028dY7qfbSwOKyP00JjdVBE8lLnlQ1
         zmh+OR/fcRqCVPgUU5r2xIUU1q+szDlLR36lZCNhn412DhhtEfHu8xIQqx2wKDVthsMJ
         fMeraxJaYmVqyHKkWPyvVBjzLC76hrksnEfIwE7fulStF08iZktY72Dipue30rVdj2h5
         /UvmhROCke15lVUN9Asn9SDeJozkjIsxDBMI15J5yviyLqfq9jy5qgEiXcRVDJG7QFSH
         N8DwRPH0pedNmYgc8/ByDKqTa5+QSV8TRjs1lRzUkgxuGEAVS/STETr5YKzolv7sSLWY
         xeeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JVgIirTX/NYev2iBhQtrhcsE+5u5prjhBhIo53BeyfPWXF2CkMySM21BqDE4Xrk+pKQCQgueY/6XOynqWYJlzxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1E4zdvN4YGSwp++GCLM11/IAb0x/TeV//w217yIQxbsBveHU
	ajkCjCcdWCWFAWnCnz2EFgP974MD1Zq5BIVzjemx9TKNviZ7Xs7/LNQg+ntE0L24Heg=
X-Gm-Gg: Acq92OEjxg5/8ph+WW3YLFvO8TbLDJ6oV4YfomzX9IM0rd+zJ7SE/EPjsJZsElJJ9B3
	1hjhl96l4QQyzDqatQrmedDJAp+wecOjiBuHx7JRBdpo7wbEdWr2CuJcGpOm50gdDhusNGjO5bd
	vRIFZ1fsKcs2rZunEZASautEyMwLDaPcae+NpMK2fUgWOguWt4xQtWFgwi6s9mk97Ryi2KvXA08
	Se1p9MCAxbPme/SF3eVh2hSI0S9k1wRFsDhR56QRb0K+alaoY1oAc8h08z1tP4Qsot6Tzdb7Itc
	KfTOYwvrYLSm1uy/3ri254st0NbLe5gvq6BKXROyLk40/HeztcQHDNuIkK8qVjH0vrsX9yQGOik
	Vkv5z1zkyb//5hikIHDKBtqji0CFlJTJn3fIjn4gdIBu0zrdQrFWTYhR72x+6vqFNUJiI37IdtB
	oV9z9rd6bG5YEKrwRIEZtu/CL6mtiqYaYcPfrs+aPWjzoJFSEeUOfzSYwHzTMhqFe9
X-Received: by 2002:a05:6122:45a1:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-575595a40e0mr5969451e0c.7.1778234522819;
        Fri, 08 May 2026 03:02:02 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21a10d2dsm574817241.5.2026.05.08.03.01.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:02:00 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5637886c92aso879692e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 03:01:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/5lgcFBUSn3oHSUhrYY2QT1o/RQ+KHROWkKojK9WMFD5orPdEUEDdjZTAf48B0IYIpDy5+6OxqbyLrFmxov7c/dg==@vger.kernel.org
X-Received: by 2002:a05:6123:a8:b0:56e:e7b5:17d3 with SMTP id
 71dfb90a1353d-575595d06b6mr6630766e0c.8.1778234516982; Fri, 08 May 2026
 03:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com> <20260402163126.12135-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402163126.12135-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 12:01:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyf1HPqAArdy8nsOuW3qxExOEAeO72221A0w1mCtXrVg@mail.gmail.com>
X-Gm-Features: AVHnY4LLjavjc6b4hOixot-jTxjcDtq_QAYXdyxTt9JPymFC7dc2OhGNdgp1wPY
Message-ID: <CAMuHMdUyf1HPqAArdy8nsOuW3qxExOEAeO72221A0w1mCtXrVg@mail.gmail.com>
Subject: Re: [PATCh v3 2/8] clk: renesas: r9a09g047: Add audio clock and reset support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4802D4F4CA2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-32277-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi John,

On Thu, 2 Apr 2026 at 18:32, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for audio-related modules on the RZ/G3E SoC.
>
> Target modules are:
>  - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
>  - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
>    CTU/MIX ch0-ch1
>  - ADMAC (Audio DMA Controller)
>  - ADG (Audio Clock Generator) with divider input clocks and audio
>    master clock outputs
>
> While at it, reorder plldty_div16 to group it with other plldty fixed
> dividers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -22,6 +22,9 @@ enum clk_ids {
>         CLK_AUDIO_EXTAL,
>         CLK_RTXIN,
>         CLK_QEXTAL,
> +       CLK_AUDIO_CLKA,

Please drop this, as the AUDIO_CLKA clock is provided by the
existing CLK_AUDIO_EXTAL pin.

> +       CLK_AUDIO_CLKB,
> +       CLK_AUDIO_CLKC,
>
>         /* PLL Clocks */
>         CLK_PLLCM33,
> @@ -34,6 +37,8 @@ enum clk_ids {
>         /* Internal Core Clocks */
>         CLK_PLLCM33_DIV3,
>         CLK_PLLCM33_DIV4,
> +       CLK_PLLCM33_DIV4_DDIV2,
> +       CLK_PLLCM33_DIV4_DDIV2_DIV2,
>         CLK_PLLCM33_DIV5,
>         CLK_PLLCM33_DIV16,
>         CLK_PLLCM33_GEAR,
> @@ -41,15 +46,19 @@ enum clk_ids {
>         CLK_SMUX2_XSPI_CLK1,
>         CLK_PLLCM33_XSPI,
>         CLK_PLLCLN_DIV2,
> +       CLK_PLLCLN_DIV4,
>         CLK_PLLCLN_DIV8,
>         CLK_PLLCLN_DIV16,
>         CLK_PLLCLN_DIV20,
> +       CLK_PLLCLN_DIV32,
>         CLK_PLLCLN_DIV64,
>         CLK_PLLCLN_DIV256,
>         CLK_PLLCLN_DIV1024,
>         CLK_PLLDTY_ACPU,
>         CLK_PLLDTY_ACPU_DIV2,
>         CLK_PLLDTY_ACPU_DIV4,
> +       CLK_PLLDTY_DIV2,
> +       CLK_PLLDTY_DIV4,
>         CLK_PLLDTY_DIV8,
>         CLK_PLLDTY_RCPU,
>         CLK_PLLDTY_RCPU_DIV4,
> @@ -64,6 +73,7 @@ enum clk_ids {
>         CLK_PLLDTY_DIV16,
>         CLK_PLLVDO_CRU0,
>         CLK_PLLVDO_GPU,
> +       CLK_CDIV5_MAINOSC,
>
>         /* Module Clocks */
>         MOD_CLK_BASE,
> @@ -120,6 +130,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
>         DEF_INPUT("rtxin", CLK_RTXIN),
>         DEF_INPUT("qextal", CLK_QEXTAL),
> +       DEF_INPUT("audio_clka", CLK_AUDIO_CLKA),

Please drop this.

> +       DEF_INPUT("audio_clkb", CLK_AUDIO_CLKB),
> +       DEF_INPUT("audio_clkc", CLK_AUDIO_CLKC),
>
>         /* PLL Clocks */
>         DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
> @@ -135,6 +148,11 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
>         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
>
> +       DEF_DDIV(".pllcm33_div4_ddiv2", CLK_PLLCM33_DIV4_DDIV2, CLK_PLLCM33_DIV4,
> +                CDDIV0_DIVCTL1, dtable_2_64),
> +       DEF_FIXED(".pllcm33_div4_ddiv2_div2", CLK_PLLCM33_DIV4_DDIV2_DIV2,
> +                 CLK_PLLCM33_DIV4_DDIV2, 1, 2),

These two clocks are unused?

> +
>         DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
>
>         DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
> @@ -142,9 +160,11 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
>                   dtable_2_16),
>         DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
> +       DEF_FIXED(".pllcln_div4", CLK_PLLCLN_DIV4, CLK_PLLCLN, 1, 4),
>         DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
>         DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
>         DEF_FIXED(".pllcln_div20", CLK_PLLCLN_DIV20, CLK_PLLCLN, 1, 20),
> +       DEF_FIXED(".pllcln_div32", CLK_PLLCLN_DIV32, CLK_PLLCLN, 1, 32),

This clock is unused?

>         DEF_FIXED(".pllcln_div64", CLK_PLLCLN_DIV64, CLK_PLLCLN, 1, 64),
>         DEF_FIXED(".pllcln_div256", CLK_PLLCLN_DIV256, CLK_PLLCLN, 1, 256),
>         DEF_FIXED(".pllcln_div1024", CLK_PLLCLN_DIV1024, CLK_PLLCLN, 1, 1024),
> @@ -152,7 +172,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
>         DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
>         DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
> +       DEF_FIXED(".plldty_div2", CLK_PLLDTY_DIV2, CLK_PLLDTY, 1, 2),
> +       DEF_FIXED(".plldty_div4", CLK_PLLDTY_DIV4, CLK_PLLDTY, 1, 4),

These two clocks are unused?

>         DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
> +       DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
>
>         DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
>         DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
> @@ -164,9 +187,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
>         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
>         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
> -       DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
>         DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
>         DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
> +       DEF_FIXED(".cdiv5_mainosc", CLK_CDIV5_MAINOSC, CLK_QEXTAL, 1, 5),

This clock is unused?

>
>         DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
>         DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
> @@ -460,6 +483,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD("ssif_clk",                     CLK_PLLCLN_DIV8, 15, 5, 7, 21,

ssif_0_clk?

> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("scu_clk",                      CLK_PLLCLN_DIV8, 15, 6, 7, 22,

scu_0_clk?

> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("scu_clkx2",                    CLK_PLLCLN_DIV4, 15, 7, 7, 23,

scu_0_clkx2?

> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("admac_clk",                    CLK_PLLCLN_DIV8, 15, 8, 7, 24,

dmacpp_0_clk?

> +                                               BUS_MSTOP(2, BIT(5))),
> +       DEF_MOD("adg_clks1",                    CLK_PLLCLN_DIV8, 15, 9, 7, 25,

adg_0_clks1?

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_clk_200m",                 CLK_PLLCLN_DIV8, 15, 10, 7, 26,

adg_0_clk_195m?

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clka",               CLK_AUDIO_CLKA, 15, 11, 7, 27,

adg_0_audio_clka?
Parent is CLK_AUDIO_EXTAL.

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clkb",               CLK_AUDIO_CLKB, 15, 12, 7, 28,

adg_0_audio_clkb?

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clkc",               CLK_AUDIO_CLKC, 15, 13, 7, 29,

adg_0_audio_clk_c?

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi0_clk",                 CLK_PLLCLN_DIV8, 22, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi1_clk",                 CLK_PLLCLN_DIV8, 22, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi2_clk",                 CLK_PLLCLN_DIV8, 22, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi3_clk",                 CLK_PLLCLN_DIV8, 22, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi4_clk",                 CLK_PLLCLN_DIV8, 22, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi5_clk",                 CLK_PLLCLN_DIV8, 22, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi6_clk",                 CLK_PLLCLN_DIV8, 22, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi7_clk",                 CLK_PLLCLN_DIV8, 22, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi8_clk",                 CLK_PLLCLN_DIV8, 22, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi9_clk",                 CLK_PLLCLN_DIV8, 22, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),

Specifying CLK_PLLCLN_DIV8 as the parent for these ten clocks
is probably a (temporary?) simplication, as they are generated by the
ADG, from adg_0_clk_195m or adg_audio_clk[abc]?

> +       DEF_MOD("dvc0_clk",                     CLK_PLLCLN_DIV8, 23, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("dvc1_clk",                     CLK_PLLCLN_DIV8, 23, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ctu0_mix0_clk",                CLK_PLLCLN_DIV8, 23, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ctu1_mix1_clk",                CLK_PLLCLN_DIV8, 23, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src0_clk",                     CLK_PLLCLN_DIV8, 23, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src1_clk",                     CLK_PLLCLN_DIV8, 23, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src2_clk",                     CLK_PLLCLN_DIV8, 23, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src3_clk",                     CLK_PLLCLN_DIV8, 23, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src4_clk",                     CLK_PLLCLN_DIV8, 23, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src5_clk",                     CLK_PLLCLN_DIV8, 23, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src6_clk",                     CLK_PLLCLN_DIV8, 23, 10, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src7_clk",                     CLK_PLLCLN_DIV8, 23, 11, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src8_clk",                     CLK_PLLCLN_DIV8, 23, 12, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src9_clk",                     CLK_PLLCLN_DIV8, 23, 13, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("scu_supply_clk",               CLK_PLLCLN_DIV8, 23, 14, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ssif_supply_clk",              CLK_PLLCLN_DIV8, 24, 0, -1, -1,

ssiu_supply_clk?

> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi0_clk",                     CLK_PLLCLN_DIV8, 24, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi1_clk",                     CLK_PLLCLN_DIV8, 24, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi2_clk",                     CLK_PLLCLN_DIV8, 24, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi3_clk",                     CLK_PLLCLN_DIV8, 24, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi4_clk",                     CLK_PLLCLN_DIV8, 24, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi5_clk",                     CLK_PLLCLN_DIV8, 24, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi6_clk",                     CLK_PLLCLN_DIV8, 24, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi7_clk",                     CLK_PLLCLN_DIV8, 24, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi8_clk",                     CLK_PLLCLN_DIV8, 24, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi9_clk",                     CLK_PLLCLN_DIV8, 24, 10, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
>  };
>
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
> @@ -538,6 +651,20 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
>         DEF_RST(13, 13, 6, 14),         /* GE3D_RESETN */
>         DEF_RST(13, 14, 6, 15),         /* GE3D_AXI_RESETN */
>         DEF_RST(13, 15, 6, 16),         /* GE3D_ACE_RESETN */
> +       DEF_RST(14, 1, 6, 18),          /* SSIF_0_ASYNC_RESET_SSI */
> +       DEF_RST(14, 2, 6, 19),          /* SSIF_0_SYNC_RESET_SSI0 */
> +       DEF_RST(14, 3, 6, 20),          /* SSIF_0_SYNC_RESET_SSI1 */
> +       DEF_RST(14, 4, 6, 21),          /* SSIF_0_SYNC_RESET_SSI2 */
> +       DEF_RST(14, 5, 6, 22),          /* SSIF_0_SYNC_RESET_SSI3 */
> +       DEF_RST(14, 6, 6, 23),          /* SSIF_0_SYNC_RESET_SSI4 */
> +       DEF_RST(14, 7, 6, 24),          /* SSIF_0_SYNC_RESET_SSI5 */
> +       DEF_RST(14, 8, 6, 25),          /* SSIF_0_SYNC_RESET_SSI6 */
> +       DEF_RST(14, 9, 6, 26),          /* SSIF_0_SYNC_RESET_SSI7 */
> +       DEF_RST(14, 10, 6, 27),         /* SSIF_0_SYNC_RESET_SSI8 */
> +       DEF_RST(14, 11, 6, 28),         /* SSIF_0_SYNC_RESET_SSI9 */
> +       DEF_RST(14, 12, 6, 29),         /* SCU_RESET_SRU */

SCU_0_RESET_SRU?

> +       DEF_RST(14, 13, 6, 30),         /* ADMAC_ARESETN */

DMACPP_0_ARST?

> +       DEF_RST(14, 14, 6, 31),         /* ADG_RST_RESET_ADG */

ADG_0_RST_RESET_ADG?

>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
>  };
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

