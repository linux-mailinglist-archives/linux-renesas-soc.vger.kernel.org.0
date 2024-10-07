Return-Path: <linux-renesas-soc+bounces-9546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B299364E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CD7C1F2427A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FD51D968B;
	Mon,  7 Oct 2024 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0Fz3IeH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9503A1D319B;
	Mon,  7 Oct 2024 18:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326212; cv=none; b=KnnrfwuvkuIY9XGWwP05lDTUrByoNH2rTInlmUG1SUs45m6e4hOG+UFEIqGtrVJEgW8YM0tx5wsxbfI1XA82RMQGkFPfAsBwUAayMUelQYrbbBO3fHVES9DPJP/C7mt6iGpSpA8IT5Pcn0sxLJj8TVAWAToMR+0a8oEGXTZWwYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326212; c=relaxed/simple;
	bh=grfix0G16VcxvEWN21ClRmglaWo6uk6eIi2CicZXaUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=if34Nd1zRMyiI+Yr5WqF7I/FevCenK08Wx27UT7igedZD6m2K1wzxJiZh97AaghKPGRtz7l6l1whM3cKNA1o0mIV20SGZY8YY96wz0AgKCOezqJQyt8EMwJX+FAS7kl9dPszGzoXGUVD0a1GEKkMz3+CLlnaXgwBuSMX54g5ujg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0Fz3IeH; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-50c937b92d9so750116e0c.2;
        Mon, 07 Oct 2024 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326209; x=1728931009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsWE8qPOxtvjXJAbe2FHKw7ZxanJQmcIROYk7uNf2ok=;
        b=A0Fz3IeHbUmyClgNEqBpt7HZLMa2BT3kXISv/RhYABD09cB+SRawAuklMoYmmYrmgx
         y61+WebMYFlhZRk5eePzReN51T0R3aYdAQLex67qWFs+obCXeqw838lRmnugFs4YG1ZZ
         9P2TVK3a3IkUPEbXIqTLVZ6QpB6FLpxB4eaaTck5IlFsk+A54fyNkfk2AXUI9i4rSerD
         OgDdcf0eGqd2QmYs+O2TwL3M4vxHk8bXexqe5Aa+aMO7zqNsWd0F3FokpQn+nF8+oLGs
         J50R/JfBoS+eO2mFXn/794j5bK9fouEDDlIopFxJyguEfQ8e4fPwGDLh+fMGa3oeJmzv
         Y7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326209; x=1728931009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsWE8qPOxtvjXJAbe2FHKw7ZxanJQmcIROYk7uNf2ok=;
        b=L5cJj+D/eHXwIxCHdPsz/boJKXhc1XocxyibtwWiJJRRzVctykF8WF+S1BFZpybRgw
         CLoY8eTHy7FdeQ1zbkcrpg3qPCC7o+OYM5mrBqF6bg9G08Z32VIFQhh/rqHVEpCBxlft
         yQmSPUF74a4iJAHdKzZD0xYERS5qGSSTsAEHWGM+WkAHJOUlOLy9VIR1vgs8o9tGYh+p
         z9+XQZBWnMMVvJ7UOGvY+PguLZG50PzQogy4Op/kRvpnyCrcygCyNRxSOj3ZXFLlctAV
         8cOr5g2wtOVXxETW53NTQ5nGF3+ZOeSJm9YmwdtuwzUiXzpZuUCJ56c+cGwYjUYalP8d
         9Icg==
X-Forwarded-Encrypted: i=1; AJvYcCVZbHKf17HS3U+Yr0m+Pxs041MbkdoSUF7VZPa1AOxlbpadVd5cCvzUptod4xa8WqyDf1QST4SaeZzr@vger.kernel.org, AJvYcCVaYVF7iZQaHVYn7xIpTUkj1oA52YoZ9HzLOOp+FpIBXjV0rTLLd9hIlk2bG9pTgstNtMqj4hTxCw99TAvU5r6HE/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YylxlatYTPoMTZL7Dbs+b4tDsLGMo0/VgZvHIfEgoymYtUe7CRW
	fRrsqd8WyVHeov8qn8D350Zta0Z/ATQfO/FtaJZjDuhqQh/30sTak1n95JbgL5eOAPPzH8+PU1/
	WhhDZCJWMc+hpLXK/Id06DeGQPRg=
X-Google-Smtp-Source: AGHT+IHfaKPLsbvok+nyumU7pdeQcTpkSmBh7LuaUbZxF/QfyG482O6sqScTFFHDZOiWTlTAUgV+4RpHiybuL/U8EIg=
X-Received: by 2002:a05:6122:1688:b0:50a:b604:2b9e with SMTP id
 71dfb90a1353d-50c854b95fdmr9904535e0c.7.1728326209436; Mon, 07 Oct 2024
 11:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <0866811fd11b683cacfd5dc3ea75d4c0ca161acb.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <0866811fd11b683cacfd5dc3ea75d4c0ca161acb.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:36:23 +0100
Message-ID: <CA+V-a8t43sCmrNahPNtJuTq8ckHB7PkHXHDERLT_4yUr+PQ6Cw@mail.gmail.com>
Subject: Re: [PATCH 18/20] arm64: dts: renesas: Use interrupts-extended for WLAN
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
>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 3 +--
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 3 +--
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts     | 3 +--
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi            | 3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On G2M

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/a=
rm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index 4a9d20249eaa9bc0..b543739390a5d94c 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -300,8 +300,7 @@ &sdhi2 {
>         brcmf: bcrmf@1 {
>                 reg =3D <1>;
>                 compatible =3D "brcm,bcm4329-fmac";
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 27 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-names =3D "host-wake";
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/=
boot/dts/renesas/hihope-common.dtsi
> index 83104af2813eb4a0..2aa9f528ace16e7b 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -325,8 +325,7 @@ &sdhi2 {
>         wlcore: wlcore@2 {
>                 compatible =3D "ti,wl1837";
>                 reg =3D <2>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts-extended =3D <&gpio2 5 IRQ_TYPE_LEVEL_HIGH>;
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64=
/boot/dts/renesas/r8a774c0-cat874.dts
> index 94d85273064e9bc8..c861f75b1f1b70cd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -411,8 +411,7 @@ &sdhi3 {
>         wlcore: wlcore@2 {
>                 compatible =3D "ti,wl1837";
>                 reg =3D <2>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts-extended =3D <&gpio1 0 IRQ_TYPE_LEVEL_HIGH>;
>         };
>  };
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/d=
ts/renesas/ulcb-kf.dtsi
> index f7330b2262b8af0c..5c211ed83049d5a4 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -444,8 +444,7 @@ &sdhi3 {
>         wlcore: wlcore@2 {
>                 compatible =3D "ti,wl1837";
>                 reg =3D <2>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&gpio1 25 IRQ_TYPE_EDGE_FALLING>=
;
>         };
>  };
>
> --
> 2.34.1
>
>

