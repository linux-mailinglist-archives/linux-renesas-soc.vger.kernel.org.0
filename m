Return-Path: <linux-renesas-soc+bounces-9530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74511993584
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 19:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38844283DA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 17:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6EB1DDA31;
	Mon,  7 Oct 2024 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZHUsGwE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2062AF00;
	Mon,  7 Oct 2024 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728323914; cv=none; b=uLdWVqjRAQnA5YtEtOLMX7mGki8UcvOKUrcfr8E45UuRVNSug1qO7p/wy3Csd8fxLJE+l+5UpjjrTmFBWo2W2kV17ruiuGDOhrVapQsc86eYiCvEefOjvr9hM3+Nkrpmj3mKBEwyf6UBN21sIBnSACcAape1gJNj9dvuN8QWs/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728323914; c=relaxed/simple;
	bh=ERxu+VxX+6Z76C026RpgOI1U8XpZcgZN77Ra8cE4e7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aQ75wz5nRnGHcalvz4Ce/9tu75g8j3rUlxFhvuororCNdsEyAEK4dF7vLPNiMnFyLvNETz1q3vwOtXXHMU6AasOjkpA0/C6WHCLydVZbqB2KnN7QssRrV5D7Qpv6C/ukXe9QZL8XGbs3hE/jnn59HmG8kP2swY4ACvh/XB6pe4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZHUsGwE; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50c937b92d9so736402e0c.2;
        Mon, 07 Oct 2024 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728323912; x=1728928712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkYAO/bR7aqVjFW3keZ9C4VQMFF792wa+QPxSTFBnp0=;
        b=bZHUsGwERNCaG266R5d7HEtfl9rvRcxSGxZNxDi9tD1aE2uQaOEcgtGUI8uOwPnBkk
         M3ppu3EitN6GEuwTXMrOOeJxH0YCj1lMRZZNRc0mBMiIjP4+QKA5id9fV0DGVZ7H0H7Q
         WH4Tkl8mingda2qNpfovOyEHEF42FUYmIzztAKt7pQrc/SplrgkdJffnBhggAqplNgQK
         sYtYqDqk6SbwJ2i15evbstMoeG63ZkGOWxLpV6YYEgU14JPO82z0tlAUbOt2C0in/4B+
         iyd1cZO3HzBrF7Ee0qE31Y0oX9dfq1mOdFSQxO35DXar7olw3VMVDCJETDPh/6xf10Zl
         Rccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728323912; x=1728928712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkYAO/bR7aqVjFW3keZ9C4VQMFF792wa+QPxSTFBnp0=;
        b=vWNa7/PrGejWuliOAdsxZj0T74NRt00ztt4cTZUWTyaWfjV3SFeIFzVtvhRvE4zvZl
         qBqhgqvqscMPndnvk2iaP00Eg/tN46C66kwiiu/Nai+/2nFcjQJ5S4UFh2yMwusLtpRY
         Q+jakFRAa0tEijOMtkHmicOTln4XYJeIsR5glmM1FQRP7YtqxFjVcTAYNgj9kpEEd0Gy
         ZfVfGc2kg4iSSXQU9ZrZ6B67Yvw5ArTl7f4iHInLKDkBXHZOmtI0wyhQMUKdQG9BqxrB
         lNkbtiMJMsQVvbLAct1NqklAWhix7simo+5sGaq/oBVAbQXIsfSmTSqvzCCwtUAw7/cZ
         t+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3iUI/QT87hdaYfoQsfc/pnMuhHaniQLU1kctHCd79E9p/FeBRZd6tD9mu8jrROgZC6lYRez5jBqUfFig/yRU2mzM=@vger.kernel.org, AJvYcCViejkaZdiU85v8zIdqLwDI/qSs+zwG1XVfWzYRmMcN9p6bm0oYtMvEOML+QV1OcAt0AR8qBgPOxu4+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy7fKBK33N9TiEJzXRpfmXwtIpQYCyE2lx4zZ+Q5+ufHktZIHb
	GocYnVV6Mr72yeB5yFEGOktGgC5qiiui8Py1QBSxKi7ynzvQGPnk6vq5xRbHvOzO0oDzGgGiw3I
	yDRJjEpvYGTONxTLAMWn6o5aA08U=
X-Google-Smtp-Source: AGHT+IGzfFwYiCRaSNxPLCI76kM5if7o6q/csb40g7PqFYC1U/DM2+GG9UY/x3F/CSxRtX4P7VD7OGVJyjVR04WOIPw=
X-Received: by 2002:a05:6122:91f:b0:50a:cc6f:2a32 with SMTP id
 71dfb90a1353d-50c85448828mr9539013e0c.3.1728323911772; Mon, 07 Oct 2024
 10:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <d081d986e3a2b695bc27dbe00aa0fb244a22ffdf.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <d081d986e3a2b695bc27dbe00aa0fb244a22ffdf.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 18:58:05 +0100
Message-ID: <CA+V-a8s3L5bufCMGajVgMKhL8aDSajGK6gSOJXmmCZT=09BWMg@mail.gmail.com>
Subject: Re: [PATCH 05/20] ARM: dts: renesas: Use interrupts-extended for touchpanels
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
>  arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi       | 3 +--
>  arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts       | 3 +--
>  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts            | 3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi b/arch/arm/b=
oot/dts/renesas/iwg20d-q7-common.dtsi
> index 4351c5a02fa596de..2cc2908b48ca1b9f 100644
> --- a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
> @@ -219,8 +219,7 @@ sgtl5000: codec@a {
>         touch: touchpanel@38 {
>                 compatible =3D "edt,edt-ft5406";
>                 reg =3D <0x38>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <12 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio2 12 IRQ_TYPE_EDGE_FALLING>=
;
>                 vcc-supply =3D <&vcc_3v3_tft1>;
>         };
>  };
> diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch=
/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
> index 9ec0f098bf6eb5d7..3d32cf068abc20f1 100644
> --- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
> @@ -238,8 +238,7 @@ eeprom@50 {
>         touchscreen@55 {
>                 compatible =3D "sitronix,st1232";
>                 reg =3D <0x55>;
> -               interrupt-parent =3D <&irqpin1>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqpin1 2 IRQ_TYPE_LEVEL_LOW>;
>                 pinctrl-0 =3D <&st1232_pins>;
>                 pinctrl-names =3D "default";
>                 gpios =3D <&pfc 166 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts b/arch/arm/b=
oot/dts/renesas/r8a7742-iwg21d-q7.dts
> index 64102b664055b475..6a8a0d2113b020c7 100644
> --- a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
> @@ -202,8 +202,7 @@ sgtl5000: codec@a {
>         touch: touchpanel@38 {
>                 compatible =3D "edt,edt-ft5406";
>                 reg =3D <0x38>;
> -               interrupt-parent =3D <&gpio0>;
> -               interrupts =3D <24 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio0 24 IRQ_TYPE_EDGE_FALLING>=
;
>                 /* GP1_29 is also shared with audio codec reset pin */
>                 reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
>                 vcc-supply =3D <&vcc_3v3_tft1>;
> diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/d=
ts/renesas/sh73a0-kzm9g.dts
> index 15d89c20618a16b7..fe96ea07628779c6 100644
> --- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> @@ -296,8 +296,7 @@ &i2c1 {
>         touchscreen@55 {
>                 compatible =3D "sitronix,st1232";
>                 reg =3D <0x55>;
> -               interrupt-parent =3D <&irqpin1>;
> -               interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqpin1 0 IRQ_TYPE_EDGE_FALLING=
>;
>         };
>  };
>
> --
> 2.34.1
>
>

