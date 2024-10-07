Return-Path: <linux-renesas-soc+bounces-9527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9A799345D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 19:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9001F23283
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 17:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411A31DC1A3;
	Mon,  7 Oct 2024 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqYMDWhv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBFB1DC06F;
	Mon,  7 Oct 2024 17:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728320677; cv=none; b=Vl32drfJPtQOgY1G/rvOSSdhyGsXsRD3tC7dhnh1UE+gCJ7EdUhsQp1DLVhQIRZ91c2FruuxNz1ZXx1WoUEqRbT36AowICcUhqTQp0I6ub7i4QVxMQGVY/qjZBAFpJpl20AQBj0F6tNBPRSJqJpojChWPEEhIK0GyV8RMWP5r0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728320677; c=relaxed/simple;
	bh=51amlNfAGpYVr9whksCim3lVlU32zxN1bBQg8GfDd2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZW8BHIUGsk4RkhEJqyksMCmrFqCkzEDSjSA578wsHOajnXOwNe6QdqXCfQy8Y1sP7sBfhGyBcRufZb51KHJ0UNPscTWxO/AobzKyqA+ltgnEbY2rkrZiJ0qzvaCuWPGhNk+onU0//1xBBK5qNMDaRZAdjpBJaOTDvWNSh6fqKQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqYMDWhv; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5e7e1320cabso687309eaf.0;
        Mon, 07 Oct 2024 10:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728320674; x=1728925474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVXZbR4GExMRbnYzj3XBlAl3/hiGcf+yZPvZ4EfR9tU=;
        b=DqYMDWhvsnj4GhlM9XPBRbojeBX4pHNCn7PtFOh0xXf5By0J5I8HeDkkJhioDnsLkT
         5p66zJjpXB64fgA84Sk8M7SV/A6JNvwoWLniiAc3OTNn2EaxbRfRKEcF7vZCWVSp7bU1
         zSlP0/B7z7CtHGvfXxn3szhZUBKPvQ5fg9+2yBRQr4EuM9CoitobagOrrzgHmsjDvw3y
         oOQm39lbHQmH8tEDdgV3UbsMFbPLyidSVT0/BqD8wyp6TfjZmiy2BMFxNZMHwotdbPYw
         3AmetZIPdi9bSWMnH0Pc696Bf3jeNxnqlGx0tfAeVlvdkIR2KONJLm5N0fYFrnNTkHfN
         4/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728320674; x=1728925474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVXZbR4GExMRbnYzj3XBlAl3/hiGcf+yZPvZ4EfR9tU=;
        b=E17WmS7402I/B3Q5tfryGRt4/OzeN5IM/z43eUQTL9k7/nKYpSXaNPquy/49DdCpod
         yfsvTifxh3PCUuTBh/ZvyWwph2vsmP9YJ4F1Cfk0FN8n6w/Jxgm34SocX7v4X4U1L9uI
         k7n4CnCUQ3jNK4NJUnCHV58q2j81JN9jC2OxFzBmUFrq88eEeUcoj2kTmC/nR7iMqZ+m
         jP1L1x52FfDC4ENhk4WC7Al5z62UXjgWrudJGZ2t5sZdtoOvEaGGAeQgIJ0UOUidRPas
         nx4YaSBjjRydkVUbwU5bSExj7+jquv2tkwM3WupWvY5AlKJqL3NR4aQhuTehayiObZVi
         FR9g==
X-Forwarded-Encrypted: i=1; AJvYcCUPjNYULXEXP4pK+hvO5Tdk6brXusqn+I1la9Imf1/zQJ73vmvz9kOeadY79GOdws5ppw33PVkfUBrh@vger.kernel.org, AJvYcCWhKN8i8AYKrm4HrEe4TTzswwfuIqTiwM3ht59XimrvG0+GHTZkhoHjdJkid472/gkzoFE4neXlB8LSWwJrBJo0BLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0k291qYwFFHIHPuwqVgnWah5y+m9a40a6UTldqUXfKPRqug5J
	hhhz9MrTCSm+lkrRx1ABvpn2Gj32dpjhbHM9FvovSuZdkm5ANZ8QdrSyT1zTARMiq0vApfUGt1s
	ZlUrl+YF+pU+oIICYJQcDDjyjKKk=
X-Google-Smtp-Source: AGHT+IFWCVYciJIxj0K8ax/3IKkKPeVhnxietbg3qqRucAPY2olSeVDHVIWiov5upVAGs0p4xmiXkmnWQ/EIDS0FmnA=
X-Received: by 2002:a05:6358:9107:b0:1b6:d3:a633 with SMTP id
 e5c5f4694b2df-1c2b84d1432mr187763355d.25.1728320674267; Mon, 07 Oct 2024
 10:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <850317c7818b100f9afe026e80b6d685affe81a0.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <850317c7818b100f9afe026e80b6d685affe81a0.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 18:04:08 +0100
