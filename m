Return-Path: <linux-renesas-soc+bounces-7591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3C93F43A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 13:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55142835F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF29145B2D;
	Mon, 29 Jul 2024 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8WU0COI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6944145336;
	Mon, 29 Jul 2024 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722253043; cv=none; b=IRBSs26AIN53L0XtLRcJfbX3cpg3yDt60MOg63xqUOEc7jTYZae/lU7UUr3XTiqR20YPkFSpDcd1y0omCgrSxYA6Gtk34ZXwwbE0+NNBY0tykMNoWH8VV5SrDuaiZ80Fr3bmi7OfTaQ8wNW6RAn9aWuZlb1uxKXRXf2tSSVs8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722253043; c=relaxed/simple;
	bh=P89aL6R8mu0me8UDB0Wewjx3swHpc2X5xUe/8XJCr/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REydfoYLQJvPaffBoCat99yZQe0RPS+NCxwXe50a7SBbvBSZ/v/Q9L2KSE8Npw5cv3tmsngMRhguwbOISyF6Acgg1s3lA7ACSjT3aY4reGxCyE3NOetvoe2m8jToFV80dtrGHOFX874CEA9+lus+s2eJeWdSSbMDQvsQh0L8j2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8WU0COI; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4f6d35d59ccso878402e0c.1;
        Mon, 29 Jul 2024 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722253041; x=1722857841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK9i1PPaSmu8gqTMidbjNaGgzEkQSyDiTRgEI3mUKiY=;
        b=E8WU0COIwJTXr4zr+A4oUD/HItOGI08HgZbEjarkdpVskcTWMd00Qd1R2pud5r/9we
         tPVSvWGssixUHPbiltUkYc49mWl9vKE4nDG9QndhgrCx1+xKw2fKAU8m6BFn8paGdXNi
         xn6Q9Ehdnwi+zYIy6zG+QN/9XcNzONC7TXHRX/VcDEw7UEsvfdBXTjMeHCooD81v7Tkq
         892L4e6e37pg/AQ+efxji312YG8PElWrGgW+O6NSEWBZaf6ZfaBAGUP+gxJ+b5BZrlC6
         sp7qMkmW6BHoIrdSYKPr0gbqMrDHjXpnZ2oGe/s3F/cphlRF0ml10bQuf8VGtkygfGni
         /5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722253041; x=1722857841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lK9i1PPaSmu8gqTMidbjNaGgzEkQSyDiTRgEI3mUKiY=;
        b=NHIyFKsRJ+V7kVPqPGNxWRftyTjRGg/lLyQGiKeCMZM73sujMmVipFmsfUA+BOaOyW
         eyFSvBo9pjNtK6COU8VW/roYIN1ZhtQdCtWLWdE6b8BzFd5Awxh/lPnDrZeDfUTyitH5
         u2rKuNkSM8oW2YZsQ77zJp7AnUSXUKVMy8Ne8Aui89MnQmm6P2GHesGvwbgf3ePTwwxF
         g2dD30LOYaHW64CYbBTUTrgqeQO0fu+1ma2UTalTg/utuAw1jX8LHMEBmSoVSyds3DMu
         2H+o/gZDEHB5gV39JD5BvS+7Detuqw0hxywRPvA4WqJVdlFpzXf8KAQyMtSNwysJ4Grn
         l/Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWxu8lFH06/7vZaBYBb6PC8XUXWEW3brIQH6c+KUu+s8cfUW+Uy1ToevyOVygu2aWA39sgPcDUgNzJ0UBsvVNXvXyrujY+sy5Nf7HdzpCzUxgCMeBSbNnT1S3Z60OVpf9drbBZPajpTOZJGmfOHhBtNtcHHGlLWj74FMXZ8LAAzj2x8tMpWaS0fDm62
