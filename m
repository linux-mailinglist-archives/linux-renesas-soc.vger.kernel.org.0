Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC5141C2C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Sep 2021 12:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240521AbhI2KfV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Sep 2021 06:35:21 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:53258 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbhI2KfV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 06:35:21 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 9AA5720F3A21
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 4/4] arm64: dts: renesas: falcon-cpu: add SPI flash via
 RPC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-renesas-soc@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>
References: <20210929064924.1997-1-wsa+renesas@sang-engineering.com>
 <20210929064924.1997-5-wsa+renesas@sang-engineering.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <bba2d698-8afb-9ba0-a72a-ded58c7ffd82@omp.ru>
Date:   Wed, 29 Sep 2021 13:33:27 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210929064924.1997-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 29.09.2021 9:49, Wolfram Sang wrote:

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> index a0a1a1da0d87..7eeee1da9c0b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
[...]
> @@ -177,6 +182,34 @@ scif_clk_pins: scif_clk {
>   	};
>   };
>   
> +&rpc {
> +	pinctrl-0 = <&qspi0_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "spansion,s25fs512s", "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +		spi-rx-bus-width = <4>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			boot_partition@0 {

    Not just boot@...? And hyphens are preferred here over underscores.

> +				reg = <0x00000000 0xc40000>;
> +				read-only;
> +			};
> +			user@c40000 {
> +				reg = <0x00c40000 0x33c0000>;
> +			};
> +		};
> +	};
> +};
> +
[...]

MBR, Sergey
