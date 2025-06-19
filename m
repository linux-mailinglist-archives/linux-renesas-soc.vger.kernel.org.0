Return-Path: <linux-renesas-soc+bounces-18519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2AADFF99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 10:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 908D918886FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 08:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DBD21931E;
	Thu, 19 Jun 2025 08:17:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A41A3167;
	Thu, 19 Jun 2025 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321058; cv=none; b=aheoY+delTcgV56pR1yVPJ94Dy0KH/0zdEPJGwiiG6NIpe2Rx1+oSVvWrSv1KEUwyKyiGKvGc7bdppYvHCjUyGN1VYo6Mic6+xOWsqPASBtlMqnKYBN5hqxuD9n3fj74jko8LV+5nCEVA74BO8GUIKy9N3oMqABbaDKZk1P+Y5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321058; c=relaxed/simple;
	bh=Enhj4TSeefJPNPN/HfvXey7VBsM71KA/J/zKzbwFcEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eefUIjcKqnSz02uqHM/Kl3X9d4+5T760CCJAymcM9hUFvESpOQ7r+5VsHMeT530jILbl7yU+62E73wrOTDsnCtqZ0Zrk8E78Snb4aRUTp/OwFJMQRtskS2gLDcdonsD1+l2PwOayAxQf2yd+VcQKyg8Sg3W/5wPJkjB08q8yFoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87f25076697so128320241.2;
        Thu, 19 Jun 2025 01:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321053; x=1750925853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcSvqpjZZ7G0OwIFjCJFzT6zT1F8SRqmyHYa6jaDCWc=;
        b=Ehqeho36UNDRAMjVlNdg8nxOv503uXKquZBFdYMqkkmAnxYBjRlUp9NK14wZyEo2AD
         t8SUErhjUMXhnU3nyPJ8dn6XXvQNmllw2SCyiaPSI0RGMeeBi3IRqe8mYI3e9pTERa22
         V/w7xoowART+bxGuv0BJocq7iQTVQUu7W2Edbb2J9p/6EOsrEdMdqkAr8HnDcyblEcQw
         beJLvvQk3UkxPpTuFaO69oKSAj3sgojAF8WQnKzTjh0dbi8XLg6JpIPsCKDJ1a2+dBp9
         R9YGqyf1gjAjdQ67Z60gwdd/X1IYBOprAeSzD5dFNUJB2J8L/G8+8mTVPbskFvzy8MFC
         6AtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSdIlaQd+5UChmc3/ulIGwCok4THice1DngJZhtuTkWsx/Ina0wjTSfwP4zss75P8/X1NpktcJi7/6@vger.kernel.org, AJvYcCXV77eHCPOb7DDc3IgLXI6UsH76326WKruUvYM8EG6ELvI5d7eMdk/Zz45rqdtjtm4Wg7uH9HiE5o4HGCWmvyHi7Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBUHlOEw+8ANQMszyzT1+SHTFFB14fAAEb1h7YLZU9SGR1AM8s
	f2PgeEjTywP/haxFMN+ua0JlLKSSOeXA6+EDRYabknhqjzZoy1ck5532ZSguDPjK
X-Gm-Gg: ASbGncu/f7PtAEDI/p0hKcwSu89cl04WATpQGQFWKnOIwnQ96NaV7ICHU+vAed35g5l
	5U5zuCw36Q1dlueURl/HGK4i0ZQr0U6tJKjvmUEJOMJ69sXqOeo3xnfPqA3eynwapZpvs4wnJ0H
	8o6Qm1A03BJPP/xddiFj5rupef2aYxAWwLpBmNJLFiuMqIwjv/4yi8SQ6QjdEM6jygKvqwD2oQw
	im6MWwMJm1H/dcRTBzQe1+97PJUpqCq1w36FiCvCt9FMYxL+EaheJPZ0A2nzGdytPO99qWdfW4l
	YMxLip2Co/uJpNcuUNrbKuiM/ynMzMEi3jRt177NeYs7rd3gcoO9xVgphOuCydg22GLCd57w2SF
	fNdUxGld22EfCirN//jRBhoUokI2kS9/EdHQ=
