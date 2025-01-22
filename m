Return-Path: <linux-renesas-soc+bounces-12338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3830EA191F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 14:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C07CC188CDC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 13:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345141BD9C7;
	Wed, 22 Jan 2025 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvIRHdu1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0808C83CC7;
	Wed, 22 Jan 2025 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550887; cv=none; b=WWF4eT7iQQECCsPb8YabWTIjet2fBQQDaD7r4P+t47Qrzdh0uah/qG6BRbXT0hjsC9VLhQ6zikNvTsD7W6gtFft0Za7vtLEFxJo4TXVOMRwiI5X6zRdv2R1Ic9AJw+2oaTXfoRfzYU79uNZo5Qk36Z1dC8SClqpotZgVPs3a5BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550887; c=relaxed/simple;
	bh=qI/dhwnX8oeoJ26CkEOLYyS6T/AmHURek7vAFs0zHiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FexeIpvY9JovyEO6SBOutTFKAT1MpOA7L0zFn+LouARq9m/zwwz8GA5PBsh23dMCBeXJVnm9m/DdjB+CoG3uOVuTekWYkYuluTBA1UDAl5ZkVEWMsYIdRE82aZQVImg3M+xeY7F4xOxf0XhJvurNLZ/4E7/XJxnEWrcUK/r9AU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvIRHdu1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340FFC4CEE0;
	Wed, 22 Jan 2025 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737550886;
	bh=qI/dhwnX8oeoJ26CkEOLYyS6T/AmHURek7vAFs0zHiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gvIRHdu1uCUfeBkP8eEK97LgwN91CeFfl+6K1xRIHAKMG13OajL/93E9HlhGr5Mse
	 YuDYABLMShYJ5I58+s+XukF8pcG/60nz6c0RDypijDO+N3F3Snc1GAdX1G+4EgqzMO
	 aXc4PrEHErTWsBEbUX4Se00yztY1j+LxigsVcLwhqge435dFRozSZ5jn/4jXNyQAzS
	 vMkPv97yYVJ8yarqRK5HGQc8+goAs/8MnXA+tlOScI4vAzftqUlcQo6jH9xErCiN+C
	 YN4qr3Z/BlgaQKPo1U9F8OVd+rwK58ID5Vo1YdEjmtQdIQcLfVxBCQfaTevs/XDNeY
	 0WvstIBQla0dw==
Message-ID: <93377e21-ec42-4e67-a650-86809d04b350@kernel.org>
Date: Wed, 22 Jan 2025 14:01:22 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: renesas: add initial support for MYIR Remi Pi
To: Julien Massot <julien.massot@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com>
 <20250122-myir-remi-pi-v1-2-0e44e1cb8a90@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250122-myir-remi-pi-v1-2-0e44e1cb8a90@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/01/2025 13:56, Julien Massot wrote:
> Add basic support for the MyIR Remi Pi (based on r9a07g044l2):
>  - UART
>  - i2c
>  - emmc
>  - USB host
>  - HDMI output
>  - Ethernet
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  arch/arm64/boot/dts/renesas/Makefile               |   1 +
>  .../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts | 420 +++++++++++++++++++++
>  2 files changed, 421 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 97228a3cb99c163d299b508ee7653aafea3d1a3a..0b69bcfa405b69c26e8072d9b62be98dc621f89a 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -130,6 +130,7 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
>  dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
>  r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
>  dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
> +dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-remi-pi.dtb

Why not keeping the order? Or is there no order at all?

>  
>  dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
>  dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6e00afc5f5b2347f139ec4dc145fac6fd39e75d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
> @@ -0,0 +1,420 @@
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
> +	model = "MYIR Tech Limited Remi Pi MYB-YG2LX-REMI";
> +	compatible = "myir,remi-pi", "renesas,r9a07g044l2", "renesas,r9a07g044";
> +
> +	aliases {
> +		ethernet0 = &eth0;
> +		ethernet1 = &eth1;
> +
> +		serial0 = &scif0;
> +		serial1 = &scif1;
> +		serial2 = &scif2;
> +		serial3 = &scif3;
> +
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +
> +		mmc0 = &sdhi0;
> +		mmc1 = &sdhi1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@48000000 {
> +		device_type = "memory";
> +		/* first 128MB is reserved for secure area. */
> +		reg = <0x0 0x48000000 0x0 0x38000000>;
> +	};
> +
> +	reg_5p0v: regulator-reg_5p0v {

No underscores in node names.

> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-5.0V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +


...

> +
> +&eth0 {
> +	pinctrl-0 = <&eth0_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	phy0: ethernet-phy@4 {
> +		compatible = "ethernet-phy-id0022.1640",
> +			     "ethernet-phy-ieee802.3-c22";
> +		reg = <4>;
> +		interrupts-extended = <&pinctrl RZG2L_GPIO(44, 2) IRQ_TYPE_LEVEL_LOW>;
> +		rxc-skew-psec = <2400>;
> +		txc-skew-psec = <2400>;
> +		rxdv-skew-psec = <0>;
> +		txdv-skew-psec = <0>;
> +		rxd0-skew-psec = <0>;
> +		rxd1-skew-psec = <0>;
> +		rxd2-skew-psec = <0>;
> +		rxd3-skew-psec = <0>;
> +		txd0-skew-psec = <0>;
> +		txd1-skew-psec = <0>;
> +		txd2-skew-psec = <0>;
> +		txd3-skew-psec = <0>;
> +	};
> +};
> +
> +&eth1 {
> +	pinctrl-0 = <&eth1_pins>;
> +	pinctrl-names = "default";
> +	phy-handle = <&phy1>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	phy1: ethernet-phy@6 {
> +		compatible = "ethernet-phy-id0022.1640",
> +			     "ethernet-phy-ieee802.3-c22";
> +		reg = <6>;
> +		interrupts-extended = <&pinctrl RZG2L_GPIO(43, 2) IRQ_TYPE_LEVEL_LOW>;
> +		rxc-skew-psec = <2400>;
> +		txc-skew-psec = <2400>;
> +		rxdv-skew-psec = <0>;
> +		txdv-skew-psec = <0>;
> +		rxd0-skew-psec = <0>;
> +		rxd1-skew-psec = <0>;
> +		rxd2-skew-psec = <0>;
> +		rxd3-skew-psec = <0>;
> +		txd0-skew-psec = <0>;
> +		txd1-skew-psec = <0>;
> +		txd2-skew-psec = <0>;
> +		txd3-skew-psec = <0>;


At least some properties above do not exist. You cannot use them.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.


Best regards,
Krzysztof

