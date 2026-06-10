Return-Path: <linux-renesas-soc+bounces-33800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KtQIJyoZKWpiQgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:58:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CEA666D87
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:58:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4892A3030B12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D341C386C36;
	Wed, 10 Jun 2026 07:53:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E8E38736A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 07:53:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078023; cv=none; b=dBe60Y6pYatLUz9AZz7NE2xkETROGLJ1goRg8tlxdeyzXTA088nyM1+ckDubjsyCr7YDeH074d6bMGgI+18U2n4WsxHV03syhz4wOGps+0jS2hZ2LWtbVrIqgCVOUoLvtsVUs9QeNZtGXkw5UnYliSQ84Kt74FQh16cK4VI9+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078023; c=relaxed/simple;
	bh=M2D7SBf4dRDUJ+Ur1iXcza/iv4YTCZEkWRE8cycidYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiP/PWY2mV22n8QQv8WcFpAZyyqTc0FuYrOZmAynq9N06en1xtZSn+y4D3dZkY2bEJi2WgTjNuJtvrGBLmZCAqBtO+kVI3TU94mnoPnqemnT7+8aKfBC0U0xWzalN2iNistmnGFgT1E34TL0pYcgDuOtntzBizdcjvhyCULzyYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-96358d0a024so4418928241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 00:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781078021; x=1781682821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uhja3s+QnnKNsouvy5bcWC3fS0M3t/Mpg37n9Vd5ieA=;
        b=jDZGMh9Jkf6FWexEzErX50WUbUyRiLIjKZDVWN42kM4pmXSH/GTeKhoIsFi1eAoC8W
         zqAZdDMgV1DdsfEHTAOUiAdRdORbHkZgSrJ0i0V1tBjucXOUrTP1OgHuGsAbCGzUgwXz
         6nZ6tAfQc1bsbceiQhcpOeJtBGvipKqetqSDJ/qUXO6tQ7DjL8TzhtQSn/ijXOoRAKqc
         sCXJiyA5JbtIXg6XHclrtN77q028i9FuPCga4icMw0QU+Wk1V7OJbl8NRj9YQvzJJCf8
         uQB9gOiBC+LGCIyxf7YsEz1AMmS+hSNL1j+5AmMtGwcXv/ILQ0BXazO5gySj2ZgTjF+d
         hocA==
X-Forwarded-Encrypted: i=1; AFNElJ/WRJedd9k4xp/0nZTw5hBVLDLw0TqRhjS1PEmeEG6/ncagaqUOU/9uyhv70CXVnBjOfWcbggjoLIOCd2+7Q4SbzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWH/n26FHf0x+RNcZ/KMysMfFe72qGRqx2Ra+r5brjLi1j9/Sx
	rLZ8Hhz8bCDgWKmZafUEaIsedOjure4167/FTaCuupwLpLiSC2q9DPjEHagNegP9I4s=
X-Gm-Gg: Acq92OHdF3EaNFlona5MilUBtZRNmpC6FfLAx/GjJtJiJQcHjY0dex6Vp8arYjsWSOM
	RPox7SG4B7pO7tyJOvUBermo9587+vyT3vpZSGxjD6hjm+sX/YAokh8VJ0zDXM/dza1KkqARa0p
	cDkEWc1Fd+2Ig6kggz8xNRM2eAqDijgKkJyKtgBNZ2Vjmxiy1de0nsqKngd6JYx1rZPT89tEnjQ
	Wn1fQsOUW/xlaGIRCEBUcBEyofY+pcEEk7eqX0w/QYYTrqdunXMqdO4ghVdZ7FHijmrvGTKa69l
	6KGeH2+j/EAVBl4woroDhBBKlFXeOQdOaslJd8za5EjJL4Dc9hhMoKG2ieBjd1EoZzv3H3J/Fnj
	zsJwyaAmk++7PhCURgw5lFI9KkHCheO/AW6jWjGgZN+Q9xhzirfdy1bMNEQxQWxlgsW5/uG0Yyu
	7nI+zkgiudkLiCceXoZLZdqkCo9yjsKKavnHAjh4ALlYLxX2/VesGukcpsl0Y6xb4ELuUDIrvMr
	5Q=
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr15999082137.4.1781078021500;
        Wed, 10 Jun 2026 00:53:41 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5549144csm19327671137.3.2026.06.10.00.53.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 00:53:40 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59bbe027424so5258654e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Jun 2026 00:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ925XZPNXSj6/OLoSyNutiaLpfQiS0yXzqSCY8uwdP73eiNpX0rAy66uWogD5Wk8ZFci0a+Nf3t8Irx0YEJfL3j2w==@vger.kernel.org
