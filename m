Return-Path: <linux-renesas-soc+bounces-34179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CPkhN48HM2q68gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 22:46:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E4169C683
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 22:46:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DT7t0EGd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEFDA3057069
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 20:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAC93B7747;
	Wed, 17 Jun 2026 20:45:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC6238AC99
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 20:45:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781729142; cv=pass; b=IOSymJ+SEmaSO7J5TKY5BVGe9QFk67PKBDJ7Pk2lnWecdPwA58D7czcKT3XEwriOSZnFNts02gztD6xPFaSGXTQM8gI0Mw9o327tZktuAazodF3XuTbIk1sJMIUmRd4FLn76O7Hbn6paTFpWlnwqTb3Sz8xczgGQsJXS5ey1pKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781729142; c=relaxed/simple;
	bh=8a/iR0PgeZPtVkzSIzBEbGfKE8M5iGI/7dK+r7riu/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcCFeF0yidLErHkRU11U5LyDqvBhsFDVNmJssoaVJRGT74ivCnTXfaOARFfXS3W48F6pBPbF+jl8GET4RR8dfblQCAKp48JXw3Zymmmbg0ReUPhTJptLDw6CDefqOhY1HTGtAdnj2DnKNaKJkBqu+ymcU/v1lR4JzR+IhLsw93Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DT7t0EGd; arc=pass smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-462cdb88d01so124028f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 13:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781729139; cv=none;
        d=google.com; s=arc-20240605;
        b=ghylczGXI6zCTWzv8dil2QWlAdja714TyLcVyzTTrTg8GKvnYzi5NweXGIoTVR67X2
         nyxNYRWlf/WkCxVZn+wDVGCG3dmZ9GwUgA6nUjR/IiFQnJHpDhPSASYiBjk3yKbNeRYJ
         S5cHNWKhk/sbWp+1coNx0ytrw9s2RROe0L4ItmSwWd5zgmMSZAgkekK63aa64OHoSoMB
         PpbMXqW6HlCJkgzpXDGg4v/XefaVV4f8zA1lUF0CH/zOlN9JEsPYMPj5VGXl5DtiuRXK
         8QDHcHND1YWnUqC/MG5GHzSKvczAXre5fMNJM1fBp1UtoH3yAKLLBzcj1OQGuDGJ76gB
         Waxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        fh=zfqcEFYwShHvpcTPCrsP9bLHIIPkbm3e11uTNvOla2M=;
        b=K0nUINUPAzPMu8P2ubhgHExgdzBz2oAYOE14jx9qV7BGgqHfDvJo66rD19peVSFWZ/
         yspu1W2ZKhxNDRwXXnQe4AGCJOKa9Z5oVgH6Sc0ARvRi7Qr5akNTQI+8M6tmiLnk8cBQ
         V4+a9L4Pe4VEeCuShn5gtwuCYaqHF8lFLJ8N1B8/lKMeq60szbr6W4nVEYYDUKRhS2mw
         IKpDBSA7b7MFTatK2ii3DdeqoLTDVFMYhEi1oF1vCsncHQuuRFyUHgn98eBwNp4VfSr3
         LVGH4W4A07A//mYcdiRTFx0ZpN0UgJsU1pNRsVEVkkf9HT2ZdO5iXDwL3uWVbO7aAnbd
         UzKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781729139; x=1782333939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        b=DT7t0EGddQ6oq5WJ7ix/vWnJ7EGtcz6PvZmYmAXQKsabmw79lUMDNz5YfwKw5LLT9Y
         UH742BBlzFH3EZ2CxXyqIqjl4uEaq1v19Uhwh6olsl2PClKPSOuiBDvYirFPgxo8Nev/
         L1WnJkdp6lTyLN4Z404c0VZUkh+pp5Wfx4Swtuj0l9KFpbt7CEJz4+st0yBw9PT69Mcb
         uWz6cvL8n8hcWmU06fjEWv2gl5Tvavgnl+f3cji8fFH05wtagvLsMwSD3B9UqXcZIH42
         14XdGM1JMQ7pHQukxnZ5bREgzhMK7tWLqn6wz32dQE5eCEOTABbedjtw30DZSjMKxrGv
         5Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781729139; x=1782333939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tOxpa5RlaT10x/M9xWFJdAC7kk5hOTrDuX91QFFTTi8=;
        b=SGZ5TUypUhIlLGaGp0PQTQ9q8TQj/IE4V22756/q6yHF+WzEIMi6QmXEdJfusOXuCr
         sDyLZ2iklFFprrfWzVUL7CkSA5YgxM/rZfsFXl+Zf8EvtkIMMjdkPxtborQa7zN1n7oA
         5Egp+RkeE3tNIm0lxRhGlMQNXHVHp89onQGx5INN/G2zJSyJOGZhP0izjzkAin+V80Oo
         NAHLzEiXxLJ8KoT04ZknOEjQO/PY1rd1klVlby+XAWjmv+pFLdm+57PUhnwAVL6tMfNT
         u+3BArXBKRLLHZHOHDJxMuTcrfuFSk6RRrMQBXztena+CWNCE9sVzRHvMD968tszjyjq
         EbEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+nCMT5SKt5mFu74FHVd6qmmV2c0ZrWxH2/9AZnf6vHiG7mWZAZG56kKxpZI9VEfXQQ2beYQM5CuQYxNJgtK6lMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyemMwJM8l+NrpFG8WgcPUgIq2FwoITqjtOvLKmbcsp77VA6tM+
	0xtyjGFk2csA3r7oiel/EXXKhVoBR4wzJU32vpw9c77b7ngxYj3uOU6Zev6JqofPp4undbWh2hQ
	WJnSFyN3KbEEVmpsLeQmsH3hjso91ea8=
