Return-Path: <linux-renesas-soc+bounces-20637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 500AAB2AD04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 17:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7567A7B2ADB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE4E27B335;
	Mon, 18 Aug 2025 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iklW+d8F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5267F246BB7;
	Mon, 18 Aug 2025 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531732; cv=none; b=Xj9kMjTGyZhm/xevqwrCyWC6zCnX5kmVW3XX3Hz8+rCC+TA9ur0q5PRUT1UYhZRiieEZad2lyXqR4ACQeZSUX1jm1tVQss5CCNlhzNJa+CRJlNaE+D1RbQzQsTQZ86CeO84SWSMv2UnSYgEwDPA8jKflLi1icYVil0W5Fa/lxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531732; c=relaxed/simple;
	bh=+NmdFytJ0gXG7Bo8cllHYmsAn/QEZFQ+qq8h8vZ0W4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+SVohNEgPuwzpGAaSNqAvTcQENh5bqIixZoFb6ms/KEF8TotjExwtskF8ZZ/2gxfnrEWWrrPAKpLwbNRexFeVgKsBcDJNnLqZ6qjexoHZhj30vZT8s/WjQP5tqGk9AAK7hQVZIFfiPfYWzOBf6Jo4nWRK31x10/AQVz4MNBz6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iklW+d8F; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e413a219so3588873f8f.3;
        Mon, 18 Aug 2025 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755531728; x=1756136528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDJO4S9SUngj9lrL9qvOE/EfiNfp31e+G+t+JHqtX+I=;
        b=iklW+d8F2rZSCq5ovLD6vxx3UTD7tvJZWzGm87FGax9L7iXBmiycEvfTJH+uvAps+Y
         atOQ6/UVQBa41Vm2W3yxJtEaPDwDT+shwmGZXKH8S1JmN9WgVOauwsnw3ioS1BCudAE8
         It+h/qym9hp2i0wBMWMfcNPQRLuCfpzNh7AkmiYFirHh/X3WuzunWSvKjhJgoqNFZG7y
         lvmi1jmdeux87GQGNuX/hLS4HIxKLSGuRUvxkNMc4mq1FgVltugbsxOEJpZI8nfUn5aq
         iTDVW2h8tsHTtRfJHrM2Cv0F+Q/YCwWn3JRLq8MDoXxxvSuCpjBi3tixjLfvWT9+Xcxd
         uR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531728; x=1756136528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDJO4S9SUngj9lrL9qvOE/EfiNfp31e+G+t+JHqtX+I=;
        b=KkZdQTcPob/Kl+F+nXvsnaJtdAw+OU2B8yaVoJ3KpGEu7JPq5q6fnmJZo/s3OpA34N
         pAwgEmhJe65mFzqdKcjHsxmwdLcH47w2i1dIk4IwEOEoc/aQTEs7tZ0emXMSptISuvH3
         FFCDLmpYdqklvnt/V9NSBPjkQQbyG6mgvfwWkofdsafl9RX/g4j7cvxvnRV8psXxcNLy
         oS7ShjUwyVVl0Z6DQmdSa+kI5gTSuujzEU0OP37szsU6IzhkLDw9gP3GIip0MSmOJr0X
         m3/RFiMctN0OwAiShxyzz3Majykw45wt9gvJB+h7Rtzyl6TTAI3M9BVZZGBVPIG+UkhI
         HziQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPQnXVJFZ0oGP5pyQaDMAGCz4p8lZfPa1KnYzjrp/VtKvAjhKYW2a3g5LRn8OioTn6n4RqhDtmNhDX@vger.kernel.org, AJvYcCVbjbG26xUP8jLcameTkV0CEty2ib/fonQ4FUWw3lcXrTt/BvjiDQprNBFFHvj/97obIb2r4a3sdsje/QCA@vger.kernel.org, AJvYcCXwYUCINGtl3CiwascVwWd1mOUkOMeNUBqe2GkoxG4QmkI0b4/AGFRyei0si87cuDLWZb6f1T0sthtp3m5CbBu/WzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZE78Sjd31Mb2e+nYHQD9nQC5QNgEP/RAinnBVN0UQdbXRLbye
	6EtH7nGzSeXPsTt5Uzr7rL9hytKVAxLT2mrYhnmKqba0znguXMEY0y+ClzUo/BF1EydP4QeV7lD
	jgpdQmvSUtL+/RavXPajE4tkjgPi+MEs=
X-Gm-Gg: ASbGncspNOKcDpcqH3irXytUfsMBmw9/hXUYKLx93Cw6+bbewC9lv8VzzW9a+rUQvp/
	GFkKaiQZLUdoakcvR/n2o0VG6l4K7eoqzIg9ZxcqPdYjil3vRz/0mE6BCzZeCxB63ILwzp4NYMB
	TOVS4A1pXIiclt+uWKkKo3ieBNo8l0UD0xHTt9IlUGeEtbujZBuwriy60JTft2EtrHuqkTSuFmC
	cKOKf5l
X-Google-Smtp-Source: AGHT+IHuf+MvJxcd6cxxgK2f0rQ89u7zGQVvm1WKkidkRLxUuQIm22/F8vo7L6B8cEL6Tb16PT2JGnnRgqfDV6TXc5s=
X-Received: by 2002:a05:6000:22c2:b0:3a6:f2d7:e22b with SMTP id
 ffacd0b85a97d-3bb672efaa2mr8144889f8f.18.1755531728311; Mon, 18 Aug 2025
 08:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWJCAa_A-2NZMPNL49A6LmhGn7hokU=xfDwytz08pR4dA@mail.gmail.com>
In-Reply-To: <CAMuHMdWJCAa_A-2NZMPNL49A6LmhGn7hokU=xfDwytz08pR4dA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 18 Aug 2025 16:41:42 +0100
X-Gm-Features: Ac12FXyLKjxPKui3JMb0ls6wfCMdR8JjN3ugTT3iO-gFWAsZfInfbbmNEyDxhEw
Message-ID: <CA+V-a8ubECWM1sEbK+YKYXSiixd69kCNLHk0-pyrvHgScNAcZA@mail.gmail.com>
Subject: Re: [PATCH 07/13] arm64: dts: renesas: rzt2h-evk-common: Add pinctrl
 for SCI0 node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 18, 2025 at 2:35=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pinctrl for SCI0 node.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > @@ -5,6 +5,8 @@
> >   * Copyright (C) 2025 Renesas Electronics Corp.
> >   */
> >
> > +#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
>
> This relies on RZT2H_PORT_PINMUX() =3D=3D RZN2H_PORT_PINMUX.
> So perhaps it is best to get rid of the latter, and always use the former=
?
>
Ok makes sense, I'll drop the RZN2H_* macro definitions from patch
04/13 and use RZT2H_* macros for RZ/N2H.

Cheers,
Prabhakar

> > +
> >  / {
> >         aliases {
> >                 serial0 =3D &sci0;
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.18.
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

