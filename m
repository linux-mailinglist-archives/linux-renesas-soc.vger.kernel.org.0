Return-Path: <linux-renesas-soc+bounces-33622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wnqXF3TRImoXeAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 15:39:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C90CF64893F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 15:38:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB7D73007F56
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 13:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06D72DAFAF;
	Fri,  5 Jun 2026 13:38:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5D02C0282
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 13:38:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666712; cv=none; b=bWtxzAvwl2x5YUeXorTPUbjCkCCAwYkU1qjaUxws/P+rJ+xLKGzg+yIhHRn1XB/pUSvawJJVivMFGK2rRE4HnQRiZn5dtca+2wOilFUodL6tmGWiHRmwVC4jfX3z8oloSti2NMG5aRQS/VnyxdL8g/17UPY8HfKl0bVdhUzyDoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666712; c=relaxed/simple;
	bh=CFF3h2aKCRs0mVERo0w9Jab73K/yL/FpUgQ+LRq2KzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifuDgMiN22TQCxpiUG+FuxVHHqBRxh7Y4cFRdhtn3lmfRdXs5QoPmLZm4mpI4d+YnjlZa3ucYCECOIE33+8mkbIveY3mdQXMiLbpGVmBGi8syVsn7+Si4CdusgIkJ6fuWtrsicb+XZq9cQHhNZ2liCiqiDza+pKmyjoKFL2DsUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59d541955f8so622799e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 06:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780666710; x=1781271510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/NHmMIAbF26BQ6q+U+2X1MzRNnwP89We/x5SvIc/NU=;
        b=grO1UmhrbLm0+Z7M51H3Vh8pjuNinpuzJdmsL0W1aKHZJrkcVh5UL5Nj7dwsqI8Q93
         bAtDeHrVHBPra6So+hfWnC7Lc4CQULxFeQs8H1e0/GBf4nyA35DXcVSSQp/Xn7uvBp6z
         8aUtD7C81Jg2pxTx7k0w3NABd6l3TlG2vh+IlFYnZ7XCH/eKyGtAMR9Qkiro+pEzTlD7
         cii8LfYstMb/g9alqmMhoveD7UUhm1vHRCERIDJ9ZZ8a21oSnJehsWvqMSnH32OffcBu
         aSWzplSn3eMoxhDw4NaIFlDMcnhgPgi97H5HwYogB5z3zbtOn39HCIma+dmYuPVV7K2z
         ho+A==
X-Forwarded-Encrypted: i=1; AFNElJ/A4Y11MqjNkmUV6rHS5//2s5s1kdbqL7awIHutdCoSqg0TJhnE1iT6Z0MhWVxJLiR66fC0aQRwkj3b2PPSbLaEAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7Oz40bWNeHXPoy8oOIF5b1qwJJDENWC+B+L98WMDPZ3yb3i/
	/TI5kKxk/7qslpBHjaPFgZgc1Kt0CdAqlIzkQ5TDDNU5Se2403IYvBNRRBzKTSKd
X-Gm-Gg: Acq92OFUOxxl4hBY0sbSp4o/Luuu5YXTSDHTU+rOBxI1b4FnDfwL/5pa+o6kccNfmdO
	x+a7kvR+PKkH7GXA/lNvJM37lNZf3gaW0S7vrkDFUe62ZoSuSnKVJShVeEnQM5IRcfXtc0tQ3sV
	2O555TzDHLPCn7khSk4ffNIgdxqt2bvCSfrGQOiwBa5paKdnR9kfBpWTmtELzdvBjOvkklSkbMG
	xX2WHAMll+td2BBZKVIWIE/KBz1mrQld+btbrMinM/iW6Jejj8KUrN94yWPn8JCfOhOvLnaF6BW
	C72LJ24+aXeu9qEMaR1Cvj8lAEJWOsGrXGqmWB7tbUg3RJKD7TbKpv4cJR48YVZG8noCii7Hi4d
	hV37Hpx1QkltY6+/84nE9HWd3E0ycxdCsPo34NN6HoTU3xIrcsG3Yq2e3Bzy+2tudVkzDwRd7Pg
	hK7a61Ab70oZ6juBjCg1vg7UGJEui9dDcJY+j3d6cRpSENZAzWMp/Ivr7gcs+1x3vogenFiaA=
