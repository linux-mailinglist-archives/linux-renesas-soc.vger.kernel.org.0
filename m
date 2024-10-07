Return-Path: <linux-renesas-soc+bounces-9543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D87993609
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19F5F286C06
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F1B1DDC25;
	Mon,  7 Oct 2024 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXtt3BPi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1951DC054;
	Mon,  7 Oct 2024 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325428; cv=none; b=rKrw0ANxgrhQ2II+E1EXDu3m6gb+HC/MYiPhjPcPSWILRqg9iZd9Ku9Cc9gNIuegRPGgIvkUz1qGGsQ7DZldPG2W7SodzIADobkUYEwEvhgs4mtyrTAvp2Bp2Z19LDtjRn6dhxENc1uMog3fubp1w1tMx9OL+C85m6MW8AXAOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325428; c=relaxed/simple;
	bh=WwQMUcdHoWTH/ijO01j5/q9zj8OszD+NJfbURvlH1wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGU8+bPEnXklgiUYCJ2JEix91vegNjIB2zYzFVpnLUZnlAhVQ0ZdySAJSAbelbJFjD8SnG3S6LSeI+7i2CkjjA2D7C322IUG5qRIaLmKBc8JeF600jC0/OYcB+L+zpSo8k1dsZZB1AXMRO6IOt0AvA/3ncawm6bAv0z0CSc4rGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXtt3BPi; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-50ca026e121so683386e0c.0;
        Mon, 07 Oct 2024 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728325426; x=1728930226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSW2m1XJVH5hv9Tkz73FJ1wykoGPT7bGrReEoZ+oVJc=;
        b=gXtt3BPiEO4ItCIzRjpFV5OQ1/j2pikGnB0wRGttp/Lv4eq3vO9btwkyV4rAFCOwBn
         BP52gFgpKbTj6IfPlXZI9MDe/uYOJKTrYiKo6ADvUAe9iKTCi+6amGTOaJzrOyCnnLal
         gyoSGNSa6DigqkGBN9aDiIQ+fq82aZAum+Rb2v7pMFkFztktRde6zWxWWN5NztGcZUvo
         THHRTzNsTeN8cC6wNQCR+koMRBjq6LQHxtZyqKpVtgS2dspvW/77nHFODU1tD/CwlEa6
         Fw91P3eU8FNZ+3bJYBpQx+mlJ9kD+GDtHbhUACvVknYiSo8d2ZPfb8gBepC+g7HTOMOx
         vIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325426; x=1728930226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSW2m1XJVH5hv9Tkz73FJ1wykoGPT7bGrReEoZ+oVJc=;
        b=JrVrkOfkjG5hJU0kp3Mv4Hf/DIdVgax5SYPJltK4C5sVnY63WYAVwp2m0wViDjwXyH
         jQ+zggroS7TjB22MDvx/MrzsPBOMOGm98lRQYkl30JtyE88Ha0n7yiEeW6D7fqdH1KT1
         B/c25ag8lXEMO7TttTvKUSPzut642nb0JzteOtbWvnSUnJcoTVSaoItnvDQESr5d38ZF
         XAR9eruh5sbBPFAtfPf8n61mZ7iYgjIzhBF3dncjzehCBhkndJ6fIAANU1vhDDukmPJx
         NwYR+DvIVFJJ8gSVtIjppsaDqEnFvE/693Ftqih+S77omwnREopSSMuenNRge+8Gjz8Y
         LxIA==
X-Forwarded-Encrypted: i=1; AJvYcCVxkpMJKJ7LtrN5znzswre5zbtAYapQUp73305WhGP/mfcNxN/ci4GtQK+6xtyznzg3RjWeMeYL+M0T@vger.kernel.org, AJvYcCWAHkbDNhHJokcqu5bnNye0Oabsmi3Cnr1vP/9drlDn4WDFx4Qi3Y/GznqCfJErjI0SolClNIDzBi5M5rb+56G1gGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNM1xwlQAcMM+RDhNZz0kLyGHwoTgp0JJoDUbF4OdXs+L44kbt
	/Oi8jb934okSs9ZL8gWGnJRt5oUIUDI4LKl63Ax1ZhQ7Z2M426/iQUwiZztrQjWxlO9uYOUPcKW
	eUot6mgcJUIk/xta8E5LoCFg88Ok=
X-Google-Smtp-Source: AGHT+IHgg9Yg3odU++gELShTrIhHkSLQdHFjn6sONXRENlDheWvw/lZayCuVMfDo/jRgGudz7R5vawnj8v7H3PAHNUs=
X-Received: by 2002:a05:6122:3126:b0:50c:79a4:c25 with SMTP id
 71dfb90a1353d-50c855635cemr7741054e0c.8.1728325425823; Mon, 07 Oct 2024
 11:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <b65bc4b90074f13f7b36e61a8ea47afa07eb1221.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <b65bc4b90074f13f7b36e61a8ea47afa07eb1221.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:23:20 +0100
Message-ID: <CA+V-a8t7AHKFDsZ8N3ScaWavKaXQsXxmHTdQs-UMMTL2oxVgOA@mail.gmail.com>
Subject: Re: [PATCH 16/20] arm64: dts: renesas: Use interrupts-extended for
 USB muxes
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
>  arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 3 +--
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts           | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/=
arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> index 9436b249ebdd9dcd..fd1dd2875644dd60 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -448,8 +448,7 @@ touchscreen@26 {
>         hd3ss3220@47 {
>                 compatible =3D "ti,hd3ss3220";
>                 reg =3D <0x47>;
> -               interrupt-parent =3D <&gpio6>;
> -               interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio6 4 IRQ_TYPE_LEVEL_LOW>;
>
>                 ports {
>                         #address-cells =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64=
/boot/dts/renesas/r8a774c0-cat874.dts
> index 486688b789b8cd58..94d85273064e9bc8 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -208,8 +208,7 @@ &i2c0 {
>         hd3ss3220@47 {
>                 compatible =3D "ti,hd3ss3220";
>                 reg =3D <0x47>;
> -               interrupt-parent =3D <&gpio6>;
> -               interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio6 3 IRQ_TYPE_LEVEL_LOW>;
>
>                 ports {
>                         #address-cells =3D <1>;
> --
> 2.34.1
>
>

