Return-Path: <linux-renesas-soc+bounces-15658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44358A822DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 12:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74F933B8109
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 10:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A3025DAF8;
	Wed,  9 Apr 2025 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6EgeblM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D71F25D911;
	Wed,  9 Apr 2025 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196049; cv=none; b=H9LBTMHaVYoKzStT8gKMSU+hVKYDmOoLJc0odlyW24hrDbgcQjcRcsd1SoLwDAJWuCReT/Mb3MxotYgio8WLq+DEDd8YehC3zRk60++EIOsgdTv2BmJCx4f368Nap/lfUJ7KtZ+d8XK1Yp0ugefw8xvi63kcvd5B9yUw2pRY5Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196049; c=relaxed/simple;
	bh=tbMF/C9iX4T5eVWba47BrfnFko25wlOg82piSbLeNaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3extVeMlhiC7JLUGJ5BNlcxcOz/bsRvFubR4LwCCI/acoPSCwmNbeuWKF0+1bvi5QJyPomrLbD3IIsf4CKueY+P3yZBsxsPTjhqnWvEas7rQ39zi3gZkIBbNh2LswPqPlRkVT+D9qMducpa2wr3kJ2tX0Vpduoh1xmy5nt8syo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6EgeblM; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523de5611a3so2975881e0c.1;
        Wed, 09 Apr 2025 03:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744196047; x=1744800847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgIZoVKkgioMafx+bWpknazJMwDcHn7HAdB02qWhWbo=;
        b=U6EgeblMc/A5bWHWhwOsobkpeibS9uEp6RpaOeyf+4nOwXntDFOYwfR5LJKwogM5Sn
         4y/ERoBcq79QTafMLqm2mgEl/W5zo3JESjRrFOHbPf0JNDlFeUzJB5ZmsMmczwt2t5Zt
         aezTUsGRSwco8DPseSaonxchyM3fE+f/lS5VUR5YyUBqf3Vadyy+tBafp6qm2w0cSDwB
         A2nscjHnTcg4ROc2Rk+5HFpwK3LPwZXMmcZ/1xiWTF8pPOU38tAxUR63BFpoSch59C+h
         /RxD5E0WVV+U44ggN6s9EhM4wSKWiIU7ecM9YeY7QoYbUXHZDRxA2okgKhlD/4GuKMxn
         P60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196047; x=1744800847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgIZoVKkgioMafx+bWpknazJMwDcHn7HAdB02qWhWbo=;
        b=ZwccVvQQizBHNXlOs5rPDYpQ5YSLVbJnQUl/f9PNCb8iN0lO7vX1Q2ja7ru9N3VZIm
         LIQOo/FdlAVrC2XseSGEOvkhDTAjiW104p0Wxi5bIxz4rmvHwwIsFXxKcE/w3pNqUYG6
         ftN6doVQz56db3FiCek6yz4H9YXAYbUXKKb7uCisJkTVmxMMvfqSOU4M2OKoGVfsdZVC
         Wen4CXtK0gHJ4xDS5KD792Zmb5UVI6Q/nMKMwEl6CLJkchF8wBf8WbT8YhWgKVtRv4mB
         4QQCzylIfRL4V+5wb2okAoC3M+zT8H3SqVYNbrVwENJf/mcYcpj4LcED5X4Ky/KwMfkR
         E6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7b2d9GzYyteDIBJT9NYfWA0W43XeiKESxY+P9OS9N6fdwgMwM2yuTDK9Vnqh08aL9Ve+LuOsRk01HaAwA++qm9WU=@vger.kernel.org, AJvYcCUrY5Iwx4+Jc7IaL1UoyQrUi7gkXuROx5ToeXDo8nQE4h1eMb8YJ7qFY+OzU/JgMNLLRoZ8QYkwu1+UxOpu@vger.kernel.org, AJvYcCXsb7DhhTL41TjUB56ViCiE3+KEi5PfpEWwPdbDnHu6hzS817O935fHMdO4Xc1crVOwOqoBsPheFwx8@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTusoU6Nbhiue5dLXvgOyLeTOsBKxuk2aONYmRai10lPkD1+8
	wyhQxEPhKZC2hnzfDZVsp0z89Itfht48HQS6WBuRc/+rc4OTkL9fEP/nk9oub9pRhJSGflc620W
	sD+YmsZfs/cB8WOJpSuHHb80feVX3RpBO9KQ=
X-Gm-Gg: ASbGncuUJgmDUkpBfzBsrwKBlq/g2StI8hd8Z2T02sRszsYMfxycz8u0Ihoh+CXXdzr
	XijlHcx5MgHhKUNAF8maYTgudlaBlloeK4GbkHHhvAgl5KYzEs1eKTXJiAjHwONzQEIJIKpmim1
	aZYK/WIhXH4n8SwLWPK4doBSoRo2BlHTltbWNg31IT7DFyvnTjzkuDx9M=
X-Google-Smtp-Source: AGHT+IG7crk11/4VvyNYcFqhtUhfs+6UpTaoV15rvEpSl7rA5USiS8iy0l6f440IQVj+zgXTr44Tai3CmYR/w6AqpDc=
X-Received: by 2002:a05:6122:2023:b0:520:5a87:66fa with SMTP id
 71dfb90a1353d-527a9cf80f1mr1058327e0c.3.1744196046902; Wed, 09 Apr 2025
 03:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305002112.5289-1-fabrizio.castro.jz@renesas.com> <20250305002112.5289-7-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305002112.5289-7-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 9 Apr 2025 11:53:38 +0100