X-Received: by 2002:a05:6102:580f:b0:60a:8515:9097 with SMTP id ada2fe7eead31-6feef46c00emr1669075137.3.1780666710125;
        Fri, 05 Jun 2026 06:38:30 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413f91f22sm6619080241.5.2026.06.05.06.38.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:38:29 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-96387977596so670956241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 06:38:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/4RlOIokr6tQYKtP/7qbHwKsdUvl01FeSPUgDGWxtORRJz7YId3UR+UglH7AnPtJtKBcMFmOCYkkyijc1RpOvSGg==@vger.kernel.org
X-Received: by 2002:a05:6102:6447:b0:6f0:3c5c:76a with SMTP id
 ada2fe7eead31-6fede2771c1mr1647286137.0.1780666709130; Fri, 05 Jun 2026
 06:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 15:38:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBT7NFYCC-NrSxV7+Y1+76ZPc_ikGK5keRLCXEs-2_8A@mail.gmail.com>
X-Gm-Features: AVVi8CclYwL9WKaFhvlLy2AwgRj6jcLeq2B2Tj0Wg7PaSGMN4PnbodDRHC61qUc
Message-ID: <CAMuHMdVBT7NFYCC-NrSxV7+Y1+76ZPc_ikGK5keRLCXEs-2_8A@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: cpg-mssr: Add table-driven MSTP
 dummy-read delay for LCDC on RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33622-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C90CF64893F

Hi Prabhakar,

