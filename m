Return-Path: <linux-renesas-soc+bounces-31618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH1UIHIp62mPJQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 10:27:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59B45B75F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 10:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DAB93004073
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 08:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508D83033DF;
	Fri, 24 Apr 2026 08:27:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A219343E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019245; cv=none; b=svRCR4ZIQvZc4NEPi2Zcrxzm4Eb5fpTokqOiDDBWqJjSwtZZSJDWZJ4PxMq0POwvrL6YObSR/lDh7r2B4ErR9/w4BOReitF8/3z5CCCdfRDnLc2T5vErZz4+G/NeUVoh6XT9YO8j44Rx7rJ8fKGK82bysqA2tJZ0Nd+ZMjDZ+U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019245; c=relaxed/simple;
	bh=HdPO24Z5Yel3WWWATSnqh/w3jYk5D89p3OAm02/rzXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKdmIcEvUgZ1+A/93Qo+qW5P4Ktn0/1XrXNzcPFoLX0lXzpZSnxigFLLgV00O8j6QAtgCHMO1NSbt0TenhprhmIxciIJU7cQhi7+inBQ3vZLZmSn213afKczQ5XkuuvWRf4Lr/Wa2Fo5CEvebOQdZDOspBAIcIVJrCwELg9NaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so4898345241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 01:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019243; x=1777624043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftmVM3tRj/ijAMz+d8i4NYfRMF8TS2LtamFj2CS43Ck=;
        b=H10H8mem/EFeBnbEXaIoBFQhda8r1Hx9Gd/0OFIGERIvqu+RZ6sfmWK5lzagB7AAoB
         SoF7bbHQbmA0rkLbm2Qu8VG2fUw8AGjAK7WMRaUYOdNxQk4jk9FRdvcsYbeoHjoTQUQP
         ZSJLlVOsgXsiBrE8M1AQFH1gpMVWHjJZrn9e41s9ggSlY36rtjgSS6nHCIzAZ5cZHyFg
         QRX5vq/2vkddrKw2kY0QvSffgT5mMj4a8QhHu1OLJXhn8ET0U6AQOfZlEqWk7mTYQof4
         0xdO0P1a1viSsiM+fXV7kloXg8jIu0sDhvu6bHXYAsyuQmVORbw+R1PI9gWVlX/Qy0dX
         RP5A==
X-Forwarded-Encrypted: i=1; AFNElJ8cLKwmI0ixET/LWImzoFEx8NhZiTDH6yCzv/UmypA79EnN55bnSDQEnVLsPFlqLiAkRsyovhlCz6pRHswbzABwvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8CiW3EZjZXc/NkRJUqruk65FDqyMhj++Mp5523Q0SZKM0MoO1
	60dRTOJtsc3oR9bsC17Lg2+HiFobrN4i4H8hl166iESV4VCYwDHkt8JxJPvwQ0ywKC0=
X-Gm-Gg: AeBDieuEFmv0OfcKLYS5uNZv0emWhHftGkz9QW6LwiF0i8kX6KrYRfYZp2Uef8NRNTC
	fbkcv3WTsOwmsxb5i2UmiY8gQ4k1PUcGuJDFLmnqcQgokx/j1fmwOTH2kiP8d+nyKMHrQvCWxr0
	hVSLdazqMTKXmqOwwBxmf5VgnWTqVAqsGUo6P6tDW94G7SYog5leIu2neQsOptsS2VQloHkRuBW
	IfQRnDzn/15ZHekkXXQdNZyWCvqgZGCtz0EqxsZD5p9XoIeNIcR76Pj8qH+A5v43sYaAp5zqTjZ
	D24js6541+JtBGEiKg0r4KZ+CkvVYa4cJmzO3WMGk5P0HWvZDHYFhnv1Cbd1/HkLuLULqkPLdvx
	D7ekof9YYpbW8FFoE9aHI0QoHRRFu/2ToyBb64UeXOnz3EYt5bIBPPWnzo5OzX4SW0et5WyBHlr
	i/SeTjcLG85NfNQB6j2Ree6MUNmccYVLDpu5tV8tZ2iiGygcE8fAxmDl6syjgiiya1pYVHTFTXS
	2oMDgOncg==
X-Received: by 2002:a05:6102:162a:b0:605:5d09:8631 with SMTP id ada2fe7eead31-616f807265emr15629656137.29.1777019242987;
        Fri, 24 Apr 2026 01:27:22 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890bca3fdsm10704469241.10.2026.04.24.01.27.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 01:27:22 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-60fa13bde2dso4791964137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 01:27:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+YaisTH2ks2PMYRppedLXiSvmu7YBc4ZMMli7bkxlG78+CN4u4EbKZUDZ5oFS3LFvHXm+tZ8yxbiFktpt87qpISg==@vger.kernel.org
X-Received: by 2002:a05:6102:ccc:b0:613:6b44:3fad with SMTP id
 ada2fe7eead31-616f783ddf9mr16006995137.25.1777019242187; Fri, 24 Apr 2026
 01:27:22 -0700 (PDT)
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
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 10:27:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtccbEZ0Bd=A0kvC5sg3YzMdKmVuiYrVpJMXpT2zqUYg@mail.gmail.com>
X-Gm-Features: AQROBzAzk1FIfpdwLdzmR64056j3IGK12kH9Eez-F6PM4uTeq1WUC-B30qC_eAI
Message-ID: <CAMuHMdXtccbEZ0Bd=A0kvC5sg3YzMdKmVuiYrVpJMXpT2zqUYg@mail.gmail.com>
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
X-Rspamd-Queue-Id: 6D59B45B75F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31618-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,glider.be:email]

Hu Prabhakar,

On Fri, 24 Apr 2026 at 10:22, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
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

No need to resend, I will drop it while applying.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2 with this fixed.

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

