Return-Path: <linux-renesas-soc+bounces-29354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCujAiMbtGlLhQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 15:11:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF26284A0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 15:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7DF732596F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28926340A46;
	Fri, 13 Mar 2026 14:06:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B3F3368B4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410774; cv=none; b=XNJ6Pf4C1dqlb46bO7zvuxLiltTucNH+eTWdTJJAVDb6NMLlLBX/AOcpOeSFoDsCEqQGHBhP8bNFTMta4NU/t9HuUB839LboPz6N3YrVvTY8iIyO/bbvRyUj7kMZB8srkecyBauOXYfr/eMiDGTwyB4tq/AtB9VEafTFRcyKMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410774; c=relaxed/simple;
	bh=Wo9P0OvFu5Q/66npS57S4aKOuZktzVuLsj7oQRamu9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYOpZ3TWx1YjOgUQw5ZOhH3CnFD3HDoHgIGcQnWPPOluL35Eo8k1ExITO8n5ImfZXTmiY2KcWj/xMMohETUGRSAaz5rHsVstLl7Etz18Pw86Km3J5n6Bcf+9l/V7Y514eMs3JQsFc+5ibDOnDcsXbgYoM2Z3213u8aFhnbR3uxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso1740189e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 07:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773410772; x=1774015572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISrMP7lkY0Gwayd/no0kP3RKtW7L8snMqqKoKdEo9Io=;
        b=BDcaVoLZoQlWeWbAlmv5k4vw4yC/VjfoI6qUPHGu3x1RQwmN7TCQ3PYeqPP5tI9iFd
         kCSZgp560dD+T/S8giZkb9WIwDaiew+zKSwfn2p1IB3UCmlQTERBtMBk05a49LPy4KLD
         7zKUbDw9xn2Vs4SWqojINiqcO+dt3S12IWT9z9IQLIoULjCqo0m929Q3UyJW9duIrttF
         w2q2xiEKZFn9BrRAUnFS/kRTXrL+oM69Z8QRzp81RzAv2Wk3H3hLhoCHpx+NaugCaVTY
         KEB6eKj0lGzzwA/EL40oVaslhvQTut6k/g/CcVuDhL7j74+r6BVM6+BqTzVfdhv5LEFg
         CVtg==
X-Forwarded-Encrypted: i=1; AJvYcCUiQdsVugMmREV0phl3N/pR+nlmVIy3wUCLER1yGax1iyUeJbpUiuoLxPDSj5liLEI64nFuAgf2zpJOCbC1fjPdoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFAXWyNxNXe8Jww7QYvO9aQbHDcoY6FCxg7Zc1GggH48lzBUzD
	6trZ+Z0wJciqUXeO7seG+cKsIycPxwwjvFcqjlEX0Um4pY6XpgOqbJdGtEwjlyly
X-Gm-Gg: ATEYQzzkR4pKOsfKGzzbrA8zfgvnnKzlQDdLsKfHO3BFu3HC7wku6BkWjCC+vAEyMYy
	RjINatdNDvGVcUAJ5ojux3NsT+5EvEYU6n8VwUxAkTHVXSAJMg/zvjjQDSUFOGzaL3vho/TxaZq
	Sf76BVDFF57D115P1LFQxd1yBrhNp0p+AeOC2/vOOPrdMY0YntF2BfEM6oh+w3f/n8PHAYF0JTX
	MOTrFoDGelIIIH6h7oQkA+HyzVWZjOoiesVu6gHaqQ7lS9obQ5gnqpK2abJ57flwCyQGJMM0pG8
	WjWYeUav4GvxYIISvY+tMIabQWzp7Qh1ik/kqeX7M1sOiHDOH1GNpTMsLhArQ3QpMIlJPFUyjOX
	pqQj1fzj8QTqTdLVYPm/Jk2f4Ou+VLD6zd45D/jV7IZDoXycbEOgWi27iADa76IvI3qMBASTo3c
	BfXHKJJ1e3vwsNW82OiFm2Gqr8wxFGfzFLJxtEdhIZXqYCKLv1+Uy8yFJ9VjMJR4Ua
