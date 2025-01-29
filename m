Return-Path: <linux-renesas-soc+bounces-12691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7AA21ED9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7447616AC33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 14:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A4F13D503;
	Wed, 29 Jan 2025 14:12:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF412C9D;
	Wed, 29 Jan 2025 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738159943; cv=none; b=Wa+HS8/rWObFJdcTuhdMNkZd18JW3Be4NIyOppBy5uoWMc0TGC/coALsbRIagKb+QkO7nTh+9X45yHh0Iko2wTYsYzbMgtylPVQO3EnDUhvAHv8n0r2hCJrJ6sZprJU06VTctlJRraIDxBzploeg2HN/nIUBihiNq6cwcfzMFvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738159943; c=relaxed/simple;
	bh=bP1LpwLMclbJicT0S+HVXQal5TyBbetxTZ51Z7K9Qns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EfvnmHvMAM9UNLuTDML4iiQbKy34niw67HiQypKPPhT3t5J1gEXLsBzy6E7ErjGTpUTZp4QRv63nzz3H4avwYnWmZ64xtOdfVQso2JRwZrBtQDlZtWdVml14r+67h1U0AWu/XWaTRqkXnEEX5T6FCGN+OpZ9fTH1O/9a5QUXJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6df83fd01cbso27769676d6.2;
        Wed, 29 Jan 2025 06:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738159940; x=1738764740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5Tkcv8gZTgbyp2heRc2wr0p9jGYqFMOo9+Mqf5RFT4=;
        b=mEGr9ha0fxR+Po0P6hucl7XV1w4doaeAZHfvyQE8aYumiBbdHhYJJZ0xL4w70Kro05
         gNgvWiUe8hMm92ENGwYhC7y6kHExpknJFIpDW+UNn0L//SPhzPgFW7AAFPuWQGGr8Qfv
         6mBp7gHjaxXwB9Dr2F1GBfHFGduAWaSoU8mnCnOficBYzv7MB5Mpkg0pUEGlRt+oymp6
         8byL6XYFAMBPUDCoSZwgJb9iyy1Br0SubBoOWilwfXPQHABPvlT47jPl8crodYLvKOCB
         V999qEv8fgvIAyN7/MHs/Bud9fQhDKTOPyBjFv6Thx9WJykBcSROwDqqJGJGu7A+QK4d
         WPIg==
X-Forwarded-Encrypted: i=1; AJvYcCWq+u/Go29iXHdHMSgVAcJlzoEpZMfO5QMIRhmrvGJOhQJwhIBUwnyYyHnjwD+neZjnXJqm9i64PTaOYkT+@vger.kernel.org, AJvYcCXAROmxHC23kiquI9sFaFAXsFUeRBoHv0EGsomweWxot8aNGassgvFyTgMkCsYoAwlnI4ybAFVGeHrncXs84oz3iaE=@vger.kernel.org, AJvYcCXJCeVSjT/uBYoGF5Z2yEuj0uStuT1g5J+fl5UF6XkE8Jp9ms1wQOeXue/j0Isvu+AYRS+IbdPChV27@vger.kernel.org
X-Gm-Message-State: AOJu0YztjmIMRW+SrujlwP/wZgrEiR7QwpQkKg15yfHG3NVtPncuqR/N
	Qvc0mXUhlo6riEuB9cSJeV9bPAmSnTZm8GQzDOmeSJKaUnNww0E0tB9bcaRN
X-Gm-Gg: ASbGncv80fUsA18TNquyJiwSFw/byz9BDrQqxUwQHd0xfB6Ipj7mmUg/uAPw5quBFw3
	nBjZQg3IYrec/hqBhI+DECxv7qHuzww5kGdpsWCw1OK5VPj7Z2jrUt71I6nE01lBd8LqfHYgEKR
	PuzjLWLxkdlAjhrnSNDOyTTR1O2/BHC3o7TG19Vvvh8p0fm4DGg0hRKkxI8hQTACEQAtfIxl/T1
	beyG2xQi+LUwe2ZpuMvC8C+1jRIS1QdiJwEDzAJVPDOf7vfNRKH1lZ8atKF4LGnEU/KnZGtPPZH
	LhMeu9j/bEUfj1VvkHgaw46zWOoIXNT1LtDOYWokCJZEQFEnFiaUI5Hn7g==
