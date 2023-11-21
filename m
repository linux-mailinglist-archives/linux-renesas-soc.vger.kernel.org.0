Return-Path: <linux-renesas-soc+bounces-25-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DD77F2989
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 10:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 257C52829D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD753C091;
	Tue, 21 Nov 2023 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0CC110
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 01:59:24 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6bd9:a79:1d00:5285])
	by michel.telenet-ops.be with bizsmtp
	id CxzG2B0060Wid3g06xzGQV; Tue, 21 Nov 2023 10:59:22 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5NXI-009uxV-4U;
	Tue, 21 Nov 2023 10:59:16 +0100
Date: Tue, 21 Nov 2023 10:59:16 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
    conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
    mturquette@baylibre.com, sboyd@kernel.org, 
    prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
    linux-clk@vger.kernel.org, 
    Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 1/9] clk: renesas: r9a08g045: Add IA55 pclk and its
 reset
In-Reply-To: <20231120111820.87398-2-claudiu.beznea.uj@bp.renesas.com>
Message-ID: <e8637d39-911d-d8a3-b8da-548914df6ac@linux-m68k.org>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com> <20231120111820.87398-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Claudiu,

On Mon, 20 Nov 2023, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> IA55 interrupt controller is available on RZ/G3S SoC. Add IA55 pclk and
> its reset.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -188,6 +188,7 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
>
> static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
> 	DEF_MOD("gic_gicclk",		R9A08G045_GIC600_GICCLK, R9A08G045_CLK_P1, 0x514, 0),
> +	DEF_MOD("ia55_pclk",		R9A08G045_IA55_PCLK, R9A08G045_CLK_P2, 0x518, 0),

This conflicts with [1], which you sent just before.

If that patch goes in first, I guess this new entry should gain
", MSTOP(PERI_CPU, BIT(13))", just like the entry for ia55_clk?

> 	DEF_MOD("ia55_clk",		R9A08G045_IA55_CLK, R9A08G045_CLK_P1, 0x518, 1),
> 	DEF_MOD("dmac_aclk",		R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0),
> 	DEF_MOD("sdhi0_imclk",		R9A08G045_SDHI0_IMCLK, CLK_SD0_DIV4, 0x554, 0),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

[1] "clk: renesas: rzg2l-cpg: Add support for MSTOP"
     https://lore.kernel.org/r/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

