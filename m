Return-Path: <linux-renesas-soc+bounces-34131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HpGwFTJyMmps0AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:08:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD96984B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:08:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01A1831242DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 10:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3577F3D565C;
	Wed, 17 Jun 2026 10:05:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A003D34A0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 10:05:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690706; cv=none; b=ZVwPY+aIqfDZZ7iFumyG8RSMRFm+MVRn4nqGz8PTyMTvwL7w60wokCtS/89Q0GcXLlrGGy6R3BvCkYORlTKfGRLd9SI5o08eHR6oJCwRbG/z7MwyLO1th9yeopmnhWHGB+YkLMMxcd/EFjg+Hi4gPxXVRs/vbaNWBevTDWUg3Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690706; c=relaxed/simple;
	bh=05HtEekKnLhODQoM/NJU1MleMJk27P+YZTUKE2RwX2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwgFahg9u3DubZnZLDJGbp+JFMZBtJAE8dAsSNtT5CTxAG4ND6RGhLBiLglrTSOZDtQc8osllXj+6wVkmVdKpsEnnpfYnGyUyTwOIA9myk47+BVVf7eYRcA10/reisWsgB7R/8A81RGUWeJQ92nkqa53kQtC4ztoAJiQ+oqin0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bbc6c99c3aso204289e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690702; x=1782295502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/+25ljVbrV0cFHF02tOeYF6TAhfGn2KQZp2f/CD5R4=;
        b=T34+JxTqOTYsUNNsF0Hm2QRXRZJCMPCeta5UKcIxVkkvZEJWFKzdlUraBlccmg3loO
         pCmFJKj5ThSs+QDGNJN9h+kPMP0ul35sVVia6dQvAgpu8DOZm3OH2BE0zq5MTr+xLjtJ
         B9a7GTLMZabEIad46DrtWsIWlVkefGYsBVxFMcOsEt/QOo33oJJoHhyAIM+9VHo4VIUd
         SGZVvgn7AhfNZUfxFCDSmenU3FXpIu4EaYm7FmETA/XRUNBW+ngbjyoEH+fLwH7cmQjy
         xceGrTOgb8/AmIgtegU33fJOc9nsuGnkl+V+nftSGt4N6m3Ae2IKrnCwRqCLjz4JnsSA
         871w==
X-Forwarded-Encrypted: i=1; AFNElJ+KICOAHxuImrCyhtXOem4jsQd2yNn9XqlF32EG/v/q7eUCt418ZzOnAGnk9uFWZ2At52JK2iAw1wMOa00aaoceow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYUaK8YNiVjHMzNZzOxgHrFDGBO5LpLedTYX3J3dSjQoQxrBij
	RCT0jcNz0UspEry4GCOUBnrO64kcc9VCpml0ejrfOwFWDGCG9Ec/mk9kefiM7Cq5
X-Gm-Gg: AfdE7cmuiraByhgo/x5PLdsKgdaVU0ZkEojwzc8azwHC3w6C982zrYheH4iguMsAg7S
	JYPRdnXQrShrSIvTDtcz+P0r1P+K59h3snyFRd8Hk5erWzmJjsygLEG62eyw/g0WB14HmU4ww0B
	ocYHGDwzTe4QP1zPtugPEl4bizEOHjUwTIAbZ34b+vnWLZXNJkC6EIQ9PMpHASX4Kj5HcgiL+WB
	285n6+MbmTFZxW9ycs+RQ561lJaV4s9VY6+XjFhCKHrGkjt7XhmY14KCtjXGrs13vgRfd3jrFVm
	4ns+ghPzs5ziPnsW3rczkPwIsbQUqN8uZEjPAzlMBvYZzcaa87xdLEJyOPdi7Zka7lKvyAKMChr
	WCZsVOb1PY0Wk1IvoDORiHw+UVJY8TBkxphE0VNXkIeYrkZHACuogBDUUFm0cmEu8FcazsUiWws
	l36c/rzg32o3tMPw4WfuCzMfFCgZEFa9IYYkZWQhugJoGhQwW5Uw==
X-Received: by 2002:a05:6122:45a7:b0:5a0:3d17:f939 with SMTP id 71dfb90a1353d-5bbbe682d5amr1489538e0c.9.1781690702337;
        Wed, 17 Jun 2026 03:05:02 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901ac206sm8009925e0c.14.2026.06.17.03.05.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:05:01 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-963a7e48493so3755923241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 03:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8eN63tZgTiWYA+If/fN5ce0bxMTjjw8w0peANj4cUa6hnd0yzV0J/Kd7Zz8RhJ9dmQMgX836ZoxhI7Y5HVi0f2OQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1513:b0:71e:39e9:ce5a with SMTP id
 ada2fe7eead31-7246d11266fmr1475284137.26.1781690700505; Wed, 17 Jun 2026
 03:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
X-Gm-Features: AVVi8CfvzgARP_H_QUsETrMu4OFV4lGTR_oJF8-LhQSQALrUoXJKUkxdtqOFv-s
Message-ID: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation
 math into a library
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34131-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCAD96984B9

Hi Prabhakar,

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move the common PLL and divider parameter calculation logic from the
> core rzv2h-cpg driver into a standalone library file.
>
> Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
> rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
> rzv2h_cpg_get_pll_divs_pars().
>
> Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
> driver as wrappers that call into the new library helper endpoints.
> These wrappers are maintained for this cycle because they are actively
> referenced by the DSI driver; they will be safely removed in a subsequent
> cycle once the DSI driver is updated to use the new APIs from the library,
> preventing cross-subsystem build breakages.
>
> This restructuring allows other Renesas SoC clock drivers, such as the
> upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
> divider mathematical logic, to share the iterative calculation helper
> infrastructure without duplication.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
>  }
>  #endif
>
> +#ifdef CONFIG_CLK_RZV2H_CPG_LIB
> +bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                           struct rzv2h_pll_pars *pars, u64 freq_millihz);
> +
> +bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                                struct rzv2h_pll_div_pars *pars,
> +                                const u8 *table, u8 table_size, u64 freq_millihz);
> +#else
> +static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                                         struct rzv2h_pll_pars *pars,
> +                                         u64 freq_millihz)
> +{
> +       return false;
> +}
> +
> +static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                                              struct rzv2h_pll_div_pars *pars,
> +                                              const u8 *table, u8 table_size,
> +                                              u64 freq_millihz)
> +{
> +       return false;
> +}
> +#endif
>  #endif

What about just dropping the old functions, and adding two simple
compatibility defines in the header file:

    #define rzv2h_get_pll_pars rzv2h_cpg_get_pll_pars
    #define rzv2h_get_pll_divs_pars rzv2h_cpg_get_pll_divs_pars

That way there is less code to change in the next phase.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