Message-ID: <CA+V-a8s8T4sTXNRr5N3fVZz9BY=q66FB-D+7iDE781yCKWcrdg@mail.gmail.com>
Subject: Re: [PATCH 03/20] ARM: dts: renesas: Use interrupts-extended for HDMI bridges
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
>  arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi            | 3 +--
>  arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts           | 3 +--
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts                 | 3 +--
>  arch/arm/boot/dts/renesas/r8a7790-stout.dts                 | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts               | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-porter.dts                | 3 +--
>  arch/arm/boot/dts/renesas/r8a7792-blanche.dts               | 3 +--
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts                  | 3 +--
>  arch/arm/boot/dts/renesas/r8a7794-silk.dts                  | 3 +--
>  10 files changed, 10 insertions(+), 20 deletions(-)
>

Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi b/arch/arm/=
boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
> index de52218ceaa4c0e0..ca58ea93f58fbbb1 100644
> --- a/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
> +++ b/arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi
> @@ -73,8 +73,7 @@ &i2c5 {
>         hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio0>;
> -               interrupts =3D <13 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio0 13 IRQ_TYPE_LEVEL_LOW>;
>                 clocks =3D <&cec_clock>;
>                 clock-names =3D "cec";
>
> diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts =
b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> index a0b574398055ad2d..5903c1f1356f26c6 100644
> --- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> @@ -84,8 +84,7 @@ &i2c1 {
>         hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 0 IRQ_TYPE_LEVEL_LOW>;
>                 clocks =3D <&cec_clock>;
>                 clock-names =3D "cec";
>                 pd-gpios =3D <&gpio2 24 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts b/arch/arm=
/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> index 7c7a9f257567d4f8..e511eb425bc550e9 100644
> --- a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> @@ -150,8 +150,7 @@ &i2c4 {
>         hdmi@39 {
>                 compatible =3D "sil,sii9022";
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio2 29 IRQ_TYPE_LEVEL_LOW>;
>
>                 ports {
>                         #address-cells =3D <1>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/=
dts/renesas/r8a7790-lager.dts
> index 97c13b31f476505c..5ef87f8088c4c81c 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> @@ -365,8 +365,7 @@ adv7180: endpoint {
>                 hdmi@39 {
>                         compatible =3D "adi,adv7511w";
>                         reg =3D <0x39>;
> -                       interrupt-parent =3D <&gpio1>;
> -                       interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio1 15 IRQ_TYPE_LEVEL=
_LOW>;
>                         clocks =3D <&cec_clock>;
>                         clock-names =3D "cec";
>
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/=
dts/renesas/r8a7790-stout.dts
> index 1593609064104ae4..9287724187ef3b69 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> @@ -299,8 +299,7 @@ &iic2       {
>         hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 15 IRQ_TYPE_LEVEL_LOW>;
>                 clocks =3D <&osc4_clk>;
>                 clock-names =3D "cec";
>
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boo=
t/dts/renesas/r8a7791-koelsch.dts
> index 758d8331e7af66c4..bce93db4c9df5e18 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -397,8 +397,7 @@ adv7180: endpoint {
>                 hdmi@39 {
>                         compatible =3D "adi,adv7511w";
>                         reg =3D <0x39>;
> -                       interrupt-parent =3D <&gpio3>;
> -                       interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio3 29 IRQ_TYPE_LEVEL=
_LOW>;
>                         clocks =3D <&cec_clock>;
>                         clock-names =3D "cec";
>
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot=
/dts/renesas/r8a7791-porter.dts
> index 267b3623655fbc38..92b54e043795ba08 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> @@ -194,8 +194,7 @@ adv7180: endpoint {
>                 hdmi@39 {
>                         compatible =3D "adi,adv7511w";
>                         reg =3D <0x39>;
> -                       interrupt-parent =3D <&gpio3>;
> -                       interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio3 29 IRQ_TYPE_LEVEL=
_LOW>;
>
>                         avdd-supply =3D <&reg_1p8v>;
>                         dvdd-supply =3D <&reg_1p8v>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boo=
t/dts/renesas/r8a7792-blanche.dts
> index 7eefa227d65514a9..69009535814406fe 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> @@ -335,8 +335,7 @@ &i2c1 {
>         hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqc 3 IRQ_TYPE_EDGE_FALLING>;
>
>                 avdd-supply =3D <&d1_8v>;
>                 dvdd-supply =3D <&d1_8v>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/d=
ts/renesas/r8a7793-gose.dts
> index f3f62206088348c6..45ef1d1900245a11 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -383,8 +383,7 @@ adv7180_out: endpoint {
>                 hdmi@39 {
>                         compatible =3D "adi,adv7511w";
>                         reg =3D <0x39>;
> -                       interrupt-parent =3D <&gpio3>;
> -                       interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio3 29 IRQ_TYPE_LEVEL=
_LOW>;
>
>                         avdd-supply =3D <&reg_1p8v>;
>                         dvdd-supply =3D <&reg_1p8v>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/d=
ts/renesas/r8a7794-silk.dts
> index 8857bb4a9b91d969..5ed5b426f9639775 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> @@ -262,8 +262,7 @@ adv7180: endpoint {
>                 hdmi@39 {
>                         compatible =3D "adi,adv7511w";
>                         reg =3D <0x39>;
> -                       interrupt-parent =3D <&gpio5>;
> -                       interrupts =3D <23 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio5 23 IRQ_TYPE_LEVEL=
_LOW>;
>
>                         avdd-supply =3D <&d1_8v>;
>                         dvdd-supply =3D <&d1_8v>;
> --
> 2.34.1
>
>