X-Google-Smtp-Source: AGHT+IGpFOy7H4lpUugxyzLGW89jf035zggPJF+K7GhtsKxfqAxdELZDvh1fMDVjDt5edyctwXG4ZQ==
X-Received: by 2002:a05:6102:834c:b0:4e9:b26a:4d80 with SMTP id ada2fe7eead31-4e9b26a5c5emr333176137.11.1750321053341;
        Thu, 19 Jun 2025 01:17:33 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87f21ab5768sm1800501241.10.2025.06.19.01.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 01:17:33 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso106581241.1;
        Thu, 19 Jun 2025 01:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrq1fFYLbFHiI7gDBqR5FMR9qjxhxLeIxgRGGST0sTzweC76qdl6K/CZwQDyGrt36jnsJ39mNN6q+BLV7OK/0OvVc=@vger.kernel.org, AJvYcCWrSYvC531sq7bDNlnzPaJ12IaPdnygjTQMz2dgqSfIifAO84UAUG0MD4WPPUj3aKvctAC78S2qSdje@vger.kernel.org
X-Received: by 2002:a05:6102:26d0:b0:4e5:a83a:3ceb with SMTP id
 ada2fe7eead31-4e7f64a880amr12790061137.20.1750321052475; Thu, 19 Jun 2025
 01:17:32 -0700 (PDT)
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
 <CA+V-a8t1siG17NKna-ACUzCoXFTOyVxuLonTVSRLnNq1ie3iTg@mail.gmail.com>
 <CAMuHMdXw+mcj-P=Zm4R8WF0PxogPLfFCbALBRFN9Wn8UEo1FkQ@mail.gmail.com>
 <CA+V-a8u4PgttE0LaH7M=-5Br400sNE1gzk_a3L_9jfXZgCLd-Q@mail.gmail.com>
 <CAMuHMdVQ7pK+zvZm6MHsfGRctyOSurQpDYJztSfD6P1gvuw_RA@mail.gmail.com>
 <CA+V-a8tG4_2bXJ9H=FPT-Qa8zcgsE_5vkVQRj-ONDna5n4Ptgw@mail.gmail.com>
 <CAMuHMdUOHmKM6mqQHFhGqmNp-doox1rHx0WNN9O8xntp1-TXqw@mail.gmail.com> <CA+V-a8voEU7CpEarBN-0FugdE1Zny_YvkwKEw9ZChns95oXHaw@mail.gmail.com>
In-Reply-To: <CA+V-a8voEU7CpEarBN-0FugdE1Zny_YvkwKEw9ZChns95oXHaw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 10:17:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3TYvAm3YMCkKLxRPvvdWE7Mg_jeOpioxVN4Hudp8C1Q@mail.gmail.com>
X-Gm-Features: Ac12FXxuj_G89o3fM4vn0i_-NthwzOMgKCCNMvoZ7zXUeqBLHp36aLBRCkxNgi8
Message-ID: <CAMuHMdW3TYvAm3YMCkKLxRPvvdWE7Mg_jeOpioxVN4Hudp8C1Q@mail.gmail.com>
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

On Wed, 18 Jun 2025 at 17:24, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Jun 18, 2025 at 3:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 18 Jun 2025 at 15:41, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > On Wed, Jun 18, 2025 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Wed, 18 Jun 2025 at 14:06, Lad, Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > > > > On Wed, Jun 18, 2025 at 8:03=E2=80=AFAM Geert Uytterhoeven <geert=
@linux-m68k.org> wrote:
> > > > > > On Tue, 17 Jun 2025 at 23:05, Lad, Prabhakar <prabhakar.csengg@=
gmail.com> wrote:
> > > > > > > On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven <g=
eert@linux-m68k.org> wrote:
> > > > > > > > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.rene=
sas.com> wrote:
> > > > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > > > > > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.=
renesas.com> wrote:
> > > > > > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On =
Mon, 31 Mar 2025
> > > > > > > > > > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wro=
te:
> > > > > > > > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Doc=
ument support for
> > > > > > > > > > > > > > the Expanded Serial Peripheral Interface (xSPI)=
 Controller in
