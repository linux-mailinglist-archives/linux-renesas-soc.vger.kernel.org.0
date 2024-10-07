Return-Path: <linux-renesas-soc+bounces-9541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3CC9935F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D25286B54
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66C21DDA31;
	Mon,  7 Oct 2024 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQJ1dTkZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2261DDA3B;
	Mon,  7 Oct 2024 18:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325349; cv=none; b=IymX4PAHEdxCgA4vg9OaPDS5H8IyDUqc40TFnkDfkbjJ0dFLHbQ8nGNN8AcFVbvnEdEqfJ/jh2wPbBXgKWrny/mHMlD85bhfjAkzl3y8m4QAGo+Nil9ravGNUqAZKGeRMhn7yzjmz857kI9g16eAiIP4UjyEttxL8ydj5/r4dIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325349; c=relaxed/simple;
	bh=Xgr6Ln9wgcNYVoUZjlkz8LbocFmvOx/QsmoKhnwNU54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsVHcnIniLoR+1nMlAYKwFMLJ7H/7L8HS1tvHKOJBcmSKpyP/nWD0aXsjW57MrIqtu+SHyiectPvi6nVtSJ4zy0b9SL5O0lvTTGf+D37YrOiX10tN4s9UponeHF1UVKYxg/x4NEk0hj+Io952WLwajtfJUg9KKkGEQwav/HKniU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQJ1dTkZ; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50c8330c69fso2046490e0c.0;
        Mon, 07 Oct 2024 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728325347; x=1728930147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc52AO0gCz5YK6jz7Zn7PYyqdfzBnxeCeGCoCpzO+14=;
        b=HQJ1dTkZG+VH8a0Ym+m8iCaw8T8R5P2gaFUo+L++voLtcMDkkcKxoYMUmGfkvaKVuQ
         BiZI2UV2H+yvuYC4XhTFcj96gQWDnqWgnP2+qLQVw260OJrkQWsR6JGYux+PwHNJ7IHf
         Gb1ayssnQXrN31hoIxFi8JEagq943VHwjrbGReDz21ITisQLrwGSvDtRiD34aTIsX1M5
         W4gEbBVUt73ucmJBxm0w10rDnTx7Tj/VgPVTlB3Qdj2yzrQgmpJV2ZLKkZHRgtYWdmzw
         fBUD5LGMncOs2ORNhahAeNt1SRupZqWd7WGRh4ukJ1+aRIgh7BYQ1hXogrIHaXjQIR3/
         WngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325347; x=1728930147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tc52AO0gCz5YK6jz7Zn7PYyqdfzBnxeCeGCoCpzO+14=;
        b=PJF6UHbEck4YMdNCuruQX3dW2s8lgxryJSS3AkVgBSlT3rWCVCKK9v4bUIbj0Ma7f6
         DQdqUI/lqzUj/wUBcA/Lq1AJ0SSYTNxaF1SdS2RQ58aVB2X1PZnI0I8Yah47uRANdvcy
         JY25prLKtoYDt6SF9RbXtzFw+Ds1KaojifS86xvIv1Gjd36NSqDwYIYnoBgm9B47G3n9
         20g+NQN6YDFUlmwMslJ0P9XNPB0jARWMFeVJp9j6du6U8xLHiqlwP9CZVVAWEJ/fNVyN
         h3iv/ZgKhQI5GFKLDdZRfRt0cw4jPvvi09NLXbywFpQaQjFnRMGhRTwGddLpA2OQKlWD
         MkmA==
X-Forwarded-Encrypted: i=1; AJvYcCW0xfXyNDzT7kCrlQBRwNC8Aq+HF1XOlFHwvPXyw42C+Y6hoHzKAEIw6ViNu5ekGXByrQnJRUDHBzcV@vger.kernel.org, AJvYcCXrzbVlXBHLupwmvJ/ybRMsX76Be31uJG5q6EFRDg7SrtxkymdDYVksDTYwq+m2RtxI8j4ZzfnhbkjtI4CH0AM/PNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB6ruMDWjM0e0lengcLsNDfwECcF+M7mnMT5UHxCE5V82XQVU5
	4ImSftLRIiXwxYiGUuGgRWISiSWQI0CeVXxzU0SN6Imx05MxfCXMobWlKdjF5EwzVkfxWe6htm+
	ojVxoDD6KCjagfdA7fMl/wFFnOzA=
