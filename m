Return-Path: <linux-renesas-soc+bounces-18525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0BAE031E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 13:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07BC0189F452
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 11:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54F122758F;
	Thu, 19 Jun 2025 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aX2a8GZe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC52264BF;
	Thu, 19 Jun 2025 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331491; cv=none; b=jQbASf++OrrEgBGyyZie35LQWXfvYUnz9BLb0zpFzKsMNyU6zVRJYW6WIiDtFObz+sMTNYDjz8ni4Y2aBig6rZHvU+cHi0R69OyZ/TsR+rSIGWE6oV77MHcf6SaHOFn7hn44YfYfXauEYuZY4e7juAzW0JNh/ZH1cRIfpvX5QlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331491; c=relaxed/simple;
	bh=pXus7cj1wG9bTDuk8iidp2CdA3WvhfJXCegiJR3X2zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/MvDX671dc/DsAuRigXEvFt1VquOqXGQK5tAF0L7lLN3s9yc6euCfrlh1Bw56q+h8B6RKZva4KzXI3EV/lPSsSfVpnnu9tz3br7xJzOZHqVp8RFGg6PxHpDwujzi3qBXOr87mzU1yZh+DkI/OXpL4w/1UDNMmw5+FDPgEM6PtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aX2a8GZe; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f71831abso592228f8f.3;
        Thu, 19 Jun 2025 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750331488; x=1750936288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RybFHnSXUysaAJ4YRjCeBGCDrKvoHW/R4Y8aURPoLPA=;
        b=aX2a8GZeexzlVhLc0V9/D1gvNyUblNH8uyq2KWiRdGNnJSPEfLVJsdoU4t8sEtpkk1
         EZilKVjT35V+RTMAfsnXoTx84HYe2cxqLFS1hUqMtVHEo6KJnlDt8XVEPOehTrz0nscA
         BIqnWOvZKcYQfT3v9g7i5u61IrRMXSixyrLUC4rmX0T3lSY1esLwIavOdAiC8ulQn9Uq
         81LQCQTN0AqS3irtCJdicMIfun9lUbDrKvX65BtndslIJH/dpBVJJpFBA/PMUBvGm1YT
         eQwO1RYbCiVG73IB/2XIPqqtEkgP2LpBxx7ju6J6aYsV5KM9ZgTh89oj7pSHkM2EuRDf
         YqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331488; x=1750936288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RybFHnSXUysaAJ4YRjCeBGCDrKvoHW/R4Y8aURPoLPA=;
        b=M+27qBg+fXmvSNcIZe79yGVDl0rJB4ZDM4H/lmFuQj+EpQUj5+SySaetjacWFrJiKB
         BIq4Onyv9ddSWQudeq6+TpqJim7I2k4PBcoCuwHBKPz0JPTv6obKD+Ir83R5oCitWb1I
         0M9fdt+PWaQkEgvmqAvWDW5s+F0j2HeO6F5OKYCsoNfah62dpsIh2VaaqHx1X0ih7Of4
         rBgEoHrSdg2lCjXkRteHsoDdXmlzlJCxbtU/EVyVxBRJRdK8bPXEnMFG5dWrRYqk+zE+
         4G3vkYzmFX7dWzo7TRt1WAvnCl6Ut2+2nGZheVqK5IQRDDjOtKHIh2s+U2RO5e2FkQ/T
         9qKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoxPHa8wMUCdlkwYzyT9En7Gs55oqafSg8WsdEY+5IcWQvPt7ykF3vZUrASAiXhHmtxGYTM3BC54Ge@vger.kernel.org, AJvYcCXmAzoebpNije5pZjAKxJ4utG090Za9X0S+VLb2lKm0CmFFe81q6lIRaGGEBJRLFm2oCxcnNq8ofqKOcp6dUBAw4rU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMg95m4xhfou9Npzu4de0rV9upE/oWUukJxQmtdECkcl++c1e
	3axCjLk94y3KhxDfGXJGuTUmLu9o943P7dRAQNgeG7mLx525Iu8cHx6Ovt3/qqG+Ecad2PLYKEZ
	fG1GaaREk5mUZMc44FqKSiAlidzpkx23t1pICT5g=
X-Gm-Gg: ASbGnct7ABS7ytt+rWbuRwezTrWj3vK8ZGif2mcF5wTnWKBwLD5iBifkoWsjx6jof8L
	ghyS37exq1BHfs9P9WrYFuOvUqE/4VkWn5Ch4GvyZ8TNd748JyPhSV8dq4b0tNpXVzURr2DMkNK
	Fc8a2NiOFIsNz99lgIKCE3laMtpwt1+/VzrjyP0D5Whg0CygKI7omdP8+okTXTR5mlC/cFz2TvP
	cxJ
