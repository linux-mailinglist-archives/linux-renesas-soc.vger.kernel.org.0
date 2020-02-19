Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2DB1642EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 12:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgBSLFu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 06:05:50 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.161]:25583 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbgBSLFu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 06:05:50 -0500
X-Greylist: delayed 335 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Feb 2020 06:05:49 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582110348;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=B88DXd+9oJVeNvSGQP63Mq3oBBVtmlPzdypGUzk65UA=;
        b=si2ZgHDWe/egZ1mcEVEt5ArF02cc/5YNE+/91At1CUBN8VHfOLpyTk2Zv5FRleutEy
        aeKf54SLzYm86mDp1u9zZ9EhiFC1YLMYxrL9QVi1SvmaKZKmMBBWWHmqfvVYMviCOSK9
        oC4BNyQXmr1cQMWb3v+67NkjyucoVifz240rsvEITvPsQuw316j8c/G1R/rDOdplIc/B
        9xKdXZUZeaeoK5f/Jvzz12EKOXv5UdC2dhMApIrNofLtXkG4eH5WF89jhiGiR3FeUa6r
        Wku5UMrY1ZzNJPyYkOtdxPc6ZYiEcXM2r4h0EtEE7zRxb9RJXt7DIlPJSV1kOF++aKOz
        U9jA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x64iFM="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.1.12 AUTH)
        with ESMTPSA id L09b9cw1JAxm62l
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 19 Feb 2020 11:59:48 +0100 (CET)
Date:   Wed, 19 Feb 2020 11:59:48 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Message-ID: <1596455847.273189.1582109988206@webmail.strato.com>
In-Reply-To: <20200218133019.22299-2-geert+renesas@glider.be>
References: <20200218133019.22299-1-geert+renesas@glider.be>
 <20200218133019.22299-2-geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/4] ARM: dts: rcar-gen2: Add reset control
 properties for display
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
> on all supported R-Car Gen2 SoCs.  Note that on these SoCs, there is
> only a single reset for all DU channels.
> 
> Join the clocks lines while at it, to increase uniformity.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  arch/arm/boot/dts/r8a7790.dtsi | 2 ++
>  arch/arm/boot/dts/r8a7791.dtsi | 5 +++--
>  arch/arm/boot/dts/r8a7792.dtsi | 5 +++--
>  arch/arm/boot/dts/r8a7793.dtsi | 5 +++--
>  arch/arm/boot/dts/r8a7794.dtsi | 2 ++
>  5 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
> index 334ba19769b998ac..e5ef9fd4284ae436 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -1719,6 +1719,8 @@
>  			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
>  				 <&cpg CPG_MOD 722>;
>  			clock-names = "du.0", "du.1", "du.2";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index baedfab84cb09134..e38a5f01490d70a1 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -1682,9 +1682,10 @@
>  			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
> index 39af16caa2aef501..4627eefa502b7677 100644
> --- a/arch/arm/boot/dts/r8a7792.dtsi
> +++ b/arch/arm/boot/dts/r8a7792.dtsi
> @@ -852,9 +852,10 @@
>  			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
> index eef035c4d98341b6..dadbda16161b7457 100644
> --- a/arch/arm/boot/dts/r8a7793.dtsi
> +++ b/arch/arm/boot/dts/r8a7793.dtsi
> @@ -1341,9 +1341,10 @@
>  			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			status = "disabled";
>  
>  			ports {
> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
> index 05ef79c6ed7f6b61..2c9e7a1ebfec1863 100644
> --- a/arch/arm/boot/dts/r8a7794.dtsi
> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> @@ -1356,6 +1356,8 @@
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
>  			clock-names = "du.0", "du.1";
> +			resets = <&cpg 724>;
> +			reset-names = "du.0";
>  			status = "disabled";
>  
>  			ports {
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