X-Received: by 2002:a05:6122:421a:b0:5a0:2018:4dfa with SMTP id
 71dfb90a1353d-5ac4ea99b32mr12268519e0c.3.1781078020496; Wed, 10 Jun 2026
 00:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com>
 <CAMuHMdVEYciUYq6savTuOqDUQp6AqHGkeP30s6Z7PoZ3q-Pqvg@mail.gmail.com>
 <CAN4SLj0o+3Bjq0aBJUYbKU-YkXUeM9aPgRxiwmOHX_Fz-_Hq+A@mail.gmail.com>
 <CAMuHMdVX4ZJkXe1if=iHu5dt=Xtka=C9y8hxKYKc_7=bysycog@mail.gmail.com> <TYCPR01MB12093C33B2C33D80117F79D96C21D2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB12093C33B2C33D80117F79D96C21D2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jun 2026 09:53:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvY2iVM=sRq5+qFm1N4ksWsEMW3kFy1pLFeUbM6zsqsg@mail.gmail.com>
X-Gm-Features: AVVi8CfHcnn2EwKXXXh77rZddTm1dCYH0SlsSwxuoJCu4n_S71iEXmIEjnC1C8s
Message-ID: <CAMuHMdUvY2iVM=sRq5+qFm1N4ksWsEMW3kFy1pLFeUbM6zsqsg@mail.gmail.com>
Subject: Re: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for 8-bit
 RX path
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Felix Gu <ustc.gu@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-33800-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fabrizio.castro.jz@renesas.com,m:ustc.gu@gmail.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6CEA666D87

Hi Fabrizio,

On Tue, 9 Jun 2026 at 23:04, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Tue, 9 Jun 2026 at 16:14, Felix Gu <ustc.gu@gmail.com> wrote:
> >  On Mon, Jun 8, 2026 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > > On Fri, 5 Jun 2026 at 17:26, Felix Gu <ustc.gu@gmail.com> wrote:
> > > > >
> > > > > Fixes: 8b61c8919dff ("spi: Add driver for the RZ/V2H(P) RSPI IP")
> > > > > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > > >
> > > > According to Chapter 7.5 Serial Peripheral Interface (RSPI) Subsect=
ion
> > > > 7.5.2.1 List of Registers, the SPI Data Register supports access si=
zes
> > > > of 8, 16, and 32 bits.
> > > >
> > > > However, the "Access Size [bits]*1" column header has a foot note:
> > > >
> > > >     "Note 1.  The read access size is fixed at 32 bits."
> > > >
> > > > Hence that means the rzv2h_rspi_rx_u8() function as generated by th=
e
> > > > RZV2H_RSPI_RX() macro is correct, but rzv2h_rspi_rx_u16() is not?
>
> True, it looks like rzv2h_rspi_rx_u8() is correct but rzv2h_rspi_rx_u16()
> is not, and could use improving.
>
> > > >
> > > > Also, readw() in rzv2h_rx_irq_handler() is wrong, too?
>
> That looks correct to me. The access size for SPSR is 8 or 16 bit
> (as specified in the list of registers from section 7.5.2.1, and also
> repeated in section 7.5.2.2.18), and we are reading it with readw?

The confusion part is that the footnote in the column header of section
7.5.2.1 appears to apply to all registers, while apparently it does
not apply to e.g. SPSR (and e.g. SPDCR?).

BTW, e.g. SPDCR and SPDCR2 also support\ only access sizes of 8 and 16
bits, but 7.5.2.2.16 still states that read access size of SPDCR2 is
fixed at 32 bits. while 7.5.2.2.15 does not have such a note for SPDCR.
Those registers are aligned to 4-byte boundaries, though, unlike SPSR.

So there is room for improvement in the documentation.

> > > Thanks for the detailed explanation.
> > > I didn't check the reference, just thought it's a little weird here.
> > >
> > > Although the column header has a footnote to indicate the access
> > > size is fixed at 32bits.
> > > But in 7.5.2.2 register description, it specifies that for registers =
like
> > > SPDR, SPCR, SPSCR, SPCMD, SPDCR2, SPSSR, their access
> > > size are fixed at 32bits, but for SPSR, there is no footnote to speci=
fy
> > > the access size.
> >
> > True.
> >
> > > And SPSR is 0x52, readl on the register cause alignment issue?
> >
> > Good point. Let's wait for Fabrizio's response...

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

