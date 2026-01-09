Return-Path: <linux-renesas-soc+bounces-26521-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC9D0A9F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9EEF3021F88
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FD135E526;
	Fri,  9 Jan 2026 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THA6yVu5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC00235CBB2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767968722; cv=none; b=sF6/jgMKx11PqC5d82CnrxLVKasoD1utP/5D3TDowVWSbjlhdaemqslAYCcbQS2+bHvjT3MIGln6ZAZj76P/1+hesfXOVK8NMB0nozXKOYihChqTPyd2xDtdAUzAl+LWYALFZAiJYHAWMVbdcDLE3kqtK4UcTmzNy5MhqcCNevk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767968722; c=relaxed/simple;
	bh=vWS5wgStTvZMYsyqkJ91nJFk1e35QPzy/HyTmkbyjwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srI4s4N3ngn3BMixEwNV85AvlZTRzeaz1vEEYnFlEbfdjAZRS5ZzrZHV+v+4p9olKWpctxZ+6ISJC7E8b4+F8ASPRVS9jpEq34BnE1UHi8EY0tUU87rRZA5mXrO32YM0TEvW4qTIfJVH5OPFmNoREmx57c8sDTvI6t1ksW38+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THA6yVu5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2410153f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 06:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767968719; x=1768573519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2D/cMtJw19E2XiBZlICMduPGDZFgAVPWV/no22KZcBg=;
        b=THA6yVu5mLYJX4Wbmb8unRBsUVB2W87jVAja8vrRdnVB9MNzCAH2mOPnvrLbmKQTtl
         Afg6gB2+sYb10+vRCsW60YD2k5sNadf+RAMoXFHV7ja94ux8DFJH2E2Nmbw/GNP+kRkH
         BdGBVwqQc7cIP+U1IWOFksEFGJxktnCn7Q2Eto7SKYvbw3s2mnICRC2uE+eYx13nl6P0
         7SamgqP5yn5yEREWdng2uYX+S5IlkVu1FyJfr0g6mnM9GgpF5KD1FaPRQkOa9E4dX0dw
         wRL+5OYzJUAszmDtr5wIQzsuBnYWWeUmv/TLTA+jooPhuHxWcCss0LIYZe9X2fJPs5ru
         4qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767968719; x=1768573519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2D/cMtJw19E2XiBZlICMduPGDZFgAVPWV/no22KZcBg=;
        b=QDgwcarozMj4YQFcYPpR+TDX60Ec8Hx0FlDdAyjW890vSIwkQcrMrvFePReQag60RT
         LrVg7tH10u9N8rJeqeFY1V032G1KwUy0r1REChQHtZI209EMPFeBb/PesgzTWil6We25
         Zw9stMfnUqMmxSINykELzpEMQU4nqL8lZ3xI8sPUm/7dPULrjNJpozG1z9edREcfaoN7
         Xolk0LRXIV2PUjfLGTsONMAoC1ugX4upEX3Errm/P/dKPwwoOrGfvyxdlf799Ew9bF+i
         rycKqX1egVbU+q1wjJhfbw6fHRkuI91T6TTZ6YJPvh0GGFL1/lFDEqykoW1edWmI69X+
         1WAw==
X-Forwarded-Encrypted: i=1; AJvYcCUWlqJXKzmBQzHUGVLB2wJpoWpWxxEMA+4TXs1MYXpwgwlPgw+Pfpf8R0MWEmDerZdNMvmPS/SLIcbsBkLQzXcolA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1itoodwicS39kTLRvqvA7K2GSZOYu9mj+xfitK6NLHEA87RfE
	KP8FpTDhM0+eJwhM2OSGFbPCHNfkCJZ5dgMSSjeENukmUatsEmAtmwXHajJ4ndkVt/cwR6ItVde
	4koUItd15n8GCbilUVELqnQOBOrrOjg0=
X-Gm-Gg: AY/fxX7wV5cw65Ex/l5mmuW+Elk+s8edLYtsYHmPKLv2AYD8lNQh0m5ifTRvJ+pJWlY
	EGoqSUhAA10v4gR8o0JmFt45P1uN8pe2tNeIzGbIGddnFYth93qmTJ1s1KqHmtFIyMbRgNBUydW
	DvHdQb5O4/irkIVnNKJoG04j/ahw1br4ZNBkgyvQ7A0Lu4MY1fOeeniRAhWvVK5Ra4QMQ4JFcd2
	SUpIxeA0LT2xQoJL42ywFwfKNpimSaS7YcbWKQK/l+9WKqVoVer0uGcM8gWmIx5oaTIsvvI7ylz
	U2E01GsyfexBx9DD4lleoHcBk18yFenCJJcKFgDqbHp9vsVRRClC1fGbXDvJ/MN2kX9cVNp+A+n
	Eoa7jQnNcdGr+
X-Google-Smtp-Source: AGHT+IFCXpHopv0CnTYKBGZQGAJBBDYem+SbnQhktvQUHhc24r5wwyxuIOji4OejFmeRbAePpFAv7cmMZfKOoTIcV+I=
X-Received: by 2002:a05:6000:200d:b0:432:8504:8989 with SMTP id
 ffacd0b85a97d-432c37c32bemr11765044f8f.56.1767968718975; Fri, 09 Jan 2026
 06:25:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109123828.2470826-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWz6_NzvjZNMLk+Bqoa0NR2CKNFwDXynfmrTZgOGsqxTA@mail.gmail.com>
In-Reply-To: <CAMuHMdWz6_NzvjZNMLk+Bqoa0NR2CKNFwDXynfmrTZgOGsqxTA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Jan 2026 14:24:53 +0000
X-Gm-Features: AZwV_Qg77nOmp7wZB-kSrS_ejJiZLPin5aTjJnBXvyeQ0XDAs8licXEGydP6Z-Q
Message-ID: <CA+V-a8uPDpQ+wBW4EnKSJutywRhYDaRQoUUUJXaZQzknn1nyVg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: sh-sci: Fold single-entry
 compatibles into enum
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jan 9, 2026 at 1:28=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 9 Jan 2026 at 13:38, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Group single compatibles into enum.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > @@ -20,6 +20,8 @@ properties:
> >        - items:
>
> I the "- items:" can be dropped, reducing indentation of the block
> below.
>
Agreed.

> >            - enum:
> >                - renesas,scif-r7s9210      # RZ/A2
> > +              - renesas,scif-r9a07g044    # RZ/G2{L,LC}
> > +              - renesas,scif-r9a09g057    # RZ/V2H(P)
>
> This block now indeed contains all single compatible values, but it
> is still located in the middle of other multi-compatible entries.
> What about making it the first block in the "oneOf:"?
>
Ok, I will move it at the top and send a v2.

Cheers,
Prabhakar

>
> For the contents:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
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