X-Received: by 2002:a05:6122:250e:b0:567:638a:ce16 with SMTP id 71dfb90a1353d-56b62978d0dmr1435351e0c.14.1773410771642;
        Fri, 13 Mar 2026 07:06:11 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfc9c9fcsm2619681241.4.2026.03.13.07.06.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 07:06:08 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56afafef7aeso2239465e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 07:06:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDgBpk1m9a1kqU16VKNIAJVwQ8CHjFGX36R8oGUb3dyyL+CJ06gHK/pjHEXXdwDMrWjAWD2+CwfRH9OUzSpT9juw==@vger.kernel.org
X-Received: by 2002:a05:6122:4219:b0:559:6092:936c with SMTP id
 71dfb90a1353d-56b629213e5mr1521906e0c.12.1773410767533; Fri, 13 Mar 2026
 07:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-6-biju.das.jz@bp.renesas.com> <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
 <TY3PR01MB113464F7D135B2CB24B91140F867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113464F7D135B2CB24B91140F867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 15:05:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtBRHKSd6wb7Q-YmCPSnBGk_pETp7q-eCUJi3t8ERS5Q@mail.gmail.com>
X-Gm-Features: AaiRm50baEw2pzLDwGKmHfiVoIio9lIXgG4IiYSq7bUGte8xcq7IbKlQNDwy-y0
Message-ID: <CAMuHMdWtBRHKSd6wb7Q-YmCPSnBGk_pETp7q-eCUJi3t8ERS5Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com,microchip.com];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29354-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 8EF26284A0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Thu, 5 Mar 2026 at 16:18, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Document the device tree bindings for the Renesas RZ/G3L SoC Clock
> > > Pulse Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5
> > > clocks compared to 1 clock on other SoCs.
> > >
> > > Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock,
> > > module
> > > clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> > > Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> > > ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > @@ -28,19 +28,30 @@ properties:
> > >        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
> > >        - renesas,r9a07g054-cpg # RZ/V2L
> > >        - renesas,r9a08g045-cpg # RZ/G3S
> > > +      - renesas,r9a08g046-cpg # RZ/G3L
> > >        - renesas,r9a09g011-cpg # RZ/V2M
> > >
> > >    reg:
> > >      maxItems: 1
> > >
> > >    clocks:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Clock source to CPG can be either from external clock
> > > +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> > > +      - description: ETH0 TXC clock input
> > > +      - description: ETH0 RXC clock input
> > > +      - description: ETH1 TXC clock input
> > > +      - description: ETH1 RXC clock input
> > >
> > >    clock-names:
> > > -    description:
> > > -      Clock source to CPG can be either from external clock input (EXCLK) or
> > > -      crystal oscillator (XIN/XOUT).
> > > -    const: extal
> > > +    minItems: 1
> > > +    items:
> > > +      - const: extal
> > > +      - const: eth0_txc_tx_clk
> > > +      - const: eth0_rxc_rx_clk
> > > +      - const: eth1_txc_tx_clk
> > > +      - const: eth1_rxc_rx_clk
> >
> > Are you sure about these four clocks? On which pins are they input?
>
> From Figure 4.4-5 Block Diagram of the Deformed Clock System (4), page 789
>
> These clks are external source clks connected to CPG_ETH_SSEL mux for
> selecting rx/tx clks.
>
> In RGMII case, currently on RZ/G3L SMARC EVK:
>
> For Tx: we select DIV_ETH0_TR (SEL_ETH0A_SET)
> For Rx: we select ETH0_RXC_RX_CLK_IN (SEL_ETH0B_SET)

Sure, these clocks are indeed shown in that Figure, and referenced in
the CPG_ETH_SSEL register documentation, but where do they originate
from? On which pins are they supplied?

> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/r9a08g046-cpg.h
> > > @@ -0,0 +1,343 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > + *
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + */
> > > +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> > > +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> > > +
> > > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +
> > > +/* R9A08G046 CPG Core Clocks */
> >
> > [...]
> >
> > > +#define R9A08G046_OSCCLK               52
> > > +#define R9A08G046_OSCCLK2              53
> > > +#define R9A08G046_CLK_P4_DIV2          54
> >
> > CLK_P4_DIV2 looks like a purely internal clock to me.
>
> Page 3918 Figure 7.9-1 Block Diagram of CAN-FD
>
> Peripheral clk,
> RAM clk,
> CAN external clk
>
> Then, CANFD clk which is DIV2 clk of Peripheral clk, so thought of
> modelling this as Core clk. I may be wrong here??
>
> Maybe I will drop this now and revisit later when we add support for CANFD??

That may be the better option.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

