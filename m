Return-Path: <linux-renesas-soc+bounces-33691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YrPCAHYZJ2rrrgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 21:35:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741A65A17C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 21:35:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TrscCery;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77C2630265B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 19:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F46B37DEAA;
	Mon,  8 Jun 2026 19:31:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD03E5579
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 19:31:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947105; cv=pass; b=tfcOP0TQWEgDF5Gx0ji3tsRh0NTbiV30Om07FK0j0rQTD4iCoLaq8ZS7uOVTQcwKhFkOKM9mn/WuV5dVuyv8rCfFyh0pqFlwsBZh6zyG8JgPsVpJD692+8/aDVTvXAxTO6b34N7X4q3DmMXFuULCoJWXAC99eTocc98mzQDHwL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947105; c=relaxed/simple;
	bh=QHbHk0ExXgTj9Qdazczm090dMKoR2Z8xMtI7oSBa7UM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZry6kHOby52xanSGgepw/gFQuWjFRm7HaYjZnIH7dY+c3fyz3A7DIsXMIyacxwoEEnlXIEiuIS5+V1d3CfC0yjxm7m28wK4GTGpD5w0VUqOtsARk9GjRPys7yH6epGVXi+gqj5PepOn3MXJyoL8zWtU5O7q53NWyCW3d3yChwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrscCery; arc=pass smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490be03d47bso40257685e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 12:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780947101; cv=none;
        d=google.com; s=arc-20240605;
        b=WzRgsPaxvDxWxLlf5BRZKoiWWGKy0qd3CJ4KIj4y2cfyX67QFB7SWfZmKVziNWs1Ef
         4CYQQcr+iKKithHWfq9lhHudVpSwWqwMwl4ItP4yzi0Zr/b/VfCXQNd7U6htpwefL5it
         Tz8chcnQIU6DVvU2FjNUj84VADyjw0IwQYF3Z9Y84Hem4CxYpa8g8PkZoMzRwEKLNmIb
         Cu5vx62xvom/J/do7RJZvZDZKV6DYP65X3OGN9taEYIi2ukz9Rpt8ToEpEAbmE5ZqwBo
         p2XpmNX2rVMFJegsMNGqe3cxbb2o88Clhzugs/4kHlEmO+2cfpPqAz3hY3gP7SYcG3gb
         edgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVyDzm1G+RBPdq3mhCM83rV6JUo3raqutBJmohxBAns=;
        fh=h84/L8+Q2Vy5uh63bMIXmuMNfktpOa8iDJqK2ofMhy4=;
        b=WL3V6qAIOA3pX8HakcEAuPYqKKPhmyv57E029s53mtHJ5gBH0v9gFrYXpZCEp+u4vQ
         46UjQdUgpN3C3W7WOIjfNXlIaaWAP1b9Kvr73KakK7HcSuWMiW2++d2fXhXlwj7k95kp
         dywyJnT44QDJqPej6DTULxD26PUkz5mxYLz7NHqjEeNvfDYwdC5sleg6WU7hkVQBQSid
         bKp0CGeCJyGC7YAr9/IUIWMCdq7kMZwMeSYBHK1ArRL4RORfmtE1YLuAWomsL2M5TN02
         yo7QQfFM1E9zEi56803wv5WKfAdHvypqvaLF5YccdowkaJnPoOlmUjl5PNFjCkyA5EB3
         mD0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780947101; x=1781551901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVyDzm1G+RBPdq3mhCM83rV6JUo3raqutBJmohxBAns=;
        b=TrscCery0NjUdza7NsRWyHqS2EjsD98z1d5RykFY5DumcDSfLzVkm62ZSXCpoMmCMZ
         tUYgUlc51fZMylt9o6Cau0x3UX7UsE8vHTzpFChxtkuwlcjpJRblhISfwkMKUHVjJuY4
         a1TOxnIeX2nkW2B4+YY2GZDyaTK6sebtogAX3AcrG+EpCyVbcS5VfVpK7wS3GG/86pkJ
         gYiZYr8h1s8jzrF4RHL13ONgjXat9Hr/IzDMMLR1SkUz5cYMa73PwIEmJqlz1r+E1zgI
         CjuUer5f8gAM4RYBp7OVxG7jPzZcQh94JK6H88oXOTDd29TCL4q4II2L4zRhPcKGFJF7
         eIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780947101; x=1781551901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVyDzm1G+RBPdq3mhCM83rV6JUo3raqutBJmohxBAns=;
        b=GXSzmpcVTCerbsK9ug1B463KEhWOqb4aFkCQr28N0x5AqirQfecBc8tV3UABQORgZm
         /mbPuvDiYTe0hHh92t4e6Tqv0DB7L+PIUzDpw2SC/itFNjmilETGPIeT4sJNa4AULExZ
         ixD8OnqSj/u0h7IUcw73P7Aj+5u+2QBvpH1Lz4lFhvoSHrt3GN3fwHoWEGgqCge1v/W/
         6DghgovFNMsLe/S0cud2vcjKtPGlL7evBj5ZLhSOwCOkf/9VZj0sQ5Ccrrkv3fN6aoZD
         ya0vpStvTRqtcEiPDIllOhox2lYAXlG9hzhIXV7pXlzTrLRPgyC+EcGFXkaSj4GYxxkr
         HP2w==