X-Gm-Features: ATxdqUFKIMEQwTyPYyiLYbKx2EqmtKkQ7AXS8LOIIFWZ7NU0GfAVFtJtbnAndu0
Message-ID: <CA+V-a8vj-Yu+nTEhN0d5ds0WSsQKH+Jh1L__iPqWNU28QXdSWg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] arm64: dts: renesas: r9a09g057: Add DMAC nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 12:24=E2=80=AFAM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> Add nodes for the DMAC IPs found on the Renesas RZ/V2H(P) SoC.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4->v5:
> * Collected tags.
> v3->v4:
> * No change.
> v2->v3:
> * No change.
> v1->v2:
> * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 165 +++++++++++++++++++++
>  1 file changed, 165 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g057.dtsi
> index 1c550b22b164..0a7d0c801e32 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -252,6 +252,171 @@ sys: system-controller@10430000 {
>                         status =3D "disabled";
>                 };
>
> +               dmac0: dma-controller@11400000 {
> +                       compatible =3D "renesas,r9a09g057-dmac";
> +                       reg =3D <0 0x11400000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 499 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 89  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 90  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 91  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 92  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 93  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 94  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 95  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 96  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 97  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 98  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 99  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "error",
> +                                         "ch0", "ch1", "ch2", "ch3",
> +                                         "ch4", "ch5", "ch6", "ch7",
> +                                         "ch8", "ch9", "ch10", "ch11",
> +                                         "ch12", "ch13", "ch14", "ch15";
> +                       clocks =3D <&cpg CPG_MOD 0x0>;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0x31>;
> +                       #dma-cells =3D <1>;
> +                       dma-channels =3D <16>;
> +                       renesas,icu =3D <&icu 4>;
> +               };
> +
> +               dmac1: dma-controller@14830000 {
> +                       compatible =3D "renesas,r9a09g057-dmac";
> +                       reg =3D <0 0x14830000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 25  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 26  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 27  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 28  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 29  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 30  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 31  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 32  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 33  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 34  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 35  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 36  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 37  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 38  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 39  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 40  IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "error",
> +                                         "ch0", "ch1", "ch2", "ch3",
> +                                         "ch4", "ch5", "ch6", "ch7",
> +                                         "ch8", "ch9", "ch10", "ch11",
> +                                         "ch12", "ch13", "ch14", "ch15";
> +                       clocks =3D <&cpg CPG_MOD 0x1>;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0x32>;
> +                       #dma-cells =3D <1>;
> +                       dma-channels =3D <16>;
> +                       renesas,icu =3D <&icu 0>;
> +               };
> +
> +               dmac2: dma-controller@14840000 {
> +                       compatible =3D "renesas,r9a09g057-dmac";
> +                       reg =3D <0 0x14840000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 41  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 42  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 43  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 44  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 45  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 46  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 47  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 48  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 49  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 50  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 51  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 52  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 53  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 54  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 55  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 56  IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "error",
> +                                         "ch0", "ch1", "ch2", "ch3",
> +                                         "ch4", "ch5", "ch6", "ch7",
> +                                         "ch8", "ch9", "ch10", "ch11",
> +                                         "ch12", "ch13", "ch14", "ch15";
> +                       clocks =3D <&cpg CPG_MOD 0x2>;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0x33>;
> +                       #dma-cells =3D <1>;
> +                       dma-channels =3D <16>;
> +                       renesas,icu =3D <&icu 1>;
> +               };
> +
> +               dmac3: dma-controller@12000000 {
> +                       compatible =3D "renesas,r9a09g057-dmac";
> +                       reg =3D <0 0x12000000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 57  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 58  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 59  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 60  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 61  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 62  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 63  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 64  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 65  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 66  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 67  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 68  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 69  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 70  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 71  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 72  IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "error",
> +                                         "ch0", "ch1", "ch2", "ch3",
> +                                         "ch4", "ch5", "ch6", "ch7",
> +                                         "ch8", "ch9", "ch10", "ch11",
> +                                         "ch12", "ch13", "ch14", "ch15";
> +                       clocks =3D <&cpg CPG_MOD 0x3>;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0x34>;
> +                       #dma-cells =3D <1>;
> +                       dma-channels =3D <16>;
> +                       renesas,icu =3D <&icu 2>;
> +               };
> +
> +               dmac4: dma-controller@12010000 {
> +                       compatible =3D "renesas,r9a09g057-dmac";
> +                       reg =3D <0 0x12010000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 498 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 73  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 74  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 75  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 76  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 77  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 78  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 79  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 80  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 81  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 82  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 83  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 84  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 85  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 86  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 87  IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 88  IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "error",
> +                                         "ch0", "ch1", "ch2", "ch3",
> +                                         "ch4", "ch5", "ch6", "ch7",
> +                                         "ch8", "ch9", "ch10", "ch11",
> +                                         "ch12", "ch13", "ch14", "ch15";
> +                       clocks =3D <&cpg CPG_MOD 0x4>;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg 0x35>;
> +                       #dma-cells =3D <1>;
> +                       dma-channels =3D <16>;
> +                       renesas,icu =3D <&icu 3>;
> +               };
> +
>                 ostm0: timer@11800000 {
>                         compatible =3D "renesas,r9a09g057-ostm", "renesas=
,ostm";
>                         reg =3D <0x0 0x11800000 0x0 0x1000>;
> --
> 2.34.1
>
>

