Return-Path: <linux-renesas-soc+bounces-18485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD747ADE42D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 09:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 569C617B903
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 07:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5526A277C87;
	Wed, 18 Jun 2025 07:03:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC0277C84;
	Wed, 18 Jun 2025 07:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230212; cv=none; b=uDTng44/hXlKCFoQIsljchpG8LOZAXiGkJf9ws4P1kJ8NsnBgrRFawyQr7l6mSscdat56I6KCuO7G0WItqaJMbF2RKGJIgvzeC9TbjXEbqBUJKYMY2udxvbH5OWP6gbW0hidkyWF5bvGrxhwddRxrgyzzbtK4X1OnZu/pbJ9dAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230212; c=relaxed/simple;
	bh=HDPxQfTWdVy/egLmGW4fvztcJq413LGa1QL4nEkePTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuPYKyTo15drovlOOjMJ7oMUmWYt1gOW031ZfbgsRJdJTaLl6BeIfXISlX/CskF+S7vWwdN2LOE5Yn5/kEhTHr++SM60DI/ems7Hx3uvSoZTwvtrYFTgrhbUXBobpXMjuxwc7CTqETNJ/rMDJpFUBvwJdexTd/jikMhBUlPW2OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso976974241.1;
        Wed, 18 Jun 2025 00:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230208; x=1750835008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx1g4H1TwGYzkFjYtTNms8UTlvHLn0G6i9T/+MuH4hA=;
        b=Rgm8ncgy5n2f3FmmVf/C0wDK2b8+Kn1pQ2bhPv8a18C5izPmmITpuu4NKOXWGJROaD
         nlr5WLIBQjyFcomI2nCQmaMZGviqdojJhA1/1sl6JpXsjtMbrQVAQmBdvMh10s5zMPv+
         FMXo5irRyjUTHtfieJqbI+UazUaFislI8T8VrEd7OVoVTzUVoAZAA3fjOr0UI4Oi9DQ/
         pJoPy9/KduDX63imezUwcACr5Bh95roej3GiRSoJUEuEWi6Q9l8EBgHDxUtjk4cJ5gHE
         Rmrtx/h98LUsZfd2qUJAoFOjpyVbztJ4LemDiYaPIw6FEKxezHQE8cMlZwn3gU9RTL25
         PF0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOs99hLOZ7BqwTinoz4Z2XUGBcvrUuSGqJZlAejIRBj7cxjK9xCRfGVzHPL+PFpht0YDHPXpIhEurCV3tu+ympsBc=@vger.kernel.org, AJvYcCX9KAXr7FEk8q94r6y3CQ+RfUhSEgVOsOddRmq7uMST1EGSZXlyvvP+gc5RivQLwLeOuZST8HQXaVR1@vger.kernel.org
X-Gm-Message-State: AOJu0YwY3vvs+MXZpxr165YDVSkldK9l75UqsodyU3RvdcE20UTTQFRR
	YlYH/G5YK4o+t5eVqBbIC40mywRixI6AGMaKuJKp3E6Dh9uQykYG+rxCEF/HhYoc
X-Gm-Gg: ASbGncsCWJfnuaF1dmhVhJKABcZ9ps6SUPa7FL8qkKjqud2Kwf1rIW/Bh3C7d2of54V
	6kJ+pyTxyHK9hr+jxkTimdLAAIAhUEHLA+8mxc3RFziSNxYriAFq+TOmD4MSVzjZDTJwR2mtIxa
	10Fl9Yj7+tgeV/0idxD8IN+MGOhlpZknrIXqoB315Bj78ECT5eunzw6LEDPX6Jw6aXOUaAphOgq
	tfDGRSFuCn4fix96Bf+aoiOCj+kc1iBqDR3XTmBiRF0ecHMsMlQC5A3Aq5Pciex2G//vKYABIt9
	tPZnWs1K2e5FdztH6BkJ05RUhpe6Ia/r9bkxJwmXhFHMYND2kUgiW8p3BMnS1E61sNRyOVfD4ja
	NZ3TyPqdPY2mOZDMWwgh97KuM
X-Google-Smtp-Source: AGHT+IGlN+x/jPT9fn4hxTWcE0IpeuL9zHNvp7c8ie6x8wOILWFfzWIqXzp4LsX5W1t5KLKCQWZ7CA==
X-Received: by 2002:a05:6122:390f:b0:530:7bd4:1761 with SMTP id 71dfb90a1353d-53149a6fca1mr12264295e0c.11.1750230208094;
        Wed, 18 Jun 2025 00:03:28 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313dd849e7sm1940526e0c.10.2025.06.18.00.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 00:03:27 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e7ade16082so1845503137.1;
        Wed, 18 Jun 2025 00:03:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLYKiDHAOSMzsa6w66u4y8Nln2F0Er3k7fI7nzwakOLADHJbJOMs9gh2vwciTHmBx0cDKyKZiIOT4/@vger.kernel.org, AJvYcCWkwIpn3btY0+j5x0z10QKtCWAocXm2NHeUqB64mgo/zMQTwWunLbv/gsDOhQuPpK+H/8MPjZgDnGn6o6GGG4zwaqg=@vger.kernel.org
