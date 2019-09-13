Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65679B1BBB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 12:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387584AbfIMKtN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 06:49:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49034 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387424AbfIMKtN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 06:49:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8B99C25AEB1;
        Fri, 13 Sep 2019 20:49:11 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 79498940513; Fri, 13 Sep 2019 12:49:09 +0200 (CEST)
Date:   Fri, 13 Sep 2019 12:49:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0: Create thermal zone
 to support IPA
Message-ID: <20190913104909.toczyywsofv4s577@verge.net.au>
References: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568364608-46548-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 13, 2019 at 09:50:07AM +0100, Biju Das wrote:
> Setup a thermal zone driven by SoC temperature sensor.
> Create passive trip points and bind them to CPUFreq cooling
> device that supports power extension.
> 
> Based on the work done by Dien Pham <dien.pham.ry@renesas.com>
> and others for r8a77990 SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index a1c2de9..764df4c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -73,6 +73,7 @@
>  			compatible = "arm,cortex-a53";
>  			reg = <0>;
>  			device_type = "cpu";
> +			#cooling-cells = <2>;
>  			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
>  			next-level-cache = <&L2_CA53>;
>  			enable-method = "psci";
> @@ -1905,18 +1906,30 @@
>  	thermal-zones {
>  		cpu-thermal {
>  			polling-delay-passive = <250>;
> -			polling-delay = <1000>;
> -			thermal-sensors = <&thermal>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&thermal 0>;
> +			sustainable-power = <717>;
>  
>  			cooling-maps {
> +				map0 {
> +					trip = <&target>;
> +					cooling-device = <&a53_0 0 2>;
> +					contribution = <1024>;
> +				};
>  			};
>  
>  			trips {
> -				cpu-crit {
> +				sensor1_crit: sensor1-crit {
>  					temperature = <120000>;
>  					hysteresis = <2000>;
>  					type = "critical";
>  				};
> +
> +				target: trip-point1 {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
>  			};
>  		};
>  	};
> -- 
> 2.7.4
> 
