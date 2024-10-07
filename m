Return-Path: <linux-renesas-soc+bounces-9529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D94BE993473
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 19:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68BEC1F246D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 17:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908FF1DCB00;
	Mon,  7 Oct 2024 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym2/dKnC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95751D9661;
	Mon,  7 Oct 2024 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728320931; cv=none; b=Vy/V35iw9OSuHptR8zE72wHf2jo9h1yCk0JhbgYbVC/TnvncMKmGUQi9nGDMubt7OcOYO9jnLqubrQ/Kqp/pQZTOi03uVWyEsEzTGIU3j5O9PQjc4TpPx1s/XcfNNwq6AqJBQEBGCc/ixr3CBF7CdY7ViD3NUQ0KtO2OrttcRR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728320931; c=relaxed/simple;
	bh=WPFB0BclOC8+PoWBq+niIaY/H18Tt//G3VWNYaahDAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNFTicOquMbyj0Dhvs5iSgrEugEs14tbOEf2LTB76U/w2nMJMIodpkuArw207q6DwZAO7od7YRhJzZVXTPFV3ZRqJRUNRHlVXpJ5Ws6jyNgtIrvyK0k2PYhFYS/rLMUmBWyRbQ2gSC0qUc56pjxPjrhfc5Bx+bk1D0ux/Q2TlJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym2/dKnC; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-84ea36b65cfso957245241.0;
        Mon, 07 Oct 2024 10:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728320929; x=1728925729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rwbps6RsUG2AAMnqoCxgAxF4PbCn55xedoPWXypL4bQ=;
        b=Ym2/dKnCx41dkFeye9d+z3VxQ9sYAA6m3vrcnq1Y/zeF3I4RfhYFspL9Wh1TFCHT8F
         ti+4np9D43R0Bd/ZUJfuEkzD4PHcPmvsTk1We4HjwJMgX3AlKAipaXrgix1DWbF4kYdi
         gdiKpCe1ajXQBNoCGQzhtPI/FGvRO+P3SuGVUZ9j3Y6GfZ70TM2dV5W9JJwPnfx/dKaH
         t8lmvGS6VsUiZB0U0TKKDfeGvUnAaNNpAuHWdJtIbg2sij47mcfM1ZT/cwobTAGJR74w
         43ckZkoJNXIsAlwzPI1UiKK7C158TYnf8TpBVDpw4OvRLJSozSJMpmKsYYtB8iP8jZhh
         vc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728320929; x=1728925729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rwbps6RsUG2AAMnqoCxgAxF4PbCn55xedoPWXypL4bQ=;
        b=iJG6HMWLydpJThyZjfSUIWpEzGhg1UcVMIrbMPN1467WgGucGDWQfeMAcDrmTJSVRE
         //YsmZThutuzqmjo3+HhCUBHS589i7ytqPmPCgznBusu30O2XM2J4WN1XeRpIYYec1Bw
         ID7k9VW6OoMH1FeH2B/o/9i8T6x2ESjg4AWWQwukcDms5o3BUfWo5kZ1t8dTOq5exU5F
         XAMH7Ff8/RMTbXb1KorJBaLuAB0VDstm2atdYrPeE7Q8qrKaZAWoTZIMbC5ENt2a8ANd
         uZL5wxZ1dDFeRlwrOxAKg0zm39mRbtYGS0rdqQQoJZWyluFxrI+xlZjVvZpdb41neduI
         Caew==
X-Forwarded-Encrypted: i=1; AJvYcCUMaK/BJudakCqWD6mMbl5mcjAGFuK2aycjtVu8dpunLQTkeKpZYo+IcoGIA90B1AGXeQx+IYKsqYvim2aUCrbDUSM=@vger.kernel.org, AJvYcCVnKpM2LvL/gFwqJuqyKLkd4i5A1sAflt6igzbiCl63D5YFj8FAnuWPAOgAOsI+oNO+H3is+IF15Omd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw08YdWXUwpIzBJwUQjrhfCTGeLqdhaO8bZWsLIgqgTwiR+HcQ
	KmWvTDoZNsK+OlPLJWynNwhFn2sdmvT99REQD07qmscqYwU8Bzi8sH6zkpMokL6u2twdGjU1qZj
	ynUdDRasxgICHRbj6SL2J806MmiAkt4RE
X-Google-Smtp-Source: AGHT+IFmVJstvr2S91RPGjOnI4XdwsSNv29uPUaqGyRWQGgIjCrgJSNs7CkcYL1dDuq9udWyFVEcrRUg5pswIBcgIi8=
X-Received: by 2002:a05:6122:2007:b0:50a:b728:5199 with SMTP id
 71dfb90a1353d-50c854bdfbemr6933669e0c.7.1728320928575; Mon, 07 Oct 2024
 10:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <934b9b9992dacd72dbad0f5433728aac292a3cfc.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <934b9b9992dacd72dbad0f5433728aac292a3cfc.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 18:08:22 +0100
