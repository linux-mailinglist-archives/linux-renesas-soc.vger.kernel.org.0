Return-Path: <linux-renesas-soc+bounces-27875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBufFggmg2n7iQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:57:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B4E4D17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2AE7B300615D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 10:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0323B3D34B6;
	Wed,  4 Feb 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WolRYiJO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A098313526
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770202628; cv=pass; b=sc+n4+pnKlHkP6V8BOWW/Y7oeHkm/lIDG4h7mtwsbOUAdYd2K6t3yj8QBaZLUvviWnSPO8m7/ahV680O70GOGzykqqW9/QXf3oztrTMXOCSmyn/9pYq/k+vBjkBw+SCu02CAYlYUjdhSj2fIWwZKhtLUAc9673BExoV/mptXBI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770202628; c=relaxed/simple;
	bh=PMHaxJ2RklLokVlbZMqunTv5xp0IOvxDC0DQNyTtOo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOE8VkzvKjretUflHeyj8gOtNOaPa+wAVwQ6mCBb1W8RHb3cd+z2lO45l7FKa4D30NtHP/rr571fKHviMg0nRfR9fo4IJdj9SA7b6yshsf4YTwkqjIh8aTm21tssl2tEhsH5vXjX2qEuy7ew2s25yLhY1+SmYto73N8ueGojcts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WolRYiJO; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso40299905e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 02:57:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770202627; cv=none;
        d=google.com; s=arc-20240605;
        b=MHdB/DPDB+5Q8fX6vjn5aaPGk7+VCivMZ1w39Wavx8J9XoTvMc2W40v6IpWmyPTGHl
         +l/QJiC2MJqkx92kirgAGWol1gxhl59sX3YN2bZ5tOIFS6DQuYF1AHJ5nOTgGqHDzUgr
         Vi5ciA5TLc28nobg3Q52I441UYBngNtJfTy3pF0njhbpPARXdxL/mCUhTsLxjlwc0VOT
         ECkOI+WtKDl9lfNgfBfoLvqvU4GHdBmTkk2l30YPcN8q1KSZq5++LKbBx7uLQ13btLEH
         wQ9ef29k8BJu48+kw7BNw90VrklchUGXY/MjT9QfT8g14ZpX8SxKeWhMn9yIM5QoAlnA
         /5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxo7YPvssl0ML19SkKEw+xPabNvXhH4vmC9tEjOGkjY=;
        fh=Hk/IvQ2yMutvNZB8O6Nn48PqIrl1YCakmEkVqgtFe5g=;
        b=joa6vVkW1iXYljeR9qJUkWJeu14Bud6DKyLUzxBNLTDRwH20aXWXa9z+YDcj2BzTLG
         /uf474lyxTkCFu6L1I6omIR8Jz5rEwV4o6PlDXKbtaDz9Az232HjG2RBsGux+4MRLE0X
         XgGSBQJPDWWqhdorsvs/51g8DYuygG+nWFCYIRVBvxq2lphHDs/3Z0EkucW2U4hTE+uv
         Ggqh7gZu0IvBMVW/ozHx2djUgrFrdvee1cAcrtk6vuUtM3S4FsjjB+KUx7WbYYyO3MgO
         Jn51d9vdU75n3qW86sTFeGQmG2p8yu7k0mqcLoLqVMHSvUFE6AlLKDj0Y4R8nejhDF+z
         iUyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770202627; x=1770807427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxo7YPvssl0ML19SkKEw+xPabNvXhH4vmC9tEjOGkjY=;
        b=WolRYiJO+gOz4rp+LQ+GFcD/Znnc2u2TwIuHdx+imNPO49nJLi8hdk8WwC0cVWeC5v
         j/thaYPmbaZXg6OWMJR8ZPL/TsD+36vyAsBpq5ktos7FZwXneRUajr6L7/my5hh/DzY3
         maV5toNGrFV9ImIs2QqD7zh8EwID1UK4QkFNEGXiY07Yy07nTUAP/VcwpWFNbm/uMVb2
         92Fzes1N3mZg52709qkBk2p5bs4PGU/gPzNe5LVwNl84MhLPYIJbS/gBZxg2TcKrJ3U/
         OkrqO6f5SoWLDBlkSBqniIvsgV30VddBf40SOQT5vwDgHNL3DBP/jYa+CgXODWyDia+U
         NIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770202627; x=1770807427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxo7YPvssl0ML19SkKEw+xPabNvXhH4vmC9tEjOGkjY=;
        b=xE7nYDKp6gaOgT1runBQWQPsVl7O/C22nv4fqbPMaMZjs8kRvU9wUUwYnRgj+fo2LI
         F3JbhNy8aFd8q2tp5gMmC3uKIt4fRK18X6CZXJp/MZOl6Hw4E8yXF+cajgDQPNkOwKY/
         /HekoHKMiPoIQewHIdL2yum2Am+c9LYMKzOi0qiJfDpRnNxsCBGUCwO7zvKoyTrIPZiJ
         ROFONPtl1xNCeHVW21avOoxxmsISsw8cU9thhDIoIljaBcU/WE+62zJctxzsrBtGZkMp
         +8kDH04BB6xbcGMzw56nhVO5upQslKSNCfYuX/WUAMqbZNkrc+zERknB26fIUfUAMuG8
         J/xw==
