Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1403E4595E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 21:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbhKVUJQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 15:09:16 -0500
Received: from mxout04.lancloud.ru ([45.84.86.114]:56166 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhKVUJP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 15:09:15 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 3B336208AFD1
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <09b5b453-ed88-8359-4145-a5ec981069e6@omp.ru>
Date:   Mon, 22 Nov 2021 23:05:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] arm64: dts: renesas: rzg2l-smarc-som: Enable serial
 NOR flash
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20211121234906.9602-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211121234906.9602-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22.11.2021 2:49, Lad Prabhakar wrote:

> Enable mt25qu512a flash connected to QSPI0.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2
> -> Renamed qspi_pins0 to qspi0_pins
> ---
>   .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> index 7e84a29dddfa..aef1b8736732 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> @@ -178,6 +178,18 @@
>   		line-name = "gpio_sd0_pwr_en";
>   	};
>   
> +	qspi0_pins: qspi0 {
> +		qspi0-data {
> +			pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3";
> +			power-source  = <1800>;

    Hrm, sorry for more nitpicking... Why 2 spaces before =?

> +		};
> +
> +		qspi0-ctrl {
> +			pins = "QSPI0_SPCLK", "QSPI0_SSL", "QSPI_RESET#";
> +			power-source  = <1800>;

    Here as well...

> +		};
> +	};
> +
>   	/*
>   	 * SD0 device selection is XOR between GPIO_SD0_DEV_SEL and SW1[2]
>   	 * The below switch logic can be used to select the device between
[...]

MBR, Sergey