X-Forwarded-Encrypted: i=1; AFNElJ8DQOtu2st6w7FolCuzcA/cVubh87wgfRcJUgf85ZLlg/xlSlJELOYAwDDySpbwIObIdyLnPrENMUrJU3gI04RWBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlouLmCQv6mrtnp/aXluR3PHw9VYkiYMOFXnh+HSgRNs48FAoe
	Two+rIgj+jWSqK2GgJIqv6PU/GZhtfP2RmPuarmUo5jvPghnzqCEJ1sci1xN4AxGr97ulfWU9s9
	ODybJ1ejhmci5NAF1wDK+0kcTBsQhwsZlVZl4fVc=
X-Gm-Gg: Acq92OGlDdyUMZrmxAtlK6o8QcU1zkkKgTgXhyPXrfGxsY3c3a/xSrmFK5+FN6IlLqD
	bYc1A4Rvh30o0rRLKiB/zktBnuKipr1xBKh2GMezNmgsmh+x5ejHXpnBZ+s+nU0TIQlMhKszDOB
	cOlcjRzU+77dvzDTUw/6Uef57PSYvisK9jEK+ZsiHHxM1EMOiDDRSM8vA54He9pHfJsEOMSQErQ
	NLinbA70RhQj00PnLs3y7i60gnrq1GD9g45N5zRvSTOLLCDU2BatK4TBT5+iz4VAQz7w0gVSwri
	4fa01off3FQbhblL+cWndr/cKQcbgHk+R+MMudvls6KdyjwMnFz8oxsAwG8Lrb29DHRGTHHsdXJ
	lsXU=
X-Received: by 2002:a05:600c:8b68:b0:490:bad7:3634 with SMTP id
 5b1f17b1804b1-490c25e1104mr294910145e9.19.1780947100632; Mon, 08 Jun 2026
 12:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260511191910.1945705-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVBT7NFYCC-NrSxV7+Y1+76ZPc_ikGK5keRLCXEs-2_8A@mail.gmail.com>
In-Reply-To: <CAMuHMdVBT7NFYCC-NrSxV7+Y1+76ZPc_ikGK5keRLCXEs-2_8A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 8 Jun 2026 20:31:13 +0100
X-Gm-Features: AVVi8CcT1M1fPmxvE4ryOUIEys8Vk0daHnh_JjKaDGls1nWor-Gf0r8rG_5vSY8
Message-ID: <CA+V-a8vL_fKw4WE80_=ZcTxx8vzzx77Ov+8r_OCe+zz7S-2eug@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: cpg-mssr: Add table-driven MSTP
 dummy-read delay for LCDC on RZ/T2H
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33691-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8741A65A17C

Hi Geert,

Thank you for the review.

