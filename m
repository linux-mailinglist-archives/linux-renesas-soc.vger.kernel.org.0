Return-Path: <linux-renesas-soc+bounces-18502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8982AADEB64
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 14:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60959174456
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 12:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E52F2DBF6D;
	Wed, 18 Jun 2025 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOCPYY6O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4237B2BE7C8;
	Wed, 18 Jun 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248401; cv=none; b=pnkU4Xb/cR2EDxLotAA6ITFYljOmWn051XQrqkdKCdqe8AWx/GyQTQ3WyELRsZ96WKsKk1yRexn8r6BWXnejLWYKvZAOH2WjoEZPM3AaoX78bg6cVF2ujBr6gucLtHAbRE4hJoRqdvNasVzmdOYRY8qWELovtUhyP09WpeTs9TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248401; c=relaxed/simple;
	bh=ngTbBXOQ49C74P/KvnCX/Ci8IhJfAJhBa85UrGjzDek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENzQMIsciiWkCUxI4uFAVbLCFcoNcCXPh+LXFvFel2/Ib47hgqpkObM0Ol9y5vsazFUGBkcseQuYXMlt6Tl2w3L6yIW5VpcbcFZZz5aUcNYOetRyO2w0Qfkvy594nUTAIa1MGgDSd+4wD2O9YaD4TR5lZ+dwpxCZCIIa/eTtJVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOCPYY6O; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450dd065828so55811715e9.2;
        Wed, 18 Jun 2025 05:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750248397; x=1750853197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT/BduuuSc9BUyU+gwgt/b9z8x06Ljn3N/GzF+hF3B4=;
        b=HOCPYY6O0y9/jFLx9eScKfKn7Gwigboe34C3gKboeXTs7oUfaq8nF3+JuAwTBe6G1b
         lE1Fc7e8X/5uCt+/oRQ76JUj6bsGnRssvXmhe0z+fhS7BAofPsYFYa+AMK88+uTonPcH
         +DXo4j7bD6gLVYzlnpC5MkrUL5KtWswTn54oPKgks9c7Dmci05pn8hQJPp1LMInxLasj
         +HXTPt7a6Un6g+blOuPxuTKri6+ok2TUZ2lMtvxVMh/uwIL/pA/1yIa/sXjZNEJQImRp
         siTo+m6KqNElPq5qFmHyHMm9xy4XP9jBq17ADNJI8PA8rMnY8DQiyjmRzAPvvol9pJ2B
         dQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248397; x=1750853197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jT/BduuuSc9BUyU+gwgt/b9z8x06Ljn3N/GzF+hF3B4=;
        b=AOb71zssCyEP7CTZAfA8ymGfD2mgnVtChIjzi15+UA/oQ7Lk/OJhXxlniwGQoksjb/
         xP/a/9i2PVi4FSm9AMdU1U61FRv8HJfnlzKa4bkZQsmGCokEO8TQ+DfxXhna5wa1lO/c
         Lbgq/di2+WVWEQaf+X9YD7jwgE0ytsEe2hXVC7Goo9TAkCZpQGjrif/2msrhgdTOeN0V
         gcQ5Dh5bV9wE0sTm0oOm2+aPBPHH7yV/1fD1WKvhlUoX6niWN6rq/sBDQasTj6pD3F5s
         U0xTtsJgVNje3nEOGqwWjTPg+pUik9Auq4i/ghc8n08uPfr5ydLawUbkING1zX8uQ8oM
         rJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ObyBp38UMrgK42U1F8z9ycQ2HXAz1hDw9akxjITD1L7abvz9dMlzIMnIi5SGl4WpS9E0gow7vZVykHnavRsFwGs=@vger.kernel.org, AJvYcCWnA5bNlmnrioF7AsyFC020W3lqC3pDI+Dn6Sb9VdPIf3qgPFTQx04uxTwY+rmJEhIchsMeLKQCqdUP@vger.kernel.org
X-Gm-Message-State: AOJu0YyE/4Rg1bMKOAOSXuFMzd9M+hRm7Hi3rjnNkXQ95yuYt5Nz4Im3
	+7kRFcZg3/JIA8AlnltKxV9jU3ZEOa/VG4D7TU+RomOAISccHQ9urNWRvrnzikIBRIrtKiD6iTn
	Riet+wJ7E6cr0JnvVgvy2gy7iht6hqL0=
X-Gm-Gg: ASbGncsNiXWvvBxo3WRYKwGZBX6QO8Vo+iboW04wYwy8M8aGdjdS6vap5TvGe/hdyQ6
	vI2TFXbh/1ZjfPAkecYgFCAlzoskNAfpAYjLXifWm4ddpYZgc1vG/imGR1uLEcQTBYisemKlYGq
	DBpE8SeiH0kzvDQQY48vLUTBnA0+SnMC2tMojuoxlcgeAnxg==
