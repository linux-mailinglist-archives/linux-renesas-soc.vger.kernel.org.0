Return-Path: <linux-renesas-soc+bounces-9528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F1993461
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 19:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CAD31F23B01
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 17:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023391DC1A9;
	Mon,  7 Oct 2024 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSgYwj5a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7B01D9691;
	Mon,  7 Oct 2024 17:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728320743; cv=none; b=coNiETBSxgr6tv8FUj1FSO1DmKAgbGnW5PI+uLoTuAtKUO/w8AZto66oUIN4W7uV4j5/nIIpJt7/OtqY4+/GMdiuUScnHBNivY3odIIICVmFTmenqxjLdoc4u3GDOGQ19ONZ5z9LqhIee4qG3EgF2whpjL/sqER8jcxDsKs5rHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728320743; c=relaxed/simple;
	bh=b75tF/sPphEK/zpg06RywlUOnVKTAmeu5F/2mvJMWD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4lhjVZyFYNAn+OLgyyn24417GWlzsoiGIMiItIFB1mUIpZ5h6nev//qinJrWw1ZtAyLBrwYh+EgRyBlOF4op9d0syhV7YwGGSjCFDu+InbZi+pDpz3bJhzjA91nbAArlJCspjFCm4fxxo9pyEy0nwxNkyBfBrtmaXWGN2lVENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSgYwj5a; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-710f0415ac8so2184480a34.1;
        Mon, 07 Oct 2024 10:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728320741; x=1728925541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo5VaJYp/8ouRC39yR7JLozJj6c3krO2R/Jl4vYSUfI=;
        b=FSgYwj5ajuGFtJGIlr849QFeGPks+F7pdKGqwc9MpcP/mmrB8FhFkXdh8XW+p4wOfY
         bA/D+AYH+3JZnI7SVP9pzR4k3ieo2g+mhiQBCxruRS/v5QeazxyC9ZQYwJNhXnn23wln
         gfcsQIV2FPvdt9RmxuSmYofWT7QiehFvbmeKCJHXGwNvjxtg+jd1GMUfpChXdu5VTBRK
         5l3h3023j6KqopbhdYSAsjPjyuWn4i87kOEaLjRLQI9MAZmNAHARxOiVof+VJIO4CZtV
         CQBzGbGd8wmUC27E5EHaMehixPtturP+/xkXETshBo1d63bG8kRRvejcXFUy6Se/pZrw
         75HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728320741; x=1728925541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fo5VaJYp/8ouRC39yR7JLozJj6c3krO2R/Jl4vYSUfI=;
        b=Tf+2u+V3FU5dmWhXriVfVkitiQ+nOjsR7qh8OJE5Y8/64AToWnPsT7LpJjilg2IFas
         1EYzKv7nYm/grICSis9aSym4hgGi5KZZV5lT7F9rXD+91d7qhZBwtXM+sObsDsmeEXnH
         /skJpOOhrDu9K5RDvnFu9jx2Z9sawKSf+5VEl+lwAm+LiL+rfRmElu8LxG3l/gOSbv1Y
         VHiceK50BlEzncuWyM8FUGeHyAzwxZOkCaghWOYG4HsjWi2c8x5rbYJXndZaxb8ZeE0l
         6hJmTAA5dIQf1GICJo3dctth2U2wxr/HqjX3OyVMWbPl8GTqY76U2emFYk9WUdyI1BYC
         YcKg==
X-Forwarded-Encrypted: i=1; AJvYcCUv+eLuGsJCHzRfzjqlWooiChYPqpCHsJ9+OAiaJAvumizxBvKqFQaML22MtIazM5HE4rQez63D1NKOG3rDCYjOa6o=@vger.kernel.org, AJvYcCVkd8RP09NMVXtlwhTgiyQlxFTsQ89Q9qLEWeYZ9M3y47uvIEA+BpBUjD+0t829DIHjx2vI2JKL1gPC@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRunhir0RfgsMkXk8bvcehO6deGVnkvs0YxRPa+MPCuex73b0
	R4sT4yd5xH71YoOx8u8Y0MgARZnnenwS/+uQF5Qgi/M6/ubQ6VUux+MrklDgTx8ZN3pNxkci4h1
	dqkWy8MEz3KyzdYz3nKgZYL1pTFc=
X-Google-Smtp-Source: AGHT+IETU0ZxwiebjeN3vsC82cDLDyg4zBlTpnnWDXRcrq10Q18NDcb5TFin6KLrQGgFJD2JFa7X1pBSgk1pUT599fA=
X-Received: by 2002:a05:6358:7e06:b0:1bc:d1b9:90e6 with SMTP id
 e5c5f4694b2df-1c2b83af4f0mr442316055d.28.1728320741244; Mon, 07 Oct 2024
 10:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <f51de53cb003f850751e13fdbddea64ad942ee7b.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <f51de53cb003f850751e13fdbddea64ad942ee7b.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 18:05:15 +0100