X-Forwarded-Encrypted: i=1; AJvYcCV8RxxvPUVsCw7VQ8eoNBvbQGREb3nKnHBm5R/GOKx71WfEoT2STrpyWjjwlWTljrA4+JNMN6xL1liUh/1gTMiFtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9VqZ307uz8eGIQ7DDt2P3ffLg7Z9ql2E2+hXF4Xw/VofJLy0n
	773+l4SVyjxquwb1k3Kx1sqIQRmHZIKlO1t3t5Gos1WxfmlkOr8DVHJgb4x2gtmt7M1Bb8Pniv3
	C2TdN5fb9EA3DOKV3fa776W2aU12J1zg=
X-Gm-Gg: AZuq6aKEDWTgva+UK2gGZwqK2ytr+bwEUdkpBkpAs4/8HA+rxuGvyyxzk48Ik/wEx3a
	Jg7maxBk0XEwHPDb0FXqG2N6WNNtL6Vwv7n34lqL8ZNMG933dnW5XR8KSimLJR7EiGlQZ4iwIdW
	pMibwhq0I5daqmw01Rlzken947ahEmzu4HtYKyEv5haILq7l09SqjXAOzDw4d2WW+GK0s1EdzoX
	GC13b19T4oTLb3b8eip6Ss6fMxH8mfexI3phrd+PX4PIxWYaV8hyCBsDwfQ6jEdlWjMV1HJl/i7
	Og3PM2Cqm7OXbSqfu0yej49RQTH6RdAk03zYy3OZYVWaddD2MRgLkvhIPPsubXf25CkRt5FVbnW
	7UDOKgJScvTERDQ==
X-Received: by 2002:a05:600c:350e:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-4830e973685mr32763625e9.25.1770202626839; Wed, 04 Feb 2026
 02:57:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346474FD45870A1047FB1F98698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsUeZ6PsVxm3jHgS0X2wKRtuyuUWOfpp1r718mj_ay4w@mail.gmail.com>
 <TY3PR01MB113467F387FE21FE26DEC5C0E8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8uYBYM-VnUXQA3YwEMn1NzWLMkeGYgmW2jb8oo30aPvcQ@mail.gmail.com> <TY3PR01MB11346E1CF9827B7C76B20ACEC8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E1CF9827B7C76B20ACEC8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Feb 2026 10:56:40 +0000
X-Gm-Features: AZwV_QjiFqMKf_bZAQQfqJi4t6Er0FaazU7-BAKZpgZlJIM5Ls3HUfXymvKZtso
Message-ID: <CA+V-a8vg5C0HN+nwW+iNFvqGPQmqO1iBp154ifNEvSErkdvVrw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling range-aware
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27875-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,mail.gmail.com:mid,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: EE2B4E4D17
X-Rspamd-Action: no action

