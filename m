Return-Path: <linux-renesas-soc+bounces-9534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BE3993596
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7DB1B20A79
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2381DDA1B;
	Mon,  7 Oct 2024 18:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nmP45Lii"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C761D6DB9;
	Mon,  7 Oct 2024 18:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324063; cv=none; b=qJ1hjDU1Nuc+pRjHYrsf4nLEWY93bdiXmDaTjLx5eDbAJjpx8Uy2jcG0/gRmoFCexC9SoL3JBB3NyRNIiXOT7f8QHGKM7Z58M5ffGm11OWCLJSbMrbcWaxUDpRSf/qOh882DbBa9ptt5BDEFMWIgZLzPM4EUKjXWNyf3lXF0Dj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324063; c=relaxed/simple;
	bh=tLkiG/XBIym5GjYxkGW9oL9OcWwkmUXgOkUNLG18mgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/9rBFppU3a74pzXEQNKGEhY3hxnv+tgFbAm36BsckOZL+7Q7QL8OuHq6LjH500SK8lZmzMyue2OPotHtoqcMFuEBaIRitTwmWZiYSgYVZe5TH6YIuHs6FHCvnYD/ZTuT+MUo4KCMRnFu9/HYgObs3qeyf9JU6D7d3btkEVkFgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nmP45Lii; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-50ab703b9d6so1218354e0c.2;
        Mon, 07 Oct 2024 11:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728324061; x=1728928861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1mH+EY62gSsP1YwKGWFF+/b8DP8ywdtLBtB9Mop/ts=;
        b=nmP45LiiE+6pkYXd8WnfIjpzbH0fMn7V1/qZz+7lg/jVSZ2QsArcrJQNI1Zew8NZN8
         qpkINXTbZFs1fvl2QzZvnd69SgzG2EWTKuFz5xmUnSxSd93wgbny1ExaxSEybnRMoVv9
         Qz+kBFaCUsj8L9BLrRUtU2Z8zwRIiUKv7GbH5aOm2bFxSGrTRLN8Tqc7NMTrm9R1Dt93
         whJEROOvrMbll5heFzs6e6tqiEwAiXNihFhDnQTIj/y0NYlUfAX8Fd5VLpOll/nvflgW
         CNMwiTaMP8kdvB7Uz/k0IdEiRjQa08bWhO4jXFvHS1E0ugn0EMxNKeR/ONyu0iGTGn8L
         +ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324061; x=1728928861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1mH+EY62gSsP1YwKGWFF+/b8DP8ywdtLBtB9Mop/ts=;
        b=l1+MMpZOuAjyUBsav2a1SfJAFEv1lSsKLGPzmjIxR93LK2kyBjTKBjFzyOZJeGklU0
         r3W96FhhHlxcoo0ntTjBNBpNY2IF+ndsEgBnxFEtJ7/sZhUcxYcVApO88Soi45Vpxxfm
         hLbGg0Be2NHwE13l5vI0i6h856BvO76pJ0et/gs7s6PhmIjbe4znttviJfDw2rp6rZ7f
         7ZYFOai8eECehi+IKKFoE7ipSuL1FFk3gQwHy3i1MgaQQeG/zJ7lm5PP9CBCYMdkoOrQ
         /vdgwRaPKcMpGT1YymVI/ZWKDnkyR10akmsotOUJyggKeyoZLGaT30wEKIDQl91PebMN
         /zbw==
X-Forwarded-Encrypted: i=1; AJvYcCV7EPQDzhrbsRUtGLpj8Hx/Llb88pP+PHSL1/JGVjwPXuKic3Qd/aCrcHBBjLQ2TgFbhb77jnriwV6FCvihKDd8XqE=@vger.kernel.org, AJvYcCWau1i4ThLPWcbr6/QCoqWkw1Mm4DyXagYdMe8ry7aYfC7YQF1UJQq9O8VjJSLZrypMTT4+XKREt7Yk@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQn1hgAhC8sJmD3dB1RkhyAWh4v+hfQoEk5n2XBsd8ne3B6AK
	8b8rsKVPXiG5VZ8ZNN+1p/zUGz2MSCuLLpDmAguKEka++JXcwX0GuFxcuxOze36PeAc02/X2fmb
	KZtD6YZlf4Y9vfoyeHsPKTcLuV1A=
X-Google-Smtp-Source: AGHT+IF+16ULVkflIfqruC9tts8CC18jxN+29aNUkNTEIel7XkWQ78rLl09hY4bYHiqqtN+Ab9+Dzqw/28Hp0pJcLtI=
X-Received: by 2002:a05:6122:218e:b0:4ec:f7d0:e71c with SMTP id
 71dfb90a1353d-50c85479ccdmr8345595e0c.4.1728324061132; Mon, 07 Oct 2024
 11:01:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <c77ffcd01d6e9e90cd1e5578c2af98c9ec6030c9.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <c77ffcd01d6e9e90cd1e5578c2af98c9ec6030c9.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:00:34 +0100
Message-ID: <CA+V-a8v4MaMrmrd77+ynvPXxbbmwnLjpkGQWFjuLmT+oUYwmaw@mail.gmail.com>
Subject: Re: [PATCH 09/20] ARM: dts: renesas: kzm9g: Use interrupts-extended
 for I/O expander
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
> interrupt.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/d=
ts/renesas/sh73a0-kzm9g.dts
> index fe96ea07628779c6..ae7e68a44f493e1b 100644
> --- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> +++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
> @@ -308,8 +308,7 @@ &i2c3 {
>         pcf8575: gpio@20 {
>                 compatible =3D "nxp,pcf8575";
>                 reg =3D <0x20>;
> -               interrupt-parent =3D <&irqpin2>;
> -               interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&irqpin2 3 IRQ_TYPE_EDGE_FALLING=
>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 interrupt-controller;
> --
> 2.34.1
>
>

