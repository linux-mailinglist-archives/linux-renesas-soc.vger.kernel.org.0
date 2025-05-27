Return-Path: <linux-renesas-soc+bounces-17559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E16AC4DB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 13:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF11E8A070B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D7A269838;
	Tue, 27 May 2025 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jg0vm1Xn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E102561AA;
	Tue, 27 May 2025 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345748; cv=none; b=A1c39U96+GHlqVLaNzOD1wl69qwtROREkbtz9CmYTHe7Di/tZ/5SyLCuOPucj9as6u9ikNmpAuxxeWiE6M8LbjwClIYPIcEQDAOpWjh1Fylr6PNcb4ZWo4icCaFi8+Ks4BEgrwZXzR0DJHekiUyMJC0BprA4RgMI+9LLbAbxCdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345748; c=relaxed/simple;
	bh=z65Y2e/Dh7HyN3o6KU7EP7XljBRoTyLBz68cMHVqb5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvZnLIqOC5i1DS8bPRV/EWJuaBOtd+8w1LeH723MjzHlUd80nsS4OSS47h+c8IUoUYmLTO/76p3xKoNRZl0Ub+CLjK6RkOOtPfIPiltmBkKcQ4/33RooaeFSurT7m+ba1l2gWSvG3E2ztZZeWmQdywwXm5+P4PPQB+R2maFrkbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jg0vm1Xn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2010478f8f.3;
        Tue, 27 May 2025 04:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748345745; x=1748950545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2a3a7a8KQwqodQOiSF1tyIx8rv44vXyG3Dt7UPKGe0=;
        b=Jg0vm1XnpM6rq3aKjTrXM0AxF+gs0dshZVBodWClE/Fczb2gu8nDskrtGVhTuJyGz8
         z7D/0FkQ055cCDp/iMoO3gpmYMYz6xs1Pnm84gsyDnEgu/652FbeuqqHXzxC0zd73qrl
         xTYQIbu1EN64rJmgopqPbIJUWmnk389AdA5w/TsCPDkSDrwSn/x2QyRz+/YYB5SNw2JD
         cX5jdAkloTdmfU4Sm4ewCc68YjXwc38L3DoxrUH0xjC9HUKZl9BRgXqn1TEStW0IsQGD
         ETmEqPda958gs1HwgJqNP5Tzxw3lVIYnZPT2vZslmV5GsMY8AbhLP8gQ0/LvR05yzstv
         R0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345745; x=1748950545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2a3a7a8KQwqodQOiSF1tyIx8rv44vXyG3Dt7UPKGe0=;
        b=H6DKek4X19HfAhMSCkmOxiXqZTNXjKtHDAdTJ/DRvxeR8vAfUGXNPrCXzwgW6vdvhG
         jO++Xx9YYWZMuqx4fFTPOYV8np7t07NopZPG5/1GFInpAUjfD4ZQaYsYOnK9GjnGsVZN
         TCnuXaOdRQ+JhwU83mpspfm3iVqpPP0C+IXkUKjBHGnA5xuJaVxY31sheoyb8l7CsiSZ
         YF5FopuxchjMRGhIF/m81ljACkoOfCWG2Yf4L5acmdfvpfLSmaHQp9ObbCMfHnG6QbcL
         JRvU8ZIkYtKp+xer3Cqj8xrx1U5TA3x5b5GO7CbQ6TIDCSy+bcanHzoeQFEHpGDiuDHC
         raxg==
