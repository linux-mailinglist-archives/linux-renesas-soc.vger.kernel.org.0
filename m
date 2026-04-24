Return-Path: <linux-renesas-soc+bounces-31620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GgbEW0q62keJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 10:31:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB0F45B83E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 10:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35C7C3015868
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8C431A7F6;
	Fri, 24 Apr 2026 08:31:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DDF27144B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019484; cv=none; b=LqCSsbAIkPTynoJghbDi79Zq1bdSdH3Prd1rDwa+8Wv+4TlmM6P5pLq8UYsclLdSs0DSHt1DddUZJSYD/ocih/FLuNQD8RtyJRiYUB86YVYTJoBvvcaFSHOY4zdrh/t2Ms9Z7d8RV/M4rm9espq75BM1CYbJyiUroPkv0NJmqsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019484; c=relaxed/simple;
	bh=ILFx3eaUBJfF3eL9HOmoK0/QMkKUrULhH8Bb5QOooLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGmWqAlhXTEB3zwtBn/oj5oUsChKkBCyqnBae7XBZDVVqtKJlLYLAxhpS/rDvlcNGFrfXlOFmDrYk8EvxNMpnhHXcDVCnr8wOJnsSJkm8QRdSLZQEkH3Q3WxgmLx/XuBYXr5+JjlnpOmH3hZuSuAeAFwhAtlw5QsuTxr+CrUn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso7145163e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 01:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019482; x=1777624282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aY5lS/bisA7h6KyUeoSyE2LUbPNw5scSAX1hdqhvzS0=;
        b=Ogv9lFHCA/ExgbcdE7V6m4slLrv/uNA8Uya+ojVWc08C4lD//vImfN1RsfcR4Nb4/r
         pwursMZVqVEAvPf2I8Up/MVdLINDNWlpfLzTCF6hj+SctHmDEwMKvgQj42qKAInVxoU6
         6msXinMVsMWwRlIxQT8kDRQVFjqvH+MCuwgFUwvfDaqz8vQoKuozNPIAkFCc0ThnY0WF
         IVe15Veu9F3hWzoLQBblI8egShKHoe8KGQA5X02lmrGvkmaqna6ewL1MfVnm9x6B44rN
         6xbwLQwRX02JPNzDF/0+AGtxkvq+ByJYo66uMUCSRG3zxhOwbjs08QkMhjFWd/0M+n2r
         ZNLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X5qntI6mnDYZ2kKKAmxZwzPnR5JcFUEAKyqwsiAjI7fc8oYhj2oVIgen3RVT9skcVCK69w2GurD4+EfDg8E/nqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvf7eTXJUWpoQt3c0zSal9wdO8Eq7lE6AxxCGxaxT6+UDclUX+
	S5nryLP2BeWp9O4b2xUDjfOPe4Upmwa4EzXtFGGaM3uD4PTpBhwiknHymJU8bQIMvPM=
X-Gm-Gg: AeBDieu6sbxIx+qHagTV3zsK+qYETZN2S3r2n18rXZzt/+nV/MCkq19ThvMz6d1Loqk
	1Hu++7pO2Psjtm4dZLssOETNB2JO4YxqLqtmT0ezf+4ie0aidsn3K1ah722CfvodQJ/+hiEtCpx
	FwwWuGmrBJC9byouTl7yYgvnEKS9wTEFUS/+z032RXaULKtc4jvWhEsAfLol/q9SpOHTGcOzprQ
	KF/pxzi7vovKOqQNnc/K3zXsw7YIpnaqtVycrVoH7TUsTH2Yoz4LyazO4JjfJHbC3HpFGP/w9sc
	rLBFS6UEfg/g/SK185VR7JBkpykNIOBRPm5iHsyV16UFXZiJMQyq6dofoJJdYKSBAEM2UmqFCxP
	22yWEh4hRu0AmwSNMoOi7H6kn1NFcLVqN2YvBKS9ovVK9CHzp74fiYdyb8615aP+cdSpzzBv2KD
	dLo7igTF2Vll0z92zc2bT4dL/EvoKuc1FcVrGV66mKetFe5EdoGy9kHfQfSHDguLe2QPj/93Ky2
	Wa9OGhgiA==
X-Received: by 2002:a05:6123:102:b0:56d:3451:4cc0 with SMTP id 71dfb90a1353d-56fa66fd956mr10751348e0c.7.1777019482620;
        Fri, 24 Apr 2026 01:31:22 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa92f22a4sm13487025e0c.12.2026.04.24.01.31.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 01:31:22 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so5188400241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 01:31:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8CB2zwaQ+8szcUspg8smsfO47oHt1V+lbwfRjHSlAh7wHrQBNqerFJiBWBsW3BIJcVYS6w8Cl9I/w66uAcmCrWWg==@vger.kernel.org
X-Received: by 2002:a05:6102:5a93:b0:602:8742:1fa with SMTP id
 ada2fe7eead31-616fc3bb2f8mr11805656137.9.1777019481290; Fri, 24 Apr 2026
 01:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
 <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com> <CA+V-a8suj-QZ57uzUfDscZBbEGBbeJxeiC-ozLt0hBE_pLnG+w@mail.gmail.com>
In-Reply-To: <CA+V-a8suj-QZ57uzUfDscZBbEGBbeJxeiC-ozLt0hBE_pLnG+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 10:31:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8VRNGytQQyDiocZvkLhYK7cOGt5eGP04qqiMV2a0ndw@mail.gmail.com>
X-Gm-Features: AQROBzBvIrFvykv50Fa3U1oGeRUXnGgCDJVcNLsYOGukv2vKiFFFK0CtdeSv0b0
Message-ID: <CAMuHMdU8VRNGytQQyDiocZvkLhYK7cOGt5eGP04qqiMV2a0ndw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH
 configuration in PM cache
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AAB0F45B83E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31620-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]

Hi Prabhakar,

On Fri, 24 Apr 2026 at 10:27, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Fri, Apr 24, 2026 at 9:22=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when savin=
g
> > > > and restoring pin configuration registers.
> > > >
> > > > On RZ/V2H(P), the IOLH configuration is defined by the
> > > > PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> > > > account for this, causing the IOLH registers to be skipped during P=
M
> > > > save/restore.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>

> > > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struc=
t rzg2l_pinctrl *pctrl, bool suspen
> > > >                 }
> > > >
> > > >                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
> > > > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IO=
LH_B | PIN_CFG_IOLH_C));
> > > > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IO=
LH_B |
> > > > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH=
_RZV2H));
> > >
> > > Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set fo=
r
> > > dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
> > > impact for now?
> > >
> > Agreed I will drop the changes from rzg2l_pinctrl_pm_setup_regs() and
> > send a v3 for this patch only.
> >
> It looks like I need to resend the whole series because later patches
> won't apply cleanly.

No worries, I will handle it (I have just queued the other patches in
the series, and saw no conflicts).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