On Fri, Jun 5, 2026 at 2:38=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Per the RZ/T2H hardware manual, to secure processing after release from
> > the module-stop state, dummy read the same MSTPCRm register at least
> > seven times for most IP blocks, at least 100 times for LCDC and at
> > least 300 times for RTC before proceeding with subsequent processing.
> >
> > The existing udelay(10) satisfies the seven dummy-read requirement for
> > most IP blocks. Extend this to support per-IP dummy-read requirements
> > by introducing a table-driven lookup, rzt2h_mstp_delay_table, where
> > each entry records the MSTPCRm register index, bit position and the
> > minimum dummy-read count from the hardware manual, converted to
> > microseconds via RZT2H_MSTP_READS_TO_US().
> >
> > Introduce cpg_rzt2h_mstp_get_delay_us() to replace the open-coded
> > udelay(10) calls. In cpg_mstp_clock_endisable() the exact register and
> > bit are known so the lookup matches on both fields. In
> > cpg_mssr_resume_noirq() the register is known but not the individual
> > bit, so pass RZT2H_MSTP_ANY_BIT causing the lookup to match on the
> > register alone and return the delay for the first matching entry.
> >
> > Add an entry for LCDC which requires at least 100 dummy reads. Adding
> > support for further IP blocks with non-default requirements only needs
> > a new entry in rzt2h_mstp_delay_table with no logic changes needed.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -96,6 +96,24 @@ static const u16 mstpcr_for_gen4[] =3D {
> >  #define RZT2H_MSTPCR_BLOCK(x)          ((x) >> RZT2H_MSTPCR_BLOCK_SHIF=
T)
> >  #define RZT2H_MSTPCR_OFFSET(x)         ((x) & RZT2H_MSTPCR_OFFSET_MASK=
)
> >
> > +/* Dummy read counts as specified by the RZ/T2H hardware manual */
> > +#define RZT2H_MSTP_DEFAULT_DUMMY_READS 7
> > +#define RZT2H_MSTP_LCDC_DUMMY_READS    100
> > +
> > +/*
> > + * Time per dummy read in nanoseconds, derived from the original udela=
y(10)
> > + * which was used to satisfy the 7 dummy-read requirement:
> > + * 10000 ns / 7 reads =3D 1429 ns per read.
> > + */
> > +#define RZT2H_MSTP_DUMMY_READ_NS       1429
> > +#define RZT2H_MSTP_READS_TO_US(n)      (((n) * RZT2H_MSTP_DUMMY_READ_N=
S) / 1000)
>
> IMHO this is overly complicated and hard to follow...
>
> > +#define RZT2H_MSTP_DEFAULT_DELAY_US    RZT2H_MSTP_READS_TO_US(RZT2H_MS=
TP_DEFAULT_DUMMY_READS)
>
> i.e. this is just 10 again?
>
Yep.

