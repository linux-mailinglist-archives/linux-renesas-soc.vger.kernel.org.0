Return-Path: <linux-renesas-soc+bounces-6628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D85912570
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 14:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0465F281CB1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 12:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21C315444B;
	Fri, 21 Jun 2024 12:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhI0P4Tk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F7715444F;
	Fri, 21 Jun 2024 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973245; cv=none; b=fsqgqJXFA8B/lXNqmUe9W6f3UD2nkdqf6iDA+5wDcoTsI2qTEdUnlT6wAhctBTxg+D1CKzFRPcPqu/u+sTrOZEXUIGldaQJ0KgFsqpqr6vgDNvcSQ9F/cnuAU2PbgtPzZVdnolgDrpivb/gANlSj0QvPO69i4nPrHyoz9qkVE3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973245; c=relaxed/simple;
	bh=HKylSdNvmXndvryEdkzNElyK3U+jluApJRG/7KFl1wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGtvillE8OxDA14YmTUBS9KVm58gj8Np3CYuWnw0G269T5Ga2AXZZlj9WuJO533TXhWbdw6M7E/NUohD6NnLdRRoHIySPgmhVOUyViJEN3YU2mwGoqYyafYARclqwftMpeOKPtAEAqowWX8+/zk/x3G5UEy+cDJk/BxnEAYdQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhI0P4Tk; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0272692096so1838294276.1;
        Fri, 21 Jun 2024 05:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718973243; x=1719578043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dHjQTWtVeV8KS0rjSGfeLqX1RaK9DPC8zmSZCu3Dvw=;
        b=NhI0P4TkpIFpLgRp3f5LslJhI9WhfVOj08BXoP93tOVY+iLp6i1M4qNHQmMZISM3az
         /cIt0JRcQW15Rh/VkjSMfJvxbxmwQRMJZqY+46ye+nebOtQ/VPXe2418RfNC7oCi24MK
         QNiLNyjM7SlAv4fhkjw+yLxeqwmhgWQrhWoK+tv3zIgTCUIlKESfYUPt/zwLQgix7tdX
         yEFTrtAFVjOgQnHGLM/qzJZ+kluevTPN8qtDKzC4GaTofRW9ziJJy1OsubMJuhkmeInM
         w1IUBy61OPFOt8P6WuZf+5mZf9/mEkejOYevtAWa9XBBPnZ6HKhhgkVAdsUzVUxmYHNU
         a1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718973243; x=1719578043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dHjQTWtVeV8KS0rjSGfeLqX1RaK9DPC8zmSZCu3Dvw=;
        b=s4IjdfD2tJ1PD49y8WStR+AywVQUdpUk4PtjoAnOi+uXKiOQIQjnwCZUR+T2+uk3/7
         vx1kkTlOFd4uTcM76aZVRqYWDOPHJQUI69BwVjJ8vkVep22Ycfo6ZEeTxsz7hG6X/ano
         aKHs8BJq2lJYrRXKATChwBKJypGO25rEqj05DD7ktCcdPMhlcPstjZ+5Fe3kEMXmNLVm
         RJEKGRM1pq4TYsUU+0s56YxPZ8SAbxu9oXBFnJIbIcPhyn+31SndiuQURibRTSQ46VU/
         OsHy93QCE8Mt1Zlg0+YR6ilU4qN0G7mT+nex5scRz9Rmz3S64ZNrIAz6+QJGsn7XuL0u
         rwZw==
X-Forwarded-Encrypted: i=1; AJvYcCUvMiA4mUnL6w7sOrIdgi8hqvYRPDJOY5qvtvXKzFFnqPOsTP6/Dr7KD7rNtgCyliV6zGo3sdkCMtlowXXAJXTPo+PmXZMTK0ZI/xxYa+uMmZzWunDygwaCbdEnS6llbqwpLPqhakygnQGeUFRYYwTn+GvkgGMqlpGtTtmHv9vLhbjymPJEZ3GHCmzWaJt8zWOdKVZMlMxT1TGihMR4tHdgEuM8lygF
X-Gm-Message-State: AOJu0Yy1P7arx4IYft35AqBaQBIj4opwAGvqZlxqCqOte1xLZuSG/E8T
	TeTDlRgU3uWOOrznLSBEDuIxBhsAPwiFEPd+hZTvqDtuIbM6dH9wy/CcilGSsgp4Nu1BUObvXsY
	fHKN8A90SlAZFWl64zBvXE7ErQYo=
X-Google-Smtp-Source: AGHT+IFlR2ZSFKjWwZOMmWtQuUqvHgeOAyhSpWKuduLi55uLXLmgnOLtWofI0m6m/MOvOXvERGYfxDp9le3fshqA/J0=
X-Received: by 2002:a25:dbce:0:b0:e02:c3a1:bb04 with SMTP id
 3f1490d57ef6-e02c3a1be7cmr7518039276.22.1718973242590; Fri, 21 Jun 2024
 05:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
 <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>
 <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
 <CA+V-a8spwd82a3BTS-u-w-JY859YCRxCi0Os6XRn27-mkWz6WA@mail.gmail.com>
 <4lypqqf4o2wk22kzpyutlaarare5kurdrlokbm6mb4re3mstam@qo7c3d4tcpll> <CAMuHMdXeDTof+aPJVUma78DgxP8vuWjJHoiBTcX_mKjX9WduZA@mail.gmail.com>
