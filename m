Return-Path: <linux-renesas-soc+bounces-35066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k3eYOlAWUWrY/AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:57:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E973C6B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 17:57:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35066-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 088D5300E721
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B596F43800D;
	Fri, 10 Jul 2026 15:50:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417C934C9AF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 15:50:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698613; cv=none; b=tL0ELhkiHH1GU23HzOeGJRtuFTwF1c0W6WI0v5kGlLa3+kH2nwTtXoIEFpRZzK1WIWPo2FE6fVLAxhf8E1mwScTRHlWWPO3nW4ms/0UJEfNHdMJDsV8dNl+PsjN1uTB3fFOlbtsAYZ07NwahhB8cin7d0Nx3kxnbaF9b6xOcP7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698613; c=relaxed/simple;
	bh=Tq17+D31KkbBK0QvQb6lo28PCl8sTSJAnVSEdBHLiAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pw3X6+hG1iwhcYf3sxCey6MUL5gAdxCbS/xvnc3M5gt4TMmIwd65DhTJgxsq2TtrpQupVOgmOUUm6C0q0GXpLGsTUjrDoB2VZ92abnM4V7Z4kuTqpoGHLE+eA6/DhHccD/Vjm5Qc8x1Kh7tZ0yUNuPsPOUt3w4WkBQJE+JVlD6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96925a563b5so791077241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698611; x=1784303411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4pUJAfk6hstEUL5r9lz9Y/QmHdN8S/TdC3nHKlmz3p4=;
        b=OAyV4G0CRbK2cEUFYWvB4KAPDACiHV4TL70MIefuOXTQxGzYImvfzdyl/fHEbCWVL/
         P5p0i1KJrjyx23u0na8TmACEXTVffAUgWF5TDIccT6kgURrc8Fnior+YK6AxQ+hjA9tn
         SATXlcVgWpAjgI3zlScd9ZC0fX0b6g5SqDaMXK2AAPZXRHazsAhflHrClvAiBhIbOXn1
         6Dd7XHgRYEbV7X9jXUqJ7lZlE29e3r0qsdtDFi5zY2dmZJeTucuLM/tELx+lqVAj4xjt
         Lc4EtaHIaH4rcrs46bFA6AcrhHbBhABk5imL4+UImAqTLsBSaFuvNwWOgyn0LRUEUJ+s
         sBZg==
X-Forwarded-Encrypted: i=1; AHgh+RpzKxu5JZ5l+OHkNSmMshkrRF92nbcIC0DWOgs2XY1QRcZk/pos9bxEcmSsXf25h+XLpKGre+MPSyT9tvaOOgZcKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw08UFoQhu0NMz4SQDqPVJoJ8sTN9JRgAlUubYTrAm9iJkApK6
	7Ob1Hhyql18ob3AS5LKoQ0kimRUVRlyhq7lmYdd42tOricxcd6qxvTXUhnpg62ZT
X-Gm-Gg: AfdE7cnUyUSen3odQ2IhTp8GjRPySP8ioVCG+vVN5E34HaD/Pht3E3WfBt82ZEDgXzS
	cRb74UXXKr4sFrGGmlQeen2V8ckDfmbv7b5pP2+RuppaQRJFmHA2YL283fs/Z7n3BzXtURH6YWq
	218MMuNlhbQJLPcSv3m3iVm6PQQ+cZh4Qi81rnuR+ZVBYxsYc/Hco1A1sSbB/CZrjl4vaYuFcp/
	3cZtaBWadyiv0eOJMW74o3/bV6t/B7BeRyJDhrOl0Mbr952e+8xFeknU52qrJyCAGjTqp2Uq8w7
	nqpUZEAOIKBUCapiY060QR+29arzddbqQ1NWjLIqLgS0tpSqAoByuvOcjAUh1S7fp16UbpYgApg
	CDDnzGdV8OnQlIDZ2Ewwt/R6FxMBLl1Wi8dkOUWgggbI+7F5CZ1cCWdsiHMzBv560sgNbFHQ8zv
	o1qEO/Fw2pYuk/sywSoqK2mmZvsRz7ZGRhc8xzz5LXU2V4YUmLYQ==