Hi Biju,

On Wed, Feb 4, 2026 at 10:41=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 04 February 2026 10:32
> > Subject: Re: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handli=
ng range-aware
> >
> > On Wed, Feb 4, 2026 at 10:25=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 04 February 2026 10:20
> > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Cc: Thomas Gleixner <tglx@kernel.org>; Philipp Zabel
> > > > <p.zabel@pengutronix.de>; Geert Uytterhoeven
> > > > <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>;
> > > > linux-kernel@vger.kernel.org; linux- renesas-soc@vger.kernel.org;
> > > > Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev
> > > > Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Subject: Re: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type
> > > > handling range-aware
> > > >
> > > > Hi Biju,
> > > >
> > > > On Wed, Feb 4, 2026 at 6:52=E2=80=AFAM Biju Das <biju.das.jz@bp.ren=
esas.com> wrote:
> > > > >
> > > > > Hi Prabhakar,
> > > > >
> > > > > Thanks for the patch.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > > Sent: 03 February 2026 23:18
> > > > > > Subject: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type
> > > > > > handling range-aware
> > > > > >
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Refine IRQ type handling to explicitly bound IRQ and TINT range=
s
> > > > > > and dispatch based on the hardware IRQ number.
> > > > > >
> > > > > > This restructures the logic to clearly separate NMI, IRQ, and
> > > > > > TINT handling and ensures out-of-range interrupts are ignored
> > > > > > safely. The change prepares the driver for adding CA55
> > > > > > interrupts into the IRQ hierarchy domain by making the
> > > > interrupt classification explicit and extensible.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar
> > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > ---
> > > > > > v1->v2:
> > > > > > - New patch.
> > > > > > ---
> > <snip>
> > > > > >
> > > > > >       if (ret)
> > > > > >               return ret;
> > > > > > @@ -507,11 +528,11 @@ static int rzv2h_icu_alloc(struct
> > > > > > irq_domain *domain, unsigned int virq,
> > > > unsigne
> > > > > >        * fwspec->param[0].
> > > > > >        * hwirq is embedded in bits 0-15.
> > > > > >        * TINT is embedded in bits 16-31.
> > > > > > +      * Check if bits 16-31 are set to identify TINT interrupt=
s.
> > > > > >        */
> > > > > > -     if (hwirq >=3D ICU_TINT_START) {
> > > > > > -             tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
> > > > > > +     tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
> > > > > > +     if (tint) {
> > > > >
> > > > > Is tint =3D=3D 0 does not happen??  I mean GPIOint =3D=3D 0 is in=
valid??
> > > > >
> > > > For the P0_0 case, tint =3D 0 and hwirq =3D=3D ICU_TINT_EXTRACT_HWI=
RQ(hwirq).
> > > > In this situation, we do not need to enter the if condition.
> > >
> > > You mean, no need to do the belowcheck if tint =3D0. But do only this=
 check if tint > 0.
> > >
> > No, I meant we didn't need to re-extract hwirq.
> >
> > > if (hwirq < ICU_TINT_START)
> > Ok, to do this check I will update the if check to below so that the ab=
ove check is done.
> >
> > if (tint || (hwirq >=3D ICU_TINT_START && hwirq <=3D ICU_TINT_LAST)) {
>
> But this will skip the hwirq invalid entry?? for eg:- tint=3D0, hwirq=3D2
>
Will this case ever happen?

Below is the current code in next [0], which does not handle this case.
/*
 * For TINT interrupts the hwirq and TINT are encoded in
 * fwspec->param[0].
 * hwirq is embedded in bits 0-15.
 * TINT is embedded in bits 16-31.
 */
if (hwirq >=3D ICU_TINT_START) {
    tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
    hwirq =3D ICU_TINT_EXTRACT_HWIRQ(hwirq);

    if (hwirq < ICU_TINT_START)
        return -EINVAL;
}

Please propose the changes you want me to add if the above mentioned
invalid case ever happens.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/drivers/irqchip/irq-renesas-rzv2h.c?h=3Dnext-20260203#n505

Cheers,
Prabhakar

