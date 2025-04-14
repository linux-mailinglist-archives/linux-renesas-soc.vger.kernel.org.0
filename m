Return-Path: <linux-renesas-soc+bounces-15929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D9FA88778
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C5A16AEEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D6D253950;
	Mon, 14 Apr 2025 15:39:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A4225229C;
	Mon, 14 Apr 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645142; cv=none; b=txNlNpyNzfTHmz4gQYNgw8E6o0ev3Bi0flSxVF/PV5FaxqkksPBSAIF2PlctD5lPkADewYQWUfoQvAhmspDWq3RRlUNVPJRcq5gIR6iVOBRlRe5uAK7uJBNePWWJlGq9jDPNQNtCae/UEQWwakDr3zwzEXEHSmXNxmsxarYi3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645142; c=relaxed/simple;
	bh=qnq7kNGVVHXkTZ92DSUahynUCtaPEVn+gI84YfDmRaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3IUh69B+K95Dho8MgjgocWzmOpS2dRtgEE21KviMpoL/72WfcOve300KoSZpw3CIyb53lPvXb2u0veJYbipDSw1uulvqtzLM6QLD4WOLlThssB8uM3EgrQpJ50yxYyTKbG4H5mqmwaRhZi537NV+MeOPMYhmCAGlc+LEkwf5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so1886712241.0;
        Mon, 14 Apr 2025 08:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645138; x=1745249938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExSgT36WSD1AgMlCEyNaAuN9+bBCrTgldtgtmdSH1wc=;
        b=fRo7K3nhmqh7NNvI8Vq1JIhFiXAghUEpdeDUvVcirKHE14HbzIw9YmKJZp8yHVKmnD
         ZoXJsdJkt9WQvF3/Gku/5AuPHp1eFvmwu5c/5Vu1nn1j63zvg3r1M7gq8Ya/6uvOUZ4F
         A+AaGiSFGg5ch/tEWKmo7JSl53M1rMFdtLztJ6RYVPqDIqXLBDSLZatEouPlgOTMY9gx
         R4sv7orM7w7mzjfzMZNRok0WA8o9acR73GSYyCTfmUZhzg2Gxv5R0WdNHtKgcVUEgZdp
         NyeZUvvUn3Y6uHdWS03bykUtHY/D4lN8ILuaBBdLDYB7t6HiotW4+dmC2FLKsXxLw+cs
         eSTg==
X-Forwarded-Encrypted: i=1; AJvYcCUmyPsl8RxFF72tUso7ZLRxjXWxWpULK9bHQNTGGCWvPA87ry0TzvvOCx6QA+W2UfvL5nWOfr4AW1zrsAKBmucVPBs=@vger.kernel.org, AJvYcCVNqees2hiiHRds2FmtxYQTeOPIGjDGs2Lp820/OfoNkUJ1SFTNGpFmGXj0zeiF6xhltjmNIUlzn3cJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxBYnrzOTBoB3JHqops5gLQv/UgVE7MmLyQvjM1NcB1PNLjSNtR
	09POGeqwEmqnkHPqv2Z+2roSo1H+GiPsyiDcvCYdb3aT271YXfiz4yv8caJU
X-Gm-Gg: ASbGncsOLcadE/JEEZRVJ4XFZUPR5/g7vdfDr0LGV45NjzrE2E+4TSZSI42E1VzU8G/
	GAVsqVG+5iMliugwRewQmjMyFFS+TcvxzpNuicn3wcxY9J/Yw63X7ujH17kQR7DGbRmUojCEJPR
	P57pLGrDX85PQMIHNmQjtpeeso3NZSqpDIQXuKXYDCaRrde5kd0I8EehAIwDXqw+j8tDncGIikp
	sLVeDNx7l0vbMVY0aAf3NoSyUIM8erURTNq5C1wWrYccPEfzIZGh+cl9QqL9RF0Gya0QbpATjWr
	Z+RQ5LWEJPIQtr2l6NRQV5BhbllKCyehTySe0IFXtRu876KQI4ICUU8j+F7znFQq1oFWyAbRCUR
	r+Uc4WeQ=