On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Per the RZ/T2H hardware manual, to secure processing after release from
> the module-stop state, dummy read the same MSTPCRm register at least
> seven times for most IP blocks, at least 100 times for LCDC and at
> least 300 times for RTC before proceeding with subsequent processing.
>
> The existing udelay(10) satisfies the seven dummy-read requirement for
> most IP blocks. Extend this to support per-IP dummy-read requirements
> by introducing a table-driven lookup, rzt2h_mstp_delay_table, where
> each entry records the MSTPCRm register index, bit position and the
> minimum dummy-read count from the hardware manual, converted to
> microseconds via RZT2H_MSTP_READS_TO_US().
>
> Introduce cpg_rzt2h_mstp_get_delay_us() to replace the open-coded
> udelay(10) calls. In cpg_mstp_clock_endisable() the exact register and
> bit are known so the lookup matches on both fields. In
> cpg_mssr_resume_noirq() the register is known but not the individual
> bit, so pass RZT2H_MSTP_ANY_BIT causing the lookup to match on the
> register alone and return the delay for the first matching entry.
>
> Add an entry for LCDC which requires at least 100 dummy reads. Adding
> support for further IP blocks with non-default requirements only needs
> a new entry in rzt2h_mstp_delay_table with no logic changes needed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -96,6 +96,24 @@ static const u16 mstpcr_for_gen4[] = {
>  #define RZT2H_MSTPCR_BLOCK(x)          ((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
>  #define RZT2H_MSTPCR_OFFSET(x)         ((x) & RZT2H_MSTPCR_OFFSET_MASK)
>
> +/* Dummy read counts as specified by the RZ/T2H hardware manual */
> +#define RZT2H_MSTP_DEFAULT_DUMMY_READS 7
> +#define RZT2H_MSTP_LCDC_DUMMY_READS    100
> +
> +/*
> + * Time per dummy read in nanoseconds, derived from the original udelay(10)
> + * which was used to satisfy the 7 dummy-read requirement:
> + * 10000 ns / 7 reads = 1429 ns per read.
> + */
> +#define RZT2H_MSTP_DUMMY_READ_NS       1429
> +#define RZT2H_MSTP_READS_TO_US(n)      (((n) * RZT2H_MSTP_DUMMY_READ_NS) / 1000)

IMHO this is overly complicated and hard to follow...

> +#define RZT2H_MSTP_DEFAULT_DELAY_US    RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_DEFAULT_DUMMY_READS)

i.e. this is just 10 again?

> +
> +#define RZT2H_MSTPCRM_INDEX            12
> +#define RZT2H_MSTPCRM04_LCDC           4

Everywhere else (DEF_MOD(), DTS) we refer to module clocks using the
sparse base-10 combined number, i.e. "1204", so I think it would be
better to do the same here.

> +
> +#define RZT2H_MSTP_ANY_BIT             U32_MAX
> +
>  static const u16 mstpcr_for_rzt2h[] = {
>         RZT2H_MSTPCR(0, 0x300), /* MSTPCRA */
>         RZT2H_MSTPCR(0, 0x304), /* MSTPCRB */
> @@ -113,6 +131,35 @@ static const u16 mstpcr_for_rzt2h[] = {
>         RZT2H_MSTPCR(1, 0x334), /* MSTPCRN */
>  };
>
> +/**
> + * struct rzt2h_mstp_delay_entry - MSTP dummy-read requirement for RZ/T2H
> + *
> + * @reg: Index into control_regs[]. Exact match.
> + * @bit: MSTP bit position, or RZT2H_MSTP_ANY_BIT for register-level match.
> + * @delay_us: Computed delay in microseconds to satisfy the dummy read requirement.
> + */
> +struct rzt2h_mstp_delay_entry {
> +       u32 reg;
> +       u32 bit;

The sparse base-10 combined number or packed index would need just a
single u32...

> +       u32 delay_us;
> +};
> +
> +/*
> + * Per RZ/T2H HW manual: to secure processing after release from the
> + * module-stop state, dummy read the same register at least seven times
> + * (except RTC and LCDC) after writing to initiate release from the
> + * module-stop state. For RTC, dummy read at least 300 times and for
> + * LCDC, at least 100 times.
> + *
> + * Instead of performing the actual dummy reads, an equivalent delay is
> + * added using udelay(), computed from the required read count via
> + * RZT2H_MSTP_READS_TO_US().
> + */
> +static const struct rzt2h_mstp_delay_entry rzt2h_mstp_delay_table[] = {
> +       { RZT2H_MSTPCRM_INDEX, RZT2H_MSTPCRM04_LCDC,
> +         RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_LCDC_DUMMY_READS) },

"210" (us)?

> +};
> +
>  /*
>   * Standby Control Register offsets (RZ/A)
>   * Base address is FRQCR register
> @@ -253,6 +300,20 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_priv *priv, u16 offset, u32 val
>         writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
>  }
>
> +static unsigned int cpg_rzt2h_mstp_get_delay_us(u32 reg, u32 bit)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(rzt2h_mstp_delay_table); i++) {
> +               const struct rzt2h_mstp_delay_entry *e = &rzt2h_mstp_delay_table[i];
> +
> +               if (e->reg == reg && (e->bit == bit || bit == RZT2H_MSTP_ANY_BIT))
> +                       return e->delay_us;
> +       }

Given there are only two modules (LCDC and RTC) that need special
handling, a table sounds like overkill to me.
For exact matching, a switch() statement with two entries and a default
would do.
For wildcard bit matching, perhaps you can use a mask?

    unsigned int mask = bit_valid ? GENMASK(31, 0) : GENMASK(31, 5));

    if (idx == (MOD_CLK_PACK(1204) & mask)) {
            /* LCDC needs 300 dummy reads, or 210 us */
            return 210;
    } else if (idx == (MOD_CLK_PACK(605) & mask)) {
            /* RTC needs 100 dummy reads, or 70 us */
            return 70;
    } else {
            /* default 7 dummy reads, or 10 us */
            return 10;
    }

What do you think?

> +
> +       return RZT2H_MSTP_DEFAULT_DELAY_US;

You might as well just do the udelay() here, too.

> +}
> +
>  static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>  {
>         struct mstp_clock *clock = to_mstp_clock(hw);
> @@ -312,7 +373,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>                  * register, we simply add a delay after the read operation.
>                  */
>                 cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
> -               udelay(10);
> +               udelay(cpg_rzt2h_mstp_get_delay_us(reg, bit));

In this function, you do have the packed clock index (clock->index).

>                 return 0;
>         }
>
> @@ -1142,7 +1203,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
>                         cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], newval);
>                         /* See cpg_mstp_clock_endisable() on why this is necessary. */
>                         cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
> -                       udelay(10);
> +                       udelay(cpg_rzt2h_mstp_get_delay_us(reg, RZT2H_MSTP_ANY_BIT));

Here you don't have it, but idx = reg * 32, and bit_valid = false;

>                         continue;
>                 } else
>                         writel(newval, priv->pub.base0 + priv->control_regs[reg]);

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