> > +
> > +#define RZT2H_MSTPCRM_INDEX            12
> > +#define RZT2H_MSTPCRM04_LCDC           4
>
> Everywhere else (DEF_MOD(), DTS) we refer to module clocks using the
> sparse base-10 combined number, i.e. "1204", so I think it would be
> better to do the same here.
>
> > +
> > +#define RZT2H_MSTP_ANY_BIT             U32_MAX
> > +
> >  static const u16 mstpcr_for_rzt2h[] =3D {
> >         RZT2H_MSTPCR(0, 0x300), /* MSTPCRA */
> >         RZT2H_MSTPCR(0, 0x304), /* MSTPCRB */
> > @@ -113,6 +131,35 @@ static const u16 mstpcr_for_rzt2h[] =3D {
> >         RZT2H_MSTPCR(1, 0x334), /* MSTPCRN */
> >  };
> >
> > +/**
> > + * struct rzt2h_mstp_delay_entry - MSTP dummy-read requirement for RZ/=
T2H
> > + *
> > + * @reg: Index into control_regs[]. Exact match.
> > + * @bit: MSTP bit position, or RZT2H_MSTP_ANY_BIT for register-level m=
atch.
> > + * @delay_us: Computed delay in microseconds to satisfy the dummy read=
 requirement.
> > + */
> > +struct rzt2h_mstp_delay_entry {
> > +       u32 reg;
> > +       u32 bit;
>
> The sparse base-10 combined number or packed index would need just a
> single u32...
>
> > +       u32 delay_us;
> > +};
> > +
> > +/*
> > + * Per RZ/T2H HW manual: to secure processing after release from the
> > + * module-stop state, dummy read the same register at least seven time=
s
> > + * (except RTC and LCDC) after writing to initiate release from the
> > + * module-stop state. For RTC, dummy read at least 300 times and for
> > + * LCDC, at least 100 times.
> > + *
> > + * Instead of performing the actual dummy reads, an equivalent delay i=
s
> > + * added using udelay(), computed from the required read count via
> > + * RZT2H_MSTP_READS_TO_US().
> > + */
> > +static const struct rzt2h_mstp_delay_entry rzt2h_mstp_delay_table[] =
=3D {
> > +       { RZT2H_MSTPCRM_INDEX, RZT2H_MSTPCRM04_LCDC,
> > +         RZT2H_MSTP_READS_TO_US(RZT2H_MSTP_LCDC_DUMMY_READS) },
>
> "210" (us)?
>
142us

> > +};
> > +
> >  /*
> >   * Standby Control Register offsets (RZ/A)
> >   * Base address is FRQCR register
> > @@ -253,6 +300,20 @@ static void cpg_rzt2h_mstp_write(struct cpg_mssr_p=
riv *priv, u16 offset, u32 val
> >         writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
> >  }
> >
> > +static unsigned int cpg_rzt2h_mstp_get_delay_us(u32 reg, u32 bit)
> > +{
> > +       unsigned int i;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(rzt2h_mstp_delay_table); i++) {
> > +               const struct rzt2h_mstp_delay_entry *e =3D &rzt2h_mstp_=
delay_table[i];
> > +
> > +               if (e->reg =3D=3D reg && (e->bit =3D=3D bit || bit =3D=
=3D RZT2H_MSTP_ANY_BIT))
> > +                       return e->delay_us;
> > +       }
>
> Given there are only two modules (LCDC and RTC) that need special
> handling, a table sounds like overkill to me.
> For exact matching, a switch() statement with two entries and a default
> would do.
> For wildcard bit matching, perhaps you can use a mask?
>
>     unsigned int mask =3D bit_valid ? GENMASK(31, 0) : GENMASK(31, 5));
>
>     if (idx =3D=3D (MOD_CLK_PACK(1204) & mask)) {
>             /* LCDC needs 300 dummy reads, or 210 us */
>             return 210;
>     } else if (idx =3D=3D (MOD_CLK_PACK(605) & mask)) {
>             /* RTC needs 100 dummy reads, or 70 us */
>             return 70;
>     } else {
>             /* default 7 dummy reads, or 10 us */
>             return 10;
>     }
>
> What do you think?
>
agreed, this approach would much simpler.

> > +
> > +       return RZT2H_MSTP_DEFAULT_DELAY_US;
>
> You might as well just do the udelay() here, too.
>
Ok I will have the below,

static void cpg_rzt2h_mstp_delay(u32 idx, bool bit_valid)
{
    unsigned int mask =3D bit_valid ? GENMASK(31, 0) : GENMASK(31, 5);

    if (idx =3D=3D (MOD_CLK_PACK(1204) & mask)) {
        /* LCDC needs 100 dummy reads, or 142us */
        udelay(142);
    } else if (idx =3D=3D (MOD_CLK_PACK(605) & mask)) {
        /* RTC needs 300 dummy reads, or 428us */
        udelay(428);
    } else {
        /* default 7 dummy reads, or 10us */
        udelay(10);
    }
}

> > +}
> > +
> >  static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
> >  {
> >         struct mstp_clock *clock =3D to_mstp_clock(hw);
> > @@ -312,7 +373,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *=
hw, bool enable)
> >                  * register, we simply add a delay after the read opera=
tion.
> >                  */
> >                 cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
> > -               udelay(10);
> > +               udelay(cpg_rzt2h_mstp_get_delay_us(reg, bit));
>
> In this function, you do have the packed clock index (clock->index).
>
Agreed, this can be replaced with cpg_rzt2h_mstp_delay(clock->index, true);

> >                 return 0;
> >         }
> >
> > @@ -1142,7 +1203,7 @@ static int cpg_mssr_resume_noirq(struct device *d=
ev)
> >                         cpg_rzt2h_mstp_write(priv, priv->control_regs[r=
eg], newval);
> >                         /* See cpg_mstp_clock_endisable() on why this i=
s necessary. */
> >                         cpg_rzt2h_mstp_read(priv, priv->control_regs[re=
g]);
> > -                       udelay(10);
> > +                       udelay(cpg_rzt2h_mstp_get_delay_us(reg, RZT2H_M=
STP_ANY_BIT));
>
> Here you don't have it, but idx =3D reg * 32, and bit_valid =3D false;
>
and this one with cpg_rzt2h_mstp_delay(reg * 32, false);

Cheers,
Prabhakar

