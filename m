Return-Path: <linux-renesas-soc+bounces-28890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCc2Dr6RqWmvAAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:22:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8FA2133FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:22:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C28A3050505
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 14:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B7A21E091;
	Thu,  5 Mar 2026 14:21:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FC623A99E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 14:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720509; cv=none; b=CNJKEgPbgTNx1vPMov6VlvGMxobiZD7Mu/vQgoIoK1n2SoaKnsm5XBKEEduZX3/Z5/taS17FWHKXfAcWpU0Lz7132NqUHkp6OiRGBukW3bLzCcErd5mQ7hhVHWqXcoZT+5UGJBre7qPRCUiDfoEjgDojUvOsLAQ89CDclSsvSMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720509; c=relaxed/simple;
	bh=rEhy/H/nCGCiHwzJthbPzEIukVehLVTNrC1dkGO/Qd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQSGTCW0tm6ZHiXC7CSGkT+++8Yroel7zQ4TWFlG9d4bbvKNWqkwge2pq6Y1XWIAKS1dNAV+7QNTwGa+XSxxDg/XqRD2GXrsHtRQaGoFzIoNk+YcHZkSZsJctqv2xMzF9QFzTIKv2LrM8ew0mJ4G/UTmF66QyTuY+yt9MjEWDpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so2473148a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720506; x=1773325306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXtAYRrzYSGErNFDdgbOo6Dg4VTIExI46uaNzGfcACQ=;
        b=gkMnlY87rVcB+1R5A/qWMRYL9TdYZb3KadhgCDuPaelz7OaBgs3YRwaz9LQLO0oj/6
         7b6NRi+vT+Zu8hqX0NHqYjigozXcWJj6d8Cqe90Oj/lb1ztJh/F+eEU3tP0LehNoXYlT
         LXiOqmKlrm5AkpE5cJ2C6WbLVeFWclfEVXpSEAFp6ebiAxk9aHPLJP86+7ttjYoATt/j
         xxde9PkY4hI3WDILXhoIV2Kjlngf1HogoRWHHrZPocn8AbnfvobMdzd2f9gYhEI3rfEw
         I4PF9whubzK+fgr4ZVX1Sdphim162MOKVO07t9QvHjDl/bSZVOFsEcj0pw6jst/AFblW
         3jkA==
X-Forwarded-Encrypted: i=1; AJvYcCWM1f4HRU7zcRtPyu4oMgKKpCd4sj43JhnnVWxshfZn29xVTxXrwF3qy22iYEYV6b+qwpAT7TwHiQ/V53WMf2B73A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZx6XmtnZF3K//DsumxERin3DIUPUeeX9OE0po/5UjxuW3Scfj
	6IwjylSqZ/0SGQCi9RapmKu/AwmCzJLmFTLYmxkCNPjLKgdM6UyvK/H2yYj4tlFAbSY=
X-Gm-Gg: ATEYQzy7negJXdCV3rOJEbr7SeC7Cocgsp8oBhRDF9NXLApEVQJs169g5KyfgYgA90+
	62msQ1mHTkFaOO9WQaqMOO4Kv7L6C3AFO8MdoN9m47gN6SQkGRJs//vmu6eLytyohb+Pjd8mije
	+La8vcxLFB2Jq1C4n3cTAbMhttwK7PXr251SiTI6QjgnOe+ZJUf8L/FKWAzUs8oC2G/gSpjqgbA
	c+flR6oybOLgzv2FumHs+4YIKuZxjA3HWFxxRvn4w1YdS7OlJrUGb4iZ7JfR34JH/KOw36CkEty
	XwLAIZ0iWqM70P4Gm6UX29R6XvnDeBjBdbP3l9Gfsv8x6UXZQeeAcjpHhSr1Hx/ZmCkIr/cKjG9
	iaa7AoOR0MGxz6H6kUZg/FQSXPoXieSwOmjt45opZqtBSmzZviqp91LizYk8E2nBxAYorcyGbOx
	scCMN8jbZGDHhT4odp8vI6qJ9daWV0LOsSPx6agwkMjTiPn6nag4fWYRYQpO4/
X-Received: by 2002:a05:6402:358e:b0:661:7e08:e0e9 with SMTP id 4fb4d7f45d1cf-6617e08e278mr456124a12.17.1772720506019;
        Thu, 05 Mar 2026 06:21:46 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd46753sm6937631a12.8.2026.03.05.06.21.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:21:42 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b904e1cd038so1087907766b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 06:21:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7I+tWrAZc7mExXujmu9gznUU6DCNdykWFw2NZk2X9qU/LIFCimFp+2HHfl5v36PSjRTUgUWWZ/DmMRr6seU9OVg==@vger.kernel.org
