Return-Path: <linux-renesas-soc+bounces-29631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLqOITKFuWlyIgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:45:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 005702AE5A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D28A30B07C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DEF3ED5A4;
	Tue, 17 Mar 2026 16:40:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C023EBF33
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765642; cv=none; b=C5/69H3DupJdLbEhqgVs+1FPLqvcceZVMeyLpbczejZIMXaazq+7Tuh6tpboPXIwvs+xbhknkXAliEiBJwuLYgo7XWJBL99D/GYQV5kUS1KuOZMbwsds715soRvW0pDXC+Q+nh8Dk/TT+VHhrjFH65KgTuVS9Vb3Kl1cQ62OihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765642; c=relaxed/simple;
	bh=W/LXxawnUy5QbMBSVSPPXzCeSWIGPaKFW9NiSKQMkSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmLaLdsyEH1draxcFmnEW5H2amgR+Nf82i6ZpjXNxrnRkcOo0k2KbfEEHmfUcx2KLXnnR9M+rZ/adejn7CO50Xwk7QEmE2A+n0jXrOC04YImlUWkZREAE6kvxyu3miAd8n7bYYxRlbR//bcITjs1cAV4dhZuvVGIfGuNydJlKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94de664b541so1614608241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 09:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773765638; x=1774370438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsFPqGNbq+eb2XKkYK5oZMuSao00ukUspWcqW4wmr98=;
        b=CqB56O5fp/0pC8Y3CBuVW1lk9HJwvgdwD0fyIq8UnPIyCb86sjQaSjWCG2kSSg2CSl
         h1mWSr8aJasv+I8qoDSpi6tyIih/BwQeVGHt2jgbKA5cKwiNfMQk+At9Qp8qoXnnMMbl
         hy67+GfETdiLYIGiZ/qFcoyQNR//8URL+TK+kcmUsJTcc5axRagKnLxQ9wWNGUeo4IVQ
         witXmv6ba00736CKK1m9msc0DDkfRGGA0KHwQZsU9IlCEuSPxGhyXMO+3qvW8XtRJyZE
         ihGTSZ47UGp/bD6YIZ7J/crnQn1OsDIHBQGL1GliXopnN4Nf/bKYa5m27Ze4ak4dbcEw
         HeBA==
X-Forwarded-Encrypted: i=1; AJvYcCWKJTsA44HN+0kGcnJtfYmfp2rJhA0tcVqiwY4Hfl1ZyNSi2c7cRkx2UaIYa46C/AeH40p4tWKDQYFRypNDuJiM5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YybWSkZhl3xe5IBsCi0qACuxX8iMScG2axMlnVHWBRH1Us8oLJy
	w02v02oE/ITjcH82ToFZPYy54wvJ7lBAbkmMVbu+z0JbZj0Bg2i0I/1LqEp/N3TMKBU=
X-Gm-Gg: ATEYQzy4opxUKHADAACo7vEtG4Jyk8dcdnHahRmNlXQdyv4vQ6MeTjmrso4GxGRXn+t
	ftBI4G2jyjj2zS9eJH7nm4JzjzHf4Q6CIB8iwTnzZtl6jTMKKB7cw+1TFsCkJzU3NI+Tk8EGVft
	cuC9fYkXlzlGcwFP62R9WNXOlecPxxKjRCArQARfrAFNO/j372iUeC6vVdx0ZmoX4WWEKR0BsYW
	i5K2sG/U24B2ySDma/XAKcGcmn6JLyv8BEvzaKs4R51IL+V+13fZfA9+TDfuDzIxj1wqRMHvpIg
	6Dxo3Oop681eLfOlnz2PKEL3+Qk4BrUCjLQ9xpnSeVNFLrDjnkrTC3s1Ej9omUyJC8bz95xYrgJ
	/JFSjfNH0rysv6xkkRhvD3Yc0BzbBGYKvLt+Tmq+5yjV0okirHB5Ay2FotWH9lXx1roC6jmQgL3
	ObzV90HMSnxqnFofdCqrUTtB4XGs5pDuQDwoh73Ll4Gk5VMKFRzt2yLAS1wsrm
X-Received: by 2002:a05:6102:510d:b0:5ff:a16b:93f5 with SMTP id ada2fe7eead31-6027d32d856mr171706137.24.1773765637852;
        Tue, 17 Mar 2026 09:40:37 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601deaa379asm8794754137.8.2026.03.17.09.40.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:40:36 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-950cc286d86so761065241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 09:40:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZ7A7W7vJtXbD+w+ZOrb35uFU2tnFRfkziKSTsIpX7d9m4Afv1hpUPiMTHFAUWIQHGrNA0U8gm/por/b/O3/RETg==@vger.kernel.org
