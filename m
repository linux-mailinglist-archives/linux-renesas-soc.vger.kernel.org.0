Return-Path: <linux-renesas-soc+bounces-33629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v0D4M6njImp0ewEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 16:56:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016E6490E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 16:56:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QDEG+Jds;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE02306B7CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 14:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBC03D1CDB;
	Fri,  5 Jun 2026 14:45:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A373D25D3
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 14:45:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670705; cv=pass; b=eLNKmabAlwy0jbEONHQlWPFh08icTtJEHy52Q38jtQ4OTA6uR6aq2muH/P5dDQCBmapraqsNzvZ5c+9NFRo1Fs+wD6stpCu/O9KvhnuJ8kDqf1RjAR0wv2vzxSeCevQoUCDkbx7VlAtgLX95auAziq/k9kochhHjqNuQUOi1W7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670705; c=relaxed/simple;
	bh=V99FgU+T9GXepKQjZbwcvobP8EXHRxrvdmdHmWGWLss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d99rhLC6TV1+S7we2w5PESp7nAnasggH7/PANfjpcAJ7R7yC6xkIKMSy+Dp8kAy9Z/IqhZspdFhPqhp5PDlbiInBpV0aZwoJdVW6sBqsnKD0bR3XcU3WqrVAf9RLyG7XWq1+EpOBtT0k3FGvav4cD7y+iVNoOUzofZvgAhQmbsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDEG+Jds; arc=pass smtp.client-ip=209.85.218.42
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-befd83e0521so617771666b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 07:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780670700; cv=none;
        d=google.com; s=arc-20240605;
        b=DImH3EZEtWS0VbUett7nLZDdjEQjBpbUqJvCcvMhUO2fN/e+0eOfReIafjaLq07ojA
         oJZ/wNOITwV/5UUQr545R98ibQPHsylmwJlencBhIPuucc4gwh+bUiAD1Kgj6cOKM835
         QtjFHN5CO4hPtyRm8pt2acdBS0TQaa0dr2I3fccB+2VFWNHCGStyngOhR7RN6nYIiodQ
         GnGBVNY712/kZKsN0Ty8/MmEH22bFxePBYPB7lu0s6L0G5YzZcaD2IPz8YXSyGDll2+F
         VcMhEmj6p5cHGAag88+shSsCfMz0bDKppnnlVASXKh+zxIrENGgpHMtllgkbQpbJYgf0
         rUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        fh=Ubqb/M9lDud9DV3lLB3tS36Q2rjRZa5VivZwSH3N51o=;
        b=iJ9gfBHWj7BubjMbgmR9Nz/b7u984YWix06sYyiW/23w6YCcLf8AJY5fwD8HxKthYd
         Nu0VRNlwCU6kapcKv4cSDbm6jS76SFfuFziQl0IW8V4U9KQNdYmjZ7DCrr+0emgwUNUb
         8828D349l1hXRSVpbJvszwOWoRLzweCOUIGFg2xIue0CWAMhceIONabcQqtHg8xfgCBT
         EKfImph6P9cATLZTpB6BLagEHGUBItNfxCJVgBDz6gMuCGnW5YpCOQqdPz1KdQGLKFrN
         KFCa2OuqpYyEoHgCB3SVgf/4epo8RyxgIxrSxwpQ7qm+KWs5CiwdXyfsTg5GB0aZaxe4
         jbZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780670700; x=1781275500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        b=QDEG+JdsCi/nGhsGKHWrmakZCAAAKH94mJTgHAZsugCteBQLJ25F//75ar+srWpCPd
         4A44v/U3CUW6nqTQRd/qKB+M+kFmeYbE9+nlRqymKwDmadGXMH6dBGJmZdWsAmVxrAT7
         KQDiapY7mTQSL0SPpNNwC/gfnu5wSLuXrg8ImJufJh/kr6HXBKRo/DFW97P7T+zTTvvH
         TkDi9uk8k2lvgiv36m4CuHV0WEy+hy7MPDtcbXT2e8UbponLrOXhgjoSA2oV1gzmuamT
         4TGt6CiJV/ngqyzr6vxhrNQYyd/D0/IeX/v+xbt9Emomtg/Slf1iJYdzIdejRULLkKiu
         rlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670700; x=1781275500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fcZIkbRV/9Yp73cfd2Dm5cvs461vRsgl4cer6irrsmM=;
        b=hPo2svyrkr2LqO/61Z2BFoIn9BREOtJRpqNCQW6KbB2iqRtEENtW4NLcQRn3HdIt+4
         T4fJo7WLytS5qjNwZS5JcqcPD0xsvdZKM3vdoF15y9Aak9VgjDSybxvHcwLsWQdOZfa3
         H0dbDT2Cgkjzfa/z+TyAjyO+eG5EWSq6ZVLFesOEUNRqDoQWY1ztMM6EyIillzP7anDa
         ADN5ehBLoXJfLlFMb/vd5vvZJbGZ7qTCvhMyfJ6aUu5E+K2fWg8FeCacAphVWH4UH5a+
         xiYb/znvRlVUGU2xLCewU35WV71CWwdsGHq47OeFcQQogbLJPwGcPfpjn3C607gDPzFJ
         6Oaw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ndd+w7Cw9PmXREBvRDURm7O09qdIbGEb/rS0reKhJ8daB4oZZ7+WCc0sfCFqVrSi+eoYViO5rt96M+9FvrpRvtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZIFjrb55lhmeCtNojUihyZEQEYrOG+7luzdeuL8kU/bYibLi
	gW0zf1R9AsaHUXU8ayxlc1ozvftkjR+059z5ToNtbAuFA3/qXdatWQTmWJ8Tt50eTcq5b0d3sTs
	+Ki9zX7BIYum3Bd0ZGSSBEJAbEe5+FlQ=
