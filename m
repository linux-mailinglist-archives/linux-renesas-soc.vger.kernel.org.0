Return-Path: <linux-renesas-soc+bounces-9540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F229935F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8701286B2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068EB1DD53C;
	Mon,  7 Oct 2024 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLfVoCnX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E15F1369A8;
	Mon,  7 Oct 2024 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325280; cv=none; b=WZmR6SbWkb5jfMAyX5RL+0pzx9j/tmZ8B2RHpo84eiZOcvBIi1pgyt0OhUBBMqJRteH8TXVDz5Pp7wov2dSfhZXIMJpRU/JJrJsaETlQAgE22g6Vsp7KbxR9X2x1y+ccbN1FrqxNpWBSwI0j8mfKf51TiseiBJZ4NK6G8/6Z5QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325280; c=relaxed/simple;
	bh=1aHoOLF7K/c4cxBWxEZJoj9WWqYUgd0CIInHwSx5CS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3BoUOcZPpifsV/BNj/z7k85o3wT2fDJJdGL6mlwfuYLeR9oEuf49gIlc9a2xhEqjFCnA5nGVArmkYMKyKaJajYIdHcOzV0GZdCnmATdbjpCaQli5Wa5YnonVWz2/C37sZ7fziMNOO9z/X8v2D9xo96P2Qg1yhzNqUhCJTdwP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLfVoCnX; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50c582d8009so1322727e0c.0;
        Mon, 07 Oct 2024 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728325278; x=1728930078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5fHDQcIFWyYjoK42e2GqKx9JgP6ByqJ0aneTh9KwSI=;
        b=PLfVoCnXXeuX4zUCnI/I+TQyDe48eqIA2wCV+Qglw/PoLXOeo3ECeqfyqJjfI0DDTH
         Igbc5AaIFmZxpQTElfqPBJQ5osrYQP17bZPF1dqc5WgQhPk3w9NJrDP4BdQr+BqVuyWp
         OA8uAECan26ZM3yBMEmkAPxN3e7OdLl+glJUiR4dyFfsvbjrspcmL0/kK5YuXba7oxao
         FeJNoAJW1kWN8m+hZsE6p8MyVt+GQ7pjpWPR8nmkc4/mEk9isAKRx718LgG992TtXePr
         z4D0VVoI21N1baS29VPYv+18d7EuirQYGuA3bPbpqcwcj+/bN585bhTToopDBEO84oAV
         HmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325278; x=1728930078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5fHDQcIFWyYjoK42e2GqKx9JgP6ByqJ0aneTh9KwSI=;
        b=WY4N26cFu3zLLJPdnBLcy1t7MT9loQTCA5zCf1xwoCwE6LkD2UBypKbWvYeWs6TjXd
         rxE2aDemj2qzDMfKBl6y6a29SRz/L69HdwG+qSRc8GK3t3a3zWOmLWVdmTRugQJ42JJM
         Boy1UVKvgOZH2dUINVr4M/g/SoQ1E9MaVmT/D12hbsVr5xQce2kl+7LxuVmxd0iPfbsM
         KhxZWQo30DDX2ys7IWlmSsl7OLXQ6OIXKcyYFDfe042AgLcJBEYDluLY+0BvcYczl65F
         qAlIGHl+Eg/sZ+lVPrzkUTLjGlfa0nmNjXTdWIWby6Ffmz2ZbZQ9w1IIDIkCEne3rJbX
         f9gA==
X-Forwarded-Encrypted: i=1; AJvYcCWv1SchZ3tZ74AQxW/DXMGSJsNTiFdH23/nDenvJdeqVFTAfHAt9ohj40yOwkRbeAvFTATFKBGfebPx@vger.kernel.org, AJvYcCWwN2dd8yU/TLOVww+F2ww2/jvKhMOcs6yyBXpYI39nPfFvteBw2tbPXG96oauJmCAiJqzLoCd7Te/NnRsHKcFMBSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVENOqgf5sXh9BXMrSLJCCe6239/6r/ZD8Zxn2O1+vhjNRGUTi
	wDePa/GEmTTtDDSI8+yoAV6ESNICkl4Ugm0Q3xW4oNThyA/41Km6KBx/R7B0fItXqF0s0k2Hu29
	0oOFWxL+UVSDfEoyNBMM3uMAYdv8=
X-Google-Smtp-Source: AGHT+IGBNA8KljjPEkPIe4fbzSG6yIe8+fSzcGmwMgTK+eL1CIIncYR03zfkRLtEkQuMtXNCFaKYcR9H9l2Q4Bc92+E=
X-Received: by 2002:a05:6122:218e:b0:4ec:f7d0:e71c with SMTP id
 71dfb90a1353d-50c85479ccdmr8429017e0c.4.1728325278153; Mon, 07 Oct 2024
 11:21:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <7aabc9085f9206a9824d52f306df870e7f3eed3c.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <7aabc9085f9206a9824d52f306df870e7f3eed3c.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:20:52 +0100
