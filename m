Return-Path: <linux-renesas-soc+bounces-18971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36549AEF817
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74E343AC102
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046332737FC;
	Tue,  1 Jul 2025 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGdDQY5u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17C245022;
	Tue,  1 Jul 2025 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372091; cv=none; b=UADl9ROGGTrGt+Pas2w7Mv00H3vxIOQqWLUW5EX6GLMRQTQ9kbF5VBIWkld8vByHu/J2ULjX9l03imz8WU72M2QAoUljlx9JbvrwpF/AGFlO7gcgNyxmTCKC2OAFEVfdgddFBt8segaGIoMI0mpYr6xeU8SyUUrUo9tGAIklCe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372091; c=relaxed/simple;
	bh=HAFfi+lMSdiwFILAODV0pi9LTtKI2RiWDBX545r9Kyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MueRu5mzROUh2NbPtExgluHlsG3D7PE8gBLY+eRBpPl4u31XyuWwUz5jftVpzYZcynRBfEY5tiArc5mFS4fVnINTun5yTM1LtNp2xnJTjv7eBmyCdWUn60EYdVdp6Cw6h5uU0rhIsnFxWluPXsfSt8X0+i66yTaZfpiBFh6XUv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGdDQY5u; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so19208945e9.3;
        Tue, 01 Jul 2025 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751372088; x=1751976888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKov+5/H0v57EzBT3bzaGj2r0Tn1REiMuqdnsvTtQJA=;
        b=SGdDQY5uK6zmaqQHphgvCRXz931clpvI+AJDDVP8LkUe29Uxch0saWu3b1wycpRnk9
         phvLr/dVa8rgsuuJ3JF5ciidcpjvSbvwYShR3toFtsliSyM0uzIYD0A2BJMcVmQt8SNS
         9is0zaRzUmLbUElSuURkbQwjSyLAo/24zoTf2DDiSZGKyd+/Z/gjvHYa7gyEsEAWcVBx
         r2EuErtyiEyEed9ddPa1Cwr8pjoLZDVqqhmACbcleoBeT8u8DmbTiCWL3kSZtVljFozi
         oYk7tGJnFC8FAyJ3jois2VPkSe0n+g6W4MwJG25cCOhmpWL1EhermW7QMygZdzlYhJue
         MLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372088; x=1751976888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKov+5/H0v57EzBT3bzaGj2r0Tn1REiMuqdnsvTtQJA=;
        b=Q9OfSy09O510kISdJG8iUMX9xuqPAm7cAwDXZ0hNnjKsG06r03ul6xX7yNUR+YeXK6
         OAt/dgFllXTiXOe7sX815YxNsDnWTPV/G9Dhyfl2phmYXlHT5clXA33ezBxMzYjNgFei
         pd6Jq46sN/4oFtzHaImNN96coCnKJ0K40GDXBG43Q5woT6szd9M1c/XxC/oDYrkKPRgL
         upIZsE0t8bteKiCqkhmWcBrHaWaWicu/Js6D5klsDG+DxlXfEQ80iSk7mdqAJlqMdrks
         JTEhQSCmrEQ9i+V5tp9pfQRlUKU46NImOGyNQqJBOT42ARw7HVSowpSdxm1v8pTdZ5ax
         3lYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV30MyZdL4RjBKftDMlJxdhtxgLddgci9+qk1UB7iEFmZ52KF0NOEunw6KN/nrbFxhTRLmIqyv7+0lnEjdBQHerHes=@vger.kernel.org, AJvYcCViEnQNPwXheS20o56rP31lgfj6yKEcKPDD5vr01avHsoDXf6Fl/nAG6G3XFmRUTGmdC7PT68KB4QMWvu9b@vger.kernel.org, AJvYcCX4moWSFD76nnEaqEK8RGW1KC/3QL14shmhDCmlGX+rzSYwiOi7RGgRHYo8lTCtZgLuFvmpcsFqDBMl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wZ4wvBTtgmSfegdQH2F4XWxuvj+S27+T/RyYJcLCAfl0KnG8
	v0z8gBr4l3gABKaH9utylAOgZnJLRT+Uw9cL69RZZrmY2glZNf/7YPtUhgLlwIZ32AfX/fMcx5a
	NX+mHOJWSTtGm0sDzjimpQCmLxQgX+JI=
X-Gm-Gg: ASbGncuAn6dywiB75REYK59P//29WQGp/qYRYHEtTyF1AfdvrsO5wV178HBwKNTq1vz
	k/YFvHnfeH969///2UGixTeEWel8MroAzlkiepzlXF3AjAByHmiTE4/5STyclbZnP4JKwBResl2
	oYmEGp9qMBRsqzBxoYjhe7OH9mQvZP7ZWmFTP+M6Rr1vYu3ZHFQ6Hxf5DSPPvlefoo3VdqnQPP4
	e7W4eXVE2w3Yss=
X-Google-Smtp-Source: AGHT+IEeZTSLDfspnaDNhUe61xztQCQuUiXvqEb9wK8Y76FkrTICZjnyiAvpshWGVFaRfwZJWfLGM5ovhnYo9dHt7Hs=
X-Received: by 2002:a05:600c:444f:b0:450:d012:df85 with SMTP id
 5b1f17b1804b1-453952b30ddmr139666065e9.18.1751372088041; Tue, 01 Jul 2025
 05:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250624174033.475401-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXtdFqqbArLb=uGRSGY2b-gmH8sPoCzw+4LJ-4UHA0t+w@mail.gmail.com>
In-Reply-To: <CAMuHMdXtdFqqbArLb=uGRSGY2b-gmH8sPoCzw+4LJ-4UHA0t+w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 1 Jul 2025 13:14:21 +0100
X-Gm-Features: Ac12FXxJIXLTEKz9JKavCvXlynDHmSPTlwsznudfQNqBesc7dT5yU1Smihvfoz4
Message-ID: <CA+V-a8shb+JtzRWdB6L=s=7C=_9oZhKjGbnA4-16WOy_2Q30+A@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a09g056: Add XSPI node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Jul 1, 2025 at 1:07=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 24 Jun 2025 at 19:40, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add XSPI node to RZ/V2N ("R9A09G056") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> > @@ -208,6 +208,29 @@ sys: system-controller@10430000 {
> >                         resets =3D <&cpg 0x30>;
> >                 };
> >
> > +               xspi: spi@11030000 {
> > +                       compatible =3D "renesas,r9a09g056-xspi", "renes=
as,r9a09g047-xspi";
> > +                       reg =3D <0 0x11030000 0 0x10000>,
> > +                             <0 0x20000000 0 0x10000000>;
> > +                       reg-names =3D "regs", "dirmap";
> > +                       interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_RISIN=
G>,
> > +                                    <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>=
;
> > +                       interrupt-names =3D "pulse", "err_pulse";
> > +                       clocks =3D <&cpg CPG_MOD 0x9f>,
> > +                                <&cpg CPG_MOD 0xa0>,
> > +                                <&cpg CPG_CORE R9A09G056_SPI_CLK_SPI>,
> > +                                <&cpg CPG_MOD 0xa1>;
> > +                       clock-names =3D "ahb", "axi", "spi", "spix2";
> > +                       assigned-clocks =3D <&cpg CPG_CORE R9A09G056_SP=
I_CLK_SPI>;
> > +                       assigned-clock-rates =3D <133333334>;
>
> Do you need these two properties?
> If yes, perhaps they should be moved to the board part?
Yes, I need the above two properties without it flash write operation
fails. Ok I will move them to board DTS.

Cheers,
Prabhakar

