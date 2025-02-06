Return-Path: <linux-renesas-soc+bounces-12893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F59A2A504
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E90D23A7377
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03D5226548;
	Thu,  6 Feb 2025 09:47:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07E2226540;
	Thu,  6 Feb 2025 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835241; cv=none; b=QIjbtw7Ji1NpzaSWi2TAffcwQea6UBkpgTJdPBApWBl+PjN/PIQJAewgsRNATL2IYO5wn2q/HEH/uxOXkmqAlDNrj6ytcHv6sVqjO05JlOg6VGn6++lDD5antNPlCnMuDP5cveVCrkFDnvZMHSOo2k31uJLaw+q00EO85edd5tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835241; c=relaxed/simple;
	bh=BBQOdDtoMYa/13qRqZxrZ7C9eDfKvQYNPQJfxUoNdwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NH82sg+gXxaY18tB+ww8hZZVRPF0mGLedJ9zdBX57v8zPLYhqmDnJFHmXcLC8oOMpjS7FJ0d7NgUHQkQoN8MEMqsg4RwBfH8G9ddIPBLjof32hw2mXqPVIsWr3Dnny1G9vUocEnKu+FpMH20YSpAe+8qjgYcy4rMcofL2fFG5zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4ba787db858so128712137.0;
        Thu, 06 Feb 2025 01:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738835238; x=1739440038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+cuzjwa1eTLmIxJ/QXHLK60oGnWZrd/chn4FYf50v8=;
        b=bhfLbdYcFY5PcJY8teb4YUFqwNoxjLZhOQEBlezsWFqo5oQ64rBT6QB66djtpx7+J5
         DD2YgIsYWly7DoowwtL7akXqWk/hgBlkfHOOi1YJFuvfu1WvSGc+qer3ceFkzHYah/tx
         7+s7en9UkbMKl/nKAO/B8kFjAMtxGnQlS7XIVdAP2zqWzhPaV8Q/hMaavpfVbREhZEJc
         jebRsAzTTGKypPo6qKjfdBvQT9nfVLMiLS/7ipenYvgYh3hPNiDpnBFc1C+ThxwhgjX/
         x4Dcc8L/wJ9DfmIHxE4pi515uuXvmKEM6JTrPU6gFM33YZiatxndoJWSUEJJdk+93Fru
         cfDA==
X-Forwarded-Encrypted: i=1; AJvYcCUO2P+j7q7Xc+qs9TIJXVnjd5NYr3hOMFbJRJ7Lq6aa6jkC2Sg47ejr7o3qJeg053CpYabw4LhqjzKP@vger.kernel.org, AJvYcCUln8m5XKbnQVfU3sn2fbsQKt1O6riC4qmuS+Ptc6Nz8o9u4IGOnMeSLgWuApnc5nHDMTU++zSAZSl/vCqs1mIQ7XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0l/nuL2TuhW7T+u9qxbv9BBWHlZ1GahCiv29XSYEbCxP0+rFg
	dzxuFcuPfNN2J0sUR9for2+mNs38j0ZcDF+whHNn/0j8XJki7XNnd1QGsqkK
X-Gm-Gg: ASbGncsScojd+hzf1t2dN+1vOja+5hPHuH3JTzv2DMT69EWRSWIDWBv7dRGL2s61+6E
	HWwTKZjr2BBCHucXWQSlzN5l4CEoFGqoIk3/ctGEUygntisaL+q7g6dbe3hHwLeqkSwq+cKB7Ci
	NJx0/YNGc42QU1YJdHwfJ+qY0ARG8kXr8vGRq9c1YqmNwW/Ishsz2bf7xRe2tO0ynualX0Yptg8
	ImQ/5FDUsuLcXvxM51cbpxEX8sSNU/272OMP4VcUQw0vJGg2mFxV8qp5RI5nJcXkpkvhhyCW87k
	auUpFCUy98ig5WTQ89e3Ef1/EztpuQCh8fWAEsNqVNUaNnh/w7lMng==