X-Gm-Gg: Acq92OGmMRc17DqEMlFKhhErRzXCW0/cu134ChyFDv2Mr3zKexY9O1z7jAZBHgF0ppG
	Mv968UgODibPgTyWKEI/qHcA3T3gG3783nfgtNRWJuTxe3JyKVjh8ZBv5CiIF/62rdzm4nld4lW
	/6UtF8/h27moGW4gf8DPwsHhuq1cP9G3KQinUiTf0FoIGLFgSlszUvRN28tB/BN91lyGf0p5Bfm
	av80aDlrQXXs4Hnahx+C/E4+pYbbCMbS4MiaUQ0k8tBbfbz4WjaAQgh/uHe67GCNqx9xI4HEGdu
	cAlmM4E49xFt4hh61elP1rg2iLJxbwj6o3tJrNn1V3sy/1imGc2ntqrvglcfzXRgVuY4C0zGvWp
	5+A8=
X-Received: by 2002:a17:907:972a:b0:bdb:5c26:d499 with SMTP id
 a640c23a62f3a-bf3a8a06e97mr148149566b.22.1780670700008; Fri, 05 Jun 2026
 07:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
In-Reply-To: <CAMuHMdWVjvdX2Ve-Sf91oJoCWcO-fF-363ytO66Pr=SBA69N+g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Jun 2026 15:44:32 +0100
X-Gm-Features: AVVi8CcZWc8NSzDAQ_aVku7QXQXrcmHdaazPbFgpm7kgo3ZnjYI1QxUBkTayMTw
Message-ID: <CA+V-a8uYEOB2DcOjQ63hLDW-vYxGLTpphvDXyAwV3g1-GrHhgA@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33629-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3016E6490E7

Hi Geert,

Thank you for the review.

On Fri, Jun 5, 2026 at 2:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Use a per-SoC PLL reference input frequency for PLL parameter
> > calculations instead of relying on the hardcoded 24MHz constant.
> >
> > Add an input_fref field to struct rzv2h_pll_limits and derive the PLL
> > reference frequency from it in rzv2h_get_pll_pars(). Fall back to the
> > existing 24MHz value when no SoC-specific input is provided.
> >
> > This allows the existing PLL divider calculation logic to be reused
> > unchanged on SoCs such as RZ/T2H, which use a 48MHz PLL reference
> > input instead of the 24MHz reference used on RZ/V2H(P), while keeping
> > current RZ/V2H(P) behaviour intact.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -242,6 +242,7 @@ struct rzv2h_plldsi_div_clk {
> >  bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> >                         struct rzv2h_pll_pars *pars, u64 freq_millihz)
> >  {
> > +       unsigned long input_fref =3D limits->input_fref ?: RZ_V2H_OSC_C=
LK_IN_MEGA;
> >         u64 fout_min_millihz =3D mul_u32_u32(limits->fout.min, MILLI);
> >         u64 fout_max_millihz =3D mul_u32_u32(limits->fout.max, MILLI);
> >         struct rzv2h_pll_pars p, best;
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -53,6 +53,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * various parameters used to configure a PLL. These limits ensure
> >   * the PLL operates within valid and stable ranges.
> >   *
> > + * @input_fref: Reference input frequency to the PLL (in MHz)
>
> Iff there is a default, it should be documented here?
>
Agreed.

> > + *
> >   * @fout: Output frequency range (in MHz)
> >   * @fout.min: Minimum allowed output frequency
> >   * @fout.max: Maximum allowed output frequency
> > @@ -78,6 +80,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * @k.max: Maximum delta-sigma value
> >   */
> >  struct rzv2h_pll_limits {
> > +       u32 input_fref;
> > +
> >         struct {
> >                 u32 min;
> >                 u32 max;
> > @@ -156,6 +160,7 @@ struct rzv2h_pll_div_pars {
> >
> >  #define RZV2H_CPG_PLL_DSI_LIMITS(name)                                =
 \
> >         static const struct rzv2h_pll_limits (name) =3D {              =
   \
> > +               .input_fref =3D 24 * MEGA,                             =
   \
>
> Why add this if 24 * MEGA is the default value anyway?
> Why not do the same for the two similar RZ/G3E macros?
> Perhaps the default handling and the RZ_V2H_OSC_CLK_IN_MEGA macro
> should just be dropped?
>
Agreed. I will drop this change and get rid of RZ_V2H_OSC_CLK_IN_MEGA mcro.

Cheers,
Prabhakar

> >                 .fout =3D { .min =3D 25 * MEGA, .max =3D 375 * MEGA }, =
       \
> >                 .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA =
},     \
> >                 .m =3D { .min =3D 64, .max =3D 533 },                  =
       \
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
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