X-Forwarded-Encrypted: i=1; AJvYcCUDBz4NKY1bGZA2HnzRyGmzp8Cei4T2bmJvNg+CKPCd776yPeYFGgpJ+6Feqd7Hc12enBGYxQGmQZGX2Ldd@vger.kernel.org, AJvYcCWPMFbUTIfR5nBMPFGdWx8ClVTviA/uUXWVsUL+5Uu+za7bYSFLJ3JMkqcP+ldmDQlxQBfV0MkdpOHRV2tXMW3S53k=@vger.kernel.org, AJvYcCXFqri8UdBPpuJt3NxvsytLhiK3VVt8paK5Z3AZUkh4VyHxu+NBaS3dHYuwbx1/Bk7nciOjPyov5Fii@vger.kernel.org
X-Gm-Message-State: AOJu0YxAYArTUvbFwv5eeCs3Aop8ExmjbpTCCAMYYbsri1bdknmpFMzF
	HNQlispOjNMbK9fnLruzjqK2fGZvSFI6u69MAieXei1CI8pzE3b0pGCxw2NyjyhZEpalASf8NDH
	WGhIDfZ/3RhNOx9iiLLaJeYbSxAYYNUk=
X-Gm-Gg: ASbGncu4s91BezPMPJ15SQCBYM8rI4HyzNNAYdM6QGlDIaxpuapnAYQDidSymrbPiKN
	2vnKGuSRjoxVbVINUoHMnwMRTXMPu3LinVcyjHNZL7RTwjp8PxPHz2cXCLbSqUkDq1JAdAwqwu9
	zPkgjJA2T1Bgwc7S591f/rk/wUyHpAB2bs9yw=
X-Google-Smtp-Source: AGHT+IHNOg1R0JT0llzXDUDD94dpx7ihBl1W2G0V4mU4/blhfFYVc3CYqdd00jfYdbUklGcT45QUAjA/dYwCjm3haac=
X-Received: by 2002:a05:6000:2909:b0:3a3:5c05:d98b with SMTP id
 ffacd0b85a97d-3a4cb44533fmr10822254f8f.5.1748345745019; Tue, 27 May 2025
 04:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250515183104.330964-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWC0MGokCwP7gXg+kxfQP0LAqxzb2jAdepwyN2WiCFt7Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWC0MGokCwP7gXg+kxfQP0LAqxzb2jAdepwyN2WiCFt7Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 May 2025 12:35:18 +0100
X-Gm-Features: AX0GCFviWKnZo61Ynxf4kM6_pzPJ3PD8VGeb8xzezsuIu06KO6mxkChQmmtKof4
Message-ID: <CA+V-a8v6hBveByhgsx2g1Lv=UVeBuMMDjzYkXmqyc5Wzo_=LEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable
 USB2.0 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, May 23, 2025 at 9:13=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 15 May 2025 at 20:31, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable USB2.0 support on the RZ/V2H EVK board, CN3 supports
> > host only operation and CN2 supports host/function operation.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
>
> > @@ -303,6 +326,28 @@ sd1_cd {
> >                         pinmux =3D <RZV2H_PORT_PINMUX(9, 4, 14)>; /* SD=
1_CD */
> >                 };
> >         };
> > +
> > +       usb20_pins: usb20 {
> > +               vbus {
> > +                       pinmux =3D <RZV2H_PORT_PINMUX(9, 5, 14)>; /* VB=
US */
> > +               };
> > +
> > +               ovc {
>
> Moving up to preserve sort order.
>
Thank you for taking care of this (and below).

Cheers,
Prabhakar

> > +                       pinmux =3D  <RZV2H_PORT_PINMUX(9, 6, 14)>; /* O=
VC */
> > +                       bias-pull-up;
> > +               };
> > +       };
> > +
> > +       usb21_pins: usb21 {
> > +               vbus {
> > +                       pinmux =3D <RZV2H_PORT_PINMUX(6, 6, 14)>; /* VB=
US */
> > +               };
> > +
> > +               ovc {
>
> Moving up to preserve sort order.
>
> > +                       pinmux =3D <RZV2H_PORT_PINMUX(6, 7, 14)>; /* OV=
C */
> > +                       bias-pull-up;
> > +               };
> > +       };
> >  };
> >
> >  &qextal_clk {
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.17 with the above fixed.
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

