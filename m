Return-Path: <linux-renesas-soc+bounces-6621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5A5912494
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 13:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F98C2876CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 11:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE49173356;
	Fri, 21 Jun 2024 11:58:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2E171E54;
	Fri, 21 Jun 2024 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718971116; cv=none; b=q1+IAxPI6zLUgmhA/pGG7sw3TDZ1tzdNcZF/fo9VDl57oVvf+B3Sy4APW+vpJ7WVxko8lb9DBhNLUllmT9kQT1BjdpBt84+jECCVWMNHooRM6k9c1BJyfHwGZZMrdsTmm7B0JBP1J3KYUYP4CC/z5Q9eBj6s1Am3+9kTDOXgo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718971116; c=relaxed/simple;
	bh=XdJKUpMOfjs7xW7KNeqalxlxMZkmgjEczqSjunn5RpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukx/Thaq0nrUuHJaCtLhxNYnYwD1gkWdrJZtdjE+oJ58RlNC0Ix3zJQx0STqZd2bKyqo5MuhKfLFrHO1ESV+UcjpqAg/x+VLpzStkQEQlncHDl6+ijMiKWY3VvlzcOjdvMMkncB32ScTyhxPvXybdSErgNboYyDpEQdxE3fJ2bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-63bd10df78dso18061987b3.2;
        Fri, 21 Jun 2024 04:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718971113; x=1719575913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CfxTc2ay7dMkeRR8i1FoggTgd547G3vjExlObGw368=;
        b=MZd1w3q47qyJJSZe7Zxlbtm8+wfRREeF1fw2E4MEO2o6B9gLpHTwxcJG6edrrA05Fx
         JHEmLlkNxBt+Fu2Zc+bJWyBmquhE3sivVfRR84XQR3lN7t3/yGXkQEf0Dq9I+ZASq4Fm
         QSi2wXTZc1H0JZwq3EbhMBXaTLH2NSxDj3mj9QM4scYPEtKKpsBCCabLkK2BIlwGr+GB
         autc42HUjuuKd6KhEU42tlw1nSE1JB4szUOpAmByxn158Ts97xn2/w88tFZHQkdG45dP
         PHv+Azvga4t+VUMEmgs+28jZ6fUTVjqhuuJilxrQWOUl81nM4mSqt/Tmd8vwWW58uOCr
         C4oA==
X-Forwarded-Encrypted: i=1; AJvYcCV8B3u9VKGUJTpzfUi82JtQtl3lWg9AqaRBPOtcQfdIjjddsSjCu+xJeOt1wnQGUaza2VSciVf257dBZuk7njIBNGrMP/DwA5U0oCqKO4muUz/XrHdtHlzD+kws/sesvW1vyk+R7UNJwN4uULV3r69w2DEMee/7X3C8D5H03XA6YuQBAJyuJJAzJd5iPKyAptm54iS/6QK18/+OkxzD1On9mN1WCFc4
X-Gm-Message-State: AOJu0YwNJaHzUGGu7NDrXL7iRd8zxQjKvpt3ksF8Qb8zxh8xGDip+w/7
	IZr2Wg1/Zyj2ZOyrnBXhCuWjDmEHedSXcrRcWg8cXSsDYlb5dazhBoOYKNlK
X-Google-Smtp-Source: AGHT+IGU6+IPljA+GWBirS1yIkoda3RkNeEXEgUr5IH7xXsWgx3ZUP/EpHO+x/73+bR+xwemmCmqTA==
X-Received: by 2002:a0d:e88f:0:b0:613:febf:7a7c with SMTP id 00721157ae682-63a8e0e2c4dmr72593207b3.16.1718971112781;
        Fri, 21 Jun 2024 04:58:32 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f10d9f3aasm2935937b3.3.2024.06.21.04.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 04:58:32 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dff02b8a956so1883037276.1;
        Fri, 21 Jun 2024 04:58:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSK40vUwFL7dmO0h7fBol+wmQZ6OhIehG/MBgM7AOA9g8WMdG+UseCyzaqM5Ew8h/qMzIJnsQRsqMT6dZKK7Szy1fqcOu3eQ59jyXllDXl2TV2p3J0qJEse4PKXzyWlo/1BMUtwksJibOTeSCXAsvTjnco4np6I7fEDBYcv+tLdDzqVMaMNQoMCQYSkttVYTL3AB6qUN1m8HIFpztNEymxY5neUDeL
X-Received: by 2002:a25:6ac5:0:b0:dfe:388e:2987 with SMTP id
 3f1490d57ef6-e02be228793mr7474675276.64.1718971112323; Fri, 21 Jun 2024
 04:58:32 -0700 (PDT)
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
 <CA+V-a8spwd82a3BTS-u-w-JY859YCRxCi0Os6XRn27-mkWz6WA@mail.gmail.com> <4lypqqf4o2wk22kzpyutlaarare5kurdrlokbm6mb4re3mstam@qo7c3d4tcpll>
