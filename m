Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F77797578
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfHUI5Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:57:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41236 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbfHUI5Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:57:16 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ABD3225B7C7;
        Wed, 21 Aug 2019 18:57:13 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8FF6F9405AE; Wed, 21 Aug 2019 10:57:11 +0200 (CEST)
Date:   Wed, 21 Aug 2019 10:57:11 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: sort nodes
Message-ID: <20190821085710.ywva3oz733hxagnc@verge.net.au>
References: <1566219378-23126-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566219378-23126-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 09:56:18PM +0900, Yoshihiro Kaneko wrote:
> Sort nodes.
> 
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
> 
> This should not have any run-time effect.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Sorry, I feel that I have missed this in other review's too,
but, isn't canfd out of order. Its bus address seems to place it
before dmac0. Or do we prefer to keep it grouped with the can nodes?

The above notwithstanding,

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> This patch is based on the master branch of Geert Uytterhoeven's renesas-devel
> tree.
> 
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 152 +++++++++++++++----------------
>  1 file changed, 76 insertions(+), 76 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 26df5b8..3dc9d73 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -1833,6 +1833,17 @@
>  				      "ssi.1", "ssi.0";
>  			status = "disabled";
>  
> +			rcar_sound,ctu {
> +				ctu00: ctu-0 { };
> +				ctu01: ctu-1 { };
> +				ctu02: ctu-2 { };
> +				ctu03: ctu-3 { };
> +				ctu10: ctu-4 { };
> +				ctu11: ctu-5 { };
> +				ctu12: ctu-6 { };
> +				ctu13: ctu-7 { };
> +			};
> +
>  			rcar_sound,dvc {
>  				dvc0: dvc-0 {
>  					dmas = <&audma1 0xbc>;
> @@ -1849,17 +1860,6 @@
>  				mix1: mix-1 { };
>  			};
>  
> -			rcar_sound,ctu {
> -				ctu00: ctu-0 { };
> -				ctu01: ctu-1 { };
> -				ctu02: ctu-2 { };
> -				ctu03: ctu-3 { };
> -				ctu10: ctu-4 { };
> -				ctu11: ctu-5 { };
> -				ctu12: ctu-6 { };
> -				ctu13: ctu-7 { };
> -			};
> -
>  			rcar_sound,src {
>  				src0: src-0 {
>  					interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1913,6 +1913,59 @@
>  				};
>  			};
>  
> +			rcar_sound,ssi {
> +				ssi0: ssi-0 {
> +					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x01>, <&audma1 0x02>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi1: ssi-1 {
> +					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x03>, <&audma1 0x04>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi2: ssi-2 {
> +					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x05>, <&audma1 0x06>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi3: ssi-3 {
> +					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x07>, <&audma1 0x08>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi4: ssi-4 {
> +					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x09>, <&audma1 0x0a>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi5: ssi-5 {
> +					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x0b>, <&audma1 0x0c>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi6: ssi-6 {
> +					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x0d>, <&audma1 0x0e>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi7: ssi-7 {
> +					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x0f>, <&audma1 0x10>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi8: ssi-8 {
> +					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x11>, <&audma1 0x12>;
> +					dma-names = "rx", "tx";
> +				};
> +				ssi9: ssi-9 {
> +					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +					dmas = <&audma0 0x13>, <&audma1 0x14>;
> +					dma-names = "rx", "tx";
> +				};
> +			};
> +
>  			rcar_sound,ssiu {
>  				ssiu00: ssiu-0 {
>  					dmas = <&audma0 0x15>, <&audma1 0x16>;
> @@ -2123,59 +2176,6 @@
>  					dma-names = "rx", "tx";
>  				};
>  			};
> -
> -			rcar_sound,ssi {
> -				ssi0: ssi-0 {
> -					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x01>, <&audma1 0x02>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi1: ssi-1 {
> -					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x03>, <&audma1 0x04>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi2: ssi-2 {
> -					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x05>, <&audma1 0x06>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi3: ssi-3 {
> -					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x07>, <&audma1 0x08>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi4: ssi-4 {
> -					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x09>, <&audma1 0x0a>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi5: ssi-5 {
> -					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x0b>, <&audma1 0x0c>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi6: ssi-6 {
> -					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x0d>, <&audma1 0x0e>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi7: ssi-7 {
> -					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x0f>, <&audma1 0x10>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi8: ssi-8 {
> -					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x11>, <&audma1 0x12>;
> -					dma-names = "rx", "tx";
> -				};
> -				ssi9: ssi-9 {
> -					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> -					dmas = <&audma0 0x13>, <&audma1 0x14>;
> -					dma-names = "rx", "tx";
> -				};
> -			};
>  		};
>  
>  		audma0: dma-controller@ec700000 {
> @@ -2860,6 +2860,18 @@
>  			thermal-sensors = <&tsc 2>;
>  			sustainable-power = <3874>;
>  
> +			cooling-maps {
> +				map0 {
> +					trip = <&target>;
> +					cooling-device = <&a57_0 2 4>;
> +					contribution = <1024>;
> +				};
> +				map1 {
> +					trip = <&target>;
> +					cooling-device = <&a53_0 0 2>;
> +					contribution = <1024>;
> +				};
> +			};
>  			trips {
>  				target: trip-point1 {
>  					temperature = <100000>;
> @@ -2873,18 +2885,6 @@
>  					type = "critical";
>  				};
>  			};
> -			cooling-maps {
> -				map0 {
> -					trip = <&target>;
> -					cooling-device = <&a57_0 2 4>;
> -					contribution = <1024>;
> -				};
> -				map1 {
> -					trip = <&target>;
> -					cooling-device = <&a53_0 0 2>;
> -					contribution = <1024>;
> -				};
> -			};
>  		};
>  	};
>  
> -- 
> 1.9.1
> 
