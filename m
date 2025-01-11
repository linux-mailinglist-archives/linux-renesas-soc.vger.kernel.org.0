Return-Path: <linux-renesas-soc+bounces-12061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BEA0A257
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 10:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AAF03A3293
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6969C17E472;
	Sat, 11 Jan 2025 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMqhlagz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C1EECC;
	Sat, 11 Jan 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736588099; cv=none; b=YSX2fIp+AHa2VrC/jFWbD+oQWxoq7IQDITbsXdOhALdeS0XUigdHh3or/L0JPMsqkFPefsL4n3OXeMthbncYvVAUZRPLm2HGxChYjtYFxn3rtakOvwVXyFZA2d3nvZ2b93Pba7PRDUIebfDFOEbTdQ6T428tWzdcmfftCzmsLlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736588099; c=relaxed/simple;
	bh=ibwJ44mCHDE1DwJHNFGMdbOIW0wg3VwlpdjH5Qvhwj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW+zWyemoOauR7ywj08rpU+MixZFTM5nef1QE1yp835pSsryQxAC9cBSTgPQfcfRT50CED1zyrLzp6bRgVwCUXdLzU007cH0qvdL6OO8OIIuYJ1Y2fR0CrkDKKW9ihJ5bSaM6erpCeS26/TQ786XaX5+WuA0677U5EQywvKGQxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMqhlagz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CF1C4CED2;
	Sat, 11 Jan 2025 09:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736588098;
	bh=ibwJ44mCHDE1DwJHNFGMdbOIW0wg3VwlpdjH5Qvhwj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PMqhlagzvsSxhmqhzZRj6QT1SZ0tNcXn1/reicmNyZznVDrqq1Bd1LJDoeVGCkQHb
	 cDmzxrJItw+QEXmpzW3QQaTAfAkxo7dC1+tlOYu5DWjkRYCJgExxXLNgwx365G+eTX
	 YSSiebLo8pkLfNE9gM3tzom+951RtJIjBWINyxvxXMMji6SLNBsr33yqoCvulFqTkR
	 qS17asORO3IIK/wr3PAKZF+Gj5l81C3SI8IW84UQ5IaaezO3ScD+A7P9Rz1GhDi1uk
	 5MI0IfYvXJaqVuW/mWi7NvB2z+h1M0cRiNfoOGC48VQOEQUUUGuJ1KYLDnUDHUEQT3
	 fzqvJSOrQaJSQ==
Message-ID: <467573be-f143-4cfc-a04e-86be092d1b58@kernel.org>
Date: Sat, 11 Jan 2025 10:34:52 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: renesas: Add initial device tree for
 Yuridenki-Shokai Kakip board
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>
References: <20250111080903.3566296-1-iwamatsu@nigauri.org>
 <20250111080903.3566296-5-iwamatsu@nigauri.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250111080903.3566296-5-iwamatsu@nigauri.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2025 09:09, Nobuhiro Iwamatsu wrote:
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for Yuridenki-Shokai the Kakip board
> + *
> + * Copyright (C) 2024 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "r9a09g057.dtsi"
> +
> +/ {
> +	model = "Yuridenki-Shokai Kakip Board based on r9a09g057h48";
> +	compatible = "yuridenki,kakip", "renesas,r9a09g057h48", "renesas,r9a09g057";
> +
> +	aliases {
> +		serial0 = &scif;
> +		mmc0 = &sdhi0;
> +	};
> +
> +	chosen {
> +		bootargs = "ignore_loglevel";

Not really suitable for mainline DTS. This is just debugging, so drop.
Just like earlycon - not suitable for mainline usage.

> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@48000000 {
> +		device_type = "memory";
> +		/* first 128MB is reserved for secure area. */
> +		reg = <0x0 0x48000000 0x1 0xF8000000>;
> +	};
> +
> +	reg_3p3v: regulator1 {

Keep consistent naming. regulator-1 or the name as in bindings:
'regulator-[0-9]v[0-9]'

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vqmmc_sdhi0: regulator-vccq-sdhi0 {

regulator-2? Why different styles of names?

> +		compatible = "regulator-gpio";
> +		regulator-name = "SDHI0 VccQ";
> +		gpios = <&pinctrl RZV2H_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpios-states = <0>;
> +		states = <3300000 0 1800000 1>;
> +	};
> +};
> +
> +&qextal_clk {
> +	clock-frequency = <24000000>;
> +};
> +
> +&pinctrl {
> +	scif_pins: scif {
> +		pins =  "SCIF_RXD", "SCIF_TXD";
> +	};
> +
> +	sd0-pwr-en-hog {
> +		gpio-hog;
> +		gpios = <RZV2H_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "sd0_pwr_en";
> +	};
> +
> +	sdhi0_pins: sd0 {
> +		sd0_data {


No underscores in node names. Please follow DTS coding style.


Best regards,
Krzysztof

