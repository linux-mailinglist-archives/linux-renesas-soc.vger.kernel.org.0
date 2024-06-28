Return-Path: <linux-renesas-soc+bounces-6897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F091C0B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 16:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0EF1F2296A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 14:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D70C1C0048;
	Fri, 28 Jun 2024 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJbuH6el"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8874D1BE25D;
	Fri, 28 Jun 2024 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584264; cv=none; b=VO434kKtte+qHFynUB7v/6TDH+esJhA8inaSR7LKGu59nriXdU5mla2n45kOK27CUNwWQ67zVdRhXM3MdkVxiOufOymH3SoGnbOuyQjFY0p0Xf7b9BGxdbJ0UesqBUjRdCNnWVco/mmsMI3vYUTTiqiS24pn6EM/U65x1ziFct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584264; c=relaxed/simple;
	bh=K7djxqbJRnfY/csWr9JHDiStjYDCtWu0pGMD/kq7c7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GI1/cA1/2RrL2KIyeXIJV9XzFyHe+56fU5dISXKrjcoE1BynGaLre9Xbkf8LpKi7fM3KoUPLkWSaCYs7my9W1fZxpVJjNh0CIT7yv/NBSAmkH0hwYVUeWvC7yqU+S20ru+mT72Y0hRGhKKuNADtdOV90KgeXl5bGU2+cCXCKl7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJbuH6el; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e03515ca876so621180276.2;
        Fri, 28 Jun 2024 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719584260; x=1720189060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVxPLRHxokrpHZYPE0M6S9KYwgunJ95NoJ0PB9rmg6U=;
        b=YJbuH6eliX5CvmwnonN3NfL4bGCDqTDKtkec90NMTglIRUJoK/xr5pIlOyAPQHagk9
         k1RzU/2MPiv5NjDVPUgOUn2H1AXqCzZKVzVbpk5Ys5cR7F73lSAMt4AQF4jXJlMLxJA0
         LxFMQ0KTH3A2HhS0wrkwHWWDMdhvGhA1LBixaeVp1HhCe3kFpWOwlnpCPwjs6LSwvgWk
         HG4UE1Wdsy2F3J6sAibFo1U3cwhW9uWYvTAyFOl66zIXTnKkXI0G+FmEIHr/bU7iY0/+
         GFzskurfqGLsp8/4J1/S9ffCI1mDGtXbKhHN6C5KvjaX6ICB4nalXfwpgVsoR8SkuYjp
         /kUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719584260; x=1720189060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVxPLRHxokrpHZYPE0M6S9KYwgunJ95NoJ0PB9rmg6U=;
        b=q6sKFcJyE2nMoWRIMQHL7OcrnEEoc0w05rHEFSfTdZN4Ht4c8X91E2GunEJqTP624e
         Rvgctk/ndgweQa5rRp0+6JOkClz4eur1iXI4N2dlmXUF2x/QivE0uJbLnzAjna2GWMEp
         TV0yrk9lUTVbsM+jcJ0ll/kauwtVIlGPDuKhPRol4PptJ8yRX1H1yFxXY1766IogyQIM
         Jg51O0780yWJb+7f7IDnzNUHQer66UWHKl6CL86amarYO5YYECwkOyu9syjKmj6zKZyV
         1Ipc4iXgx9RhFGX8/iEFcLU/Qyrgn+bueH9lASrgVNwiMciTmKN0YfLb2vl+CE02+EAH
         Pm9A==
X-Forwarded-Encrypted: i=1; AJvYcCVw7vTlG6xcEztW0iF73GVyluq2mG2aDp/3bMpcY2QsW1RZbKP6uo/NLz6DyD4/VoRm9oknQaAP0hGO91Hy5+BluOX/RjyxesyalO4t59N1sRiyQTidDluYvO+xzUmDK1ReJ5SDk19NidPHl6wN1Cvq3bz0HbqpEdtkvHNIcaNFuMdQDgQfacGDzjb/q5qwhoU1Qfa/6761stcC08o3UhreWqram8gT
X-Gm-Message-State: AOJu0YxiSjaexNVLBpvldIlQYoAabPkKHxeb/wiIx+6LK6COdKL5Eyf5
	wdixfEnSWY+/AkMVDFnxa2aAnt7nZpVAKJlthA5g8gtwGo8OFEL58YTzNt88ns8XowaopalHIEA
	9sx8mr8vcL9Og64j8Bc6dIqGtwHA=
X-Google-Smtp-Source: AGHT+IEtEDI9FerpTgSstAJXGuQxZh+N3aHReNVa62xpxzlqq9CFIMBvZ/eDFQ4BRdJTi+7rtK9E5Z+q+QkAmnupLlQ=
X-Received: by 2002:a25:df52:0:b0:dff:3058:e30f with SMTP id
 3f1490d57ef6-e0303ee20cfmr16754290276.21.1719584260283; Fri, 28 Jun 2024
 07:17:40 -0700 (PDT)
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
Date: Fri, 28 Jun 2024 15:17:12 +0100
Message-ID: <CA+V-a8uepnPCgbEtsxL+hMcGcS-X4hEXZsd7Q2+fpqMyF=cCGA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

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
Based on the special handling required to handle the IOVS and PWEN pin
by bypassing the core regulator by function pointers in v4 [0] doesn't
seem an elegant solution.

On the RZ/V2H SoC IOVS and PWEN pins can be used as GPIO and a similar
approach has been used on the other Renesas SoCs. I will withhold
internal regulator support for RZ/V2H SoC and fallback to GPIOs.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2024062613=
2341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

