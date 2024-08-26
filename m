Return-Path: <linux-renesas-soc+bounces-8269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCD695F12D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 14:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E13E9B20E3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D11156678;
	Mon, 26 Aug 2024 12:20:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D341F140369;
	Mon, 26 Aug 2024 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674823; cv=none; b=eYvbsnAINzLmCm0gTixfkB0cTpj2lpr0NHuEOx7zQwN2XYYea6NeHm5GUx3Q5KjOVkf6zpgyVjRYSCGYeOSuaZYYnwfxMFAC0bS0xnp7lOUXEsp6endbZbMNLG+SoDOUIFCzV+RBc6PcF5eERCS0K5cj4lCrleGr/J0X5bL1Jws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674823; c=relaxed/simple;
	bh=s8/LKtlf80hdQy1KP55Ty+jBjJvYm+19p+cKHvb9fUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiSy6sGx/h9y6s3p9yLL5nJMoqF7oQYycaJWnt9tVIVRjs66ZHjCJtCXlrJCTxqqL87I3KCxtN1IDXiiJhP6RJ0pbiy0A5kprS9/D7uPWU5SA9LwRsdpK5gj6GBiqK/qlfjOgDKdVZQK83Clanx7xkAULuNs9MTzNe2mZ7/1VEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e16582cb9f9so3124143276.0;
        Mon, 26 Aug 2024 05:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724674820; x=1725279620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2sv7gNgIdFAM718zIFKTqLRe+kVkpp1n3p96raF+ZM=;
        b=BU8IAL3lHQDP8U81I0OOcwOhDqoj2e3s/49Wgk9/n/UZELAGn7Vdk1MWO25JBTqxjW
         O0a0qMBaKbQV59Qv2A0/fywounvAZ/mhhoUwEepHikPAlvITQQHV1FpiKvftRigQiqXo
         4TsV6vDNvqfMoEntLGqz9jHqsKQK214kaxTJFffE1xG8dzS8qZGwxml9NL137RzSvE7/
         GVirgFZYamA9hdgKkK3dXVADqALyionf6vjp0ohSMtNVs/pkdy5QBJdJ/ZWwuY/QSdfN
         UyXw0hONbrL4XXHHdopww6sxF6xQVKEzsk1qdM6UAjBiABj+dx+lnp39mR6eihyqn6L0
         hicQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAxL6J0VX515Mtsoft0cOZwu/LBSZpewG5NebY9x5O5QrY6r+bS6qBsudII5kjtVKVqdyQjKGB3YJwFS6z@vger.kernel.org, AJvYcCVr7nySFOIQu3+K8VTZSvT0Vkr5VCiVAX0XuANBRHEbu4Ipl1FpZ9wOAvj0Rg1+aNxtInz6ycYRZOv+@vger.kernel.org, AJvYcCWlSVQh+lJByaF6oeAABahWsFHwfy7LlrqEy14gXcuWXMImTY83SO20Ta+ryk4/ace0pP7J7VHZNbMFX4rylyYqbPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfwfPD9td1KyDbIf4+146vU/bWK+onKXQDHDNZQvWFHt+hd00t
	EMrOtPijoqkcqVoctd7cVMhjUFXHORYsMvXGdB1nqKHieLMRbR4bVNs7JxyE
X-Google-Smtp-Source: AGHT+IF4eQx/3SXlFoEn5cwmlB/wTCHwUP8+hDAt5LPgnJUrjpybnvvOvgDyxw1MHlf/ibladFUVPg==
X-Received: by 2002:a05:6902:1023:b0:e11:446b:d43b with SMTP id 3f1490d57ef6-e17a78e6048mr7752997276.16.1724674820064;
        Mon, 26 Aug 2024 05:20:20 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e463e9csm1941701276.25.2024.08.26.05.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 05:20:19 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b3afc6cd01so40265307b3.1;
        Mon, 26 Aug 2024 05:20:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAI+5FARNbbxBa/ewL9hFgHcUfN+StszGGc6MEO9wHtNSDWnxG/zCuETUyKzF56W927QDp+JN7yIl42ix4ShciWW8=@vger.kernel.org, AJvYcCUkg9SG4X4vgy9INZMzdakpxoU5eMzU5tiqzDW4A3pzAWRlLzPILzwbSFXFeBl+9o7TgxZlNZtnzoe+@vger.kernel.org, AJvYcCUvMfdZ6tDw7xz9fPUv88OGBfITNG5iMuSunCKbxuGv2I5UJRr8APxYIcrAyIarUP/sgnxRXjmv2h4rlVvA@vger.kernel.org
X-Received: by 2002:a05:690c:630c:b0:6cf:4b85:5e69 with SMTP id
 00721157ae682-6cf4b8560camr3216737b3.18.1724674819672; Mon, 26 Aug 2024
 05:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240821085644.240009-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240821085644.240009-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 14:20:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVun6ZW95wRFo6wyZWAg9Y6KZ9Ot7j3Jo__uDtJFZDgdw@mail.gmail.com>
Message-ID: <CAMuHMdVun6ZW95wRFo6wyZWAg9Y6KZ9Ot7j3Jo__uDtJFZDgdw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI0-SDHI2 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -420,6 +420,51 @@ gic: interrupt-controller@14900000 {
>                         interrupt-controller;
>                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>                 };
> +
> +               sdhi0: mmc@15c00000  {
> +                       compatible =3D "renesas,sdhi-r9a09g057";
> +                       reg =3D <0x0 0x15c00000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD 163>,
> +                                <&cpg CPG_MOD 165>,
> +                                <&cpg CPG_MOD 164>,
> +                                <&cpg CPG_MOD 166>;
> +                       clock-names =3D "core", "clkh", "cd", "aclk";
> +                       resets =3D <&cpg 167>;

With all module clock and reset numbers HEXed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