X-Received: by 2002:a05:6102:66d5:b0:745:1b91:5489 with SMTP id ada2fe7eead31-7451b9192b5mr938616137.8.1783698610960;
        Fri, 10 Jul 2026 08:50:10 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3ee7csm5309018137.2.2026.07.10.08.50.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:50:10 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7370ea43b9cso1238969137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 08:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr6nHtS5niYo5ShRMyq21PaPirOFEPSPtIij8yzz35vn4vIkowU30/ppJdcLcfmkXgcE1/IASOsuYt+gObFl0Tf3A==@vger.kernel.org
X-Received: by 2002:a05:6102:1a15:10b0:6cd:b43f:72fd with SMTP id
 ada2fe7eead31-7450cbc02c2mr1897086137.22.1783698610437; Fri, 10 Jul 2026
 08:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:49:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWR15XdcQkncnwov6B7KbQHXpvk1jBPOQr4f5zwtR09dA@mail.gmail.com>
X-Gm-Features: AUfX_mxHw8t6FHfw4QItlFOI1qA8p9h3PYZrH4NBbu-mU_RDK2R6hPa3dqc-gts
Message-ID: <CAMuHMdWR15XdcQkncnwov6B7KbQHXpvk1jBPOQr4f5zwtR09dA@mail.gmail.com>
Subject: Re: [PATCH 5/6] clk: renesas: r9a08g046-cpg: Add MIPI DSI and LCDC
 clock/reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35066-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 545E973C6B5

Hi Biju,

Thanks for your patch!

s/r9a08g046-cpg/r9a08g046/

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the MIPI DSI and LCDC peripherals on the
> RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/clk/renesas/r9a08g046-cpg.c | 62 +++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
> index 4488bd1988e8..7cea2c6d2c42 100644
> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -19,22 +19,26 @@
>  #define G3L_CPG_PL3_DDIV               (0x208)
>  #define G3L_CPG_SDHI_DDIV              (0x218)
>  #define G3L_CPG_GE3D_DDIV              (0x224)
> +#define G3L_CPG_DSI_DDIV               (0x228)
>  #define G3L_CPG_CA55CORE_DDIV          (0x234)
>  #define G3L_CPG_RSCI_DDIV              (0x238)
>  #define G3L_CPG_RSPI_DDIV              (0x23c)
>  #define G3L_CPG_SDHI_DSEL              (0x244)
>  #define G3L_CLKDIVSTATUS               (0x280)
>  #define G3L_CLKSELSTATUS               (0x284)
> +#define G3L_CPG_DSI_SSEL               (0x408)
>  #define G3L_CPG_GE3D_SSEL              (0x40c)
>  #define G3L_CPG_ETH_SSEL               (0x410)
>  #define G3L_CPG_RSCI_SSEL              (0x414)
>  #define G3L_CPG_RSPI_SSEL              (0x418)
> +#define G3L_CPG_DSI_SDIV               (0x430)
>  #define G3L_CPG_ETH_SDIV               (0x434)
>
>  /* RZ/G3L Specific division configuration.  */
>  #define G3L_DIVPL2A            DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
>  #define G3L_DIVPL2B            DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
>  #define G3L_DIVPL3A            DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
> +#define G3L_DIVPL3B            DDIV_PACK(G3L_CPG_PL3_DDIV, 4, 2)
>  #define G3L_DIV_SDHI0          DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
>  #define G3L_DIV_SDHI1          DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
>  #define G3L_DIV_SDHI2          DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
> @@ -54,11 +58,14 @@
>  #define G3L_SDIV_ETH_B         DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
>  #define G3L_SDIV_ETH_C         DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
>  #define G3L_SDIV_ETH_D         DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
> +#define G3L_SDIV_DSI_C_SET     DDIV_PACK(G3L_CPG_DSI_SDIV, 8, 1)
> +#define G3L_DIV_DSI            DDIV_PACK(G3L_CPG_DSI_DDIV, 0, 2)

Please preserve sort order for both newly-added lines.