In-Reply-To: <CAMuHMdXeDTof+aPJVUma78DgxP8vuWjJHoiBTcX_mKjX9WduZA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 21 Jun 2024 13:33:36 +0100
Message-ID: <CA+V-a8sB2FCtMjke1XsHuVF8Ze=uk=OiMxfb54TTeOeqV=LVow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Jun 21, 2024 at 12:58=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi all,
>
> On Fri, Jun 21, 2024 at 9:54=E2=80=AFAM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > > Based on the feedback from Rob I have now changed it to below, i.e.
> > > the regulator now probes based on regulator-compatible property value
> > > "vqmmc-r9a09g057-regulator" instead of regulator node name as the
> > > driver has of_match in regulator_desc.
> >
> > I like this a lot! One minor comment.
> >
> > > static struct regulator_desc r9a09g057_vqmmc_regulator =3D {
> > >     .of_match    =3D of_match_ptr("vqmmc-r9a09g057-regulator"),
> > >     .owner        =3D THIS_MODULE,
> > >     .type        =3D REGULATOR_VOLTAGE,
> > >     .ops        =3D &r9a09g057_regulator_voltage_ops,
> > >     .volt_table    =3D r9a09g057_vqmmc_voltages,
> > >     .n_voltages    =3D ARRAY_SIZE(r9a09g057_vqmmc_voltages),
> > > };
> > >
> > > SoC DTSI:
> > >         sdhi1: mmc@15c10000 {
> > >             compatible =3D "renesas,sdhi-r9a09g057";
> > >             reg =3D <0x0 0x15c10000 0 0x10000>;
> > >             interrupts =3D <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
> > >                      <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
> > >             clocks =3D <&cpg CPG_MOD 167>,
> > >                  <&cpg CPG_MOD 169>,
> > >                  <&cpg CPG_MOD 168>,
> > >                  <&cpg CPG_MOD 170>;
> > >             clock-names =3D "core", "clkh", "cd", "aclk";
> > >             resets =3D <&cpg 168>;
> > >             power-domains =3D <&cpg>;
> > >             status =3D "disabled";
> > >
> > >             vqmmc_sdhi1: vqmmc-regulator {
> > >                 regulator-compatible =3D "vqmmc-r9a09g057-regulator";
>
> renesas,r9a09g057-vqmmc-regulator?
>
> > >                 regulator-name =3D "vqmmc-regulator";
> >
> > This should have "sdhi<X>" somewhere in the name?
>
> Indeed.
>
> >
> > >                 regulator-min-microvolt =3D <1800000>;
> > >                 regulator-max-microvolt =3D <3300000>;
> > >                 status =3D "disabled";
> > >             };
> > >         };
> > >
> > > Board DTS:
> > >
> > > &sdhi1 {
> > >     pinctrl-0 =3D <&sdhi1_pins>;
> > >     pinctrl-1 =3D <&sdhi1_pins>;
> > >     pinctrl-names =3D "default", "state_uhs";
> > >     vmmc-supply =3D <&reg_3p3v>;
> > >     vqmmc-supply =3D <&vqmmc_sdhi1>;
> > >     bus-width =3D <4>;
> > >     sd-uhs-sdr50;
> > >     sd-uhs-sdr104;
> > >     status =3D "okay";
> > > };
> > >
> > > &vqmmc_sdhi1 {
> > >     status =3D "okay";
> > > };
> >
> > Again, I like this. It looks like proper HW description to me.
> >
> > > Based on the feedback provided Geert ie to use set_pwr callback to se=
t
> > > PWEN bit and handle IOVS bit in voltage switch callback by dropping
> > > the regulator altogether. In this case we will have to introduce just
> > > a single "use-internal-regulator" property and if set make the vqmmc
> > > regulator optional?
> >
> > Let's discuss with Geert. But I am quite convinced of your approach
> > above.
> >
> > > > > Let me know if I have missed something obvious here.
> > > >
> > > > Nope, all good.
> >
> > Don't give up, I think we are close...
>
> The above indeed starts looking good to me.
> IIUIC, the use of the special vqmmc-r9a09g057-regulator is still
> optional, and the subnode can be left disabled? E.g. the board
> designer may still use a (different) GPIO to control the regulator,
> using "regulator-gpio"?
>
> Which brings me to another question: as both the SDmIOVS and SDmPWEN
> pins can be configured as GPIOs, why not ignore the special handling
> using the SDm_SD_STATUS register, and use "regulator-gpio" instead?
> We usually do the same for CD/WP, using "{cd,wp}-gpios" instead.
> Exceptions are old SH/R-Mobile and R-Car Gen1 boards:
>
>   arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts:          groups =3D
> "sdhi0_data4", "sdhi0_ctrl", "sdhi0_cd";
>   arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts:
> groups =3D "sdhi0_data4", "sdhi0_ctrl", "sdhi0_wp";
>   arch/arm/boot/dts/renesas/r8a7778-bockw.dts:            groups =3D
> "sdhi0_cd", "sdhi0_wp";
>   arch/arm/boot/dts/renesas/r8a7779-marzen.dts:           groups =3D
> "sdhi0_data4", "sdhi0_ctrl", "sdhi0_cd";
>   arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts:             groups =3D
> "sdhi0_data4", "sdhi0_ctrl", "sdhi0_cd", "sdhi0_wp";
>
Indeed this can be done on RZ/V2H(P) SoC, the future upcoming SoCs may
not have an option for this In this case we will have to use the
internal regulator.

Let me know your thoughts on what approach we take for RZ/V2H(P) SoC.

Cheers,
Prabhakar

