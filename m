Return-Path: <linux-renesas-soc+bounces-9526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C27993455
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 19:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34C711F23147
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 17:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA95C1DC056;
	Mon,  7 Oct 2024 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfCIq3uL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45A81DB373;
	Mon,  7 Oct 2024 17:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728320588; cv=none; b=pmNap7GwgnagUHD6yBP3hPAg5jEdEF27M/Ej2D2GsyH2KMOnOvgV3AJ+zcq92tPZwVTux6H0VNGrZwhsZqLP9yEclD8ER6IDh0nkaTZg2+pjtNKWzWETYHdI17nQthRQSPkzFp5+zXgc8mGp3qnRxNO+BH4XuVDNoRUssP1iuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728320588; c=relaxed/simple;
	bh=YIuKBmX+P1bUPr7/pJZBFfD+AYclF9/9ihOB8g9ll50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6oXGjFQUXeKYzLWwsrI4YXeYIOl61YVmrQnjkoAENbXtorIMMggpGmFjd3gbYs0Q7FJbGrSNs7IpKH5moZzFZbbMUWav23e8W008gQIwc+6uCaMVcUh7mt3a/lV5mwmoVE2CPkVfnIRWnaTMB/ZVJgH4g3L5e0ASsbx0i9Spic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfCIq3uL; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4a3a5cc3903so1261188137.1;
        Mon, 07 Oct 2024 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728320584; x=1728925384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzAQI2zuRwrHex7SW8vJ3CkxHhhV6R3iS3DZpL+am0A=;
        b=AfCIq3uLO3E9SMFcdh9+SFRrx07fAIJ66R8pxnGFpVBr/65O0yzJdfbPEXU7xxzEpY
         3JZeiNH85URymp4a0z/AGwQsEFMyp5scVyGdpLR1qYgCbrmBgan4QC7EV/ZIBaU/4Y1C
         XdMutNpU3iJCKNkE6y9QUCk813471ivLcMI4tTop42eX9EzsyFDOpxY/x9niaNvGO6hP
         ghwer5uM35nSJcHsBG89ecr4LQVh3Pm6OszTnfjIPZWMVqkrk/r7XP00FHXp94EyhzrT
         SQPAJEOOwKi1MAIDdtD5joEhHLR84s/FBwrC23c1GgiBWBUlWXwJW2OBFlOzJo2ArjsN
         +nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728320584; x=1728925384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzAQI2zuRwrHex7SW8vJ3CkxHhhV6R3iS3DZpL+am0A=;
        b=Z++rDjWBAMfaX77kdBDpZmBDvALpSn0MSUDQh/A0PAZ/MNAnuTfu+R56Fu0s0E9kvG
         RyQM7WQ/+PS1RPMn4uFNzJCN27aDCZN2V50T/DrxUe+LJbodVjEqVTQ8JqR9rbxhzL64
         YZeCzVAvBlDF+qoVVNvJhoIartxWlqObL3A+odDJQ/NIOuV2hx/c3kBfSIG14+7pPQWk
         5nQe+e9H8P+bKMyYXGrducOc3qt5RILhdRPv2avQW9CVDHFQlXrF8x6CvPAY82rxeuRI
         WGDUHi/SMdsXz4tAPeYdyxiVvJkHx1JuprNz/polM854zyvuweBxUEJIuCtt/YmTS+Wh
         si7A==
X-Forwarded-Encrypted: i=1; AJvYcCUdDvd/HkDkKrYcKTlhvD/R+XMAUI2YSUGL6AHweLj0uECUFfvpvHH09y/aDqFavg+uDEZTffF7DoCJ@vger.kernel.org, AJvYcCUk/rAkQxTGhbni/QSg+/N/Z2bhYPL5xSxiwtwd+vVD3/QylNZ35Q6ncEoZGeZ/obL6emTO/VOfe5S3Go05j2PRv6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrshIqJ+bi0zJx66yMhNIDcAxBVoxEMALUJYLGcTYc8q8NJh6
	KPZKMiJqT6Ae6RWO0EYA6Tv4q6mEF05K8JmeH5XDhC7eaphnqt75rDcxGOpABJFHzg+j9liO8oJ
	CO6u+HPxoFs1KtyJdzukNzFiOe+I=
X-Google-Smtp-Source: AGHT+IF4tUJZFMaeBM5q26x7HoyJxJlVb+PPXr65w8RCl0eRkFN8gf/jWde8aPaa2WLvrnpwjYIX0OQkVAAIAk5G/R0=
X-Received: by 2002:a05:6122:78d:b0:50a:c19b:e712 with SMTP id
 71dfb90a1353d-50c855597a5mr7088179e0c.8.1728320584433; Mon, 07 Oct 2024
 10:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <623645456e7636f43150a70f8603114b26304818.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <623645456e7636f43150a70f8603114b26304818.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 18:02:38 +0100
