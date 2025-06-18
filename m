Return-Path: <linux-renesas-soc+bounces-18510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA0ADF157
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 17:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2D4A4A07B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 15:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87572EF2B4;
	Wed, 18 Jun 2025 15:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8mN0Sa0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67292EF2A7;
	Wed, 18 Jun 2025 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750260298; cv=none; b=MvE5SjcuWf497YODw7uaZZ7YCTVFWP3JUY0XfqtjPgcujYo1pAfAC1BsEQybWGxZkvzil5DnH4iIgVL1sLkOTMMXvOWNAaAwlGPAJqHomF+UrumSkV9b33KMeciAVVZ48L0ouQGBX5lqedIVBbiIiqsFfFijRjJoiDmvYyI5NmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750260298; c=relaxed/simple;
	bh=oqSrxa4bPcw9rCNbFoTZDudXoPLJ6miM+1RnjDLji3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxyDqM9SvIttn87/Zp5Wq6tA+RqIxPvCPGpVVbfdImbRcmpm+J/WnWfUcOR69FMEQ+FovUoJxL3OSVBYYPssLM1ew/1hBz9hkivhN4sL1/zzR5hOJW5ioP51o7a9mufsrlJkmR02BRH0CRSw8k06ZHVxxd9ml/yc7SLKWkbsLjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8mN0Sa0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so48061525e9.2;
        Wed, 18 Jun 2025 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750260294; x=1750865094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1aFUGYQqSYHGQ7/Wuy6bSzGJxwls5++o+QYK1qoSaI=;
        b=m8mN0Sa0ulj6QeHbMBCpaIdgJz4jvsloW9t0PywHnfB6uJg2zvWzHqcc9HPtezwOct
         tb9zSFtc+ImBu6yEkIT8bPzeyc9PiV7lDvCM7xD83KkwfHwX/CiBZQoVrYMC9KhX2xD1
         Jrtoy1bxwtBRUyIHVnKa+8Q6tIm+UWTvXdRCCplA3U9bqraZ74BdXB9LEW+7NsY51RrU
         zKoCT8Ss7ybfgYiNTM9lX9fNcSSXL8A6vdyXVh/1T94mKHQFMXSLMahupVU6Ih9fQEkr
         PIhULx5VQexnHwjS76EVsUyH3pFvfipeRqRTB9paotg/lyfuIyc5n3AaKjrcMMb+Js4A
         DIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750260294; x=1750865094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1aFUGYQqSYHGQ7/Wuy6bSzGJxwls5++o+QYK1qoSaI=;
        b=EQfUTIZQHpVD6rA2A2c0cN9nTnKwy4iqaXuQ+HCtavEEcAoHJt+2d83T7BGP0LmlF8
         gddIn71C5wCcw9LEtFZoWR+1KBAyCC/xVQBBoMnr+h9q1+cZq0chbWzdhft/JblpYFQE
         Y8Zu30NP2rfdx5fJs4q+3MxcxQWDxYEGrnFgrealLwb7xsEKceFpZFJULtyWGZKmXdQt
         pRJ/JNgEoZry8nW5oiRDF4Ow8bMOF2zWk/4Q5N9FRkKkFhzd/5KRcTsYnHMRgDZXFiW9
         NMX6p5YqduGBPswqu3O/Dqp/fcd1S9WP8KK2SazKjnFUlXo3LT1aRPv7MU5kvrILQXDO
         djWg==
X-Forwarded-Encrypted: i=1; AJvYcCVDuAHzsdnDwzzwycnL8w1xSPchI5gRfJ6qujQ4t7hiDCMxPp6eTO3lNe9cuv6rbbs9J6CsMY2pqm6mQvCU6Ad6YlY=@vger.kernel.org, AJvYcCXCBreBg8UiT03bInugFqUmw9BXlNwPfboj/bjgUMg1OG0qI8NI8ROUqEIWUcvnItkO0c7tA9UhW0fP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BeT2/q8BOuBVnvWJnmuBzkJuE/kvNp488TAANBZlD7YVCxHh
	QbbupvvV9eEVv+24PYPscBIeHKyq/HXnf6Q6pe13SQ8aiywUQ1/zVvv1RxYtSuKM4e6hQsrRIwt
	wIfYMX0tjvsiIlrcWigZDf3HCjkWJiCc=
