Return-Path: <linux-renesas-soc+bounces-6578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97541910E44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 19:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355921F22F1A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C201B3758;
	Thu, 20 Jun 2024 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agt0SPA6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759D1ABCB1;
	Thu, 20 Jun 2024 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718903790; cv=none; b=F+i8pfD5JQpY7JmOWvsHB26WNj8VF7AbOl/qgiV67hFxfyr0VIXkDqo8T3C6ZK1tBECz2s32OdUIKfBvWVDmMfiE890H3dJwniLYG9XFp+vwg77uNtWP1BT/dmIiJOt/+/WI0klUXtOgxB+GZz5YLLn82qtmr6f6wU6FBF7fjhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718903790; c=relaxed/simple;
	bh=Cm6boTYiGyczGTLf1d6+1WdYcy1zWeBu51u/uIzaRLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHIx1BQgyZ+yMTtNWPCiikfF7uPdza/Am9tXkccoZlWGAxL2XV3AZNthngwlqttri/IlMzOHhmeZjFL0Yecos63SdurVwD2/c9Di0aQmmymPtAqpEthZ7+ilrwZp1Jy4tlwfpHq6qv5su/uE/Zq2h1fhIgXRLuxhSH40shavtIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agt0SPA6; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-48f159d3275so409520137.0;
        Thu, 20 Jun 2024 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718903787; x=1719508587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIPHUV8SHKqvt2iSTxINyVm3CI6nMiR7RNXL+xTxwHM=;
        b=agt0SPA6vlD6rY0jYFtpgFRkiCmIUsqaV+QmnbT0JLbSqVP4S6jPxvfM22wiZJ1tPQ
         1vYwxkJjo97Rm/1EAcrZrOHpQ5sripDBDn9QuUAFap+vLTP8tBEvJomuk4Rd+/SPmEdD
         V1Aq0jpBQLnVIDPCmx6tr6ROYnbauRS2sxBF1fcopgNG7MAhhnAi7Ow0bJc5I/iNGE8+
         16Z6DfyoVRsvWQhf+e9ImEeTaQ2qB9j2KaAK56vviu6YtrUHLL/fwjmeGc6hXmh/LT5H
         miy/JM0ObjjA4suTyiXcMt5NnTkMrT/7bHQ5aGjekoNy+ouuN9Qwxx+N8BVL7bf4QlzD
         tmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718903787; x=1719508587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIPHUV8SHKqvt2iSTxINyVm3CI6nMiR7RNXL+xTxwHM=;
        b=v072jJ8E7WZkm30I8zMD40v0syeA3NadDOrOqxlndw4jZyszv0HpwXMLmHE2wp+8/O
         z/Fay5DHYg8sOFpP4tA/jbrFCVZN0k5tliHEt33t3ocVkLJc4VAa98hcYQABYChrnP5y
         8FVF22HgGDaxUxWWhQpTLHXTcFt+HTk+UZZrF3fZZZ1nQNSYlmp3fn/X1NVtW3E9hVSn
         S0sP6hN/YGqMPEuEVxIoBa+iF3pQBSg3ub8a5yO0cjRV9KVhGm7p+5BvyEhX5jWbIdxL
         SCWk6fFonXmj+E4v4j6TrJH3uNnGfump0RzuPcXNnwgiwBNoJjUY5EQre8gMqAbFbc5D
         SbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLz6hn6zc7aYrwnJowSubW3+g3Isfqha9OuUEc3Btjc1SIQM6+kDw5VV0cQRhX9PiFSuwwH7yFjvKAzUexPh0azIB++QGE432uLFlJIM2SbEUjhDVyM/NIs1V+LzJyGraFWejXEXJKlYs1kL7nD0ajjZ97YJk/DsxgpR9fIUOxx7CshS4+L4Itnc1ZkD2ZxqA3hYJx2GjY3T3bK3/SHGdHhER9YsiO
X-Gm-Message-State: AOJu0YzunIyNw6eFQzp8Wj2kNMZuALJ+ywcoAlpY7ZXr04bliA7AM5h6
	cth9wZWSgLN7kQYetURSsiJAiQKqQ1KOkMB95CdDC27thkVEHZQzf1Q6zTBpMEWkMTSvca/d44B
	Zfda5P9DN9pQSA4v7hLZoj5Q7ZRtCThJQiPs=