Message-ID: <CA+V-a8stGNbXZztH1tAXg555BKcm-8R_fZkA_CKpOB7YvebK5Q@mail.gmail.com>
Subject: Re: [PATCH 02/20] ARM: dts: renesas: Use interrupts-extended for
 Ethernet PHYs
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
>  arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts    | 3 +--
>  arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts    | 3 +--
>  arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts | 3 +--
>  arch/arm/boot/dts/renesas/r8a7790-lager.dts       | 3 +--
>  arch/arm/boot/dts/renesas/r8a7790-stout.dts       | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-koelsch.dts     | 3 +--
>  arch/arm/boot/dts/renesas/r8a7791-porter.dts      | 3 +--
>  arch/arm/boot/dts/renesas/r8a7793-gose.dts        | 3 +--
>  arch/arm/boot/dts/renesas/r8a7794-alt.dts         | 3 +--
>  arch/arm/boot/dts/renesas/r8a7794-silk.dts        | 3 +--
>  10 files changed, 10 insertions(+), 20 deletions(-)
>

Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts b/arch/arm/bo=
ot/dts/renesas/r8a7743-sk-rzg1m.dts
> index ff274bfcb6646ea7..9b16fe7ce713c903 100644
> --- a/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts
> @@ -73,8 +73,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc 0 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio5 22 GPIO_ACTIVE_LOW>;
>         };
> diff --git a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts b/arch/arm/bo=
ot/dts/renesas/r8a7745-sk-rzg1e.dts
> index 0a75e8c79acc0e58..571615a506207169 100644
> --- a/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts
> @@ -68,8 +68,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc 8 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio1 24 GPIO_ACTIVE_LOW>;
>         };
> diff --git a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts b/arch/arm=
/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> index 6448022852491661..7c7a9f257567d4f8 100644
> --- a/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> +++ b/arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts
> @@ -82,8 +82,7 @@ phy3: ethernet-phy@3 {
>                 compatible =3D "ethernet-phy-id0022.1622",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <3>;
> -               interrupt-parent =3D <&gpio5>;
> -               interrupts =3D <16 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio5 16 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>         };
>  };
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/=
dts/renesas/r8a7790-lager.dts
> index 826a29064d27f663..97c13b31f476505c 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
> @@ -692,8 +692,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio5 31 GPIO_ACTIVE_LOW>;
>         };
> diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/=
dts/renesas/r8a7790-stout.dts
> index 683f7395fab0b696..1593609064104ae4 100644
> --- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
> @@ -211,8 +211,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <1 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 1 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio3 31 GPIO_ACTIVE_LOW>;
>         };
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boo=
t/dts/renesas/r8a7791-koelsch.dts
> index 0a8eac57135f2e81..758d8331e7af66c4 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
> @@ -659,8 +659,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio5 22 GPIO_ACTIVE_LOW>;
>         };
> diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot=
/dts/renesas/r8a7791-porter.dts
> index 93c86e9216455577..267b3623655fbc38 100644
> --- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
> @@ -329,8 +329,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio5 22 GPIO_ACTIVE_LOW>;
>         };
> diff --git a/arch/arm/boot/dts/renesas/r8a7793-gose.dts b/arch/arm/boot/d=
ts/renesas/r8a7793-gose.dts
> index 1ea6c757893bc0bf..f3f62206088348c6 100644
> --- a/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7793-gose.dts
> @@ -622,8 +622,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio5 22 GPIO_ACTIVE_LOW>;
>         };
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-alt.dts b/arch/arm/boot/dt=
s/renesas/r8a7794-alt.dts
> index b5ecafbb2e4de582..1e04b8630ef3f3ca 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-alt.dts
> @@ -381,8 +381,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio1 24 GPIO_ACTIVE_LOW>;
>         };
> diff --git a/arch/arm/boot/dts/renesas/r8a7794-silk.dts b/arch/arm/boot/d=
ts/renesas/r8a7794-silk.dts
> index 595e074085eb4cd3..8857bb4a9b91d969 100644
> --- a/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> +++ b/arch/arm/boot/dts/renesas/r8a7794-silk.dts
> @@ -415,8 +415,7 @@ phy1: ethernet-phy@1 {
>                 compatible =3D "ethernet-phy-id0022.1537",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <1>;
> -               interrupt-parent =3D <&irqc0>;
> -               interrupts =3D <8 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc0 8 IRQ_TYPE_LEVEL_LOW>;
>                 micrel,led-mode =3D <1>;
>                 reset-gpios =3D <&gpio1 24 GPIO_ACTIVE_LOW>;
>         };
> --
> 2.34.1
>
>