>
>  /* RZ/G3L Clock status configuration. */
>  #define G3L_DIVPL2A_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
>  #define G3L_DIVPL2B_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
>  #define G3L_DIVPL3A_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
> +#define G3L_DIVPL3B_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 9, 1)
>  #define G3L_DIV_CA55_CORE0_STS DDIV_PACK(G3L_CLKDIVSTATUS, 12, 1)
>  #define G3L_DIV_CA55_CORE1_STS DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
>  #define G3L_DIV_CA55_CORE2_STS DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
> @@ -78,6 +85,7 @@
>  #define G3L_SEL_SDHI1_STS      SEL_PLL_PACK(G3L_CLKSELSTATUS, 17, 1)
>  #define G3L_SEL_SDHI2_STS      SEL_PLL_PACK(G3L_CLKSELSTATUS, 18, 1)
>  #define G3L_DIV_GE3D_STS       DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
> +#define G3L_DIV_DSI_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 28, 1)
>
>  /* RZ/G3L Specific clocks select. */
>  #define G3L_SEL_SDHI0          SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
> @@ -101,6 +109,7 @@
>  #define G3L_SEL_RSPI0          SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 0, 2)
>  #define G3L_SEL_RSPI1          SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
>  #define G3L_SEL_RSPI2          SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
> +#define G3L_SEL_DSI            SEL_PLL_PACK(G3L_CPG_DSI_SSEL, 0, 1)

Sort order?

> @@ -347,6 +388,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>         DEF_G3S_DIV("G", R9A08G046_CLK_G, CLK_SEL_GE3D, G3L_DIV_GE3D, G3L_DIV_GE3D_STS,
>                     dtable_1_32, 0, 0, 0, NULL),
>         DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
> +       DEF_FIXED("dsi_pllclk", R9A08G046_MIPI_DSI_PLLCLK, R9A08G046_CLK_M4, 1, 1),

"mipi_dsi_pllclk"

>  };
>
>  static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
> @@ -400,6 +442,22 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
>                                         MSTOP(BUS_PERI_VIDEO, BIT(12))),
>         DEF_MOD("ge3d_ace_clk",         R9A08G046_GE3D_ACE_CLK, R9A08G046_CLK_P1, 0x558, 2,
>                                         MSTOP(BUS_PERI_VIDEO, BIT(12))),
> +       DEF_MOD("dsi_sysclk",           R9A08G046_MIPI_DSI_SYSCLK, R9A08G046_CLK_M5, 0x568, 1,

"mipi_dsi_sysclk"

> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("dsi_aclk",             R9A08G046_MIPI_DSI_ACLK, R9A08G046_CLK_P1, 0x568, 2,

"mipi_dsi_aclk"

> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("dsi_pclk",             R9A08G046_MIPI_DSI_PCLK, R9A08G046_CLK_P2, 0x568, 3,

"mipi_dsi_pclk"

> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("dsi_vclk",             R9A08G046_MIPI_DSI_VCLK, R9A08G046_CLK_M3, 0x568, 4,

"mipi_dsi_vclk"

> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("dsi_lpclk",            R9A08G046_MIPI_DSI_LPCLK, R9A08G046_CLK_M1, 0x568, 5,

"mipi_dsi_lpclk"


> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("lcdc_clk_a",           R9A08G046_LCDC_CLK_A, R9A08G046_CLK_P1, 0x56c, 0,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
> +       DEF_MOD("lcdc_clk_d",           R9A08G046_LCDC_CLK_D, R9A08G046_CLK_M3, 0x56c, 1,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
> +       DEF_MOD("lcdc_clk_p",           R9A08G046_LCDC_CLK_P, R9A08G046_CLK_P2, 0x56c, 2,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
>         DEF_MOD("ssi0_pclk2",           R9A08G046_SSI0_PCLK2, R9A08G046_CLK_P0, 0x570, 0,
>                                         MSTOP(BUS_MCPU1, BIT(10))),
>         DEF_MOD("ssi0_pclk_sfr",        R9A08G046_SSI0_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 1,

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

