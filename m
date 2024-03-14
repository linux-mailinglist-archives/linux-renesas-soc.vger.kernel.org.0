Return-Path: <linux-renesas-soc+bounces-3780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3687BE22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 14:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E8D31F218A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 13:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A528F6FE0F;
	Thu, 14 Mar 2024 13:56:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A26FE03
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710424596; cv=none; b=VaPBCPdKbz28I/YG77UhlisJprsK9yZmA1/kCtanrI2+CLn1Ydh56CQ/s7JSu/eq/0sDLURZUDfManlbZ9H1JUykLJ1mLBNpYdfd3RsCnHkPDb9rVTRPibklM9safQsDNY3o/kP0eNVpCbj6IlTt4MYMenToIqVCpdEI5EDvy9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710424596; c=relaxed/simple;
	bh=uhmook1XW0HWvo586kiwVvmAHTFk8d7n4WBeHoVUL6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKR1BHjxadOvpzQhNigWOwv2fTSJii6O877zXEd1PX3/QmTwiY7m43PyzmRKe/FCWiBkv34BiY9K2GAQR3T1wNqqLvpyQDkfJdl0WKYoFGgh5gai54J5MKIKsJ/f1YehQQyuSNjc3fJr3YHWSUSawdwjJIdwSdsPPf83wg5R0wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-609f3ca61e0so11055977b3.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 06:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710424593; x=1711029393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GFhFr/gR/UKXmcHLUFNOfl0WfJcjIlkMlMN2CiPv/I=;
        b=KPaOuNfw60K6KpV5/SFJPQ/lNsPKSTqPOvUx7VUnsJrusLwXqdpD7H/xOv+WEAnHpA
         mioPhYbWQI8zRH4SePpt8N7iKLTtCI8EWqlqr9r6v3X3nkxv0n2qlYPUvwYbnqTcjdeZ
         H1USj8iWQj+fKESu8b4aynaLsGGHyblPQN+IXJfBSIsMiIUTALEi0OzpIRnmIMaubH9o
         n7N+WwMoUowq9qlA7FY6bo3tK4aaBDmI+7AgkNksfoaHjuEpv4RTZh0ti8l/rJJDpYWC
         qPXHDoT0GtcHU1zIfiv9beEJs4PD1NO8UOiz45ncUYrR1vdj0g5V3jFwyZK7KirpUgmE
         GlwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbYuricyfbAh46ntQnJy6FDoykHgGh+TjyzgfE0GUxE8pr7jdMvjIu9+7mNw2WE7swQ6zPH0SqUUTMyzV6Vo+iUvxiGRcuzL9wRU7e5PhfwU0=
X-Gm-Message-State: AOJu0YwQCvn73JiZLQ/Y5q7YY+hgMnml6No3U4cA2Dit+A/uzf7opkeA
	kJmzxYaWiUJ+UPE27YJb6RqmWi5XnkRKnBMUKAY3h3OtARakzVYisKx8jtdIzVc=
X-Google-Smtp-Source: AGHT+IHJLLuRCcgLJRpY/ZyhFXdCRwcO9uDkWjv/ZwGgfTRVEZprt3i8O4U4nP5OvvgAWZLLjWhKaw==
X-Received: by 2002:a0d:df45:0:b0:609:fad5:a2e4 with SMTP id i66-20020a0ddf45000000b00609fad5a2e4mr2022721ywe.7.1710424593156;
        Thu, 14 Mar 2024 06:56:33 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id ey17-20020a05690c301100b006093c621a9asm273084ywb.86.2024.03.14.06.56.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:56:32 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60a3c48e70fso11204387b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 06:56:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUax2Ju70Zc9QcR/wNijtNAg9sOVhq2mzm74TrPQHI3kCJzif7BaVLEgcpJBKju/EhmEilempGJ2F+ARCXhm9qnzX9BH8HADTJcEXuumUUwEO4=
X-Received: by 2002:a81:6fd7:0:b0:609:ff39:7f5f with SMTP id
 k206-20020a816fd7000000b00609ff397f5fmr1923569ywc.30.1710424592394; Thu, 14
 Mar 2024 06:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com> <20240229120741.2553702-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20240229120741.2553702-2-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 14:56:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXWsnukKDjfQ4oHsXOVPiF+18odkURGP+9BWp4XN1DU0A@mail.gmail.com>
Message-ID: <CAMuHMdXWsnukKDjfQ4oHsXOVPiF+18odkURGP+9BWp4XN1DU0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add PCIe Host and
 Endpoint nodes
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

