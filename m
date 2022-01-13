Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A713248D523
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jan 2022 10:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbiAMJq6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jan 2022 04:46:58 -0500
Received: from mxout01.lancloud.ru ([45.84.86.81]:60908 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbiAMJq5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 04:46:57 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 9B3A620D92ED
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [RFC 24/28] arm64: dts: renesas: r9a07g044: Add vspd node
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-25-biju.das.jz@bp.renesas.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <2c4383f4-86cd-f0a3-2480-8e9d5eb8a014@omp.ru>
Date:   Thu, 13 Jan 2022 12:46:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220112174612.10773-25-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 1/12/22 8:46 PM, Biju Das wrote:

> Add vspd node to SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> index 080b4c8af427..9dc407c37976 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -611,6 +611,18 @@
>  			status = "disabled";
>  		};
>  
> +		vspd0: vsp@10870000 {
> +			compatible = "renesas,vsp2-r9a07g044";
> +			reg = <0 0x10870000 0 0x10000>;
> +			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
> +				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
> +				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;

   What about clock-names?

[...]

MBR, Sergey