> > > > > > > > > > > > > > the Renesas RZ/G3E
> > > > > > > > > > > > > > (R9A09G047) SoC.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org=
>
> > > > > > > > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas=
.com>
> > > > > > > > > > > >
> > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > +++ b/Documentation/devicetree/bindings/memory-=
controllers/renes
> > > > > > > > > > > > > > +++ as,r
> > > > > > > > > > > > > > +++ zg3e
> > > > > > > > > > > > > > +++ -xspi.yaml
> > > > > > > > > > > >
> > > > > > > > > > > > > > +    spi@11030000 {
> > > > > > > > > > > > > > +        compatible =3D "renesas,r9a09g047-xspi=
";
> > > > > > > > > > > > > > +        reg =3D <0x11030000 0x10000>, <0x20000=
000 0x10000000>;
> > > > > > > > > > > > > > +        reg-names =3D "regs", "dirmap";
> > > > > > > > > > > > > > +        interrupts =3D <GIC_SPI 228 IRQ_TYPE_E=
DGE_RISING>,
> > > > > > > > > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDG=
E_RISING>;
> > > > > > > > > > > > > > +        interrupt-names =3D "pulse", "err_puls=
e";
> > > > > > > > > > > > > > +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cpg =
CPG_MOD 0xa0>,
> > > > > > > > > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CP=
G_MOD 0xa1>;
> > > > > > > > > > > > >
> > > > > > > > > > > > > On the next version I am going to update spix2 cl=
k as <&cpg
> > > > > > > > > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
> > > > > > > >
> > > > > > > > According to the RZ/G3E clock system diagram, (the parent o=
f) clk_spi
> > > > > > > > is derived from (the parent of) clk_spix2, not the other wa=
y around?
> > > > > > > > So you can model clk_spi as a fixed divider clock with pare=
nt clk_spix2
> > > > > >                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^
> > > > [A]
> > > >
> > > > > > > > and factor two.  I.e. provide a new core clock R9A09G047_SP=
I_CLK_SPI
> > > > > > > > instead of your proposed R9A09G047_SPI_CLK_SPIX2?
> > > > > > > >
> > > > > > > With this approach when R9A09G047_SPI_CLK_SPI is used as a co=
re clock
> > > > > > > and XSPI node is disabled the clk_summary reports the core cl=
ock is ON
> > > > > > > (while it's actually OFF).
> > > > > >
> > > > > > Is that a real problem, or is it purely cosmetic?
> > > > > Just cosmetic tbh as despite being a MOD clock we have to define =
it as
> > > > > a core clock in the DT.

> > > > > > If spi_clk_spi really must show being disabled, you can change =
it
> > > > > > from a fixed divider clock (which does not implement .{en,dis}a=
ble())
> > > > > > to a custom fixed divider clock that does implement .{en,dis}ab=
le()
> > > > > > and keeps track internally of the fake state, or even looks at =
the
> > > > > > state of spi_clk_spix2?
> > > > > >
> > > > > Good point. Maybe instead of implementing the dummy .{en,dis}able=
() I
> > > > > will implement the is_enabled() + (clk_fixed_factor_ops). The
> > > > > is_enabled() will take care of reading from the MON bits and repo=
rt
> > > > > the actual state of the clock.
> > > > >
> > > > > > However, upon second look, spi_clk_spi is not implemented as a =
fixed
> > > > > > divider clock with parent clk_spix2, as described above:
> > > > > >
> > > > > >       .smux2_xspi_clk1     0  0  0 320000000  0  0  50000  Y
> > > > > >          .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> > > > > >             spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> > > > > >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> > > > > >          spi_aclk          0  0  0 200000000  0  0  50000  N
> > > > > >          spi_hclk          0  0  0 200000000  0  0  50000  N
> > > > > >       .smux2_xspi_clk0     0  0  0 533333333  0  0  50000  Y
> > > > > >
> > > > > > Instead, they both use pllcm33_xspi as the parent clock.
> > > > > > Apparently I missed that in the review of RZ/G3E XSPI clock sup=
port.
> > > > > > The changelog for that patch does describe the correct topology=
?
> > > > > >
> > > > > The topology is correct for RZ/G3E, spi/spix2 are sourced from
> > > > > pllcm33_xspi divider and there is a divider (/2) for spi.
> > > >
> > > > Both spi_clk_spix2 and spi_clk_spix have .pllcm33_xspi as
> > > > immediate parent.
> > > >
> > > > [A] describes something different:
> > > >
> > > >     .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> > > >         spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> > > >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> > > >
> > > > I.e. if spi_clk_spix2() is disabled, spi_clk_spi() is disabled, too=
.
> > > >
> > > Okay, thanks - got it.
> > >
> > > To clarify, to implement spi_clk_spi core clock as a parent of
> > > spi_clk_spix2 I will need to implement some sort of mechanism which
> > > registers (late) core clks after core clks and module clks are
> > > registered as spi_clk_spix2 is a module clock.
> >
> > Yes, I wondered about that as well, but wasn't too worried as you
> > already added the smux with e.g. "et0_rxclk" as parent, which also
> > doesn't exist at registration time ;-)
> >
> Good point.
>
> > But indeed, the smux uses clock names to find the parents, while
> > fixed-factor clocks in zv2h_cpg_register_core_clk() expect clock IDs
> > (which are converted to names), and don't handle non-core clocks yet.
> > So either add support for late core clocks, or modify CLK_TYPE_FF
> > to use cpg_core_clock.parent_names[] in case of a non-core parent?
> >
> I choose the late core registration of the clocks and with this the
> core clk_spi still reports `Y` in the summary while the parent is OFF
> (since its a FF clock).

That leads to an interesting philosophical question: if a clock does
not have an .is_enabled() callback, or cannot be disabled, should its
enabled state match the enabled state of its parent?
However, the same question can be asked for a clock that does have an
.is_enabled() callback, and is currently enabled.  What if its parent
is disabled?

> Code implementation for option#1
> ------------------------------------------------


> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> @@ -727,8 +727,12 @@ rzv2h_cpg_register_core_clk(const struct
> cpg_core_clk *core,
>          break;
>      case CLK_TYPE_FF:
>          WARN_DEBUG(core->parent >=3D priv->num_core_clks);
> -        parent =3D priv->clks[core->parent];
> +        if (late)
> +            parent =3D priv->clks[priv->num_core_clks + core->parent];
> +        else
> +            parent =3D priv->clks[core->parent];

I'd rather keep the meaning of the parent ID the same in both cases,
to avoid confusion.

Perhaps keep the (modified) WARN_DEBUG():

    WARN_DEBUG(core->parent >=3D
               priv->num_core_clks + (late ? priv->num_mod_clks : 0));

>          if (IS_ERR(parent)) {
> +            pr_err("parent clk is NULL for %s parent:%d\n",
> core->name, core->parent);
>              clk =3D parent;
>              goto fail;
>          }

Thanks , this the simplest option of the two, but still shows the
clock as enabled when it is not.

> # Option#2
> As mentioned in the previous thread I implemented FF clock with
> is_enabled() with this I can see the status of core clk_spi reports
> correct status.

> Code implementation for option#2
> ------------------------------------------------

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -179,6 +179,28 @@ struct rzv2h_plldsi_div_clk {
>  #define to_plldsi_div_clk(_hw) \
>      container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
>
> +/**
> + * struct rzv2h_ff_mod_status_clk - Fixed Factor Module Status Clock
> + *
> + * @priv: CPG private data
> + * @conf: fixed mod configuration
> + * @hw: Fixed Factor Status Clock handle
> + * @mult: multiplier value
> + * @div: divider value
> + * @flags: flags for the clock
> + */
> + struct rzv2h_ff_mod_status_clk {
> +    struct rzv2h_cpg_priv *priv;
> +    struct fixed_mod_conf conf;
> +    struct clk_hw hw;
> +    unsigned int mult;
> +    unsigned int div;
> +    unsigned int flags;

You can replace the last four by embedding struct clk_fixed_factor
(at the top of the struct!).

> +};
> +
> +#define to_rzv2h_ff_mod_status_clk(_hw) \
> +    container_of(_hw, struct rzv2h_ff_mod_status_clk, hw)
> +
>  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
>  {
>      struct pll_clk *pll_clk =3D to_pll(hw);
> @@ -664,6 +686,114 @@ rzv2h_cpg_mux_clk_register(const struct
> cpg_core_clk *core,
>      return clk_hw->clk;
>  }
>
> +static unsigned long
> +rzv2h_clk_ff_mod_status_recalc_rate(struct clk_hw *hw,
> +                    unsigned long parent_rate)

[...]

> +static const struct clk_ops rzv2h_clk_ff_mod_status_ops =3D {
> +    .round_rate =3D rzv2h_clk_ff_mod_status_round_rate,
> +    .set_rate =3D rzv2h_clk_ff_mod_status_set_rate,
> +    .recalc_rate =3D rzv2h_clk_ff_mod_status_recalc_rate,
> +    .recalc_accuracy =3D rzv2h_clk_ff_mod_status_recalc_accuracy,
> +    .is_enabled =3D rzv2h_clk_ff_mod_status_is_enabled,
> +};

Lots of code copied from drivers/clk/clk-fixed-factor.c.  Fortunately
clk_fixed_factor_ops is public and exported, so you can just copy its
callback pointers. instead of duplicating the code.

> Please share your thoughts on this.

Thanks , this is (slightly) more complex, and shows the correct
clock state.

Initially, I favored the first solution, due to its simplicity. But
that was before I realized the second option could avoid duplicating
code by reusing the callbacks from clk_fixed_factor_ops...
What do other people think?

Thanks!

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

