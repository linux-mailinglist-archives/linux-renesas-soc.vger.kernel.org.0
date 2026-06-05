Return-Path: <linux-renesas-soc+bounces-33621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hO7LEKzRImofeAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 15:39:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5280648965
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 15:39:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA2B33017093
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 13:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4FC2D73AE;
	Fri,  5 Jun 2026 13:37:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF771F1534
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 13:37:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666677; cv=none; b=HGFipE/l6vdhh8Zu7bLPX6CMqV6jGa23ACrpzuXTmECT2vHxvS+4U5Eq/kzJFW4RM4NksB2lCTtdu/fu3AfUhSb6aNk2pQhLaH6CoMAuKeYlx/o3J4e7RAzqjMTllXDEPo1/hqxVul01BWlivokPuq0RoxwuvWFO82Iz3FZmLf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666677; c=relaxed/simple;
	bh=2aZEH0J2VU5XhjSzChfxXZtpAytXZoxQRRnO59GhRp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpzBpy0jm3AUtf0YOWue8uPeOcG0IO22QXKfFMPb3VkulFnJqT2UGu8Avq1HrsKb50VubQMpsACIc5rrtra4V2EDOVu1GFh18So7f0JSHfsT15zr6BKSqIa9vVe8Mo6NtGSBRQk6R/A/N28+NIairWeLDKHF9cXJ9EPq4FfIJMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59e23d70dfaso642028e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 06:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780666675; x=1781271475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mbWYv3/oYKk7SXXBsDpY1xgHffMAZJ0Tb8VCAbQ5qE=;
        b=DUKiJZhp+GtQ1UiniqZKdQ8I2FFrFfMLBEZIqy+1fZlqrelS7S8Rrl0S8hKZWSygnR
         MqpNM+0+rS9AwR3BgBHumCvtu4HelVqCT9Hya4hVjOuERRJDNyNFV1XDp9KfXbaWIFAJ
         C36+nxl0VjQmCxQ2wFhiCI1kmg5vTuOcFbUUxdu76mm1NdJOK+xuVpbTwzNK54K7KV3X
         o4Z0syFlczq/a0j3pTriH5yE5NQWrnpT2o4znTHJRgmMcdofZppgTsLECBpTZ0MipkjT
         o3TYP/9kP92I9Crme+VrCvEVDhFCxD2RIcnmr7qWLhEInO4T0QaNcT/HEyjUinuFByC1
         e2vw==
X-Forwarded-Encrypted: i=1; AFNElJ8HqjgnuPu+KXWQnmL0zzMyfKAlYC9L0NEg+plBhyqxDXFEsj/Q80dJ6RbsMbqn6S3c6DqqGu1XI6IwPPd29RQgBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6NJA+lPk6MJ867T9IJ5PIKzu1ZUpxTGqbbwqJ8huw2BB7t1ue
	pYuEj14WN+jOGJ3eR3Vj0GQLDf14Kp5cTdSTwxrUAOpZ1y4xJNKKHWZADGc2kB8p
X-Gm-Gg: Acq92OH9NcpZbx4+qNHobyvTqpCr0VshpluM8yTz8ongMeJYtQFvWdpsEswI0g9izah
	mMGu8x9b3qWRgxy8nnpPP7Y69Zzj3qiT3eIRo5hMtvlbhGc6y3p2dqNflmOuQKch7Nk2jjrYQE3
	24gG3tmb4KAM3q1Wcz2FjrSzhJQ6BjJKY2okLbzMJ8XC3+l7HnUGr/1q5wk4Vmqyp4G5S3z4q4k
	PrH5sURPLeiaS/TBmaFDGHnqh2+WhH480E3tIZOMIR1LszSacSgAwFHwijgPFmLkZD+mpi8Zva7
	99PP3g86WSIRdf7eVuMwbBoBmEsPsl7+EhU8Bjyf899PyO23/EaBFySDrkV7UY1cK9CDyG8Xstp
	NBzavHRQuQBAvlZrQacmMJZassQIYh/6SoyyFFvoWjgcsKrRDeZMdnJt3JsQyOdSekAeBp9isDB
	Uz4shqWIRKTTfDfIRXkQMSKDBzVwFvxO/vcsX0a12i6Q15mo96/Ya9ji/kAAVnVpgccuIISWi7p
	08=