X-Received: by 2002:a17:906:7316:b0:b87:1fe6:f223 with SMTP id
 a640c23a62f3a-b93f10f8313mr358270066b.6.1772720500784; Thu, 05 Mar 2026
 06:21:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 15:21:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
X-Gm-Features: AaiRm51dLhVDp_IdfNbKoUzEcAGoO9N7tD3ybXTlfw77SuglDEgtVuQ3mKWaML4
Message-ID: <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7F8FA2133FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	TAGGED_FROM(0.00)[bounces-28890-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.116];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Biju,

Thanks for your patch!

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
> Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5 clocks
> compared to 1 clock on other SoCs.
>
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock, module

Core Clocks, as listed in section 4.4.1 ("Block Diagram of the Clock System")

> clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> @@ -28,19 +28,30 @@ properties:
>        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
>        - renesas,r9a07g054-cpg # RZ/V2L
>        - renesas,r9a08g045-cpg # RZ/G3S
> +      - renesas,r9a08g046-cpg # RZ/G3L
>        - renesas,r9a09g011-cpg # RZ/V2M
>
>    reg:
>      maxItems: 1
>
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Clock source to CPG can be either from external clock
> +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> +      - description: ETH0 TXC clock input
> +      - description: ETH0 RXC clock input
> +      - description: ETH1 TXC clock input
> +      - description: ETH1 RXC clock input
>
>    clock-names:
> -    description:
> -      Clock source to CPG can be either from external clock input (EXCLK) or
> -      crystal oscillator (XIN/XOUT).
> -    const: extal
> +    minItems: 1
> +    items:
> +      - const: extal
> +      - const: eth0_txc_tx_clk
> +      - const: eth0_rxc_rx_clk
> +      - const: eth1_txc_tx_clk
> +      - const: eth1_rxc_rx_clk

Are you sure about these four clocks? On which pins are they input?

>
>    '#clock-cells':
>      description: |

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g046-cpg.h
> @@ -0,0 +1,343 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A08G046 CPG Core Clocks */

[...]

> +#define R9A08G046_OSCCLK               52
> +#define R9A08G046_OSCCLK2              53
> +#define R9A08G046_CLK_P4_DIV2          54

CLK_P4_DIV2 looks like a purely internal clock to me.


> +
> +/* R9A08G046 Module Clocks */

[...]

> +#define R9A08G046_CRU_PCLK             65
> +#define R9A08G046_CRU_ACLK             66
> +#define R9A08G046_MIPI_DSI_PLLCLK      67

MIPI_DSI_PLLCLK is indeed not a gateable clock, so it should be a core
clock.

> +#define R9A08G046_MIPI_DSI_SYSCLK      68
> +#define R9A08G046_MIPI_DSI_ACLK                69
> +#define R9A08G046_MIPI_DSI_PCLK                70
> +#define R9A08G046_MIPI_DSI_VCLK                71
> +#define R9A08G046_MIPI_DSI_LPCLK       72
> +#define R9A08G046_LVDS_PLLCLK          73
> +#define R9A08G046_LVDS_CLK_DOT0                74
> +#define R9A08G046_LVDS_PCLK            75

LVDS_PCLK does not seem to exist, there is only a single reference to it
(but I can see where its gate bit used to be ;-)

> +#define R9A08G046_LCDC_CLK_A           76
> +#define R9A08G046_LCDC_CLK_D           77
> +#define R9A08G046_LCDC_CLK_P           78
> +#define R9A08G046_SSI0_PCLK2           79
> +#define R9A08G046_SSI0_PCLK_SFR                80
> +#define R9A08G046_SSI1_PCLK2           81
> +#define R9A08G046_SSI1_PCLK_SFR                82
> +#define R9A08G046_SSI2_PCLK2           83
> +#define R9A08G046_SSI2_PCLK_SFR                84
> +#define R9A08G046_SSI3_PCLK2           85
> +#define R9A08G046_SSI3_PCLK_SFR                86
> +#define R9A08G046_USB_U2H0_HCLK                87
> +#define R9A08G046_USB_U2H1_HCLK                88
> +#define R9A08G046_USB_U2P0_EXR_CPUCLK  89
> +#define R9A08G046_USB_U2P1_EXR_CPUCLK  90
> +#define R9A08G046_USB_PCLK             91
> +#define R9A08G046_USB_SCLK             92

USB_SCLK is not gateable, so it should be a core clock.

[...]

> +/* R9A08G046 Resets */

[...]

> +#define R9A08G046_RSCI2_TRESETN                114
> +#define R9A08G046_RSCI3_TRESETN                115
> +#define R9A08G046_LVDS_RESET_N         116

Missing BSC_X_PRESET_BSC?
It could be added later, but you do list the corresponding module clock.

> +
> +#endif /* __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__ */


The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

