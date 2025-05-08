Return-Path: <linux-renesas-soc+bounces-16813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6815BAAFF85
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 17:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 850731885A8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 15:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3C322422D;
	Thu,  8 May 2025 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqFYySP5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367AF1E282D;
	Thu,  8 May 2025 15:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719305; cv=none; b=C9Hxs4kwyKW8Y0HTyhDrSVC/9Q/DJQDWbJB7WtIbcOIjo0iTYtTz4/+4EyL7WyIhM/KZNSvS7IS5HGtBloqljc19L2cs3glKnLE659a/xwjrpif+1dWdrEFtk7yiSABQ6TTwIrXkF7XloR0/1fiKf8EBoIe1/7o5Ri9RIt5s2Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719305; c=relaxed/simple;
	bh=K/2560fU5vYvfP9sY8JuxYHn5BvgkxKTNBCTZiiuc80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIhtea2g/A9RPp1iBZlmhg7crhMGReP/Z9h/nc713lF8v/h62nhUIURlZmgAemqZyITbOZomModcM/oIxbRRaciGl+k+WcTtDo/WeRHLitXe1A/eFdBnUGymayvU8IoFiGggAkeb6CDegadYg90W9MccqWJK8uRHgxNPUEhAt2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqFYySP5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0bd7f4cd5so722882f8f.0;
        Thu, 08 May 2025 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746719301; x=1747324101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZpnsgcRqz46HJ3vS+GZ9GzsA798Ef6vR8zBMHz3hJg=;
        b=UqFYySP5LqXrKtGUEvp7G2lJyIIXbUQ4TbzOgnZO8U9ejQM2f09LbaloOL6plPdYpF
         D0i6jWZZIZ9dwTn7YTbMcWmqMMS9JTRmqJdyf4w2LrwNFYsKt/uQ+ZlbUExqByzhIUts
         0aseYkTlb/fOy3WKb7VzolhvkidEDew94HwVO8WrqEhE0+C9ioBde0DcJ/k6lIyat9AW
         mHuwBreTZIzvDCXKndg6gZ9UHbiC9d9rTv0CWs3e94Re7XjCqAOHPDlWGpUgvpOOAqO6
         7wjyMglbo5ZWt+R/XgJjYt4ObHZ4nvhJi83UOiCIXq5/yDzEYnfrJdte/yBKPYCEhGIN
         su8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746719301; x=1747324101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZpnsgcRqz46HJ3vS+GZ9GzsA798Ef6vR8zBMHz3hJg=;
        b=AhdLnKF6rGFu9sPncFnNJhzcy7ebqC6rFYnZdGnwreboLdifbfW1LYB1sBCyoWntxD
         0C+62z8l5n3d56dYMCLwpkF0s2vcD7PM+xggFbOjyOY46qSX4jLlv9DpPqB2xQ/7eVJJ
         Jr0dlkIODJEd7ca4rXELZhycdkA37DGWh/10uQfyph6Qmoucg/qexbD26WfzzFahxiOz
         pwyD6V02O/rCk6Uf4pJI7HCoBsTUjmzsh0Ky2LD/n5yQB1agdMWCBW8BEzieSLEXMgLV
         RVGZUxIXuygxdNoGv90RzwoClAhBo2pQYP+rxrdjTEZHP6Mj5BxMuRiOqKhiWbFfNe45
         CjbA==
X-Forwarded-Encrypted: i=1; AJvYcCV8/+fSzldAWgQf7pdXCAsigcsVQ5LyvVWG3AhnPzxrRSEoQ9efa7DWMrcDVxEueR+EiCcuH05xKQjm@vger.kernel.org, AJvYcCWkt/+KPTzWhXUgClPELBZAGrFW2YTy7jqmzwDH0JcsSn+ZzC1NaXlndVSpPMTqd6oOmVbFjo7+4gDSYpa6NPm6tlI=@vger.kernel.org, AJvYcCXyVX7CN9SRmvE3hfsXlKiXQulljavksBCghSEbfdOT0QXfJs/QNoAdP9CstY1a1g3654VwO1WEjE37OVkW@vger.kernel.org
X-Gm-Message-State: AOJu0YznK7TUf+Eh0hs7yspH0li1M+R+HV9hRTFOv4XfEkpoT52sS2cq
	4Gq1OUGC4mC78g13rO1ERuNICDEHQ2renMPt17rxsn/fYQkkWj7zJ0MWegmGZQnR0v8H5X0fciY
	QtAfCsQBBDJxwfXupYd0j+2QTaJNwDOQ1
X-Gm-Gg: ASbGncul0U+hvPYpqSYfPjtaU5BzdyYLZ0+B9c9Fq/pSKeSdgY9WzdyDL1EKOD5PeB6
	nsI+5myFkIbQgFGtLCDMJqHIbhTHtcHjJFMpNb4R6dVqeQSrWQ+i4jL0C3Xkn9T0etUjh+XXz+d
	Gc/l99jEPKgESM9C6ObzuzjSLU0esZWhoamg==