X-Google-Smtp-Source: AGHT+IE8/Td/IzF8V17wvuiM4k2AqaEYHsgLyt12Y78+fQ0wmMmbQi11O1TwwiMergWHZ2hnl8ipW70YV3pjoDle2tM=
X-Received: by 2002:a05:6122:738:b0:4ef:320f:9f13 with SMTP id
 71dfb90a1353d-4ef320fa00bmr4192680e0c.0.1718903787363; Thu, 20 Jun 2024
 10:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
 <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com> <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
In-Reply-To: <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Jun 2024 18:15:44 +0100
Message-ID: <CA+V-a8spwd82a3BTS-u-w-JY859YCRxCi0Os6XRn27-mkWz6WA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-mmc@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Jun 20, 2024 at 8:39=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> > I did give it a try with platform_driver_probe() and failed.
>
> Ok, thanks for trying nonetheless!
>
> > - Firstly I had to move the regulator node outside the SDHI node for
> > platform_driver_probe() to succeed or else it failed with -ENODEV (at
> > https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#=
L953)
>
> This makes sense to me because it is just a "regular" regulator.
>
OK.

> > - In Renesas SoCs we have multiple instances of SDHI, the problem
> > being for each instance we are calling platform_driver_probe(). Which
> > causes a problem as the regulator node will use the first device.
>
> I see... we would need a reg property to differentiate between the
> internal regulators but that is already used by the parent SDHI node.
>
> Okay, so let's scrap that idea. However, we need to ensure that we can
> still have an external regulator. Seeing the bindings, it looks like you
> enable the internal regulator with the "vqmmc-r9a09g057-regulator"
> property? I wonder now if we can simplify this to an
> "use-internal-regulator" property because we have 'compatible' already
> to differentiate? Needs advice from DT maintainers, probably.
>

Based on the feedback from Rob I have now changed it to below, i.e.
the regulator now probes based on regulator-compatible property value
"vqmmc-r9a09g057-regulator" instead of regulator node name as the
driver has of_match in regulator_desc.

static struct regulator_desc r9a09g057_vqmmc_regulator =3D {
    .of_match    =3D of_match_ptr("vqmmc-r9a09g057-regulator"),
    .owner        =3D THIS_MODULE,
    .type        =3D REGULATOR_VOLTAGE,
    .ops        =3D &r9a09g057_regulator_voltage_ops,
    .volt_table    =3D r9a09g057_vqmmc_voltages,
    .n_voltages    =3D ARRAY_SIZE(r9a09g057_vqmmc_voltages),
};

SoC DTSI:
        sdhi1: mmc@15c10000 {
            compatible =3D "renesas,sdhi-r9a09g057";
            reg =3D <0x0 0x15c10000 0 0x10000>;
            interrupts =3D <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
                     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
            clocks =3D <&cpg CPG_MOD 167>,
                 <&cpg CPG_MOD 169>,
                 <&cpg CPG_MOD 168>,
                 <&cpg CPG_MOD 170>;
            clock-names =3D "core", "clkh", "cd", "aclk";
            resets =3D <&cpg 168>;
            power-domains =3D <&cpg>;
            status =3D "disabled";

            vqmmc_sdhi1: vqmmc-regulator {
                regulator-compatible =3D "vqmmc-r9a09g057-regulator";
                regulator-name =3D "vqmmc-regulator";
                regulator-min-microvolt =3D <1800000>;
                regulator-max-microvolt =3D <3300000>;
                status =3D "disabled";
            };
        };

Board DTS:

&sdhi1 {
    pinctrl-0 =3D <&sdhi1_pins>;
    pinctrl-1 =3D <&sdhi1_pins>;
    pinctrl-names =3D "default", "state_uhs";
    vmmc-supply =3D <&reg_3p3v>;
    vqmmc-supply =3D <&vqmmc_sdhi1>;
    bus-width =3D <4>;
    sd-uhs-sdr50;
    sd-uhs-sdr104;
    status =3D "okay";
};

&vqmmc_sdhi1 {
    status =3D "okay";
};

Based on the feedback provided Geert ie to use set_pwr callback to set
PWEN bit and handle IOVS bit in voltage switch callback by dropping
the regulator altogether. In this case we will have to introduce just
a single "use-internal-regulator" property and if set make the vqmmc
regulator optional?

Let me know your thoughts.

> > Let me know if I have missed something obvious here.
>
> Nope, all good.
>
sigh..

Cheers,
Prabhakar

