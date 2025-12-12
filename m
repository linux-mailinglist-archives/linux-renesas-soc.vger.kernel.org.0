Return-Path: <linux-renesas-soc+bounces-25727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A1ECB9DF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 22:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E26AF30BAFD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 21:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3E3280332;
	Fri, 12 Dec 2025 21:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HLM60RvQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDA2749C9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Dec 2025 21:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765574308; cv=none; b=TE6jg56ZHnTqv85hnfDet0joAvEnuthANzPQFCVJUWwRA1NoZIBLn8WBHiU/KMdg3P5lYPvHE4UeKH7biMmzuKq25Tp3v5xqxyJlXfzxAcz1OT3+hwl6EoE+DEqQ9coVY6RBDEzy5RrIoP9Zd9kbuRIBb6A1JFWF+jpFWh/Yb5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765574308; c=relaxed/simple;
	bh=tAYHHvyBIxwmOn0FXzhxdLKMGuBqvYTxhaHEZdafu6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgsewnN9AWSvpce47Zqfua8DCuhq56wSuX/sxD73VugsFh/TKBrA+QB8hwDhKuc7WnttdQLCfSG3WEBoAjiGeJ/AuWy0ir9esQtTnwF/h9PUyCfCjCpLHhbP1/HRWzJ+BPnw3Z0U8MOLPyPpchgzRTUy+JN/442kUOBT9FgyZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HLM60RvQ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B940AC19369;
	Fri, 12 Dec 2025 21:17:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5843606DF;
	Fri, 12 Dec 2025 21:18:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8B72103C8D89;
	Fri, 12 Dec 2025 22:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765574297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ibpI/8IsPFwa4no7KFk+umJ2AO5xlqf2PVxIa7iLFU0=;
	b=HLM60RvQYesG36vE7JR/5+uLnWRQf4bdIdat8LNhhwn27mZDSoZ2SDj0eyP003231tegvj
	UG5YUjBH8eqeOXuidTBTl7qXnVk2PDVrOM7lwXYo2EWHDHtSkpw5pSN6VgmVs1Cdq9r8oT
	qZzjCAS1Hp3GRbh2BBtJ8S82Y6KOo3hfBw59NXxnpzDVTrfH2keYu4Are0AApWfc4h8X9P
	bFHApOaQx+lRJwgJBy2vU+ElfJrANokMEMwNUedWns8MrHPn0+dKNvDxU8A5bLOS15PSs7
	Yg+gSvPB42p4iufmtmIXanb6veaAfiTuLYRzZgsydV5nftcVOoSQY5Ph4vniMg==
Date: Fri, 12 Dec 2025 22:18:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Message-ID: <20251212211812768361f3@mail.local>
References: <20251212203226.458694-8-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212203226.458694-8-robh@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On 12/12/2025 14:32:14-0600, Rob Herring (Arm) wrote:
> This .dtsi file is not included anywhere in the tree and can't be
> tested.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  .../boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 93 -------------------
>  1 file changed, 93 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
> 
> diff --git a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
> deleted file mode 100644
> index 5b1d80c0ab26..000000000000
> --- a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * calao-dab-mmx.dtsi - Device Tree Include file for Calao DAB-MMX Daughter Board
> - *
> - * Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> - */
> -
> -/ {
> -	ahb {
> -		apb {
> -			usart1: serial@fffb4000 {
> -				status = "okay";
> -			};
> -
> -			usart3: serial@fffd0000 {
> -				status = "okay";
> -			};
> -		};
> -	};
> -
> -	i2c-gpio@0 {
> -		status = "okay";
> -	};
> -
> -	leds {
> -		compatible = "gpio-leds";
> -
> -		user_led1 {
> -			label = "user_led1";
> -			gpios = <&pioB 20 GPIO_ACTIVE_LOW>;
> -		};
> -
> -/*
> -* led already used by mother board but active as high
> -*		user_led2 {
> -*			label = "user_led2";
> -*			gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
> -*		};
> -*/
> -		user_led3 {
> -			label = "user_led3";
> -			gpios = <&pioB 22 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		user_led4 {
> -			label = "user_led4";
> -			gpios = <&pioB 23 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		red {
> -			label = "red";
> -			gpios = <&pioB 24 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		orange {
> -			label = "orange";
> -			gpios = <&pioB 30 GPIO_ACTIVE_LOW>;
> -		};
> -
> -		green {
> -			label = "green";
> -			gpios = <&pioB 31 GPIO_ACTIVE_LOW>;
> -		};
> -	};
> -
> -	gpio_keys {
> -		compatible = "gpio-keys";
> -
> -		button-user-pb1 {
> -			label = "user_pb1";
> -			gpios = <&pioB 25 GPIO_ACTIVE_LOW>;
> -			linux,code = <0x100>;
> -		};
> -
> -		button-user-pb2 {
> -			label = "user_pb2";
> -			gpios = <&pioB 13 GPIO_ACTIVE_LOW>;
> -			linux,code = <0x101>;
> -		};
> -
> -		button-user-pb3 {
> -			label = "user_pb3";
> -			gpios = <&pioA 26 GPIO_ACTIVE_LOW>;
> -			linux,code = <0x102>;
> -		};
> -
> -		button-user-pb4 {
> -			label = "user_pb4";
> -			gpios = <&pioC 9 GPIO_ACTIVE_LOW>;
> -			linux,code = <0x103>;
> -		};
> -	};
> -};
> -- 
> 2.51.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