X-Google-Smtp-Source: AGHT+IEBYk0BLj2bzHdF/ejrDqZCzeu2j4zfPViMC0k16l6D0bgRld/ZOGusPH2FZPnfLozpEdMGBEFgKXolHU2ukHw=
X-Received: by 2002:a05:6000:25c7:b0:3a0:a0d1:1131 with SMTP id
 ffacd0b85a97d-3a572367717mr17499281f8f.7.1750331487443; Thu, 19 Jun 2025
 04:11:27 -0700 (PDT)
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
 <CAMuHMdUOHmKM6mqQHFhGqmNp-doox1rHx0WNN9O8xntp1-TXqw@mail.gmail.com>
 <CA+V-a8voEU7CpEarBN-0FugdE1Zny_YvkwKEw9ZChns95oXHaw@mail.gmail.com> <CAMuHMdW3TYvAm3YMCkKLxRPvvdWE7Mg_jeOpioxVN4Hudp8C1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdW3TYvAm3YMCkKLxRPvvdWE7Mg_jeOpioxVN4Hudp8C1Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Jun 2025 12:11:00 +0100
X-Gm-Features: Ac12FXyfFKZ_SLRpHegGvVYEnpmUoQG54W0xdg536MafR-HG6f1x3QznMpdsfvI
Message-ID: <CA+V-a8sChpGAyi3c0rmEJsYW-YWQQ-gQqf0yXBrwPzQgdN7g4A@mail.gmail.com>
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