X-Google-Smtp-Source: AGHT+IHt8L4IJPbtn6Gw9wrCi43HxYGc+iDlnQj/j+7v7+mr843kNuT2ymEAWfsKRGVkYhSyMqj6ASdiRlSBpYFQH5c=
X-Received: by 2002:a5d:5887:0:b0:39e:dbee:f644 with SMTP id
 ffacd0b85a97d-3a0b4a14764mr7372974f8f.46.1746719301096; Thu, 08 May 2025
 08:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428205518.454960-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250428205518.454960-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUNkrGHAyYFTqt_EEhMzRG-cKQEVM9B1vOv5h3bzKDfmQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUNkrGHAyYFTqt_EEhMzRG-cKQEVM9B1vOv5h3bzKDfmQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 May 2025 16:47:53 +0100
X-Gm-Features: ATxdqUEPbHeqlMkNHBIKyuXPMLYI25K75OkD94JeuhnZMFv9x4sxA1Eb-OfqbsY
Message-ID: <CA+V-a8vokKwZOHTc5k4HCJVp0dfG=BSt53srA4KJtNEVi_3i2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add GBETH nodes
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

On Thu, May 8, 2025 at 4:01=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 28 Apr 2025 at 22:55, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Renesas RZ/V2H(P) SoC is equipped with 2x Synopsys DesignWare Ethernet
> > Quality-of-Service IP block version 5.20. Add GBETH nodes to R9A09G057
> > RZ/V2H(P) SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -701,6 +701,200 @@ sdhi2_vqmmc: vqmmc-regulator {
> >                                 status =3D "disabled";
> >                         };
> >                 };
> > +
> > +               eth0: ethernet@15c30000 {
> > +                       compatible =3D "renesas,r9a09g057-gbeth", "rene=
sas,rzv2h-gbeth",
> > +                                    "snps,dwmac-5.20";
> > +                       reg =3D <0 0x15c30000 0 0x10000>;
> > +                       interrupts =3D <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>,
>
> 775?
>
Ouch, I missed that.

> > +                                    <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names =3D "macirq", "eth_wake_irq", "=
eth_lpi",
> > +                                         "rx-queue-0", "rx-queue-1", "=
rx-queue-2",
> > +                                         "rx-queue-3", "tx-queue-0", "=
tx-queue-1",
> > +                                         "tx-queue-2", "tx-queue-3";
> > +                       clocks =3D  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD =
0xbc>,
> > +                                 <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_=
PTP_REF_I>,
> > +                                 <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0x=
b9>,
> > +                                 <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0x=
bb>;
> > +                       clock-names =3D "stmmaceth", "pclk", "ptp_ref",
> > +                                     "tx", "rx", "tx-180", "rx-180";
> > +                       resets =3D <&cpg 0xb0>;
>
> power-domains =3D <&cpg>;
>
Agreed.

> > +                       snps,multicast-filter-bins =3D <256>;
> > +                       snps,perfect-filter-entries =3D <128>;
> > +                       rx-fifo-depth =3D <8192>;
> > +                       tx-fifo-depth =3D <8192>;
> > +                       snps,fixed-burst;
> > +                       snps,no-pbl-x8;
> > +                       snps,force_thresh_dma_mode;
> > +                       snps,axi-config =3D <&stmmac_axi_setup>;
> > +                       snps,mtl-rx-config =3D <&mtl_rx_setup0>;
> > +                       snps,mtl-tx-config =3D <&mtl_tx_setup0>;
> > +                       snps,txpbl =3D <32>;
> > +                       snps,rxpbl =3D <32>;
> > +                       status =3D "disabled";
> > +
> > +                       mtl_rx_setup0: rx-queues-config {
> > +                               snps,rx-queues-to-use =3D <4>;
> > +                               snps,rx-sched-sp;
>
> Any specific reason the first instance has this property, while the
> second has not?
>
My initial intention was let the board DTS override it based on their
custom needs, but later thought maybe let's default something in the
SoC and later let the users update it based on the needs. I will add
this to both the nodes.

> > +               eth1: ethernet@15c40000 {
> > +                       compatible =3D "renesas,r9a09g057-gbeth", "rene=
sas,rzv2h-gbeth",
> > +                                    "snps,dwmac-5.20";
> > +                       reg =3D <0 0x15c40000 0 0x10000>;
> > +                       interrupts =3D <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names =3D "macirq", "eth_wake_irq", "=
eth_lpi",
> > +                                         "rx-queue-0", "rx-queue-1", "=
rx-queue-2",
> > +                                         "rx-queue-3", "tx-queue-0", "=
tx-queue-1",
> > +                                         "tx-queue-2", "tx-queue-3";
> > +                       clocks =3D  <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD =
0xc2>,
> > +                                 <&cpg CPG_CORE R9A09G057_GBETH_1_CLK_=
PTP_REF_I>,
> > +                                 <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0x=
bf>,
> > +                                 <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0x=
c1>;
> > +                       clock-names =3D "stmmaceth", "pclk", "ptp_ref",
> > +                                     "tx", "rx", "tx-180", "rx-180";
> > +                       resets =3D <&cpg 0xb1>;
>
> power-domains =3D <&cpg>;
>
OK.

Cheers,
Prabhakar

