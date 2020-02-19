Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23BE01642DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 12:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgBSLDJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 06:03:09 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:28420 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgBSLDJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 06:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582110188;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=IWvmnV5BLvLTudQgVxr7AEJRhxyXYx62Xcs/V0mTJVI=;
        b=AfJkYVv4qUGkQO943qpamJraV5WTBbx/mHDBfIEg85NlPD127De8NaBE+K+U1ZSAPe
        UmctUEpTVEGSXYjsNm0yrsov117Ye7cBTJRy1DLG32hePpJ9MXjST0jnhmU8SapmqqwW
        YbTC8vEd990d7yFCI1sTP8g5y37G9zND7AdKVtyplWVxRCCVUwKpfhuwfQHYBLdLkCT1
        bjiNk+jpPBZMy1P28pGevfgq9JS/2mSu4a/7olgDcNUAZqiUS2xDNQ5GZ+MM6z8t4rjs
        NxtHr4Lks6U5rCwRbGamzC+qALCcc99sVe+WBYjzwBmNyVpM97zGi1EfsQ3Yz+GaKA5F
        jsZA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x64iFM="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.1.12 AUTH)
        with ESMTPSA id L09b9cw1JB0662z
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 19 Feb 2020 12:00:06 +0100 (CET)
Date:   Wed, 19 Feb 2020 12:00:06 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Message-ID: <465772718.273222.1582110006831@webmail.strato.com>
In-Reply-To: <20200218133019.22299-4-geert+renesas@glider.be>
References: <20200218133019.22299-1-geert+renesas@glider.be>
 <20200218133019.22299-4-geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: rcar-gen3: Add reset
 control properties for display
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev26
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On February 18, 2020 at 2:30 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> Add reset control properties to the device nodes for the Display Units
> on all supported R-Car Gen3 SoCs.  Note that on these SoCs, there is
> only a single reset for each pair of DU channels.
> 
> The display nodes on R-Car V3M and V3H already had "resets" properties,
> but lacked the corresponding "reset-names" properties.
> 
> Join the clocks lines while at it, to increase uniformity.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Use "du.0" resp. "du.2" instead of "du.0-1" resp. "du.2-3",
>   - Drop LVDS reset, as LVDS is now a separate node,
>   - Add other R-Car Gen3 SoCs.
> ---
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 8 ++++----
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 5 +++--
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 5 +++--
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 1 +
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 1 +
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 3 +--
>  7 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> index 27cbe697490c7c78..52229546454c400a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -3177,11 +3177,11 @@
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>,
> -				 <&cpg CPG_MOD 722>,
> -				 <&cpg CPG_MOD 721>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> +				 <&cpg CPG_MOD 722>, <&cpg CPG_MOD 721>;
>  			clock-names = "du.0", "du.1", "du.2", "du.3";
> +			resets = <&cpg 724>, <&cpg 722>;
> +			reset-names = "du.0", "du.2";
>  
>  			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
>  			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>,
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> index ea03b91bdf9d9cbc..31282367d3acd8cf 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2827,10 +2827,11 @@
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>,
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
>  				 <&cpg CPG_MOD 722>;
>  			clock-names = "du.0", "du.1", "du.2";
> +			resets = <&cpg 724>, <&cpg 722>;
> +			reset-names = "du.0", "du.2";
>  
>  			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>;
>  			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 1a20ebe9ea5be5da..f7468822e81e41d6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2503,10 +2503,11 @@
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>,
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
>  				 <&cpg CPG_MOD 721>;
>  			clock-names = "du.0", "du.1", "du.3";
> +			resets = <&cpg 724>, <&cpg 722>;
> +			reset-names = "du.0", "du.3";
>  
>  			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm3>;
>  			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index dbf1c677dbc6e51f..a009c0ebc8b4f8d0 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -1121,6 +1121,7 @@
>  			clock-names = "du.0";
>  			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
>  			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			renesas,vsps = <&vspd0 0>;
>  
>  			status = "disabled";
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> index 9444347e61eb881d..e01b0508a18fa91a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -1491,6 +1491,7 @@
>  			clock-names = "du.0";
>  			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
>  			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			renesas,vsps = <&vspd0 0>;
>  
>  			status = "disabled";
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index c05ee98043b2c7a5..0ad20b78e6eb62fd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1793,8 +1793,7 @@
>  			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
>  			resets = <&cpg 724>;
>  			reset-names = "du.0";
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 7d3102dccac96e42..e8d2290fe79d761a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1026,8 +1026,7 @@
>  			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
>  			resets = <&cpg 724>;
>  			reset-names = "du.0";
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