X-Gm-Gg: ASbGnct4iy3l9Z/+UEtTT9jA/dxSWsQu/whqc5usFvf6L4BPQU9T8mFkp22q3o53Tio
	oCFyxWlpDKk/XxJCSnjRi94GUvra1cfpAAzHt6oanaVJLg2w7gBy2WVRwhUuL4eK1yigOu1dD05
	hMC6mHRvz6IsHV2+ymBALf+s6eworYkGV8AKv0ykC7621e6Q==
X-Google-Smtp-Source: AGHT+IHTnlp0S/0a3luYMmfTgNzHY4YrQRf8QZ6bjWuHmUyxMuNpoiYsQ9bAJefAe+NiLHRE78PDEfaDSGAxUxCozIE=
X-Received: by 2002:a05:600c:8710:b0:44a:775d:b5e8 with SMTP id
 5b1f17b1804b1-4533cadf840mr155585545e9.1.1750260293770; Wed, 18 Jun 2025
 08:24:53 -0700 (PDT)
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
 <CA+V-a8tG4_2bXJ9H=FPT-Qa8zcgsE_5vkVQRj-ONDna5n4Ptgw@mail.gmail.com> <CAMuHMdUOHmKM6mqQHFhGqmNp-doox1rHx0WNN9O8xntp1-TXqw@mail.gmail.com>
In-Reply-To: <CAMuHMdUOHmKM6mqQHFhGqmNp-doox1rHx0WNN9O8xntp1-TXqw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Jun 2025 16:24:26 +0100
X-Gm-Features: Ac12FXzTwZNLF0qqzrNT6NtR5rEaW0wcKd5eU38O4_ibPd7mepNVUVCAtDczkJI
Message-ID: <CA+V-a8voEU7CpEarBN-0FugdE1Zny_YvkwKEw9ZChns95oXHaw@mail.gmail.com>
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