X-Google-Smtp-Source: AGHT+IE/6SdaAR9mAGJnJOQaU6s3bhDsAEYQwRcoz0uKgto71AUv0heiLRpPxq9QgFk1oc8QTy9F0w==
X-Received: by 2002:a05:6214:1d0e:b0:6d8:b189:5419 with SMTP id 6a1803df08f44-6e243b91da4mr57849446d6.8.1738159939772;
        Wed, 29 Jan 2025 06:12:19 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2057a88f8sm55894526d6.74.2025.01.29.06.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:12:19 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467a3c85e11so50132191cf.2;
        Wed, 29 Jan 2025 06:12:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTuRdD7rrWqfEjAVQQJGftwShgwipMtGq8csQY/XBRmd/g7DudALd7gf5LJU+LfMDRmPl170YQjaeo5PN0tsjQ55I=@vger.kernel.org, AJvYcCUaKgBDyqIkOpvs2ys6AybA4OiX3EgNDwAooMIm4u9jqjhqSnv6Wj5dbpRb1g0bkq4ENRG9KHrVz31Y@vger.kernel.org, AJvYcCVnNSL8J4XeM+RhRaL6ZP0u0Upr1qKYcyvN+Py1K6iYeN8bXurbvEuQM8KSg8FvlZnXnjc+NoL5hSnOj6wp@vger.kernel.org
X-Received: by 2002:ac8:5d52:0:b0:467:86fa:6b72 with SMTP id
 d75a77b69052e-46fd0a6486cmr46231051cf.12.1738159939102; Wed, 29 Jan 2025
 06:12:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127-myir-remi-pi-v2-0-7bd3a1c62752@collabora.com> <20250127-myir-remi-pi-v2-2-7bd3a1c62752@collabora.com>
In-Reply-To: <20250127-myir-remi-pi-v2-2-7bd3a1c62752@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jan 2025 15:12:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3Z9d8qsa_mnUgH50a=_aq9myf0xYVx+ZexKtkUXcMNw@mail.gmail.com>
X-Gm-Features: AWEUYZlxLUbHTU3u3xDhV9Zxr8pZ7ahCIIdSYfsNHiLG9VOAKw5JswNmTSU9Sbc
Message-ID: <CAMuHMdV3Z9d8qsa_mnUgH50a=_aq9myf0xYVx+ZexKtkUXcMNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: renesas: add initial support for MYIR Remi Pi
To: Julien Massot <julien.massot@collabora.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Mon, 27 Jan 2025 at 10:39, Julien Massot <julien.massot@collabora.com> wrote:
> Add basic support for the MyIR Remi Pi (based on r9a07g044l2):
>  - UART
>  - i2c
>  - emmc
>  - USB host
>  - HDMI output
>  - Ethernet
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the MYiR Remi Pi
> + *
> + * Copyright (C) 2022 MYiR Electronics Corp.
> + * Copyright (C) 2025 Collabora Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +#include "r9a07g044l2.dtsi"
> +
> +/ {
> +       model = "MYIR Tech Limited Remi Pi MYB-YG2LX-REMI";
> +       compatible = "myir,remi-pi", "renesas,r9a07g044l2", "renesas,r9a07g044";
> +
> +       aliases {
> +               ethernet0 = &eth0;
> +               ethernet1 = &eth1;
> +
> +               serial0 = &scif0;

So serial0 is the CA55 console, OK.

> +               serial1 = &scif1;

Connected to BT/WiFi, but not yet enabled below.

> +               serial2 = &scif2;

This is wired to the Raspberri Pi expansion connector.
However, on Raspberri Pi, these pins are GPIOs.
While the Raspberri Pi UART_[TR]X pins are wired to SCIF4 here,
which is not yet enabled...

> +               serial3 = &scif3;

Serial3 is the CA33 debug console, OK.

> +
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +
> +               mmc0 = &sdhi0;
> +               mmc1 = &sdhi1;

sdhi1 is not yet enabled, so please drop it.

> +       };

> +       reg_5p0v: regulator-5p0v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-5.0V";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +       };
> +
> +       reg_3p3v: regulator-3p3v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               vin-supply = <&reg_5p0v>;
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +       };
> +
> +       reg_1p8v: regulator-1p8v {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               vin-supply = <&reg_3p3v>;

reg_5p0v, as 1.8V is generated from 5.0V, according to the schematics.

> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-always-on;
> +       };
> +
> +       reg_1p1v: regulator-vdd-core {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.1V";
> +               regulator-min-microvolt = <1100000>;
> +               regulator-max-microvolt = <1100000>;
> +               regulator-always-on;
> +       };