X-Google-Smtp-Source: AGHT+IE27hw74iIJA64w91EWv96W9NwpbcJYx42q7Msj+obK7lUJg0GyuMJS7wUEsGFY0sua9kwd9Q==
X-Received: by 2002:a05:6102:441a:b0:4c4:df5b:330f with SMTP id ada2fe7eead31-4c9e4fff708mr7861638137.17.1744645138101;
        Mon, 14 Apr 2025 08:38:58 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c98afc1csm2224888137.22.2025.04.14.08.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:38:57 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1333900e0c.0;
        Mon, 14 Apr 2025 08:38:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmkL8rRk7+ybN9HpVt612ziln8OQ4tPINjpyAr6NP0VZak6uoSvmYyvWm7bj43FcAxHTn0h/4PiyzM@vger.kernel.org, AJvYcCWko1mhIvVR5DZPeQamQ9OWxe8b4YWj5O8H3h1KXjszhrxa+N3o3b/lhPnca4SqktZuysb8R9u5CNZAwCf0SVC7Q+U=@vger.kernel.org
X-Received: by 2002:a05:6122:1681:b0:51f:3eee:89f4 with SMTP id
 71dfb90a1353d-527c35be349mr8492726e0c.9.1744645137610; Mon, 14 Apr 2025
 08:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com> <20250320164121.193857-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250320164121.193857-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 17:38:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVAqP30iK25tnOyy+pLBusKQn-agvSAw-Xuy9Vds1Nmg@mail.gmail.com>
X-Gm-Features: ATxdqUF_blPCBbaxPTFvmznTYE28mhV50nlYJVG9732Ija_HtDBK3sM_sQXHRE8
Message-ID: <CAMuHMdVVAqP30iK25tnOyy+pLBusKQn-agvSAw-Xuy9Vds1Nmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 20 Mar 2025 at 17:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable CANFD on the RZ/G3E SMARC EVK platform.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Split the patch into two.
>  * Enabling CANFD done in this patch and CAN Transceiver on next patch.
>  * Defined the macros SW_LCD_EN and SW_PDM_EN  which routes signals to
>    CAN0 and CAN1 based on SYS.5 and BOOT.6 switches.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -8,6 +8,8 @@
>  /dts-v1/;
>
>  /* Switch selection settings */
> +#define SW_LCD_EN              0
> +#define SW_PDM_EN              0
>  #define SW_SD0_DEV_SEL         0
>  #define SW_SDIO_M2E            0
>
> @@ -33,7 +35,36 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
>         };
>  };
>
> +&canfd {
> +       pinctrl-0 = <&canfd_pins>;
> +       pinctrl-names = "default";
> +
> +#if (!SW_PDM_EN)
> +       channel1 {
> +               status = "okay";
> +       };
> +#endif
> +
> +#if (!SW_LCD_EN)
> +       channel4 {
> +               status = "okay";
> +       };
> +#endif
> +};
> +
>  &pinctrl {
> +       canfd_pins: canfd {
> +               can1_pins: can1 {
> +                       pinmux = <RZG3E_PORT_PINMUX(L, 2, 3)>, /* RX */
> +                                <RZG3E_PORT_PINMUX(L, 3, 3)>; /* TX */
> +               };
> +
> +               can4_pins: can4 {
> +                       pinmux = <RZG3E_PORT_PINMUX(5, 2, 3)>, /* RX */
> +                                <RZG3E_PORT_PINMUX(5, 3, 3)>; /* TX */
> +               };
> +       };
> +
>         scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> index fd82df8adc1e..1d3a844174b3 100644
> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -29,6 +29,10 @@ aliases {
>         };
>  };
>
> +&canfd {
> +       status = "okay";
> +};

I am wondering why you split this in two patches?
I believe CAN-FD does not work without adding the CAN transceivers,
which is only done in the next patch?

> +
>  &scif0 {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