Message-ID: <CA+V-a8u=qpR17Pyhw_Z=8zjjbia2fX7XBJSowp1NwMVkX9yjtA@mail.gmail.com>
Subject: Re: [PATCH 04/20] ARM: dts: renesas: Use interrupts-extended for PMICs
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
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 6 ++----
>  arch/arm/boot/dts/renesas/r8a7790-stout.dts   | 9 +++------
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 6 ++----
>  arch/arm/boot/dts/renesas/r8a7791-porter.dts  | 6 ++----
>  arch/arm/boot/dts/renesas/r8a7792-blanche.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts    | 6 ++----
>  arch/arm/boot/dts/renesas/r8a7794-alt.dts     | 3 +--
>  arch/arm/boot/dts/renesas/r8a7794-silk.dts    | 3 +--
>  8 files changed, 14 insertions(+), 28 deletions(-)
>

Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/=
dts/renesas/r8a7790-lager.dts
> index 5ef87f8088c4c81c..47ffa278a0dfd79e 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> @@ -443,8 +443,7 @@ i2cpwr: i2c-mux4 {
>                 pmic@58 {
>                         compatible =3D "dlg,da9063";
>                         reg =3D <0x58>;
> -                       interrupt-parent =3D <&irqc0>;
> -                       interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_=
LOW>;
>                         interrupt-controller;
>                         #interrupt-cells =3D <2>;
>
> @@ -460,8 +459,7 @@ watchdog {
>                 vdd_dvfs: regulator@68 {
>                         compatible =3D "dlg,da9210";
>                         reg =3D <0x68>;
> -                       interrupt-parent =3D <&irqc0>;
> -                       interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_=
LOW>;
>
>                         regulator-min-microvolt =3D <1000000>;
>                         regulator-max-microvolt =3D <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/=
dts/renesas/r8a7790-stout.dts
> index 9287724187ef3b69..d7c0a9574ce83144 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> @@ -342,8 +342,7 @@ &iic3 {
>         pmic@58 {
>                 compatible =3D "dlg,da9063";
>                 reg =3D <0x58>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> @@ -363,8 +362,7 @@ watchdog {
>         vdd_dvfs: regulator@68 {
>                 compatible =3D "dlg,da9210";
>                 reg =3D <0x68>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>
>                 regulator-min-microvolt =3D <1000000>;
>                 regulator-max-microvolt =3D <1000000>;
> @@ -375,8 +373,7 @@ vdd_dvfs: regulator@68 {
>         vdd: regulator@70 {
>                 compatible =3D "dlg,da9210";
>                 reg =3D <0x70>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>
>                 regulator-min-microvolt =3D <1000000>;
>                 regulator-max-microvolt =3D <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boo=
t/dts/renesas/r8a7791-koelsch.dts
> index bce93db4c9df5e18..1a0d2c6ed0e83ce7 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -814,8 +814,7 @@ &i2c6 {
>         pmic@58 {
>                 compatible =3D "dlg,da9063";
>                 reg =3D <0x58>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> @@ -831,8 +830,7 @@ watchdog {
>         vdd_dvfs: regulator@68 {
>                 compatible =3D "dlg,da9210";
>                 reg =3D <0x68>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>
>                 regulator-min-microvolt =3D <1000000>;
>                 regulator-max-microvolt =3D <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot=
/dts/renesas/r8a7791-porter.dts
> index 92b54e043795ba08..08381498350aacde 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> @@ -408,8 +408,7 @@ &i2c6 {
>         pmic@5a {
>                 compatible =3D "dlg,da9063l";
>                 reg =3D <0x5a>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> @@ -421,8 +420,7 @@ watchdog {
>         vdd_dvfs: regulator@68 {
>                 compatible =3D "dlg,da9210";
>                 reg =3D <0x68>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>
>                 regulator-min-microvolt =3D <1000000>;
>                 regulator-max-microvolt =3D <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts b/arch/arm/boo=
t/dts/renesas/r8a7792-blanche.dts
> index 69009535814406fe..a3986076d8e3e993 100644
> --- a/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7792-blanche.dts
> @@ -376,8 +376,7 @@ pmic@58 {
>                 reg =3D <0x58>;
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pmic_irq_pins>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc 2 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/d=
ts/renesas/r8a7793-gose.dts
> index 45ef1d1900245a11..5334af25c10111c8 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -754,8 +754,7 @@ &i2c6 {
>         pmic@58 {
>                 compatible =3D "dlg,da9063";
>                 reg =3D <0x58>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> @@ -771,8 +770,7 @@ watchdog {
>         vdd_dvfs: regulator@68 {
>                 compatible =3D "dlg,da9210";
>                 reg =3D <0x68>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 2 IRQ_TYPE_LEVEL_LOW>;
>
>                 regulator-min-microvolt =3D <1000000>;
>                 regulator-max-microvolt =3D <1000000>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dt=
s/renesas/r8a7794-alt.dts
> index 1e04b8630ef3f3ca..882644cd7c1875c1 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> @@ -449,8 +449,7 @@ &i2c7 {
>         pmic@58 {
>                 compatible =3D "dlg,da9063";
>                 reg =3D <0x58>;
> -               interrupt-parent =3D <&gpio3>;
> -               interrupts =3D <31 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio3 31 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/d=
ts/renesas/r8a7794-silk.dts
> index 5ed5b426f9639775..2a0819311a3c4ef3 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> @@ -434,8 +434,7 @@ &i2c7 {
>         pmic@58 {
>                 compatible =3D "dlg,da9063";
>                 reg =3D <0x58>;
> -               interrupt-parent =3D <&gpio3>;
> -               interrupts =3D <31 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio3 31 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>
> --
> 2.34.1
>
>