X-Google-Smtp-Source: AGHT+IFJ1Mq7Ncc2rbeI9g0b01ZxjyHC4iKkHRaQpMoeUpSOHkVHtbjd7laaWGZ/yuaHO2czrf8udQ==
X-Received: by 2002:a05:6102:570b:b0:4b2:ad50:a99c with SMTP id ada2fe7eead31-4ba46dba843mr3895949137.2.1738835237643;
        Thu, 06 Feb 2025 01:47:17 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d8cb9sm132247241.23.2025.02.06.01.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:47:17 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-866f01c2f2aso191881241.0;
        Thu, 06 Feb 2025 01:47:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ+BcDW0I/YTllHrFzZeswK0ZDILM27exx1oyUvDNCGljGkEM5Ji/4c7uYiiJjjgn40IXFbr1M2JI+gDMUSSRr2Rg=@vger.kernel.org, AJvYcCWczelH+VetdI+QJ1uqkUTgfu70ZSN+brfwebyxoN/QDEOHNHFo6qqoLcPMPoJRq8krUDc9grOBsS0j@vger.kernel.org
X-Received: by 2002:a05:6102:570b:b0:4b2:ad50:a99c with SMTP id
 ada2fe7eead31-4ba46dba843mr3895928137.2.1738835236703; Thu, 06 Feb 2025
 01:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com> <20250131112429.119882-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112429.119882-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 10:47:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTJ6KjhkASEGU=SxJHNShcRXr_X7DuRNvKG0dVn_gcLw@mail.gmail.com>
X-Gm-Features: AWEUYZkcKZR3dlxDoz57V_WsdGsB7bJoqFrxxi8E7LGtbS5fr4yCODmiYtUEkSI
Message-ID: <CAMuHMdUTJ6KjhkASEGU=SxJHNShcRXr_X7DuRNvKG0dVn_gcLw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: rzg3e-smarc-som: Add support
 for enable SD on SDHI0
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 12:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for enabling SD on SDHI0 on RZ/G3E SMARC SoM. It is enabled
> by setting the macro SW_SD0_DEV_SEL to 1 in board DTS and setting the
> switch SYS.1 to ON position on the SoM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -5,6 +5,15 @@
>   * Copyright (C) 2024 Renesas Electronics Corp.
>   */
>
> +/*
> + * Please set the switch position SYS.1 on the SoM and the corresponding macro
> + * SW_SD0_DEV_SEL on the board DTS:
> + *
> + * SW_SD0_DEV_SEL:
> + *      0 - SD0 is connected to eMMC (default)
> + *      1 - SD0 is connected to uSD0 card
> + */
> +
>  / {
>         compatible = "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "renesas,r9a09g047";
>
> @@ -43,6 +52,34 @@ &audio_extal_clk {
>  };
>
>  &pinctrl {
> +#if (SW_SD0_DEV_SEL)

No need to make this conditional.

> +       sdhi0_pins: sd0 {

sdhi0_usd_pins: sd0-usd {

> +               sd0-cd {
> +                       pinmux = <RZG3E_PORT_PINMUX(5, 0, 8)>;
> +               };
> +
> +               sd0-ctrl {
> +                       pins = "SD0CLK", "SD0CMD";
> +                       renesas,output-impedance = <3>;
> +               };
> +
> +               sd0-data {
> +                       pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3";
> +                       renesas,output-impedance = <3>;
> +               };
> +
> +               sd0-iovs {
> +                       pins = "SD0IOVS";
> +                       renesas,output-impedance = <3>;
> +               };
> +
> +               sd0-pwen {
> +                       pins = "SD0PWEN";
> +                       renesas,output-impedance = <3>;
> +               };
> +       };
> +#endif
> +
>         sdhi0_emmc_pins: sd0emmc {
>                 sd0-emmc-ctrl {
>                         pins = "SD0CLK", "SD0CMD";
> @@ -96,6 +133,25 @@ &rtxin_clk {
>         clock-frequency = <32768>;
>  };
>
> +#if (SW_SD0_DEV_SEL)
> +&sdhi0 {
> +       pinctrl-0 = <&sdhi0_pins>;
> +       pinctrl-1 = <&sdhi0_pins>;
> +       pinctrl-names = "default", "state_uhs";
> +
> +       vmmc-supply = <&reg_3p3v>;
> +       vqmmc-supply = <&vqmmc_sdhi0>;
> +       bus-width = <4>;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
> +       status = "okay";
> +};
> +
> +&vqmmc_sdhi0 {
> +       regulator-name = "SD0_PVDD";

Why override the name?

> +       status = "okay";
> +};
> +#else
>  &sdhi0 {
>         pinctrl-0 = <&sdhi0_emmc_pins>;
>         pinctrl-1 = <&sdhi0_emmc_pins>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