X-Gm-Message-State: AOJu0Yz5VTKuM/R8wz/CIXXL96bh4din/TVkN2OPBptHb3wvW93MD6wq
	w6kQ9m+Aw6eSsCtW+F8ISjXWZUqvRw8Omygs6tDa6vVo1dVZG4jEZS2VnzXpA6hfEnyH1MoD0/6
	63HkEU0eqKsuHzt1LCAVyfXmn8Vo=
X-Google-Smtp-Source: AGHT+IHKYF432WX0EPcvAkL3Hj3W0DN9esPu52UJjo54ndxletRxuEb52xU+1JpXbb2fXjBa36nAVIrW8FHf/s3qmG4=
X-Received: by 2002:a05:6122:311b:b0:4f5:199b:2a7f with SMTP id
 71dfb90a1353d-4f6e68e211cmr3760998e0c.8.1722253040780; Mon, 29 Jul 2024
 04:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240725133932.739936-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346857DC444410F5C0A0C9486B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346857DC444410F5C0A0C9486B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 29 Jul 2024 12:36:54 +0100
Message-ID: <CA+V-a8v3=ykkRXSO-tqo20b_YT_iW_Z02oFSHkXhM68i8fgYcg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r9a07g054(l1): Correct GICD and
 GICR sizes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Jul 26, 2024 at 6:19=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Thursday, July 25, 2024 2:40 PM
> > Subject: [PATCH 3/5] arm64: dts: renesas: r9a07g054(l1): Correct GICD a=
nd GICR sizes
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/V2L SoC is equipped with the GIC-600. The GICD + GICDA is 128kB,=
 and the GICR is 128kB per
> > CPU.
> >
> > Fixes: 7c2b8198f4f32 ("arm64: dts: renesas: Add initial DTSI for RZ/V2L=
 SoC")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r9a07g054.dtsi   | 4 ++--
> >  arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi | 5 +++++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a07g054.dtsi
> > index 1de2e5f0917d..8a9b61bd759a 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> > @@ -1051,8 +1051,8 @@ gic: interrupt-controller@11900000 {
> >                       #interrupt-cells =3D <3>;
> >                       #address-cells =3D <0>;
> >                       interrupt-controller;
> > -                     reg =3D <0x0 0x11900000 0 0x40000>,
> > -                           <0x0 0x11940000 0 0x60000>;
> > +                     reg =3D <0x0 0x11900000 0 0x20000>,
>
> Can we update GIC-600 in[1]  based on [2] to avoid ABI breakage
> in future?
>
Sure will do.

Cheers,
Prabhakar

> IIC, As per [2], this patch series removes section GICT(GIC trace and deb=
ug page)
> and GICP(GIC PMU) and [1] does not mention first reg is for GICD + GICA.
> However, it mentions, it is for GICD.
>
> reg:
>     description: |
>       Specifies base physical address(s) and size of the GIC
>       registers, in the following order:
>       - GIC Distributor interface (GICD)
>       - GIC Redistributors (GICR), one range per redistributor region
>       - GIC CPU interface (GICC)
>       - GIC Hypervisor interface (GICH)
>       - GIC Virtual CPU interface (GICV)
>
> [1] https://elixir.bootlin.com/linux/v6.10.1/source/Documentation/devicet=
ree/bindings/interrupt-controller/arm,gic-v3.yaml
>
> [2] https://developer.arm.com/documentation/100336/0106/programmer-s-mode=
l/the-gic-600-registers/register-map-pages?lang=3Den
>
>
> Cheers,
> Biju
>
>
> > +                           <0x0 0x11940000 0 0x40000>;
> >                       interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> >               };
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> > b/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> > index d85a6ac0f024..5c0f6c5d165e 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> > @@ -16,3 +16,8 @@ cpus {
> >               /delete-node/ cpu@100;
> >       };
> >  };
> > +
> > +&gic {
> > +     reg =3D <0x0 0x11900000 0 0x20000>,
> > +           <0x0 0x11940000 0 0x20000>;
> > +};
> > --
> > 2.34.1
>