X-Received: by 2002:a05:6102:4186:b0:602:6c69:eec7 with SMTP id
 ada2fe7eead31-6027d320cb1mr178012137.23.1773765635951; Tue, 17 Mar 2026
 09:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-6-biju.das.jz@bp.renesas.com> <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
 <TY3PR01MB113464F7D135B2CB24B91140F867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWtBRHKSd6wb7Q-YmCPSnBGk_pETp7q-eCUJi3t8ERS5Q@mail.gmail.com> <TYCPR01MB113329C33FF3CF8832B9FB1498645A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB113329C33FF3CF8832B9FB1498645A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 17:40:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWVmD7oBHOfooH6r5Gm5aVi+cU3+cbFsbGV=t7vhmL3Pg@mail.gmail.com>
X-Gm-Features: AaiRm51rq9Qm7mO42ai5bG3MUeyB3Sk3xPiht1eExfZaJrMLrFCMT9PE1Npi9uk
Message-ID: <CAMuHMdWVmD7oBHOfooH6r5Gm5aVi+cU3+cbFsbGV=t7vhmL3Pg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com,microchip.com];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29631-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.842];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,microchip.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 005702AE5A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Fri, 13 Mar 2026 at 15:35, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 5 Mar 2026 at 16:18, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Tue, 3 Feb 2026
> > > > at 11:30, Biju <biju.das.au@gmail.com> wrote:
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > Document the device tree bindings for the Renesas RZ/G3L SoC Clock
> > > > > Pulse Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has
> > > > > 5 clocks compared to 1 clock on other SoCs.
> > > > >
> > > > > Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock,
> > > > > module clock outputs, as listed in section 4.4.2 ("Clock List
> > > > > r1.00") and add Reset definitions referring to registers CPG_RST_*
> > > > > in Section 4.4.3
> > > > > ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
> > > > >
> > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > > ---
> > > > > a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.ya
> > > > > +++ ml
> > > > > @@ -28,19 +28,30 @@ properties:
> > > > >        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
> > > > >        - renesas,r9a07g054-cpg # RZ/V2L
> > > > >        - renesas,r9a08g045-cpg # RZ/G3S
> > > > > +      - renesas,r9a08g046-cpg # RZ/G3L
> > > > >        - renesas,r9a09g011-cpg # RZ/V2M
> > > > >
> > > > >    reg:
> > > > >      maxItems: 1
> > > > >
> > > > >    clocks:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    items:
> > > > > +      - description: Clock source to CPG can be either from external clock
> > > > > +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> > > > > +      - description: ETH0 TXC clock input
> > > > > +      - description: ETH0 RXC clock input
> > > > > +      - description: ETH1 TXC clock input
> > > > > +      - description: ETH1 RXC clock input
> > > > >
> > > > >    clock-names:
> > > > > -    description:
> > > > > -      Clock source to CPG can be either from external clock input (EXCLK) or
> > > > > -      crystal oscillator (XIN/XOUT).
> > > > > -    const: extal
> > > > > +    minItems: 1
> > > > > +    items:
> > > > > +      - const: extal
> > > > > +      - const: eth0_txc_tx_clk
> > > > > +      - const: eth0_rxc_rx_clk
> > > > > +      - const: eth1_txc_tx_clk
> > > > > +      - const: eth1_rxc_rx_clk
> > > >
> > > > Are you sure about these four clocks? On which pins are they input?
> > >
> > > From Figure 4.4-5 Block Diagram of the Deformed Clock System (4), page
> > > 789
> > >
> > > These clks are external source clks connected to CPG_ETH_SSEL mux for
> > > selecting rx/tx clks.
> > >
> > > In RGMII case, currently on RZ/G3L SMARC EVK:
> > >
> > > For Tx: we select DIV_ETH0_TR (SEL_ETH0A_SET) For Rx: we select
> > > ETH0_RXC_RX_CLK_IN (SEL_ETH0B_SET)
> >
> > Sure, these clocks are indeed shown in that Figure, and referenced in the CPG_ETH_SSEL register
> > documentation, but where do they originate from? On which pins are they supplied?
>
> Figure 6.3-1 Block Diagram of the Ethernet Interface
>
> and
>
> 1.3.3 Clock Pin Specifications
> Table 1.3-3 List of Pin Functions (1/2)
>
> For Rx this clock is supplied by PHY on the RZ/G3L SMARC SoM Module.
> RZ_ETH0_RXC is the pin.
>
> For Tx this clock is supplied by the SoC(RZ_ETH0_TXC)

OK, thanks! So these are fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