X-Received: by 2002:a05:6102:2c86:b0:4e5:958d:4962 with SMTP id
 ada2fe7eead31-4e7f6323326mr14620847137.2.1750230207208; Wed, 18 Jun 2025
 00:03:27 -0700 (PDT)
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
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com> <CA+V-a8t1siG17NKna-ACUzCoXFTOyVxuLonTVSRLnNq1ie3iTg@mail.gmail.com>
In-Reply-To: <CA+V-a8t1siG17NKna-ACUzCoXFTOyVxuLonTVSRLnNq1ie3iTg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 09:03:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXw+mcj-P=Zm4R8WF0PxogPLfFCbALBRFN9Wn8UEo1FkQ@mail.gmail.com>
X-Gm-Features: Ac12FXw1RnKAXRPJAq0eRD5Mv4HXDFg96giukwQ-6mV3udJ0q68YZnrTxPiV39s
Message-ID: <CAMuHMdXw+mcj-P=Zm4R8WF0PxogPLfFCbALBRFN9Wn8UEo1FkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Tue, 17 Jun 2025 at 23:05, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesas.com> wro=
te:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.renesas.com>=
 wrote:
> > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 Mar =
2025
> > > > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Document suppor=
t for
> > > > > > > > the Expanded Serial Peripheral Interface (xSPI) Controller =
in
> > > > > > > > the Renesas RZ/G3E
> > > > > > > > (R9A09G047) SoC.
> > > > > > > >
> > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > >
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/memory-controllers/=
renes
> > > > > > > > +++ as,r
> > > > > > > > +++ zg3e
> > > > > > > > +++ -xspi.yaml
> > > > > >
> > > > > > > > +    spi@11030000 {
> > > > > > > > +        compatible =3D "renesas,r9a09g047-xspi";
> > > > > > > > +        reg =3D <0x11030000 0x10000>, <0x20000000 0x100000=
00>;
> > > > > > > > +        reg-names =3D "regs", "dirmap";
> > > > > > > > +        interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> > > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> > > > > > > > +        interrupt-names =3D "pulse", "err_pulse";
> > > > > > > > +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0=
>,
> > > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1>;
> > > > > > >
> > > > > > > On the next version I am going to update spix2 clk as <&cpg
> > > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
> >
> > According to the RZ/G3E clock system diagram, (the parent of) clk_spi
> > is derived from (the parent of) clk_spix2, not the other way around?
> > So you can model clk_spi as a fixed divider clock with parent clk_spix2
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > and factor two.  I.e. provide a new core clock R9A09G047_SPI_CLK_SPI
> > instead of your proposed R9A09G047_SPI_CLK_SPIX2?
> >
> With this approach when R9A09G047_SPI_CLK_SPI is used as a core clock
> and XSPI node is disabled the clk_summary reports the core clock is ON
> (while it's actually OFF).

Is that a real problem, or is it purely cosmetic?

> Can we maybe use a unused ON index and ON bit for example 25, 0 (ie
> 0x190) and represent this is a module clock for example for the
> spi_clk_spix2 clock and use this in the DT and let the CPG core code
> handle such turning ON/OF the module clocks based on the enable count
> which will be handled internally in the driver?

Please do not use "unused" module clock bits.  These do not describe
the hardware, and may actually exist in the hardware (try disabling
all undocumented module clocks, and observe what fails...).

If spi_clk_spi really must show being disabled, you can change it
from a fixed divider clock (which does not implement .{en,dis}able())
to a custom fixed divider clock that does implement .{en,dis}able()
and keeps track internally of the fake state, or even looks at the
state of spi_clk_spix2?

However, upon second look, spi_clk_spi is not implemented as a fixed
divider clock with parent clk_spix2, as described above:

      .smux2_xspi_clk1     0  0  0 320000000  0  0  50000  Y
         .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
            spi_clk_spix2  0  0  0 40000000   0  0  50000  N
            spi_clk_spi    0  0  0 20000000   0  0  50000  Y
         spi_aclk          0  0  0 200000000  0  0  50000  N
         spi_hclk          0  0  0 200000000  0  0  50000  N
      .smux2_xspi_clk0     0  0  0 533333333  0  0  50000  Y

Instead, they both use pllcm33_xspi as the parent clock.
Apparently I missed that in the review of RZ/G3E XSPI clock support.
The changelog for that patch does describe the correct topology?

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