On Wed, Jun 18, 2025 at 3:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 18 Jun 2025 at 15:41, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Wed, Jun 18, 2025 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Wed, 18 Jun 2025 at 14:06, Lad, Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > > > On Wed, Jun 18, 2025 at 8:03=E2=80=AFAM Geert Uytterhoeven <geert@l=
inux-m68k.org> wrote:
> > > > > On Tue, 17 Jun 2025 at 23:05, Lad, Prabhakar <prabhakar.csengg@gm=
ail.com> wrote:
> > > > > > On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven <gee=
rt@linux-m68k.org> wrote:
> > > > > > > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > > > > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.re=
nesas.com> wrote:
> > > > > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mo=
n, 31 Mar 2025
> > > > > > > > > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote=
:
> > > > > > > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Docum=
ent support for
> > > > > > > > > > > > > the Expanded Serial Peripheral Interface (xSPI) C=
ontroller in
> > > > > > > > > > > > > the Renesas RZ/G3E
> > > > > > > > > > > > > (R9A09G047) SoC.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.c=
om>
> > > > > > > > > > >
> > > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > > +++ b/Documentation/devicetree/bindings/memory-co=
ntrollers/renes
> > > > > > > > > > > > > +++ as,r
> > > > > > > > > > > > > +++ zg3e
> > > > > > > > > > > > > +++ -xspi.yaml
> > > > > > > > > > >
> > > > > > > > > > > > > +    spi@11030000 {
> > > > > > > > > > > > > +        compatible =3D "renesas,r9a09g047-xspi";
> > > > > > > > > > > > > +        reg =3D <0x11030000 0x10000>, <0x2000000=
0 0x10000000>;
> > > > > > > > > > > > > +        reg-names =3D "regs", "dirmap";
> > > > > > > > > > > > > +        interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDG=
E_RISING>,
> > > > > > > > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_=
RISING>;
> > > > > > > > > > > > > +        interrupt-names =3D "pulse", "err_pulse"=
;
> > > > > > > > > > > > > +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cpg CP=
G_MOD 0xa0>,
> > > > > > > > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_=
MOD 0xa1>;
> > > > > > > > > > > >
> > > > > > > > > > > > On the next version I am going to update spix2 clk =
as <&cpg
> > > > > > > > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
> > > > > > >
> > > > > > > According to the RZ/G3E clock system diagram, (the parent of)=
 clk_spi
> > > > > > > is derived from (the parent of) clk_spix2, not the other way =
around?
> > > > > > > So you can model clk_spi as a fixed divider clock with parent=
 clk_spix2
> > > > >                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^
> > > [A]
> > >
> > > > > > > and factor two.  I.e. provide a new core clock R9A09G047_SPI_=
CLK_SPI
> > > > > > > instead of your proposed R9A09G047_SPI_CLK_SPIX2?
> > > > > > >
> > > > > > With this approach when R9A09G047_SPI_CLK_SPI is used as a core=
 clock
> > > > > > and XSPI node is disabled the clk_summary reports the core cloc=
k is ON
> > > > > > (while it's actually OFF).
> > > > >
> > > > > Is that a real problem, or is it purely cosmetic?
> > > > Just cosmetic tbh as despite being a MOD clock we have to define it=
 as
> > > > a core clock in the DT.
> > > >
> > > > > > Can we maybe use a unused ON index and ON bit for example 25, 0=
 (ie
> > > > > > 0x190) and represent this is a module clock for example for the
> > > > > > spi_clk_spix2 clock and use this in the DT and let the CPG core=
 code
> > > > > > handle such turning ON/OF the module clocks based on the enable=
 count
> > > > > > which will be handled internally in the driver?
> > > > >
> > > > > Please do not use "unused" module clock bits.  These do not descr=
ibe
> > > > > the hardware, and may actually exist in the hardware (try disabli=
ng
> > > > > all undocumented module clocks, and observe what fails...).
> > > > >
> > > > Agreed, "unused" module clock bits were only used as a dummy. The
> > > > read/write operations were only performed on the actual bits which =
are
> > > > documented in the HW manual.
> > > >
> > > > > If spi_clk_spi really must show being disabled, you can change it
> > > > > from a fixed divider clock (which does not implement .{en,dis}abl=
e())
> > > > > to a custom fixed divider clock that does implement .{en,dis}able=
()
> > > > > and keeps track internally of the fake state, or even looks at th=
e
> > > > > state of spi_clk_spix2?
> > > > >
> > > > Good point. Maybe instead of implementing the dummy .{en,dis}able()=
 I
> > > > will implement the is_enabled() + (clk_fixed_factor_ops). The
> > > > is_enabled() will take care of reading from the MON bits and report
> > > > the actual state of the clock.
> > > >
> > > > > However, upon second look, spi_clk_spi is not implemented as a fi=
xed
> > > > > divider clock with parent clk_spix2, as described above:
> > > > >
> > > > >       .smux2_xspi_clk1     0  0  0 320000000  0  0  50000  Y
> > > > >          .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> > > > >             spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> > > > >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> > > > >          spi_aclk          0  0  0 200000000  0  0  50000  N
> > > > >          spi_hclk          0  0  0 200000000  0  0  50000  N
> > > > >       .smux2_xspi_clk0     0  0  0 533333333  0  0  50000  Y
> > > > >
> > > > > Instead, they both use pllcm33_xspi as the parent clock.
> > > > > Apparently I missed that in the review of RZ/G3E XSPI clock suppo=
rt.
> > > > > The changelog for that patch does describe the correct topology?
> > > > >
> > > > The topology is correct for RZ/G3E, spi/spix2 are sourced from
> > > > pllcm33_xspi divider and there is a divider (/2) for spi.
> > >
> > > Both spi_clk_spix2 and spi_clk_spix have .pllcm33_xspi as
> > > immediate parent.
> > >
> > > [A] describes something different:
> > >
> > >     .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> > >         spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> > >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> > >
> > > I.e. if spi_clk_spix2() is disabled, spi_clk_spi() is disabled, too.
> > >
> > Okay, thanks - got it.
> >
> > To clarify, to implement spi_clk_spi core clock as a parent of
> > spi_clk_spix2 I will need to implement some sort of mechanism which
> > registers (late) core clks after core clks and module clks are
> > registered as spi_clk_spix2 is a module clock.
>
> Yes, I wondered about that as well, but wasn't too worried as you
> already added the smux with e.g. "et0_rxclk" as parent, which also
> doesn't exist at registration time ;-)
>
Good point.

> But indeed, the smux uses clock names to find the parents, while
> fixed-factor clocks in zv2h_cpg_register_core_clk() expect clock IDs
> (which are converted to names), and don't handle non-core clocks yet.
> So either add support for late core clocks, or modify CLK_TYPE_FF
> to use cpg_core_clock.parent_names[] in case of a non-core parent?
>
I choose the late core registration of the clocks and with this the
core clk_spi still reports `Y` in the summary while the parent is OFF
(since its a FF clock).

Logs for option #1
------------------------
root@rzv2h-evk:~# modprobe spi_rpc_if
[  217.783625] 3 fixed-partitions partitions found on MTD device spi0.0
[  217.790029] Creating 3 MTD partitions on "spi0.0":
[  217.794958] 0x000000000000-0x000000060000 : "bl2"
[  217.800464] 0x000000060000-0x000002000000 : "fip"
[  217.807788] 0x000002000000-0x000004000000 : "user"
root@rzv2h-evk:~#
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep spi
             spi_aclk                0       1        0
200000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
             spi_hclk                0       1        0
200000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
          .smux2_xspi_clk0           1       1        0
533333333   0          0     50000      Y            deviceless
              no_connection_id
             .smux2_xspi_clk1        1       1        0
533333333   0          0     50000      Y               deviceless
                 no_connection_id
                .pllcm33_xspi        1       1        0
266666667   0          0     50000      Y                  deviceless
                    no_connection_id
                   spi_clk_spix2     2       2        0
266666667   0          0     50000      Y
11030000.spi                    spix2
                      spi_clk_spi    1       1        0
133333333   0          0     50000      Y
11030000.spi                    spi
root@rzv2h-evk:~#
root@rzv2h-evk:~# modprobe -r  spi_rpc_if
[  225.376563] Deleting MTD partitions on "spi0.0":
[  225.381218] Deleting bl2 MTD partition
[  225.385504] Deleting fip MTD partition
[  225.617827] Deleting user MTD partition
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep spi
             spi_aclk                0       0        0
200000000   0          0     50000      N               deviceless
                 no_connection_id
             spi_hclk                0       0        0
200000000   0          0     50000      N               deviceless
                 no_connection_id
          .smux2_xspi_clk0           0       0        0
533333333   0          0     50000      Y            deviceless
              no_connection_id
             .smux2_xspi_clk1        0       0        0
533333333   0          0     50000      Y               deviceless
                 no_connection_id
                .pllcm33_xspi        0       0        0
266666667   0          0     50000      Y                  deviceless
                    no_connection_id
                   spi_clk_spix2     0       0        0
266666667   0          0     50000      N
deviceless                      no_connection_id
                      spi_clk_spi    0       0        0
133333333   0          0     50000      Y
deviceless                      no_connection_id
root@rzv2h-evk:~#
root@rzv2h-evk:~#




Code implementation for option#1
------------------------------------------------
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c
b/drivers/clk/renesas/r9a09g057-cpg.c
index 9952474bcf48..ab9e9a3e8cd1 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -231,7 +231,10 @@ static const struct cpg_core_clk
r9a09g057_core_clks[] __initconst =3D {
           CLK_PLLETH_DIV_125_FIX, 1, 1),
     DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G057_GBETH_1_CLK_PTP_REF_I,
           CLK_PLLETH_DIV_125_FIX, 1, 1),
-    DEF_FIXED("spi_clk_spi", R9A09G057_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2=
),
+};
+
+static const struct cpg_core_clk r9a09g057_late_core_clks[] __initconst =
=3D {
+    DEF_FIXED("spi_clk_spi", R9A09G057_SPI_CLK_SPI, 0xa1, 1, 2),
 };

 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst =3D {
@@ -502,6 +505,8 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info
__initconst =3D {
     /* Core Clocks */
     .core_clks =3D r9a09g057_core_clks,
     .num_core_clks =3D ARRAY_SIZE(r9a09g057_core_clks),
+    .late_core_clks =3D r9a09g057_late_core_clks,
+    .num_late_core_clks =3D ARRAY_SIZE(r9a09g057_late_core_clks),
     .last_dt_core_clk =3D LAST_DT_CORE_CLK,
     .num_total_core_clks =3D MOD_CLK_BASE,

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cp=
g.c
index 97bcd252fcbf..0fdac1578f8b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -710,7 +710,7 @@ static struct clk

 static void __init
 rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
-                struct rzv2h_cpg_priv *priv)
+                struct rzv2h_cpg_priv *priv, bool late)
 {
     struct clk *clk =3D ERR_PTR(-EOPNOTSUPP), *parent;
     unsigned int id =3D core->id, div =3D core->div;
@@ -727,8 +727,12 @@ rzv2h_cpg_register_core_clk(const struct
cpg_core_clk *core,
         break;
     case CLK_TYPE_FF:
         WARN_DEBUG(core->parent >=3D priv->num_core_clks);
-        parent =3D priv->clks[core->parent];
+        if (late)
+            parent =3D priv->clks[priv->num_core_clks + core->parent];
+        else
+            parent =3D priv->clks[core->parent];
         if (IS_ERR(parent)) {
+            pr_err("parent clk is NULL for %s parent:%d\n",
core->name, core->parent);
             clk =3D parent;
             goto fail;
         }
@@ -1298,11 +1302,14 @@ static int __init rzv2h_cpg_probe(struct
platform_device *pdev)
         clks[i] =3D ERR_PTR(-ENOENT);

     for (i =3D 0; i < info->num_core_clks; i++)
-        rzv2h_cpg_register_core_clk(&info->core_clks[i], priv);
+        rzv2h_cpg_register_core_clk(&info->core_clks[i], priv, false);

     for (i =3D 0; i < info->num_mod_clks; i++)
         rzv2h_cpg_register_mod_clk(&info->mod_clks[i], priv);

+    for (i =3D 0; i < info->num_late_core_clks; i++)
+        rzv2h_cpg_register_core_clk(&info->late_core_clks[i], priv, true);
+
     error =3D of_clk_add_provider(np, rzv2h_cpg_clk_src_twocell_get, priv)=
;
     if (error)
         return error;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cp=
g.h
index bce131bec80b..442289b9cafb 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -297,6 +297,8 @@ struct rzv2h_reset {
  *
  * @core_clks: Array of Core Clock definitions
  * @num_core_clks: Number of entries in core_clks[]
+ * @late_core_clks: Array of Core Clocks that are late initialized
+ * @num_late_core_clks: Number of entries in late_core_clks[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
  * @num_total_core_clks: Total number of Core Clocks (exported + internal)
  *
@@ -315,6 +317,8 @@ struct rzv2h_cpg_info {
     /* Core Clocks */
     const struct cpg_core_clk *core_clks;
     unsigned int num_core_clks;
+    const struct cpg_core_clk *late_core_clks;
+    unsigned int num_late_core_clks;
     unsigned int last_dt_core_clk;
     unsigned int num_total_core_clks;


# Option#2
As mentioned in the previous thread I implemented FF clock with
is_enabled() with this I can see the status of core clk_spi reports
correct status.

Logs for option #2
---------------------
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep spi
             spi_aclk                0       1        0
200000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
             spi_hclk                0       1        0
200000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
          .smux2_xspi_clk0           1       1        0
533333333   0          0     50000      Y            deviceless
              no_connection_id
             .smux2_xspi_clk1        1       1        0
533333333   0          0     50000      Y               deviceless
                 no_connection_id
                .pllcm33_xspi        2       2        0
266666667   0          0     50000      Y                  deviceless
                    no_connection_id
                   spi_clk_spix2     1       1        0
266666667   0          0     50000      Y
11030000.spi                    spix2
                   spi_clk_spi       1       1        0
133333333   0          0     50000      Y
11030000.spi                    spi
root@rzv2h-evk:~#
root@rzv2h-evk:~# modprobe -r spi_rpc_if
[   58.860437] Deleting MTD partitions on "spi0.0":
[   58.865078] Deleting bl2 MTD partition
[   58.869355] Deleting fip MTD partition
[   58.907329] Deleting user MTD partition
root@rzv2h-evk:~#
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep spi
             spi_aclk                0       0        0
200000000   0          0     50000      N               deviceless
                 no_connection_id
             spi_hclk                0       0        0
200000000   0          0     50000      N               deviceless
                 no_connection_id
          .smux2_xspi_clk0           0       0        0
533333333   0          0     50000      Y            deviceless
              no_connection_id
             .smux2_xspi_clk1        0       0        0
533333333   0          0     50000      Y               deviceless
                 no_connection_id
                .pllcm33_xspi        0       0        0
266666667   0          0     50000      Y                  deviceless
                    no_connection_id
                   spi_clk_spix2     0       0        0
266666667   0          0     50000      N
deviceless                      no_connection_id
                   spi_clk_spi       0       0        0
133333333   0          0     50000      N
deviceless                      no_connection_id
root@rzv2h-evk:~#
root@rzv2h-evk:~# modprobe spi_rpc_if
[   65.423581] 3 fixed-partitions partitions found on MTD device spi0.0
[   65.429971] Creating 3 MTD partitions on "spi0.0":
[   65.434778] 0x000000000000-0x000000060000 : "bl2"
[   65.440203] 0x000000060000-0x000002000000 : "fip"
[   65.446337] 0x000002000000-0x000004000000 : "user"
root@rzv2h-evk:~#
root@rzv2h-evk:~#
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep spi
             spi_aclk                0       1        0
200000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
             spi_hclk                0       1        0
200000000   0          0     50000      N               deviceless
                 of_clk_get_from_provider
          .smux2_xspi_clk0           1       1        0
533333333   0          0     50000      Y            deviceless
              no_connection_id
             .smux2_xspi_clk1        1       1        0
533333333   0          0     50000      Y               deviceless
                 no_connection_id
                .pllcm33_xspi        2       2        0
266666667   0          0     50000      Y                  deviceless
                    no_connection_id
                   spi_clk_spix2     1       1        0
266666667   0          0     50000      Y
11030000.spi                    spix2
                   spi_clk_spi       1       1        0
133333333   0          0     50000      Y
11030000.spi                    spi
root@rzv2h-evk:~#

Code implementation for option#2
------------------------------------------------

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c
b/drivers/clk/renesas/r9a09g057-cpg.c
index 9952474bcf48..c56e43492a02 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -231,7 +231,8 @@ static const struct cpg_core_clk
r9a09g057_core_clks[] __initconst =3D {
           CLK_PLLETH_DIV_125_FIX, 1, 1),
     DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G057_GBETH_1_CLK_PTP_REF_I,
           CLK_PLLETH_DIV_125_FIX, 1, 1),
-    DEF_FIXED("spi_clk_spi", R9A09G057_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2=
),
+    DEF_FIXED_MOD_STATUS("spi_clk_spi", R9A09G057_SPI_CLK_SPI,
CLK_PLLCM33_XSPI, 1, 2,
+                 FIXED_MOD_CONF_XSPI),
 };

 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst =3D {
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cp=
g.c
index 97bcd252fcbf..96db6ce4460f 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -179,6 +179,28 @@ struct rzv2h_plldsi_div_clk {
 #define to_plldsi_div_clk(_hw) \
     container_of(_hw, struct rzv2h_plldsi_div_clk, hw)

+/**
+ * struct rzv2h_ff_mod_status_clk - Fixed Factor Module Status Clock
+ *
+ * @priv: CPG private data
+ * @conf: fixed mod configuration
+ * @hw: Fixed Factor Status Clock handle
+ * @mult: multiplier value
+ * @div: divider value
+ * @flags: flags for the clock
+ */
+ struct rzv2h_ff_mod_status_clk {
+    struct rzv2h_cpg_priv *priv;
+    struct fixed_mod_conf conf;
+    struct clk_hw hw;
+    unsigned int mult;
+    unsigned int div;
+    unsigned int flags;
+};
+
+#define to_rzv2h_ff_mod_status_clk(_hw) \
+    container_of(_hw, struct rzv2h_ff_mod_status_clk, hw)
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
     struct pll_clk *pll_clk =3D to_pll(hw);
@@ -664,6 +686,114 @@ rzv2h_cpg_mux_clk_register(const struct
cpg_core_clk *core,
     return clk_hw->clk;
 }

+static unsigned long
+rzv2h_clk_ff_mod_status_recalc_rate(struct clk_hw *hw,
+                    unsigned long parent_rate)
+{
+    struct rzv2h_ff_mod_status_clk *fix =3D to_rzv2h_ff_mod_status_clk(hw)=
;
+    unsigned long long int rate;
+
+    rate =3D (unsigned long long int)parent_rate * fix->mult;
+    do_div(rate, fix->div);
+    return (unsigned long)rate;
+}
+
+static long
+rzv2h_clk_ff_mod_status_round_rate(struct clk_hw *hw, unsigned long rate,
+                   unsigned long *prate)
+{
+    struct rzv2h_ff_mod_status_clk *fix =3D to_rzv2h_ff_mod_status_clk(hw)=
;
+
+    if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+        unsigned long best_parent;
+
+        best_parent =3D (rate / fix->mult) * fix->div;
+        *prate =3D clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+    }
+
+    return (*prate / fix->div) * fix->mult;
+}
+
+static int rzv2h_clk_ff_mod_status_set_rate(struct clk_hw *hw,
unsigned long rate,
+                        unsigned long parent_rate)
+{
+    return 0;
+}
+
+static unsigned long
+rzv2h_clk_ff_mod_status_recalc_accuracy(struct clk_hw *hw,
+                    unsigned long parent_accuracy)
+{
+    return parent_accuracy;
+}
+
+static int
+rzv2h_clk_ff_mod_status_is_enabled(struct clk_hw *hw)
+{
+    struct rzv2h_ff_mod_status_clk *fix =3D to_rzv2h_ff_mod_status_clk(hw)=
;
+    struct rzv2h_cpg_priv *priv =3D fix->priv;
+    u32 offset =3D GET_CLK_MON_OFFSET(fix->conf.mon_index);
+    u32 bitmask =3D BIT(fix->conf.mon_bit);
+    u32 val;
+
+    val =3D readl(priv->base + offset);
+    return !!(val & bitmask);
+}
+
+static const struct clk_ops rzv2h_clk_ff_mod_status_ops =3D {
+    .round_rate =3D rzv2h_clk_ff_mod_status_round_rate,
+    .set_rate =3D rzv2h_clk_ff_mod_status_set_rate,
+    .recalc_rate =3D rzv2h_clk_ff_mod_status_recalc_rate,
+    .recalc_accuracy =3D rzv2h_clk_ff_mod_status_recalc_accuracy,
+    .is_enabled =3D rzv2h_clk_ff_mod_status_is_enabled,
+};
+
+static struct clk * __init
+rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
+                    struct rzv2h_cpg_priv *priv)
+{
+    struct rzv2h_ff_mod_status_clk *clk_hw_data;
+    struct clk_init_data init =3D { };
+    const struct clk *parent;
+    const char *parent_name;
+    struct clk_hw *hw;
+    int ret;
+
+    WARN_DEBUG(core->parent >=3D priv->num_core_clks);
+    parent =3D priv->clks[core->parent];
+    if (IS_ERR(parent))
+        return ERR_CAST(parent);
+
+    parent_name =3D __clk_get_name(parent);
+    parent =3D priv->clks[core->parent];
+    if (IS_ERR(parent))
+        return ERR_CAST(parent);
+
+    clk_hw_data =3D devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERN=
EL);
+    if (!clk_hw_data)
+        return ERR_PTR(-ENOMEM);
+
+    clk_hw_data->priv =3D priv;
+    clk_hw_data->conf =3D core->cfg.fixed_mod;
+    clk_hw_data->mult =3D core->mult;
+    clk_hw_data->div =3D core->div;
+
+    init.name =3D core->name;
+    init.ops =3D &rzv2h_clk_ff_mod_status_ops;
+    init.flags =3D CLK_SET_RATE_PARENT;
+    init.parent_names =3D &parent_name;
+    init.num_parents =3D 1;
+
+    hw =3D &clk_hw_data->hw;
+    hw->init =3D &init;
+
+    ret =3D devm_clk_hw_register(priv->dev, hw);
+    if (ret)
+        return ERR_PTR(ret);
+
+    return hw->clk;
+}
+
 static struct clk
 *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
                    void *data)
@@ -742,6 +872,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *=
core,
         else
             clk =3D clk_hw->clk;
         break;
+    case CLK_TYPE_FF_MOD_STATUS:
+        clk =3D rzv2h_cpg_fixed_mod_status_clk_register(core, priv);
+        break;
     case CLK_TYPE_PLL:
         clk =3D rzv2h_cpg_pll_clk_register(core, priv,
&rzv2h_cpg_pll_ops, false);
         break;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cp=
g.h
index bce131bec80b..29e1dc841b46 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -94,6 +94,23 @@ struct smuxed {
         .width =3D (_width), \
     })

