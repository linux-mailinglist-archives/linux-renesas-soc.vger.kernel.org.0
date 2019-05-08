Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5280D17555
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 11:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfEHJnS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 05:43:18 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:46318 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbfEHJnS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 05:43:18 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 15B2925AF6B;
        Wed,  8 May 2019 19:43:16 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 078469403E0; Wed,  8 May 2019 11:43:13 +0200 (CEST)
Date:   Wed, 8 May 2019 11:43:13 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/10] ARM: dts: r7s9210: Add USB Device support
Message-ID: <20190508094313.f7h6b2mwb6ghangp@verge.net.au>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-10-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506234631.113226-10-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 06, 2019 at 06:46:30PM -0500, Chris Brandt wrote:
> Add USB Device support for RZ/A2.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s9210.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
> index 1a992e6197c3..67ac746142d0 100644
> --- a/arch/arm/boot/dts/r7s9210.dtsi
> +++ b/arch/arm/boot/dts/r7s9210.dtsi
> @@ -354,6 +354,18 @@
>  			status = "disabled";
>  		};
>  
> +		usbhs0: usbhs@e8219000 {
> +			compatible = "renesas,usbhs-r7s9210","renesas,rza2-usbhs";

Hi Chris,

please add a space after ",". Likewise below.

Otherwise this patch looks good to me.

> +			reg = <0xe8219000 0x724>;
> +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 61>;
> +			renesas,buswait = <7>;
> +			phys = <&usb2_phy0>;
> +			phy-names = "usb";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +		};
> +
>  		ohci1: usbhcd@e821a000 {
>  			compatible = "generic-ohci";
>  			reg = <0xe821a000 0x100>;
> @@ -386,6 +398,18 @@
>  			status = "disabled";
>  		};
>  
> +		usbhs1: usbhs@e821b000 {
> +			compatible = "renesas,usbhs-r7s9210","renesas,rza2-usbhs";
> +			reg = <0xe821b000 0x724>;
> +			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 60>;
> +			renesas,buswait = <7>;
> +			phys = <&usb2_phy1>;
> +			phy-names = "usb";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +		};
> +
>  		sdhi0: sd@e8228000 {
>  			compatible = "renesas,sdhi-r7s9210";
>  			reg = <0xe8228000 0x8c0>;
> -- 
> 2.16.1
> 