In-Reply-To: <4lypqqf4o2wk22kzpyutlaarare5kurdrlokbm6mb4re3mstam@qo7c3d4tcpll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jun 2024 13:58:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXeDTof+aPJVUma78DgxP8vuWjJHoiBTcX_mKjX9WduZA@mail.gmail.com>
Message-ID: <CAMuHMdXeDTof+aPJVUma78DgxP8vuWjJHoiBTcX_mKjX9WduZA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, Jun 21, 2024 at 9:54=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Based on the feedback from Rob I have now changed it to below, i.e.
> > the regulator now probes based on regulator-compatible property value
> > "vqmmc-r9a09g057-regulator" instead of regulator node name as the
> > driver has of_match in regulator_desc.
>
> I like this a lot! One minor comment.
>
> > static struct regulator_desc r9a09g057_vqmmc_regulator =3D {
> >     .of_match    =3D of_match_ptr("vqmmc-r9a09g057-regulator"),
> >     .owner        =3D THIS_MODULE,
> >     .type        =3D REGULATOR_VOLTAGE,
> >     .ops        =3D &r9a09g057_regulator_voltage_ops,
> >     .volt_table    =3D r9a09g057_vqmmc_voltages,
> >     .n_voltages    =3D ARRAY_SIZE(r9a09g057_vqmmc_voltages),
> > };
> >
> > SoC DTSI:
> >         sdhi1: mmc@15c10000 {
> >             compatible =3D "renesas,sdhi-r9a09g057";
> >             reg =3D <0x0 0x15c10000 0 0x10000>;
> >             interrupts =3D <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
> >                      <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
> >             clocks =3D <&cpg CPG_MOD 167>,
> >                  <&cpg CPG_MOD 169>,
> >                  <&cpg CPG_MOD 168>,
> >                  <&cpg CPG_MOD 170>;
> >             clock-names =3D "core", "clkh", "cd", "aclk";
> >             resets =3D <&cpg 168>;
> >             power-domains =3D <&cpg>;
> >             status =3D "disabled";
> >
> >             vqmmc_sdhi1: vqmmc-regulator {
> >                 regulator-compatible =3D "vqmmc-r9a09g057-regulator";

renesas,r9a09g057-vqmmc-regulator?

> >                 regulator-name =3D "vqmmc-regulator";
>
> This should have "sdhi<X>" somewhere in the name?

Indeed.

>
> >                 regulator-min-microvolt =3D <1800000>;
> >                 regulator-max-microvolt =3D <3300000>;
> >                 status =3D "disabled";
> >             };
> >         };
> >
> > Board DTS:
> >
> > &sdhi1 {
> >     pinctrl-0 =3D <&sdhi1_pins>;
> >     pinctrl-1 =3D <&sdhi1_pins>;
> >     pinctrl-names =3D "default", "state_uhs";
> >     vmmc-supply =3D <&reg_3p3v>;
> >     vqmmc-supply =3D <&vqmmc_sdhi1>;
> >     bus-width =3D <4>;
> >     sd-uhs-sdr50;
> >     sd-uhs-sdr104;
> >     status =3D "okay";
> > };
> >
> > &vqmmc_sdhi1 {
> >     status =3D "okay";
> > };
>
> Again, I like this. It looks like proper HW description to me.
>
> > Based on the feedback provided Geert ie to use set_pwr callback to set
> > PWEN bit and handle IOVS bit in voltage switch callback by dropping
> > the regulator altogether. In this case we will have to introduce just
> > a single "use-internal-regulator" property and if set make the vqmmc
> > regulator optional?
>
> Let's discuss with Geert. But I am quite convinced of your approach
> above.
>
> > > > Let me know if I have missed something obvious here.
> > >
> > > Nope, all good.
>
> Don't give up, I think we are close...

The above indeed starts looking good to me.
IIUIC, the use of the special vqmmc-r9a09g057-regulator is still
optional, and the subnode can be left disabled? E.g. the board
designer may still use a (different) GPIO to control the regulator,
using "regulator-gpio"?

Which brings me to another question: as both the SDmIOVS and SDmPWEN
pins can be configured as GPIOs, why not ignore the special handling
using the SDm_SD_STATUS register, and use "regulator-gpio" instead?
We usually do the same for CD/WP, using "{cd,wp}-gpios" instead.
Exceptions are old SH/R-Mobile and R-Car Gen1 boards:

  arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts:          groups =3D
"sdhi0_data4", "sdhi0_ctrl", "sdhi0_cd";
  arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts:
groups =3D "sdhi0_data4", "sdhi0_ctrl", "sdhi0_wp";
  arch/arm/boot/dts/renesas/r8a7778-bockw.dts:            groups =3D
"sdhi0_cd", "sdhi0_wp";
  arch/arm/boot/dts/renesas/r8a7779-marzen.dts:           groups =3D
"sdhi0_data4", "sdhi0_ctrl", "sdhi0_cd";
  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts:             groups =3D
"sdhi0_data4", "sdhi0_ctrl", "sdhi0_cd", "sdhi0_wp";

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

