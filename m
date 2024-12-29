Return-Path: <linux-renesas-soc+bounces-11745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 837189FDECA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 12:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFBCA3A1507
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 11:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB11115697B;
	Sun, 29 Dec 2024 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKLqxbqL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E383D156C40;
	Sun, 29 Dec 2024 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735471996; cv=none; b=AfACrDEg6V1De2Ceys7k1wP6vyQ2oJDH0GRweoXS95AmtUTahNcWgJDBBR+aThy89LFwhovsKUv3c/ujVu1Lj/b702mqK9CqLyzVFPFlodRMYqaL4jrxZzucIwZ8wXQc+9Uerb53rqqcve6Vd61YJck2NfBRE4dnneXHiKSJbdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735471996; c=relaxed/simple;
	bh=VJm4/DWPuqrA0+fBBxMK4gTBDX/bBLGHs0SA16UrMJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3onxuTmget8af1dLc9N7HqRXfWfNVdDrMntEuAT9AgCQ9ySzHdEyBK3295x86gh4YoEFnevSnfBfWPN1mC5QVSxIhljgdKemWlVG5Hbtf2qQQm+BlFbGWsfOpqZEVbIL5rcHOt6017wpoJv87zU106tkgRiAd40nmCS3dHXcMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKLqxbqL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38634c35129so6362542f8f.3;
        Sun, 29 Dec 2024 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735471993; x=1736076793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkndmCp+jPQ8r/fKjpZebPOCIHraDLC2krpRGXtKOvI=;
        b=KKLqxbqLWlggCxiBS2LiM9uYQf8X597oOWFH0mdELzLdUI1L/mlnsGMQ0ehymYdkjL
         /5+voyTbm0+85GTkMGNdJCmYTZWlwAQVCRCE6zgFRUX7b386D40N70n9YeG9NlYWKE2x
         YSrYXTC3sxarr/EtGr5oJ+GhjCl4Eu15Okq1AzXUVh3ZqvPnXbx6DbaLLpptmbk8jG1g
         M2XdiQiKZayfsh4L3+bCZXCBEgGAIrRfiBE15HeAUkYR1/q97Th7XmIEZPySQgS1h1R/
         TAgIFhSsMRwh5ZCNUxaFCxT82bnB/U9JkdVJkQ4xY1gn2WQ5iFtyeOXZbjdRjSIvSm7S
         QtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735471993; x=1736076793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkndmCp+jPQ8r/fKjpZebPOCIHraDLC2krpRGXtKOvI=;
        b=gZj1jj0vUR/k+rt2JIPx05r0N82qlbY8BOo8ECfLLvOH48F1iVzGTFCdWWD/Redmqm
         dLD8MDe5I78U6MjVmVZgBvx6LBhGi5ZNoXgJlPv5PAVIl4CJ72T9uH+WjywRmQEGX2Fa
         nYFYvgtY8CwtDW9DVU0XVscBdpnhcltHYdLUuUQxLE5ZCwDFj/L2tMGBHckfIdI52+VM
         nvY45ryA4aM+Dbt54z67//k1N2GS3hRk+ghqhHkEs9jJS+Ydh+HXhsbdKG2lwuYImLHz
         cywnxTBhrCLioeJp8wLzlqohE/QchEaKnP6ioGe7CoeOl1F1XevsFo+a1iJEt/JnYoVz
         1R6g==
X-Forwarded-Encrypted: i=1; AJvYcCUgkubPV2m/0tjYC6mz0wrI62UBcFE7goaZfGiLXaV3jusrRjt5C5yLhdFKJmhlkS8Bo1N+4paZJXqlTnWZkYS7Sn4=@vger.kernel.org, AJvYcCWvizM8x60pZMazON3vDEZhsgWd/MbsMGQuE4mgZWlAFPy/hFbMkcfMv4BXQH4VgKhd4V6xBY+P1Y058Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdbi/gcMjsbRAy0hZ+PYpjP608ksq2CWRQyiibkNiT9OzCJ9Fs
	P0+N6vLW325e/w7gBd5lJ6/5RWRrYX5wdtNaWPrpMk00Tl8A/Mv8
X-Gm-Gg: ASbGncszE9nYXk4GCxyzDpizRBItnkE2vasQCe8NT1DmjBLTCKxFoZSUn0AG2Gm9KEh
	EPHU2tJZcBvTVY6MoE6WkuaiRwmArL8gVE0TmuKUa3b6G1nk3BM97N+ZRPbYgQ5RnCsav0jqlLA
	y4fId5YeDRRPw2XCNVuIFLg7S96gDEcICADG4+kbktV3C+pWwh+TyKyCLAND9wCl+5JZTKvk2PE
	ydzJPI81mERL6ZCzl4SqlNjBgwQnL0NECmWbVd26z4F4FYBA8d0SPULwq18I+3hMjgNMQg8jN+0
	AZ06+hV+qv9bxe4dIq4A83k=
X-Google-Smtp-Source: AGHT+IFvftzXgl78vEYrm9XPeEnig4E4l73931Fxjl6fUhikR8JH2AY/yECzv08NDXPLb5jTMXlLow==
X-Received: by 2002:a5d:64eb:0:b0:386:3711:ff8c with SMTP id ffacd0b85a97d-38a221f1fddmr24422470f8f.23.1735471993069;
        Sun, 29 Dec 2024 03:33:13 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e219sm27517675f8f.84.2024.12.29.03.33.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2024 03:33:12 -0800 (PST)
Date: Sun, 29 Dec 2024 11:33:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, =?UTF-8?B?UHJ6ZW15c8WCYXc=?= Gaj
 <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 5/5] i3c: cdns: use get_parity8 helper instead of
 open coding it
Message-ID: <20241229113311.3b8f70d6@dsl-u17-10>
In-Reply-To: <CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
	<20241229101234.2896-6-wsa+renesas@sang-engineering.com>
	<CAMuHMdWSQvyLwHyci+WVtTj4rGeR-hkjw1ap52=5X29ZzVchSA@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 29 Dec 2024 11:49:55 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Wolfram,
>=20
> On Sun, Dec 29, 2024 at 11:13=E2=80=AFAM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > The kernel has now a generic helper for getting parity with easier to
> > understand semantics. Make use of it.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com> =20
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/i3c/master/i3c-master-cdns.c
> > +++ b/drivers/i3c/master/i3c-master-cdns.c
> > @@ -889,8 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
> >         ret |=3D (addr & GENMASK(9, 7)) << 6;
> >
> >         /* RR0[0] =3D ~XOR(addr[6:0]) */
> > -       if (!(hweight8(addr & 0x7f) & 1))
> > -               ret |=3D 1;
> > +       ret |=3D parity8(addr & 0x7f) ? 0 : BIT(0); =20
>=20
> Perhaps keep the if()-construct, to better match the example in the
> documentation in 1/5?

That line is hard to read, with parity8() returning 1 for 'odd' it could be:
	ret |=3D parity8(addr & 0x7f) ^ 1;
But:
	if (!parity8(addr & 0x7f))
		ret |=3D 1;
is probably easier to read.
But I'd change the name to parity8_odd() for clarity.
(or _even and return 0x80 for even)

	David

>=20
> >
> >         return ret;
> >  } =20
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>=20


