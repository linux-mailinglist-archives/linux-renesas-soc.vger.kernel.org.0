Return-Path: <linux-renesas-soc+bounces-31619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALD/HaEq62keJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 10:32:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDCD45B86C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 10:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0B3E302204B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FDA351C2A;
	Fri, 24 Apr 2026 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBKA/R5X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E6C3033DF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019275; cv=pass; b=F9K3P3nbM7oDYkNeYhmrMeHOS/K6aeP/iHUPe0mk4borQg4DJlJKacwbKKmwH6ZmwvUGkMu77RneXbJOKJbRnm12YqwMSKptTXVFrzVKSkHSRjRqojqUL75tBPxYWU5sndKEDaUEH3236MtLHCjxZkfH8t4AAfKQUxBDH+6TqOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019275; c=relaxed/simple;
	bh=abEa2oo3LWroecIJ0K5+AP3rKYBkm2+VRT5wYlo8ng4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ax2NZ71p6ANpTJFoXiEwq8mYl2JvxAQ+bW4cfw+CMvtv4uIawOeTX0u/BYAP1j3OVtE60ONznrRIPdpQACZL7hTz+EzfmZ7K9EB/82V1QMvv290Jrb8YtPq2L4VBRmz5ezAeq5NJ3lWbs9oqbGWkdHcE9RD9NJzKeOyFlGGH7Ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBKA/R5X; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4411e1eba51so4095706f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 01:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019272; cv=none;
        d=google.com; s=arc-20240605;
        b=jFONwtYCQltA31crDimVkCcsh2yZzWEKQ1eDyn25BlngtHCCRb/M7A3qXplHJecFUx
         BR6p8va28omcLnpIDovNrjMYxTgFNuJcPgQFBeoJ/kBEoQwfJlCpGC6Eg+GzgENO9gf+
         LDPlOkBIsYoAyKIVVCbZBPdFIrIM5F7i+Jq0vLgq2KtM3RoE2oyuNm2qRj6SK7W7CagU
         zR+uY/ajLC8/NFlOOlY6uFeJuQ0WHOPtsuj8vOQs6LPvcdtMCRgtDuJh/hDHjfdluh56
         VlFcxOq0rWkqCjixILtpUaBXFw5xAT34ukk4U/bwUvqIHe2k+tIQbb0SF9I5I761ekDe
         rmtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2/10k5kXVT4tbnl3kLu0KzcprQXFXDT4Zcypjq4Ejw=;
        fh=KbosyhJh91JdmYpeCTME/U/8CpvFbW0x80CtLt2uZvw=;
        b=WH7WM1zTAu5MtIXk33aQyncXo447vUdxSN+Lbzuz66My1oy/P82GG7j9ARbMPGD0mZ
         7xnRNCCFwHSaLQRjRF+Fa8tXmk+iXj6eSQRd4V7SUcJ11xoAx8sx9t4TImNz4oTysHio
         rgU4tCM3X+c8dEQFJmWd3TEdhSHeoCRHvtqEJhLhzczY8DjisMKYcmkZICqqbY+S2luB
         JQqiEQiN7MhDpiO308ZWuFEQkKGgo2HGVN4VRSMzWBH/4z3+S9mY6xDQB3mJrCfqXdIF
         xbT15HYKxUmQw0hDSPJ7V8+DFVPfALI8WZ0+HooF6+InvAHD64/mcu8V4mdRnoDR3Xcg
         wzQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777019272; x=1777624072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2/10k5kXVT4tbnl3kLu0KzcprQXFXDT4Zcypjq4Ejw=;
        b=pBKA/R5X5rIKkTJmpQviA6cfARDPI3J2lOZt+SGAnMu7noYO7Gq8rfQpqJBCfahvp+
         6TzdPZkjcBAp9HrAAHYu4mdtMuyzvKY9etN1Kwr0rP83K0YWPhK6gSNzIm/rJKpmT3u4
         rYLtjAn2FFs88P2s1DgReBhLrAKMTBl/+RHna4wS/GUKd23nL9YDV/HN+Twt95xFCem4
         DROGrii7uTJXXJnPqTtB7CWcKgrg4t/5oDWj/8/CULmZfkLJ5/ND9VhgV2TdDYD7oTBv
         I1tp595gMIs0wEoP2802fYBr55FXjwVDsspJaGDdNUDBDf4/wvXJ9JpOWIjT97vVQIk0
         xycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019272; x=1777624072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2/10k5kXVT4tbnl3kLu0KzcprQXFXDT4Zcypjq4Ejw=;
        b=okspL+r1U1MmgmJoTYVT1LFboNsz0eVZH21vh43F4Nbe26Pe6IufTwbLVjYs7w/Bn1
         PO2Q9FeayqJLqHDmg+Zl3O1R020H58GFUWpKcE2V+JFZxCvCqF2/cMy53nUrIwpCCkUP
         S2bStIhveE6+DcEe3ZUqVgvJeLkxvlNL6Q7Z7aIMJSSDn5tFyaRnm5mXT49T7us/3o9b
         DEFrgb4T/QO4f70btLnfZBnHFL0hPVJSFQy4kR8RTPIZsIEz/qYHQnffPn4bEaDP9ZQG
         yJrCguXTYpUlkr0Mrkdg21v+oJNQT8DhHBTONAvqo/VEjBeQPXkG0REiYtMRj/5AeJtz
         lJkw==
