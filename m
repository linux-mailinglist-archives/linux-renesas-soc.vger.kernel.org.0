Return-Path: <linux-renesas-soc+bounces-7526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6441293C5A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 16:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95BAE1C21EE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 14:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0D419D06C;
	Thu, 25 Jul 2024 14:54:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5813C816;
	Thu, 25 Jul 2024 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721919241; cv=none; b=DXh/WgUUbGBsm6HwqAwhC8uHWDYB48JHecoDit8I3IZd55xbD5CoC0gs6HFcmJuvw6jrGh0W2Dbu4uM4ZgmfWdWz/0c0/kywcwW2D+Bt3UQsm7jCadmoaBV9f0zeYb9eWEQKpKov4QMFlbEKske/xNq44FtoNgLaLkhVvY3I/UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721919241; c=relaxed/simple;
	bh=utI3mmcPxP1fry9KThUdNsQ8tmb0GHQU8QKgJNkuV5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2b2F42Na2ED/F5q47rzbiYBlVaX+md3ethFF2FiCtrahuMK/pns7NMXFFv+OYlbwAAG9vYhaoLoUb2y+TpMiZrkfclJ8mKFls6tzRcyHvUlFqQPHHImmlE3prhxiHEEP7tc1A8/zeFbwzlFXlmngjVnQ0FkvRl1Ml2QUbFoQHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-66ca536621cso11495907b3.3;
        Thu, 25 Jul 2024 07:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721919237; x=1722524037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSX1kYXMedsdi3QUwMeh251N6K480Y5ixoD2IfbKvI4=;
        b=ivGsZJogVrINg0+bC7lQ9ZSOoTc8poAu4oHApae6qPOVzDZyPEOyy7rzKRcoYGuPB3
         m6E24waUv3g1/BsEgQPO2NQsnNANZgadm5TrHKn558vegFE+AB2b3fVjbMeN1bXOOZx6
         TR7fYzc6TSDApD5di17tSbMT2YgSE+TBUG86TJfXbazmCJWK78e2NW0RAT+ulF/jtS6S
         LIqcxiapzGhQpN5w0xFcAq+MbcnWMxUKGUaERsFh05Xuq1eooyCk9F9aj826z0GRz0Mg
         Rs2w04Kx3x6Ft50rnkAq6apAHmUnAipZ4/9LgQ9DAPNkqHF6RybZsTmQJRv+2Gl3EBvL
         KwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+lvX8suttmv/LIojIodXoysCm8KbFLrOl8aBLpzkWDMhAnSKJdCmTAzEmQPCqcNwCL9EbMiQzWxOKp+vIYvtyI8c/LF48k5F/cwA//DROivz68H1fIP8mKgMrusoEjaPlLDBiJTiJdX/q563IQaFkMxAab8ihzfWvmpuC+wSLa5xTxG2rIm4QHEI
X-Gm-Message-State: AOJu0Yz+InK+BtSTu6LHaYA+JD6V0mByztBzGNHgFlVdpmFDyxgQJSL3
	/hWs2nRYdLWUuh4j6HPr+czBLt8dAMUp49uIKrbv1wXWljLFHCFJ+D0PEMis
X-Google-Smtp-Source: AGHT+IFm9aWcPQbPKF80AeXL3xLOVDbhjIL31D+y2eXIXJ7fSXsMqU6kXBJACScny/fGa9orNFVxgw==
X-Received: by 2002:a81:8805:0:b0:64a:d5fd:f19e with SMTP id 00721157ae682-67510920ad9mr31705587b3.3.1721919237346;
        Thu, 25 Jul 2024 07:53:57 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756795eab0sm4142867b3.48.2024.07.25.07.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 07:53:57 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-65fe1239f12so8910227b3.0;
        Thu, 25 Jul 2024 07:53:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQ5I+HaP2rtZ/tcfOKOrJSGMLT8OGeqmB/hFg7gK+3GCEajavMH28GhYmluC4vXgYEE/ACkouts9Ob1lUFb4/bRpJJklwLMacKaI8amD4U2SSLdlBwfHQ0Iw8mnYk/3wQJA8AtqbmGJFkZwXgzhRDe5zYnnEqRX2mHcaQ0r1Iye5YepBEHPwMJGEFB
X-Received: by 2002:a81:7782:0:b0:64b:4219:768a with SMTP id
 00721157ae682-67512029321mr32481697b3.24.1721919236766; Thu, 25 Jul 2024
 07:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240725133932.739936-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240725133932.739936-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Jul 2024 16:53:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpZ6KWdjveVSS72jdSuySCB7KVgo=TSr7tt=G295bPXw@mail.gmail.com>
Message-ID: <CAMuHMdUpZ6KWdjveVSS72jdSuySCB7KVgo=TSr7tt=G295bPXw@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a07g044(l1): Correct GICD and
 GICR sizes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Jul 25, 2024 at 3:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The RZ/G2L SoC is equipped with the GIC-600. The GICD + GICDA is 128kB,
> and the GICR is 128kB per CPU.
>
> Fixes: 68a45525297b2 ("arm64: dts: renesas: Add initial DTSI for RZ/G2{L,=
LC} SoC's")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -1043,8 +1043,8 @@ gic: interrupt-controller@11900000 {
>                         #interrupt-cells =3D <3>;
>                         #address-cells =3D <0>;
>                         interrupt-controller;
> -                       reg =3D <0x0 0x11900000 0 0x40000>,
> -                             <0x0 0x11940000 0 0x60000>;
> +                       reg =3D <0x0 0x11900000 0 0x20000>,
> +                             <0x0 0x11940000 0 0x40000>;
>                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>                 };
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a07g044l1.dtsi
> index 9cf27ca9f1d2..6f4d4dc13f50 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> @@ -16,3 +16,8 @@ cpus {
>                 /delete-node/ cpu@100;
>         };
>  };
> +
> +&gic {
> +       reg =3D <0x0 0x11900000 0 0x20000>,
> +             <0x0 0x11940000 0 0x20000>;
> +};

What's the point of overriding this here?

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

