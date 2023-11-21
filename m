Return-Path: <linux-renesas-soc+bounces-30-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FBE7F2A68
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 11:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BE111C20BCD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 10:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA5D4652E;
	Tue, 21 Nov 2023 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145E0E7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 02:30:10 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6bd9:a79:1d00:5285])
	by albert.telenet-ops.be with bizsmtp
	id CyW22B00Y0Wid3g06yW2iz; Tue, 21 Nov 2023 11:30:07 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5O14-009vCd-NI;
	Tue, 21 Nov 2023 11:30:02 +0100
Date: Tue, 21 Nov 2023 11:30:02 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
    conor+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, 
    sboyd@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
    Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 6/9] irqchip/renesas-rzg2l: Add macro to retrieve
 TITSR register offset based on register's index
In-Reply-To: <20231120111820.87398-7-claudiu.beznea.uj@bp.renesas.com>
Message-ID: <f01a5cc1-44c0-891a-c8f7-3023f3ff6b6a@linux-m68k.org>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com> <20231120111820.87398-7-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Claudiu,

Thanks for your patch!

On Mon, 20 Nov 2023, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There are 2 TITSR registers available on IA55 interrupt controller. A

... the IA55 interrupt controller.

> single macro could be used to access both of them. Add a macro that
> retrieves TITSR register offset based on it's index. This macro is

the TITSR register offset ... its index

> useful in commit that adds suspend/resume support to access both TITSR

> registers in a for loop.

This macro will be useful to access both TITSR registers in a for loop
when adding suspend/resume support later/

>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -28,8 +28,7 @@
> #define ISCR				0x10
> #define IITSR				0x14
> #define TSCR				0x20
> -#define TITSR0				0x24
> -#define TITSR1				0x28
> +#define TITSR(n)			(0x24 + (n) * 4)
> #define TITSR0_MAX_INT			16
> #define TITSEL_WIDTH			0x2
> #define TSSR(n)				(0x30 + ((n) * 4))
> @@ -200,8 +199,7 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
> 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> 	unsigned int hwirq = irqd_to_hwirq(d);
> 	u32 titseln = hwirq - IRQC_TINT_START;
> -	u32 offset;
> -	u8 sense;
> +	u8 index, sense;
> 	u32 reg;
>
> 	switch (type & IRQ_TYPE_SENSE_MASK) {
> @@ -217,17 +215,17 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
> 		return -EINVAL;
> 	}
>
> -	offset = TITSR0;
> +	index = 0;
> 	if (titseln >= TITSR0_MAX_INT) {
> 		titseln -= TITSR0_MAX_INT;
> -		offset = TITSR1;
> +		index = 1;
> 	}

You can remove this if you would use ...
>
> 	raw_spin_lock(&priv->lock);
> -	reg = readl_relaxed(priv->base + offset);
> +	reg = readl_relaxed(priv->base + TITSR(index));

... TITSR(titseln / TITSR0_MAX_INT) here.

> 	reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
> 	reg |= sense << (titseln * TITSEL_WIDTH);
> -	writel_relaxed(reg, priv->base + offset);
> +	writel_relaxed(reg, priv->base + TITSR(index));
> 	raw_spin_unlock(&priv->lock);
>
> 	return 0;
> -- 
> 2.39.2
>
>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