On Thu, Jun 19, 2025 at 9:17=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 18 Jun 2025 at 17:24, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Wed, Jun 18, 2025 at 3:03=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Wed, 18 Jun 2025 at 15:41, Lad, Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > > > On Wed, Jun 18, 2025 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@l=
inux-m68k.org> wrote:
> > > > > On Wed, 18 Jun 2025 at 14:06, Lad, Prabhakar <prabhakar.csengg@gm=
ail.com> wrote:
> > > > > > On Wed, Jun 18, 2025 at 8:03=E2=80=AFAM Geert Uytterhoeven <gee=
rt@linux-m68k.org> wrote:
> > > > > > > On Tue, 17 Jun 2025 at 23:05, Lad, Prabhakar <prabhakar.cseng=
g@gmail.com> wrote:
> > > > > > > > On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven =
<geert@linux-m68k.org> wrote:
> > > > > > > > > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.re=
nesas.com> wrote:
> > > > > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > > > > > > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@b=
p.renesas.com> wrote:
> > > > > > > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> O=
n Mon, 31 Mar 2025
> > > > > > > > > > > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> w=
rote:
> > > > > > > > > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> D=
ocument support for
> > > > > > > > > > > > > > > the Expanded Serial Peripheral Interface (xSP=
I) Controller in
> > > > > > > > > > > > > > > the Renesas RZ/G3E
> > > > > > > > > > > > > > > (R9A09G047) SoC.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.o=
rg>
> > > > > > > > > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renes=
as.com>
> > > > > > > > > > > > >
> > > > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > > > +++ b/Documentation/devicetree/bindings/memor=
y-controllers/renes
> > > > > > > > > > > > > > > +++ as,r
> > > > > > > > > > > > > > > +++ zg3e
> > > > > > > > > > > > > > > +++ -xspi.yaml
> > > > > > > > > > > > >
> > > > > > > > > > > > > > > +    spi@11030000 {
> > > > > > > > > > > > > > > +        compatible =3D "renesas,r9a09g047-xs=
pi";
> > > > > > > > > > > > > > > +        reg =3D <0x11030000 0x10000>, <0x200=
00000 0x10000000>;
> > > > > > > > > > > > > > > +        reg-names =3D "regs", "dirmap";
> > > > > > > > > > > > > > > +        interrupts =3D <GIC_SPI 228 IRQ_TYPE=
_EDGE_RISING>,
> > > > > > > > > > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_E=
DGE_RISING>;
> > > > > > > > > > > > > > > +        interrupt-names =3D "pulse", "err_pu=
lse";
> > > > > > > > > > > > > > > +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cp=
g CPG_MOD 0xa0>,
> > > > > > > > > > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg =
CPG_MOD 0xa1>;
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On the next version I am going to update spix2 =
clk as <&cpg
> > > > > > > > > > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
> > > > > > > > >
> > > > > > > > > According to the RZ/G3E clock system diagram, (the parent=
 of) clk_spi
> > > > > > > > > is derived from (the parent of) clk_spix2, not the other =
way around?
> > > > > > > > > So you can model clk_spi as a fixed divider clock with pa=
rent clk_spix2
> > > > > > >                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^
> > > > > [A]
> > > > >
> > > > > > > > > and factor two.  I.e. provide a new core clock R9A09G047_=
SPI_CLK_SPI
> > > > > > > > > instead of your proposed R9A09G047_SPI_CLK_SPIX2?
> > > > > > > > >
> > > > > > > > With this approach when R9A09G047_SPI_CLK_SPI is used as a =
core clock
> > > > > > > > and XSPI node is disabled the clk_summary reports the core =
clock is ON
> > > > > > > > (while it's actually OFF).
> > > > > > >
> > > > > > > Is that a real problem, or is it purely cosmetic?
> > > > > > Just cosmetic tbh as despite being a MOD clock we have to defin=
e it as
> > > > > > a core clock in the DT.
>
> > > > > > > If spi_clk_spi really must show being disabled, you can chang=
e it
> > > > > > > from a fixed divider clock (which does not implement .{en,dis=
}able())
> > > > > > > to a custom fixed divider clock that does implement .{en,dis}=
able()
> > > > > > > and keeps track internally of the fake state, or even looks a=
t the
> > > > > > > state of spi_clk_spix2?
> > > > > > >
> > > > > > Good point. Maybe instead of implementing the dummy .{en,dis}ab=
le() I
> > > > > > will implement the is_enabled() + (clk_fixed_factor_ops). The
> > > > > > is_enabled() will take care of reading from the MON bits and re=
port
> > > > > > the actual state of the clock.
> > > > > >
> > > > > > > However, upon second look, spi_clk_spi is not implemented as =
a fixed
> > > > > > > divider clock with parent clk_spix2, as described above:
> > > > > > >
> > > > > > >       .smux2_xspi_clk1     0  0  0 320000000  0  0  50000  Y
> > > > > > >          .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> > > > > > >             spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> > > > > > >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> > > > > > >          spi_aclk          0  0  0 200000000  0  0  50000  N
> > > > > > >          spi_hclk          0  0  0 200000000  0  0  50000  N
> > > > > > >       .smux2_xspi_clk0     0  0  0 533333333  0  0  50000  Y
> > > > > > >
> > > > > > > Instead, they both use pllcm33_xspi as the parent clock.
> > > > > > > Apparently I missed that in the review of RZ/G3E XSPI clock s=
upport.
> > > > > > > The changelog for that patch does describe the correct topolo=
gy?
> > > > > > >
> > > > > > The topology is correct for RZ/G3E, spi/spix2 are sourced from
> > > > > > pllcm33_xspi divider and there is a divider (/2) for spi.
> > > > >
> > > > > Both spi_clk_spix2 and spi_clk_spix have .pllcm33_xspi as
> > > > > immediate parent.
> > > > >
> > > > > [A] describes something different:
> > > > >
> > > > >     .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> > > > >         spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> > > > >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> > > > >
> > > > > I.e. if spi_clk_spix2() is disabled, spi_clk_spi() is disabled, t=
oo.
> > > > >
> > > > Okay, thanks - got it.
> > > >
> > > > To clarify, to implement spi_clk_spi core clock as a parent of
> > > > spi_clk_spix2 I will need to implement some sort of mechanism which
> > > > registers (late) core clks after core clks and module clks are
> > > > registered as spi_clk_spix2 is a module clock.
> > >
> > > Yes, I wondered about that as well, but wasn't too worried as you
> > > already added the smux with e.g. "et0_rxclk" as parent, which also
> > > doesn't exist at registration time ;-)
> > >
> > Good point.
> >
> > > But indeed, the smux uses clock names to find the parents, while
> > > fixed-factor clocks in zv2h_cpg_register_core_clk() expect clock IDs
> > > (which are converted to names), and don't handle non-core clocks yet.
> > > So either add support for late core clocks, or modify CLK_TYPE_FF
> > > to use cpg_core_clock.parent_names[] in case of a non-core parent?
> > >
> > I choose the late core registration of the clocks and with this the
> > core clk_spi still reports `Y` in the summary while the parent is OFF
> > (since its a FF clock).
>
> That leads to an interesting philosophical question: if a clock does
> not have an .is_enabled() callback, or cannot be disabled, should its
> enabled state match the enabled state of its parent?
> However, the same question can be asked for a clock that does have an
> .is_enabled() callback, and is currently enabled.  What if its parent
> is disabled?
>
That's indeed a subtle and thought-provoking question ;)

> > Code implementation for option#1
> > ------------------------------------------------
>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > @@ -727,8 +727,12 @@ rzv2h_cpg_register_core_clk(const struct
> > cpg_core_clk *core,
> >          break;
> >      case CLK_TYPE_FF:
> >          WARN_DEBUG(core->parent >=3D priv->num_core_clks);
> > -        parent =3D priv->clks[core->parent];
> > +        if (late)
> > +            parent =3D priv->clks[priv->num_core_clks + core->parent];
> > +        else
> > +            parent =3D priv->clks[core->parent];
>
> I'd rather keep the meaning of the parent ID the same in both cases,
> to avoid confusion.
>
> Perhaps keep the (modified) WARN_DEBUG():
>
>     WARN_DEBUG(core->parent >=3D
>                priv->num_core_clks + (late ? priv->num_mod_clks : 0));
>
Agreed.

> >          if (IS_ERR(parent)) {
> > +            pr_err("parent clk is NULL for %s parent:%d\n",
> > core->name, core->parent);
> >              clk =3D parent;
> >              goto fail;
> >          }
>
> Thanks , this the simplest option of the two, but still shows the
> clock as enabled when it is not.
>
Yea.

> > # Option#2
> > As mentioned in the previous thread I implemented FF clock with
> > is_enabled() with this I can see the status of core clk_spi reports
> > correct status.
>
> > Code implementation for option#2
> > ------------------------------------------------
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -179,6 +179,28 @@ struct rzv2h_plldsi_div_clk {
> >  #define to_plldsi_div_clk(_hw) \
> >      container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
> >
> > +/**
> > + * struct rzv2h_ff_mod_status_clk - Fixed Factor Module Status Clock
> > + *
> > + * @priv: CPG private data
> > + * @conf: fixed mod configuration
> > + * @hw: Fixed Factor Status Clock handle
> > + * @mult: multiplier value
> > + * @div: divider value
> > + * @flags: flags for the clock
> > + */
> > + struct rzv2h_ff_mod_status_clk {
> > +    struct rzv2h_cpg_priv *priv;
> > +    struct fixed_mod_conf conf;
> > +    struct clk_hw hw;
> > +    unsigned int mult;
> > +    unsigned int div;
> > +    unsigned int flags;
>
> You can replace the last four by embedding struct clk_fixed_factor
> (at the top of the struct!).
>
Agreed.

> > +};
> > +
> > +#define to_rzv2h_ff_mod_status_clk(_hw) \
> > +    container_of(_hw, struct rzv2h_ff_mod_status_clk, hw)
> > +
> >  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> >  {
> >      struct pll_clk *pll_clk =3D to_pll(hw);
> > @@ -664,6 +686,114 @@ rzv2h_cpg_mux_clk_register(const struct
> > cpg_core_clk *core,
> >      return clk_hw->clk;
> >  }
> >
> > +static unsigned long
> > +rzv2h_clk_ff_mod_status_recalc_rate(struct clk_hw *hw,
> > +                    unsigned long parent_rate)
>
> [...]
>
> > +static const struct clk_ops rzv2h_clk_ff_mod_status_ops =3D {
> > +    .round_rate =3D rzv2h_clk_ff_mod_status_round_rate,
> > +    .set_rate =3D rzv2h_clk_ff_mod_status_set_rate,
> > +    .recalc_rate =3D rzv2h_clk_ff_mod_status_recalc_rate,
> > +    .recalc_accuracy =3D rzv2h_clk_ff_mod_status_recalc_accuracy,
> > +    .is_enabled =3D rzv2h_clk_ff_mod_status_is_enabled,
> > +};
>
> Lots of code copied from drivers/clk/clk-fixed-factor.c.  Fortunately
> clk_fixed_factor_ops is public and exported, so you can just copy its
> callback pointers. instead of duplicating the code.
>
Agreed.

> > Please share your thoughts on this.
>
> Thanks , this is (slightly) more complex, and shows the correct
> clock state.
>
> Initially, I favored the first solution, due to its simplicity. But
> that was before I realized the second option could avoid duplicating
> code by reusing the callbacks from clk_fixed_factor_ops...
> What do other people think?
>
Given that, Biju is OK with this solution I will go ahead with this approac=
h.

Cheers,
Prabhakar

