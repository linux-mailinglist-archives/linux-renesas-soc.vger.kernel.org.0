Return-Path: <linux-renesas-soc+bounces-17558-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3BAC4DAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 13:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D0227AB98A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CC425D200;
	Tue, 27 May 2025 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrDs2PGz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59A1DF270;
	Tue, 27 May 2025 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345696; cv=none; b=CijOmObQyE9obPiKQvzCoJSvf4ZMVunecMytygAzVh/LODQ9V25Kqii4UmqP8AEZwe0HO7v52jeHdEyF3BHpO9Rwx845QUHiAWJHc6iySdggF7A0rX6ZLkwZ1tH+qPCoG+6uVeIuuz2DEzzJT2DwYlfPUP2sKAJyFlTyIKbSBR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345696; c=relaxed/simple;
	bh=+PPbfF2SmSiQIvjQ2MW3Yk65tF46e7YUm4vQNjVdxUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTQtDxaSSa9RUKcT3Zaa2m+Rta1LFDF9hnw4Cbvzhpw4zJCk6mTbiX9JSl9nXQochkW4VWKW57QVqqQFw8UQLk4TyuzrBQ6XaeGkWMFL+psdRn/4G18UGNP6N/jF8yFSganENy09UFvDCrnc4vR6jfuYI0KuBsY6Q1OcGa0G3AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrDs2PGz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441ab63a415so38644615e9.3;
        Tue, 27 May 2025 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748345692; x=1748950492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY6+6p1ISLjuPJ6dhFMtDrf4Z9wnk7v30MNc5rqXJJE=;
        b=hrDs2PGz0l6MfCxRcMUmCTnMLQAZF6+5ypQJGUrCtmOZFzYcEjYRkxHu1UCNnr7HWE
         YZti3gLNEKWWQ3O0yudARfcr5w9OjB6xwbTj3g2BkkjHXtrYZBAG57+m/oGdnJPnoXpl
         iNoWjn3CcpXuRtYRP9qFEPEp42b3SBYWuvQEZ/75lYrN7mp6UF3a0jGsj8F4SLsMINRA
         cKHT4+F/J+e4qkRF1sNTA0VS+QeMJUpRDeC/8cP9TZo6ehJjIhpLmCl5VUFZmpyGe9df
         SfkiMmin2x8sCu2frjLTTLECABVzMNFzH3L1NQYpj1rDjso3VzwOMVIRh9MamdoTzsaN
         JnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345692; x=1748950492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZY6+6p1ISLjuPJ6dhFMtDrf4Z9wnk7v30MNc5rqXJJE=;
        b=O47xKgR/lSI/ybBW0CRpeu4oXTxvOULjSMgpkeLzMw/vt7YtE1QBqXwudoqR1wPCt3
         S4/vKhjX0pN4wcZMpbbqiIRpHRmkGXFbjdIFLnLHO4XwBJg/ct6iY1k5+tBBvY0r+ixV
         ykHaDLY7D860RT37XTQalYKoE8B8GnPxxVQMDJOpkj3Lmh4SE9Q5IVZ8cVOIxYKFozr6
         769uPWa6zhteLowTGElyLJY3715GREq66uEgzqI4FYMZJO68u6rNkg3qBZgoYbAT6PmD
         SoX/eBaJ8XjEL/bM4/1QSn8ZqH0uW6rLr5u9MbK7ZGAK5pc3+fc/JkTqdWP1BMr2qgPk
         IPNw==
X-Forwarded-Encrypted: i=1; AJvYcCU1PFUFS74VJXP449ozPuxaLvQRgq0d3FhBxY0e25ql3Q1nXlqrquQCXwKIl9JaNFbIZ8Eb1fVQPNyr@vger.kernel.org, AJvYcCUjLjik9qbfWDRa60y+WXXSCZzhbw0Ok2fhP102NUNtBSD+Vdrks7dBclit2yTNqROVaIBe0AcGnFy/bc4S@vger.kernel.org, AJvYcCXH4Z/uvusU+4BXYzlvObBRDEBu0CH8tCiU4seaYaZkIA9VB2VU0wj3cYLbegj706rfaZsHzOn3AuHAIXbSBTSieEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOg7qvmuWYwIxmyNgKfg0m3qzBS85KQUcE+sc/SuHN/7XfFyL6
	L05nNfOu7242uiK1yEK7AI5n9ZRwV2Uby+11CWTViEQzrHcRvFReiumIECPMNKbaaQzmkYEbM0z
	O90Dz57b4fIqltUa4qF4AffDMKZpK09FqhpMN
X-Gm-Gg: ASbGncsUK4fzfhhRD6Ev7WtPhqJasE9T12qedlJkxyVWev2iyDgQa3baAeBj7g5tm7L
	nAOOcIR9+HkQ3gVnH4GZfmOLvCIw4g0tSTxDZRYjSR9G0TC+0C/skJP9zQx8xNGk+upAwJ2UuUs
	0qsrMMTLRhryLyyB4lxNdkTOidELePkBROEo9FVX0QUMEoIg==
X-Google-Smtp-Source: AGHT+IGIEBNXzYbY9tpl/7hzwAfE29eN0MO6dp5pYK4g1FEm7pOZesiGxfUqL+aJmDXst1z45qSr3DaCn+pNQiposp0=
X-Received: by 2002:a05:6000:2301:b0:3a4:d53d:be23 with SMTP id
 ffacd0b85a97d-3a4d53dc01cmr6499259f8f.30.1748345691523; Tue, 27 May 2025
 04:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250515183104.330964-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVv3abCx-FXMZFhfmc=5tk5-OA0mnxpcT=QYQGzaVZPjw@mail.gmail.com>
In-Reply-To: <CAMuHMdVv3abCx-FXMZFhfmc=5tk5-OA0mnxpcT=QYQGzaVZPjw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 May 2025 12:34:25 +0100
X-Gm-Features: AX0GCFuawmIBP_0UgEC3uycVa4QO5o3QQMygKDcTaJmzsnkJu7SUeaGdb6G3MIQ
Message-ID: <CA+V-a8vsXdEHDHWmk=5gp5hU7egmEuwcJx1vaoPWrv5EXEb=jA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add USB2.0 support
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

On Fri, May 23, 2025 at 9:03=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 15 May 2025 at 20:31, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The Renesas RZ/V2H(P) ("R9A09G057") SoC supports 1x channel with OTG/DR=
D
> > and 1x channel with host interface.
> >
> > Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 chann=
els
> > in R9A09G057 SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -662,6 +662,119 @@ sdhi0_vqmmc: vqmmc-regulator {
> >                         };
> >                 };
> >
> > +               ohci0: usb@15800000 {
>
> Moving above mmc@15c00000 to preserve sort order.
>
Thank you for taking care of this.

Cheers,
Prabhakar

> [...]
>
> > +
> >                 sdhi1: mmc@15c10000 {
> >                         compatible =3D "renesas,sdhi-r9a09g057";
> >                         reg =3D <0x0 0x15c10000 0 0x10000>;
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