> +&eth0 {
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@4 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <4>;
> +               interrupts-extended = <&pinctrl RZG2L_GPIO(44, 2) IRQ_TYPE_LEVEL_LOW>;

Missing reset-gpios (P44_3).

> +       };
> +};
> +
> +&eth1 {
> +       pinctrl-0 = <&eth1_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy1>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy1: ethernet-phy@6 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <6>;
> +               interrupts-extended = <&pinctrl RZG2L_GPIO(43, 2) IRQ_TYPE_LEVEL_LOW>;

Missing reset-gpios (P43_3).

> +       };
> +};

> +&pinctrl {

> +       spi0_pins: spi0 {
> +               pinmux = <RZG2L_PORT_PINMUX(47, 0, 5)>, /* CLK */
> +                        <RZG2L_PORT_PINMUX(47, 1, 5)>, /* MOSI */
> +                        <RZG2L_PORT_PINMUX(47, 2, 5)>, /* MISO */
> +                        <RZG2L_PORT_PINMUX(47, 3, 5)>; /* Chip Enable*/
> +       };

Unused.

> +
> +       eth0_pins: eth0 {

Please sort pinctrl subnodes (alphabetically by node name).

> +       sdhi0_pins: sd0 {
> +               sd0_data {
> +                       pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
> +                              "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
> +                       power-source = <1800>;
> +               };
> +
> +               sd0_ctrl {
> +                       pins = "SD0_CLK", "SD0_CMD";
> +                       power-source = <1800>;
> +               };
> +
> +               sd0_rst {
> +                       pins = "SD0_RST#";
> +                       power-source = <1800>;
> +               };
> +       };
> +
> +       sdhi0_pins_uhs: sd0_uhs {
> +               sd0_data_uhs {
> +                       pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
> +                              "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
> +                       power-source = <1800>;
> +               };
> +
> +               sd0_ctrl_uhs {
> +                       pins = "SD0_CLK", "SD0_CMD";
> +                       power-source = <1800>;
> +               };
> +
> +               sd0_rst_uhs {
> +                       pins = "SD0_RST#";
> +                       power-source = <1800>;
> +               };
> +       };

sd0 and sd0_uhs are identical, so you can just always use the former,
and drop the latter.

> +
> +       usb1_pins: usb1 {
> +               pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>, /* VBUS */
> +                        <RZG2L_PORT_PINMUX(42, 1, 1)>; /* OVC */

These two pins don't seem to be exposed on the SoM.
Perhaps this is wired on the SoM?

> +       };
> +
> +       scif0_pins: scif0 {
> +               pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* TxD */
> +                        <RZG2L_PORT_PINMUX(38, 1, 1)>; /* RxD */
> +       };
> +
> +       scif1_pins: scif1 {
> +               pinmux = <RZG2L_PORT_PINMUX(40, 0, 1)>, /* TxD */
> +                        <RZG2L_PORT_PINMUX(40, 1, 1)>; /* RxD */
> +       };

SCIF1 is connected to BT/WiFi, and the CTS/RTS pins should be included.
However, for now SCIF1 is not yet enabled, so please everything related to it.

> +&usb2_phy1 {
> +       pinctrl-0 = <&usb1_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};
> +
> +&ehci1 {

Please sort references to nodes (alphabetically). More below...

> +&dsi {
> +       status = "okay";

Please insert a blank line.

> +       ports {

> +&i2c0 {
> +       pinctrl-0 = <&i2c0_pins>;
> +       pinctrl-names = "default";
> +
> +       clock-frequency = <400000>;
> +       status = "okay";
> +
> +       hdmi-bridge@48 {
> +               compatible = "lontium,lt8912b";
> +               reg = <0x48> ;
> +               reset-gpios = <&pinctrl RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;

Missing interrupts (P16_1), but that is not yet supported by the
bindings, so I guess it's fine to leave it out for now.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