Message-ID: <CA+V-a8sfnwqE0gTyWXqK3XCoTDh_BzgZ8T-SzuHYyRiLuX6+aQ@mail.gmail.com>
Subject: Re: [PATCH 13/20] arm64: dts: renesas: Use interrupts-extended for
 HDMI bridges
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:27=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/condor-common.dtsi  | 3 +--
>  arch/arm64/boot/dts/renesas/draak.dtsi          | 3 +--
>  arch/arm64/boot/dts/renesas/ebisu.dtsi          | 3 +--
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts  | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts  | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  | 3 +--
>  arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi    | 3 +--
>  arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi   | 3 +--
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi        | 3 +--
>  10 files changed, 10 insertions(+), 20 deletions(-)
>

Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On G2L

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/=
boot/dts/renesas/condor-common.dtsi
> index b2d99dfaa0cdf19d..375a56b20f267bf0 100644
> --- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
> @@ -195,8 +195,7 @@ io_expander1: gpio@21 {
>         hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>                 avdd-supply =3D <&d1_8v>;
>                 dvdd-supply =3D <&d1_8v>;
>                 pvdd-supply =3D <&d1_8v>;
> diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts=
/renesas/draak.dtsi
> index 402112a37d75a8c5..05712cd96d28bbdf 100644
> --- a/arch/arm64/boot/dts/renesas/draak.dtsi
> +++ b/arch/arm64/boot/dts/renesas/draak.dtsi
> @@ -367,8 +367,7 @@ hdmi-encoder@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>, <0x3f>, <0x3c>, <0x38>;
>                 reg-names =3D "main", "edid", "cec", "packet";
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <28 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 28 IRQ_TYPE_LEVEL_LOW>;
>
>                 avdd-supply =3D <&reg_1p8v>;
>                 dvdd-supply =3D <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts=
/renesas/ebisu.dtsi
> index 1aedd093fb41bf44..4d16b8f0eae5474b 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -399,8 +399,7 @@ io_expander: gpio@20 {
>         hdmi-encoder@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <1 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 1 IRQ_TYPE_LEVEL_LOW>;
>
>                 avdd-supply =3D <&reg_1p8v>;
>                 dvdd-supply =3D <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64=
/boot/dts/renesas/r8a774c0-cat874.dts
> index d42e24d9c09b9162..486688b789b8cd58 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -232,8 +232,7 @@ hd3ss3220_out_ep: endpoint {
>         tda19988: tda19988@70 {
>                 compatible =3D "nxp,tda998x";
>                 reg =3D <0x70>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <1 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 1 IRQ_TYPE_LEVEL_LOW>;
>
>                 video-ports =3D <0x234501>;
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/=
boot/dts/renesas/r8a77970-eagle.dts
> index 7dd9e13cf0074442..32f07aa2731678a5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -171,8 +171,7 @@ io_expander: gpio@20 {
>         hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>
>                 avdd-supply =3D <&d1p8>;
>                 dvdd-supply =3D <&d1p8>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/=
boot/dts/renesas/r8a77970-v3msk.dts
> index 0a103f93b14d71ad..118e77f4477e389c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> @@ -148,8 +148,7 @@ hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 #sound-dai-cells =3D <0>;
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>                 avdd-supply =3D <&vcc_d1_8v>;
>                 dvdd-supply =3D <&vcc_d1_8v>;
>                 pvdd-supply =3D <&vcc_d1_8v>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/=
boot/dts/renesas/r8a77980-v3hsk.dts
> index a8a20c748ffcd1ed..b409a8d1737e629c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> @@ -140,8 +140,7 @@ hdmi@39 {
>                 compatible =3D "adi,adv7511w";
>                 #sound-dai-cells =3D <0>;
>                 reg =3D <0x39>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
>                 avdd-supply =3D <&vcc1v8_d4>;
>                 dvdd-supply =3D <&vcc1v8_d4>;
>                 pvdd-supply =3D <&vcc1v8_d4>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/bo=
ot/dts/renesas/rzg2l-smarc.dtsi
> index ee3d96fdb6168b56..789f7b0b5ebcadc7 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -64,8 +64,7 @@ adv7535: hdmi@3d {
>                 compatible =3D "adi,adv7535";
>                 reg =3D <0x3d>;
>
> -               interrupt-parent =3D <&pinctrl>;
> -               interrupts =3D <RZG2L_GPIO(2, 1) IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&pinctrl RZG2L_GPIO(2, 1) IRQ_TY=
PE_EDGE_FALLING>;
>                 clocks =3D <&osc1>;
>                 clock-names =3D "cec";
>                 avdd-supply =3D <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/b=
oot/dts/renesas/rzg2lc-smarc.dtsi
> index 377849cbb462eae9..345b779e4f6015da 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -86,8 +86,7 @@ adv7535: hdmi@3d {
>                 compatible =3D "adi,adv7535";
>                 reg =3D <0x3d>;
>
> -               interrupt-parent =3D <&pinctrl>;
> -               interrupts =3D <RZG2L_GPIO(43, 1) IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&pinctrl RZG2L_GPIO(43, 1) IRQ_T=
YPE_EDGE_FALLING>;
>                 clocks =3D <&osc1>;
>                 clock-names =3D "cec";
>                 avdd-supply =3D <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/d=
ts/renesas/ulcb-kf.dtsi
> index 431b37bf566192d2..5a5dd5ecb75e0e7c 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -150,8 +150,7 @@ hdmi@3d {
>                                 pinctrl-0 =3D <&hdmi1_pins>;
>                                 pinctrl-names =3D "default";
>
> -                               interrupt-parent =3D <&gpio2>;
> -                               interrupts =3D <14 IRQ_TYPE_LEVEL_LOW>;
> +                               interrupts-extended =3D <&gpio2 14 IRQ_TY=
PE_LEVEL_LOW>;
>
>                                 clocks =3D <&cs2000>;
>                                 clock-names =3D "cec";
> --
> 2.34.1
>
>

