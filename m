Return-Path: <linux-renesas-soc+bounces-12666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC4A20BB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96CEC3A31E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35011B0421;
	Tue, 28 Jan 2025 14:04:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06E11AB531;
	Tue, 28 Jan 2025 14:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073088; cv=none; b=slY2qcJrGR5W0OP2Tpo+BjPfg/GP1je4vUQ52WCee1m5rtZLYEBJNFmGM10mEhEDdW5y4vdgL9vpm0jYZAXgtpBe2hXTfJ48+UrWHS6KWvzqrU7B4qNIv7uchEPwddaqBqb+D9/PgKSGo7NPn5unK5oylP1ZPmMwvB12vuWL90I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073088; c=relaxed/simple;
	bh=xFqA+QaLeWTVYCo6CE11FB2fRwifP+Dbwxo3Yh5jmlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gO988a6zfpKJ7DpdEiJXskahwSseM429XyhZleA1xWutPxyqCgnL31h5UdDAZLD5skwYcQpq0TIlNNHZvBH/U9r8xPatc03hQKChYWusnfzbWbvfPuUnAEXK0kBruvL/8y79O8RIkE187RESb+Gym8qaMUpjOWYb4tiqFlEI4zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4679eacf2c5so54730881cf.0;
        Tue, 28 Jan 2025 06:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073085; x=1738677885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1OH7dHz6q7HfoqniJWo+UtpmUzYb9o3pRJUznbcfSE=;
        b=WUwO0nO6MD87r5Sm1V0c8YynUiQdZQ+n4YUNtvVs1CEWdfLOokdkLmjAo+t/b7oecm
         y9+rL0rNzW6X7/+DAARgv6rOpEJAiPXkXWkpSUy6fLPCp8g3R12jrF8intechgYvdPRC
         sF8hEwLsqUW5dURhLjRXT1FDJhLv3rSsEF1IsEtyBNDFcGtWYT00hecPSqkFhfdwbFDR
         1ECtypjTh4+qvngJhMR9cp58B++I7EgvT0WstzMqPPC0UxF9uulMOwoigOnAWp4xJ/YB
         U79pM6kr1zhdt0rlPbdDRKRZ6s0nBxBpY3K33a6gTo/jY7bGNdRjDRoRxNgxxichYSgY
         R2IA==
X-Forwarded-Encrypted: i=1; AJvYcCUcDOwSzfKnxMS8mBGO8yyMuE5eSz/U47WSFwNXDS7Elgjfh6lSB4CM3+V/evDY7MN+KfhjZ1aX6wcKackDN6r8knk=@vger.kernel.org, AJvYcCXihOwfyIGBczjWsWKUcqOmBJX52uk3D6PsdepNzMKAKo72XKZu7aQtiblGgB1fYyrECcw7ohQvhEKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUN1zVJVAANy8sqGomuDq6AGz5yndM1GAEykkrLEpUai/ffR5
	kk+B0KBAWz/ANsgiTZ10c9Ij0iQjftJWMnkb41uC3y80SA4frjLzu/+PmGJE
X-Gm-Gg: ASbGncuDPpdqYhS+wPn1kv1d2moDe3E9U17q0b1HSbWZcnKLFAiVJp1yULUiPC4ndui
	iBH6wB95/aMs5xBW6fhekSoQplv5iS3rFaqaZxdsinSaj3X8VNCssbiiFr5jITzFMITYgmJ7HED
	UfebtHUSek4oGyvbAej8412LrWgRBzKeAu0miceoGVaXkLunL+T9bNoCu14KZorikCMY9PvTlfv
	ICJkzNBEH4AgkVKKP51j8NEuuNH0anjr6r65Pde7svcRWxzLCtgDu8/3Aha8U6NSXT9Z/ZhUg54
	+qX51+rIecgIyCEGZZKKgfXk30+PFVNh2doCHtNkRk4dwRJRnrRaNgRFOn9io3teCocY
X-Google-Smtp-Source: AGHT+IH+bv9FpvJQmkFkTWE1tH+Bru2HeBc7Ki5YuNGLvFtfJ77D5Ab87LUdC/lQC3QzpLFpDHERcg==
X-Received: by 2002:ac8:58cb:0:b0:467:8836:e003 with SMTP id d75a77b69052e-46e12b7bf14mr756429961cf.41.1738073084695;
        Tue, 28 Jan 2025 06:04:44 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e666d0e3fsm51362661cf.0.2025.01.28.06.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:04:44 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6f53c12adso509752185a.1;
        Tue, 28 Jan 2025 06:04:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUURYdZ+gPzjs8tb99Jo5CHeA2OyCvgBHLmHehwHGVg+QleG75TRYX+GtkkNbXTVtYSC7A0DfBnzzwBSOD1PQ+IEUc=@vger.kernel.org, AJvYcCVtTaUKNJt5/JFzICpozlrjtOkgfEjaJTwKiTxmtWfZDdX1bfllpZLjgVVhnm60DwZQGY/KbztaLIRJ@vger.kernel.org
X-Received: by 2002:a05:620a:1911:b0:7b6:cedf:1b48 with SMTP id
 af79cd13be357-7be6320bf2dmr6189082685a.3.1738073083639; Tue, 28 Jan 2025
 06:04:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com> <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 15:04:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ3t1gNXnc_3gabi7uX6HH6pSf372hrkuq9L=dnhbD7A@mail.gmail.com>
X-Gm-Features: AWEUYZmecPPwitaef6zUPhz2YZZFlEpNFw1T8HnjCj4v5oCkK-I8ubQtnkUZstg
Message-ID: <CAMuHMdXQ3t1gNXnc_3gabi7uX6HH6pSf372hrkuq9L=dnhbD7A@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Sun, 26 Jan 2025 at 14:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable SDHI1 on the RZ/G3E SMARC EVK platform using gpio regulator for
> voltage switching.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -12,10 +12,40 @@
>  #include "rzg3e-smarc-som.dtsi"
>  #include "renesas-smarc2.dtsi"
>
> +/*
> + * To enable uSD card on SDIO_USD:
> + *
> + * Switch bank - SW_OPT_MUX-1 (SW_SDIO_M2E):
> + *     0 - SMARC SDIO signal is connected to uSD1
> + *     1 - SMARC SDIO signal is connected to M.2 Key E connector
> + */
> +
>  / {
>         model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
>         compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
>                      "renesas,r9a09g047e57", "renesas,r9a09g047";
> +
> +       usd_vdd_3p3v: regulator-usd-vdd-3p3v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };

Can't you just reuse reg_3p3v from rzg3e-smarc-som.dtsi?

> +
> +       vqmmc_sdhi1_ext: regulator-vqmmc-sdhi1-ext {
> +               compatible = "regulator-gpio";
> +
> +               regulator-name = "SDHI1 VccQ";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpios = <&pinctrl RZG3E_GPIO(1, 5) GPIO_ACTIVE_HIGH>;

arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts:44.37-38 syntax error

Missing #include <dt-bindings/gpio/gpio.h>

> +
> +               gpios-states = <0>;
> +               states = <3300000 0>, <1800000 1>;
> +       };

Is there a specific reason why you are using an external regulator...

>  };
>
>  &pinctrl {
> @@ -23,9 +53,44 @@ scif_pins: scif {
>                 pins = "SCIF_TXD", "SCIF_RXD";
>                 renesas,output-impedance = <1>;
>         };
> +
> +       sd1-pwr-en {
> +               gpio-hog;
> +               gpios = <RZG3E_GPIO(1, 6) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "sd1_pwr_en";
> +       };

... and external (fixed) power enable, instead of the internal regulator,
which uses the same two pins?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