X-Received: by 2002:a05:6122:d87:b0:59f:8ddb:2fc1 with SMTP id 71dfb90a1353d-5ac55be8a83mr1569695e0c.7.1780666674948;
        Fri, 05 Jun 2026 06:37:54 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dcc2ecbesm7191040e0c.13.2026.06.05.06.37.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:37:54 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59e23d70dfaso642008e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 06:37:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+HX96SP7/07/RlcfMnmbeZKqowkzv2ID1bYst52PcaIzq27ROKxNJQk/LahJUKZOTVby00ho7kvlehPxT83k72/Q==@vger.kernel.org
X-Received: by 2002:a05:6122:4b05:b0:5a0:9ad4:7016 with SMTP id
 71dfb90a1353d-5ac57e02261mr1463187e0c.10.1780666673234; Fri, 05 Jun 2026
 06:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 15:37:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
X-Gm-Features: AVVi8CftNp2l3YTCG72NkTVwV1FmtccWLHXsNjSPXXHE1Sq7KdRdjdvppMf_SNw
Message-ID: <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33621-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5280648965

Hi Prabhakar,

On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Use a per-SoC PLL reference input frequency for PLL parameter
> calculations instead of relying on the hardcoded 24MHz constant.
>
> Add an input_fref field to struct rzv2h_pll_limits and derive the PLL
> reference frequency from it in rzv2h_get_pll_pars(). Fall back to the
> existing 24MHz value when no SoC-specific input is provided.
>
> This allows the existing PLL divider calculation logic to be reused
> unchanged on SoCs such as RZ/T2H, which use a 48MHz PLL reference
> input instead of the 24MHz reference used on RZ/V2H(P), while keeping
> current RZ/V2H(P) behaviour intact.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -242,6 +242,7 @@ struct rzv2h_plldsi_div_clk {
>  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
>                         struct rzv2h_pll_pars *pars, u64 freq_millihz)
>  {
> +       unsigned long input_fref = limits->input_fref ?: RZ_V2H_OSC_CLK_IN_MEGA;
>         u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
>         u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
>         struct rzv2h_pll_pars p, best;

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -53,6 +53,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
>   * various parameters used to configure a PLL. These limits ensure
>   * the PLL operates within valid and stable ranges.
>   *
> + * @input_fref: Reference input frequency to the PLL (in MHz)

Iff there is a default, it should be documented here?

> + *
>   * @fout: Output frequency range (in MHz)
>   * @fout.min: Minimum allowed output frequency
>   * @fout.max: Maximum allowed output frequency
> @@ -78,6 +80,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
>   * @k.max: Maximum delta-sigma value
>   */
>  struct rzv2h_pll_limits {
> +       u32 input_fref;
> +
>         struct {
>                 u32 min;
>                 u32 max;
> @@ -156,6 +160,7 @@ struct rzv2h_pll_div_pars {
>
>  #define RZV2H_CPG_PLL_DSI_LIMITS(name)                                 \
>         static const struct rzv2h_pll_limits (name) = {                 \
> +               .input_fref = 24 * MEGA,                                \

Why add this if 24 * MEGA is the default value anyway?
Why not do the same for the two similar RZ/G3E macros?
Perhaps the default handling and the RZ_V2H_OSC_CLK_IN_MEGA macro
should just be dropped?

>                 .fout = { .min = 25 * MEGA, .max = 375 * MEGA },        \
>                 .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },     \
>                 .m = { .min = 64, .max = 533 },                         \

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

