Return-Path: <linux-renesas-soc+bounces-19279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45233AFA36E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 09:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81DCD189B236
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 07:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A0B155CBD;
	Sun,  6 Jul 2025 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwI9EOXV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F04E610D
	for <linux-renesas-soc@vger.kernel.org>; Sun,  6 Jul 2025 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751786807; cv=none; b=NOSng/mz7SeZdMcIEPlMtloGahxkh8RYnPosS+WdhOvAwNl79SGXbhGkboAR3qqDTvrlsot8o9XF75zZf326DQlvsIPtxhqLi4Jdy3X5OQiNDoRtF3a8gjRsuhMeuMyCONJumpHlU3HahZB5YzCUx/FteMy242x0L4Bgv1umnIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751786807; c=relaxed/simple;
	bh=gMridhOgjO5690S/7L342g7F68++JsLyl7s7mchRxl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYd288NAetAR+lF5kOev3d3xvLhOyZyI/WNOAuFBrtzT9qRNnf8hF3Jy6wZ45Z1T01SQmoISmOjgA4EFTFHFfgK0vYFjsRhTAbxUvofga9pgX3iUQqMgTosQPtGTDdKk4SkQIdXUtTqml4RWl5s1hDpp3M8od+tQkK0xy7Wy5qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwI9EOXV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B5EC4CEEE;
	Sun,  6 Jul 2025 07:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751786806;
	bh=gMridhOgjO5690S/7L342g7F68++JsLyl7s7mchRxl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MwI9EOXVSc69Q6ElLmSj7XC6kqmgmBXWPKiWlg/UITSefCWcTVx1o0FSlYkPWe6wh
	 +hRKi/Dlm5JbCa+5fnefqJ8dWeN7WyuTiMXfU12llCmUd/78dmK7aCL6YDJPk62Hq5
	 cY2mqhv5VZQAGwiBN1dCL8SVWEaMCvHoj1a5Rs6f80vj4A+xhb/wK0CZRmnDM7cnRB
	 8L42MbWVcobqWGopXOBHw0qftIkXxJmKj9pIWcJN6bnlSoHEVajCpIMU+Hfa1IODV4
	 P6u2Q/EOA5UwY3YpMAIuv508ZMkme2NvLfrTC1o1pU2nzf3x7xqEJAxkarEQOhhFEX
	 zU2yw/nJO71YQ==
Message-ID: <aa0df92a-2624-4879-a573-7eaa33231554@kernel.org>
Date: Sun, 6 Jul 2025 09:26:42 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ARM: dts: renesas: rza2mbtc: initial board support
To: Magnus Damm <damm@opensource.se>, linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com, geert+renesas@glider.be
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
 <175174256950.83411.5319298494550248866.sendpatchset@1.0.0.127.in-addr.arpa>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <175174256950.83411.5319298494550248866.sendpatchset@1.0.0.127.in-addr.arpa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/07/2025 21:09, Magnus Damm wrote:
> From: Magnus Damm <damm@opensource.se>
> 
> Add initial support for the RZA2MBTC board which is based on the RZ/A2M by
> Renesas Electronics. Included in this patch are DTS nodes for serial console,
> on-board SPI flash as well as RMII Ethernet.
> 
> Signed-off-by: Magnus Damm <damm@opensource.se>
> ---
> 
>  Applies to next-20250704
> 
>  arch/arm/boot/dts/renesas/Makefile                  |    1 
>  work/arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dts |  133 +++++++++++++++++++
>  2 files changed, 134 insertions(+)
>  
> --- 0006/arch/arm/boot/dts/renesas/Makefile
> +++ work/arch/arm/boot/dts/renesas/Makefile	2025-07-05 22:03:46.456578459 +0900
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
>  	r7s72100-gr-peach.dtb \
>  	r7s72100-rskrza1.dtb \
>  	r7s9210-gr-mango.dtb \
> +	r7s9210-rza2mbtc.dtb \
>  	r7s9210-rza2mevb.dtb \
>  	r8a73a4-ape6evm.dtb \
>  	r8a7740-armadillo800eva.dtb \
> --- /dev/null
> +++ work/arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dts	2025-07-05 22:03:21.996442287 +0900
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZ/A2M BTC board
> + *
> + * Based on RZA2MEVB, Copyright (C) 2018 Renesas Electronics
> + */
> +
> +/dts-v1/;
> +#include "r7s9210.dtsi"
> +#include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
> +
> +/ {
> +	model = "RZA2MBTC";
> +	compatible = "aprg,rza2mbtc", "renesas,r7s9210";
> +
> +	aliases {
> +		serial0 = &scif1;
> +		spi0 = &rpc0;
> +	};
> +
> +	chosen {
> +		bootargs = "ignore_loglevel";
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&extal_clk {
> +	clock-frequency = <24000000>; /* EXTAL: Y2: ECS-240-8-47B-7KM-TR (24MHz) */
> +};
> +
> +&ostm0 {
> +	status = "okay";
> +};
> +
> +&ostm1 {
> +	status = "okay";
> +};
> +
> +&rpc0 {
> +	status = "okay";
> +
> +	flash0: spi-flash@0 {

That's just flash@0

> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "jedec,spi-nor";

Follow DTS coding style - read about property order.

> +		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <1>;
> +		spi-rx-bus-width = <1>;
> +		reg = <0>;
> +


Best regards,
Krzysztof