X-Gm-Gg: AfdE7cnPWNigYSvjHpBso5971f32Ev67P8DHRtE3k9/oLm92hIwzV3qTR+h4SWlaHIL
	cpWRduIpK1rijtolCkonZoCK54czRRrnRzcIAbXPnkdwKHCyWWeK707OB7tPqM940fbr7qNOYQO
	0ysnyem1sn6z2nY72ouEFqzORFB1sgvQBIC8WWv/UN9zGuKYNa5cd0ci4NwVPugsmOTGrRHCxHJ
	Qfu7Lxbzlga9nHCSLrV9Of3jIZEVAlP68wj1afmTOLolt7pp13OS9NcanGlphBeExTWcLG79exd
	skRfm8mI/8iA/VWQBouGyZYo+l15Q67Gp6mytYuxJqqotj9kA8TzV+hxTec=
X-Received: by 2002:a05:6000:4712:b0:460:11a7:f82e with SMTP id
 ffacd0b85a97d-463968566c6mr1731610f8f.8.1781729139388; Wed, 17 Jun 2026
 13:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
In-Reply-To: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:45:13 +0100
X-Gm-Features: AVVi8Cdkf1jVo4kO3gd7API00mVvh1fcU6060AgvOUxLid7Szzq8x4Qi-iPfzo0
Message-ID: <CA+V-a8t9b-xi-bfBs-rp8eZOS+TM8OVLVy44S19fPFZjRKT3Lg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation
 math into a library
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34179-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40E4169C683

Hi Geert,

Thank you for the review.

On Wed, Jun 17, 2026 at 11:05=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move the common PLL and divider parameter calculation logic from the
> > core rzv2h-cpg driver into a standalone library file.
> >
> > Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
> > rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
> > rzv2h_cpg_get_pll_divs_pars().
> >
> > Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
> > driver as wrappers that call into the new library helper endpoints.
> > These wrappers are maintained for this cycle because they are actively
> > referenced by the DSI driver; they will be safely removed in a subseque=
nt
> > cycle once the DSI driver is updated to use the new APIs from the libra=
ry,
> > preventing cross-subsystem build breakages.
> >
> > This restructuring allows other Renesas SoC clock drivers, such as the
> > upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
> > divider mathematical logic, to share the iterative calculation helper
> > infrastructure without duplication.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const s=
truct rzv2h_pll_limits *limits
> >  }
> >  #endif
> >
> > +#ifdef CONFIG_CLK_RZV2H_CPG_LIB
> > +bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> > +                           struct rzv2h_pll_pars *pars, u64 freq_milli=
hz);
> > +
> > +bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits=
,
> > +                                struct rzv2h_pll_div_pars *pars,
> > +                                const u8 *table, u8 table_size, u64 fr=
eq_millihz);
> > +#else
> > +static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limit=
s *limits,
> > +                                         struct rzv2h_pll_pars *pars,
> > +                                         u64 freq_millihz)
> > +{
> > +       return false;
> > +}
> > +
> > +static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_=
limits *limits,
> > +                                              struct rzv2h_pll_div_par=
s *pars,
> > +                                              const u8 *table, u8 tabl=
e_size,
> > +                                              u64 freq_millihz)
> > +{
> > +       return false;
> > +}
> > +#endif
> >  #endif
>
> What about just dropping the old functions, and adding two simple
> compatibility defines in the header file:
>
>     #define rzv2h_get_pll_pars rzv2h_cpg_get_pll_pars
>     #define rzv2h_get_pll_divs_pars rzv2h_cpg_get_pll_divs_pars
>
Thats neat!

> That way there is less code to change in the next phase.
>
Agreed.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