Message-ID: <CA+V-a8uwtN9gortwYHWs_PJ6BjGzLTU4jy_Wt-WbKmHeh1Kyvw@mail.gmail.com>
Subject: Re: [PATCH 01/20] ARM: dts: renesas: Use interrupts-extended for
 Ethernet MACs
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:30=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/renesas/emev2-kzm9d.dts     | 3 +--
>  arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7778-bockw.dts   | 3 +--
>  arch/arm/boot/dts/renesas/r8a7779-marzen.dts  | 3 +--
>  arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7792-wheat.dts   | 3 +--
>  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts    | 3 +--
>  7 files changed, 7 insertions(+), 14 deletions(-)
>

Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/emev2-kzm9d.dts b/arch/arm/boot/dt=
s/renesas/emev2-kzm9d.dts
> index 89495dd373585e94..c624fd61578b3b72 100644
> --- a/arch/arm/boot/dts/renesas/emev2-kzm9d.dts
> +++ b/arch/arm/boot/dts/renesas/emev2-kzm9d.dts
> @@ -83,8 +83,7 @@ ethernet@20000000 {
>                 compatible =3D "smsc,lan9221", "smsc,lan9115";
>                 reg =3D <0x20000000 0x10000>;
>                 phy-mode =3D "mii";
> -               interrupt-parent =3D <&gpio0>;
> -               interrupts =3D <1 IRQ_TYPE_EDGE_RISING>;
> +               interrupts-extended =3D <&gpio0 1 IRQ_TYPE_EDGE_RISING>;
>                 reg-io-width =3D <4>;
>                 smsc,irq-active-high;
>                 smsc,irq-push-pull;
> diff --git a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts b/arch/arm/boo=
t/dts/renesas/r8a73a4-ape6evm.dts
> index ae656ee27124c745..94a39ffc4297b788 100644
> --- a/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
> +++ b/arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts
> @@ -207,8 +207,7 @@ partition@80000 {
>         ethernet@8000000 {
>                 compatible =3D "smsc,lan9220", "smsc,lan9115";
>                 reg =3D <0x08000000 0x1000>;
> -               interrupt-parent =3D <&irqc1>;
> -               interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts-extended =3D <&irqc1 8 IRQ_TYPE_LEVEL_HIGH>;
>                 phy-mode =3D "mii";
>                 reg-io-width =3D <4>;
>                 smsc,irq-active-high;
> diff --git a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts b/arch/arm/boot/=
dts/renesas/r8a7778-bockw.dts
> index a3f9d74e8877b72b..e27d7dd8c869bb2d 100644
> --- a/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7778-bockw.dts
> @@ -96,8 +96,7 @@ ethernet@18300000 {
>                 reg =3D <0x18300000 0x1000>;
>
>                 phy-mode =3D "mii";
> -               interrupt-parent =3D <&irqpin>;
> -               interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqpin 0 IRQ_TYPE_EDGE_FALLING>=
;
>                 reg-io-width =3D <4>;
>                 vddvario-supply =3D <&fixedregulator3v3>;
>                 vdd33a-supply =3D <&fixedregulator3v3>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts b/arch/arm/boot=
/dts/renesas/r8a7779-marzen.dts
> index fec08562d12c1813..9793d8781d6e9425 100644
> --- a/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7779-marzen.dts
> @@ -261,8 +261,7 @@ ethernet@18000000 {
>                 pinctrl-names =3D "default";
>
>                 phy-mode =3D "mii";
> -               interrupt-parent =3D <&irqpin0>;
> -               interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqpin0 1 IRQ_TYPE_EDGE_FALLING=
>;
>                 smsc,irq-push-pull;
>                 reg-io-width =3D <4>;
>                 vddvario-supply =3D <&fixedregulator3v3>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boo=
t/dts/renesas/r8a7792-blanche.dts
> index 540a9ad28f28ac1a..7eefa227d65514a9 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> @@ -224,8 +224,7 @@ ethernet@18000000 {
>                 compatible =3D "smsc,lan89218", "smsc,lan9115";
>                 reg =3D <0x18000000 0x100>;
>                 phy-mode =3D "mii";
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqc 0 IRQ_TYPE_EDGE_FALLING>;
>                 smsc,irq-push-pull;
>                 reg-io-width =3D <4>;
>                 vddvario-supply =3D <&d3_3v>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts b/arch/arm/boot/=
dts/renesas/r8a7792-wheat.dts
> index 000f21a2a8630a8e..bfc780f7e396b408 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7792-wheat.dts
> @@ -115,8 +115,7 @@ ethernet@18000000 {
>                 compatible =3D "smsc,lan89218", "smsc,lan9115";
>                 reg =3D <0x18000000 0x100>;
>                 phy-mode =3D "mii";
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqc 0 IRQ_TYPE_EDGE_FALLING>;
>                 smsc,irq-push-pull;
>                 smsc,save-mac-address;
>                 reg-io-width =3D <4>;
> diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/d=
ts/renesas/sh73a0-kzm9g.dts
> index 98897f710063a91b..15d89c20618a16b7 100644
> --- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> @@ -172,8 +172,7 @@ ethernet@10000000 {
>                 compatible =3D "smsc,lan9221", "smsc,lan9115";
>                 reg =3D <0x10000000 0x100>;
>                 phy-mode =3D "mii";
> -               interrupt-parent =3D <&irqpin0>;
> -               interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqpin0 3 IRQ_TYPE_EDGE_FALLING=
>;
>                 reg-io-width =3D <4>;
>                 smsc,irq-push-pull;
>                 smsc,save-mac-address;
> --
> 2.34.1
>
>