+/**
+ * struct fixed_mod_conf - Structure for fixed module configuration
+ *
+ * @mon_index: monitor index
+ * @mon_bit: monitor bit
+ */
+struct fixed_mod_conf {
+    u8 mon_index;
+    u8 mon_bit;
+};
+
+#define FIXED_MOD_CONF_PACK(_index, _bit) \
+    ((struct fixed_mod_conf){ \
+        .mon_index =3D (_index), \
+        .mon_bit =3D (_bit), \
+    })
+
 #define CPG_SSEL0        (0x300)
 #define CPG_SSEL1        (0x304)
 #define CPG_CDDIV0        (0x400)
@@ -137,6 +154,8 @@ struct smuxed {
                  FIELD_PREP_CONST(BUS_MSTOP_BITS_MASK, (mask)))
 #define BUS_MSTOP_NONE        GENMASK(31, 0)

+#define FIXED_MOD_CONF_XSPI    FIXED_MOD_CONF_PACK(5, 1)
+
 /**
  * Definitions of CPG Core Clocks
  *
@@ -157,6 +176,7 @@ struct cpg_core_clk {
         struct ddiv ddiv;
         struct pll pll;
         struct smuxed smux;
+        struct fixed_mod_conf fixed_mod;
     } cfg;
     const struct clk_div_table *dtable;
     const char * const *parent_names;
@@ -169,6 +189,7 @@ enum clk_types {
     /* Generic */
     CLK_TYPE_IN,        /* External Clock Input */
     CLK_TYPE_FF,        /* Fixed Factor Clock */
+    CLK_TYPE_FF_MOD_STATUS,    /* Fixed Factor Clock which can report
the status of module clock */
     CLK_TYPE_PLL,
     CLK_TYPE_DDIV,        /* Dynamic Switching Divider */
     CLK_TYPE_SMUX,        /* Static Mux */
@@ -186,6 +207,9 @@ enum clk_types {
     DEF_TYPE(_name, _id, CLK_TYPE_IN)
 #define DEF_FIXED(_name, _id, _parent, _mult, _div) \
     DEF_BASE(_name, _id, CLK_TYPE_FF, _parent, .div =3D _div, .mult =3D _m=
ult)
+#define DEF_FIXED_MOD_STATUS(_name, _id, _parent, _mult, _div, _gate) \
+    DEF_BASE(_name, _id, CLK_TYPE_FF_MOD_STATUS, _parent, .div =3D _div, \
+         .mult =3D _mult, .cfg.fixed_mod =3D _gate)
 #define DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
     DEF_TYPE(_name, _id, CLK_TYPE_DDIV, \
         .cfg.ddiv =3D _ddiv_packed, \

Please share your thoughts on this.

Cheers,
Prabhakar