On Thu, Feb 29, 2024 at 1:07=E2=80=AFPM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PCIe Host and Endpoint nodes for R-Car V4H (R8A779G0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -723,6 +737,126 @@ hscif3: serial@e66a0000 {
>                         status =3D "disabled";
>                 };
>
> +               pciec0: pcie@e65d0000 {
> +                       compatible =3D "renesas,r8a779g0-pcie",
> +                                    "renesas,rcar-gen4-pcie";
> +                       reg =3D <0 0xe65d0000 0 0x1000>, <0 0xe65d2000 0 =
0x0800>,
> +                             <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x=
1200>,
> +                             <0 0xe65d6200 0 0x0e00>, <0 0xe65d7000 0 0x=
0400>,
> +                             <0 0xfe000000 0 0x400000>;
> +                       reg-names =3D "dbi", "dbi2", "atu", "dma", "app",=
 "phy", "config";
> +                       interrupts =3D <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "msi", "dma", "sft_ce", "app"=
;
> +                       clocks =3D <&cpg CPG_MOD 624>, <&pcie0_clkref>;
> +                       clock-names =3D "core", "ref";
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 624>;
> +                       reset-names =3D "pwr";
> +                       max-link-speed =3D <4>;
> +                       num-lanes =3D <2>;
> +                       #address-cells =3D <3>;
> +                       #size-cells =3D <2>;
> +                       bus-range =3D <0x00 0xff>;
> +                       device_type =3D "pci";
> +                       ranges =3D <0x01000000 0 0x00000000 0 0xfe000000 =
0 0x00400000>,
> +                                <0x02000000 0 0x30000000 0 0x30000000 0 =
0x10000000>;
> +                       dma-ranges =3D <0x42000000 0 0x00000000 0 0x00000=
000 1 0x00000000>;
> +                       #interrupt-cells =3D <1>;
> +                       interrupt-map-mask =3D <0 0 0 7>;
> +                       interrupt-map =3D <0 0 0 1 &gic GIC_SPI 416 IRQ_T=
YPE_LEVEL_HIGH>,
> +                                       <0 0 0 2 &gic GIC_SPI 416 IRQ_TYP=
E_LEVEL_HIGH>,
> +                                       <0 0 0 3 &gic GIC_SPI 416 IRQ_TYP=
E_LEVEL_HIGH>,
> +                                       <0 0 0 4 &gic GIC_SPI 416 IRQ_TYP=
E_LEVEL_HIGH>;

s/416/449 for all four lines.

> +                       snps,enable-cdm-check;
> +                       status =3D "disabled";
> +               };
> +
> +               pciec1: pcie@e65d8000 {
> +                       compatible =3D "renesas,r8a779g0-pcie",
> +                                    "renesas,rcar-gen4-pcie";
> +                       reg =3D <0 0xe65d8000 0 0x1000>, <0 0xe65da000 0 =
0x0800>,
> +                             <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x=
1200>,
> +                             <0 0xe65de200 0 0x0e00>, <0 0xe65df000 0 0x=
0400>,
> +                             <0 0xee900000 0 0x400000>;
> +                       reg-names =3D "dbi", "dbi2", "atu", "dma", "app",=
 "phy", "config";
> +                       interrupts =3D <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "msi", "dma", "sft_ce", "app"=
;
> +                       clocks =3D <&cpg CPG_MOD 625>, <&pcie1_clkref>;
> +                       clock-names =3D "core", "ref";
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 625>;
> +                       reset-names =3D "pwr";
> +                       max-link-speed =3D <4>;
> +                       num-lanes =3D <2>;
> +                       #address-cells =3D <3>;
> +                       #size-cells =3D <2>;
> +                       bus-range =3D <0x00 0xff>;
> +                       device_type =3D "pci";
> +                       ranges =3D <0x01000000 0 0x00000000 0 0xee900000 =
0 0x00400000>,
> +                                <0x02000000 0 0xc0000000 0 0xc0000000 0 =
0x10000000>;
> +                       dma-ranges =3D <0x42000000 0 0x00000000 0 0x00000=
000 1 0x00000000>;
> +                       #interrupt-cells =3D <1>;
> +                       interrupt-map-mask =3D <0 0 0 7>;
> +                       interrupt-map =3D <0 0 0 1 &gic GIC_SPI 423 IRQ_T=
YPE_LEVEL_HIGH>,
> +                                       <0 0 0 2 &gic GIC_SPI 423 IRQ_TYP=
E_LEVEL_HIGH>,
> +                                       <0 0 0 3 &gic GIC_SPI 423 IRQ_TYP=
E_LEVEL_HIGH>,
> +                                       <0 0 0 4 &gic GIC_SPI 423 IRQ_TYP=
E_LEVEL_HIGH>;

s/423/456 for all four lines.

> +                       snps,enable-cdm-check;
> +                       status =3D "disabled";
> +               };

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