X-Forwarded-Encrypted: i=1; AFNElJ9VIb6LdU7wAw+nHUAuRyk6sQrvoQfI/jm5uTyBrw6oMyFGClwm3XdG2Ida9FzBWY1Q2HVe2vu0UtOc7YELaL3o3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpqEeYUOr+I85t5EYbqCqEge4kVX84tB9F4cPoByqH8j0FZFvy
	IBQ8+3ezvUf0EaiF+AQadd7bUJu6ZbVyCXI6EpRDTYEB7On+d3sP++H5rbznCh61FK1HuCZGKdi
	pVd6tzXR61ndQ85BL/xra2VRpP0o56nw=
X-Gm-Gg: AeBDietkfxCG2/r82w8Fz2xqMRCRP0s89WQA2HUocEiphtK2yObtqS1aXqqYRAW5isq
	sq+4iG0nQdrwYJtohiAYdqIylmWuVDzXx4MmLFah+GBc3eUnsmDflDsWm4uGgUSrq2Etw+a9ISt
	XPZ/7aS4d6Jv0P2TOkWpiL9SvaPNgYbz1wS7h7Imvnljz3LUfM220egJiJ/ijxoIa7F5N4gNrqd
	AaI+0fpNZ6cx/C9E5cQjnujlcPAk85ij/59HVl+2BQuBrjsCm/cLlHYmteh5+EpgbIFifQy6qKZ
	fD1L3w/ntPayrZ+44+VemFErRYmXYVaV6RB4VKzAL1chByLbyhwzmEj+N4K44q4yrEdWEOygdxi
	/FBs=
X-Received: by 2002:a5d:64e4:0:b0:43c:f7e5:817a with SMTP id
 ffacd0b85a97d-43fe3dd4b72mr47541014f8f.19.1777019271852; Fri, 24 Apr 2026
 01:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com> <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com>
In-Reply-To: <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Apr 2026 09:27:25 +0100
X-Gm-Features: AQROBzBklweav6Cadl6bvx-k8sOTN1rEJNQHnGNe-6bPGl1U0IHT8EAXdfgKu2c
Message-ID: <CA+V-a8suj-QZ57uzUfDscZBbEGBbeJxeiC-ozLt0hBE_pLnG+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH
 configuration in PM cache
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5FDCD45B86C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31619-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]

Hi Geert

On Fri, Apr 24, 2026 at 9:22=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when saving
> > > and restoring pin configuration registers.
> > >
> > > On RZ/V2H(P), the IOLH configuration is defined by the
> > > PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> > > account for this, causing the IOLH registers to be skipped during PM
> > > save/restore.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struct =
rzg2l_pinctrl *pctrl, bool suspen
> > >                 }
> > >
> > >                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
> > > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH=
_B | PIN_CFG_IOLH_C));
> > > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH=
_B |
> > > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_R=
ZV2H));
> >
> > Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set for
> > dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
> > impact for now?
> >
> Agreed I will drop the changes from rzg2l_pinctrl_pm_setup_regs() and
> send a v3 for this patch only.
>
It looks like I need to resend the whole series because later patches
won't apply cleanly.

Cheers,
Prabhakar