X-Google-Smtp-Source: AGHT+IGSYeteVqWN4fYWwcHd3/tVtk6kbEusBH6CurXnYQTZ8aIczMJGvqbAdUAz8FmBK+u5FoTjgpA1z6wr+caYzBM=
X-Received: by 2002:a05:6122:2914:b0:50a:c52d:6ba6 with SMTP id
 71dfb90a1353d-50cd817eaabmr628658e0c.7.1728325347023; Mon, 07 Oct 2024
 11:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <8409a184db92b8d03d95beffde2cc9a9752366a9.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <8409a184db92b8d03d95beffde2cc9a9752366a9.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:22:00 +0100
Message-ID: <CA+V-a8tYDAwmP-7VE5FGatx1HC_1dBmXAnxDUMWBhz1iKkZnOA@mail.gmail.com>
Subject: Re: [PATCH 14/20] arm64: dts: renesas: Use interrupts-extended for
 I/O expanders
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
>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi  |  3 +--
>  arch/arm64/boot/dts/renesas/ebisu.dtsi               |  3 +--
>  .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts   |  3 +--
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi             | 12 ++++--------
>  .../boot/dts/renesas/white-hawk-cpu-common.dtsi      |  3 +--
>  5 files changed, 8 insertions(+), 16 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/a=
rm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index 5a15a956702a6be8..4a9d20249eaa9bc0 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -130,8 +130,7 @@ pca9654: gpio@20 {
>         pca9654_lte: gpio@21 {
>                 compatible =3D "onnn,pca9654";
>                 reg =3D <0x21>;
> -               interrupt-parent =3D <&gpio5>;
> -               interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio5 25 IRQ_TYPE_EDGE_FALLING>=
;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>                 gpio-controller;
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts=
/renesas/ebisu.dtsi
> index 4d16b8f0eae5474b..54ebffcd82d4337b 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -392,8 +392,7 @@ io_expander: gpio@20 {
>                 reg =3D <0x20>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <22 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio2 22 IRQ_TYPE_LEVEL_LOW>;
>         };
>
>         hdmi-encoder@39 {
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/=
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> index b1d035ca4d97a51a..58eabcc7e0e07f49 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -248,8 +248,7 @@ &i2c0 {
>         io_expander_a: gpio@20 {
>                 compatible =3D "onnn,pca9654";
>                 reg =3D <0x20>;
> -               interrupt-parent =3D <&gpio0>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio0 0 IRQ_TYPE_LEVEL_LOW>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 interrupt-controller;
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/d=
ts/renesas/ulcb-kf.dtsi
> index 5a5dd5ecb75e0e7c..f7330b2262b8af0c 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -235,8 +235,7 @@ gpio_exp_74: gpio@74 {
>                 #gpio-cells =3D <2>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
> -               interrupt-parent =3D <&gpio6>;
> -               interrupts =3D <8 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio6 8 IRQ_TYPE_EDGE_FALLING>;
>
>                 audio-out-off-hog {
>                         gpio-hog;
> @@ -296,8 +295,7 @@ gpio_exp_75: gpio@75 {
>                 #gpio-cells =3D <2>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
> -               interrupt-parent =3D <&gpio6>;
> -               interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio6 4 IRQ_TYPE_EDGE_FALLING>;
>         };
>  };
>
> @@ -317,8 +315,7 @@ gpio_exp_76: gpio@76 {
>                 #gpio-cells =3D <2>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
> -               interrupt-parent =3D <&gpio7>;
> -               interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio7 3 IRQ_TYPE_EDGE_FALLING>;
>         };
>
>         gpio_exp_77: gpio@77 {
> @@ -328,8 +325,7 @@ gpio_exp_77: gpio@77 {
>                 #gpio-cells =3D <2>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
> -               interrupt-parent =3D <&gpio5>;
> -               interrupts =3D <9 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio5 9 IRQ_TYPE_EDGE_FALLING>;
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arc=
h/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> index 209cba75adec6d6c..337ba68342c475b5 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -215,8 +215,7 @@ &i2c0 {
>         io_expander_a: gpio@20 {
>                 compatible =3D "onnn,pca9654";
>                 reg =3D <0x20>;
> -               interrupt-parent =3D <&gpio0>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio0 0 IRQ_TYPE_LEVEL_LOW>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 interrupt-controller;
> --
> 2.34.1
>
>