X-Google-Smtp-Source: AGHT+IE3g1/9L7vTPpcQ5hz/jaq232X2I+KkGePuf97G2hrTVM1360JVyVi2+IRHxDSO1Qu69urZBIVXU4lJz1GhyeU=
X-Received: by 2002:a05:6000:64b:b0:3a5:8d9d:27fa with SMTP id
 ffacd0b85a97d-3a58d9d2a7bmr2280014f8f.3.1750248397056; Wed, 18 Jun 2025
 05:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com> <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
 <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
 <CA+V-a8t1siG17NKna-ACUzCoXFTOyVxuLonTVSRLnNq1ie3iTg@mail.gmail.com> <CAMuHMdXw+mcj-P=Zm4R8WF0PxogPLfFCbALBRFN9Wn8UEo1FkQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXw+mcj-P=Zm4R8WF0PxogPLfFCbALBRFN9Wn8UEo1FkQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Jun 2025 13:06:10 +0100
X-Gm-Features: Ac12FXy-ucHTAia_D_X04DGS0aDE-Zp0xzcAPAzeX1-qXC3VjdBnkbxRptx04Lg
Message-ID: <CA+V-a8u4PgttE0LaH7M=-5Br400sNE1gzk_a3L_9jfXZgCLd-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Jun 18, 2025 at 8:03=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 17 Jun 2025 at 23:05, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesas.com> w=
rote:
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 Ma=
r 2025
> > > > > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Document supp=
ort for
> > > > > > > > > the Expanded Serial Peripheral Interface (xSPI) Controlle=
r in
> > > > > > > > > the Renesas RZ/G3E
> > > > > > > > > (R9A09G047) SoC.
> > > > > > > > >
> > > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > >
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/Documentation/devicetree/bindings/memory-controller=
s/renes
> > > > > > > > > +++ as,r
> > > > > > > > > +++ zg3e
> > > > > > > > > +++ -xspi.yaml
> > > > > > >
> > > > > > > > > +    spi@11030000 {
> > > > > > > > > +        compatible =3D "renesas,r9a09g047-xspi";
> > > > > > > > > +        reg =3D <0x11030000 0x10000>, <0x20000000 0x1000=
0000>;
> > > > > > > > > +        reg-names =3D "regs", "dirmap";
> > > > > > > > > +        interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_RISING=
>,
> > > > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> > > > > > > > > +        interrupt-names =3D "pulse", "err_pulse";
> > > > > > > > > +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0x=
a0>,
> > > > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1=
>;
> > > > > > > >
> > > > > > > > On the next version I am going to update spix2 clk as <&cpg
> > > > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
> > >
> > > According to the RZ/G3E clock system diagram, (the parent of) clk_spi
> > > is derived from (the parent of) clk_spix2, not the other way around?
> > > So you can model clk_spi as a fixed divider clock with parent clk_spi=
x2
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
> > > and factor two.  I.e. provide a new core clock R9A09G047_SPI_CLK_SPI
> > > instead of your proposed R9A09G047_SPI_CLK_SPIX2?
> > >
> > With this approach when R9A09G047_SPI_CLK_SPI is used as a core clock
> > and XSPI node is disabled the clk_summary reports the core clock is ON
> > (while it's actually OFF).
>
> Is that a real problem, or is it purely cosmetic?
Just cosmetic tbh as despite being a MOD clock we have to define it as
a core clock in the DT.

>
> > Can we maybe use a unused ON index and ON bit for example 25, 0 (ie
> > 0x190) and represent this is a module clock for example for the
> > spi_clk_spix2 clock and use this in the DT and let the CPG core code
> > handle such turning ON/OF the module clocks based on the enable count
> > which will be handled internally in the driver?
>
> Please do not use "unused" module clock bits.  These do not describe
> the hardware, and may actually exist in the hardware (try disabling
> all undocumented module clocks, and observe what fails...).
>
Agreed, "unused" module clock bits were only used as a dummy. The
read/write operations were only performed on the actual bits which are
documented in the HW manual.

> If spi_clk_spi really must show being disabled, you can change it
> from a fixed divider clock (which does not implement .{en,dis}able())
> to a custom fixed divider clock that does implement .{en,dis}able()
> and keeps track internally of the fake state, or even looks at the
> state of spi_clk_spix2?
>
Good point. Maybe instead of implementing the dummy .{en,dis}able() I
will implement the is_enabled() + (clk_fixed_factor_ops). The
is_enabled() will take care of reading from the MON bits and report
the actual state of the clock.

> However, upon second look, spi_clk_spi is not implemented as a fixed
> divider clock with parent clk_spix2, as described above:
>
>       .smux2_xspi_clk1     0  0  0 320000000  0  0  50000  Y
>          .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
>             spi_clk_spix2  0  0  0 40000000   0  0  50000  N
>             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
>          spi_aclk          0  0  0 200000000  0  0  50000  N
>          spi_hclk          0  0  0 200000000  0  0  50000  N
>       .smux2_xspi_clk0     0  0  0 533333333  0  0  50000  Y
>
> Instead, they both use pllcm33_xspi as the parent clock.
> Apparently I missed that in the review of RZ/G3E XSPI clock support.
> The changelog for that patch does describe the correct topology?
>
The topology is correct for RZ/G3E, spi/spix2 are sourced from
pllcm33_xspi divider and there is a divider (/2) for spi.

So to conclude I will implement spi as a core clock (as done on
RZ/G3E) and implement a fixed factor clock which can report the MON
bit for spi clock. Is this approach OK with you?

Cheers,
Prabhakar

