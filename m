Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE5B7B0370
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Sep 2019 20:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729696AbfIKSQj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 14:16:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39038 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbfIKSQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 14:16:38 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12CAF33A;
        Wed, 11 Sep 2019 20:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568225794;
        bh=JfpGD2XNiEa10BL3XOxANjHOBAWNgeYUpaG4a1nT5DE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UI9VUa5RllbdIR74yOCe1OB9vro99OvGpZOoi/EHeJMBcE89VKWbhMne7INCXjeOR
         1fAOnNq+uoXtBhara3HrI4o54azlU02XxJ9/XZpqdr82+2SVrKEkVdY5K4P23nlhEg
         590h1mvTLBmD/rC+p2yoGxrY9/gHbAtxy71mTW90=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 9/9] arm64: dts: renesas: Add CMM units to Gen3 SoCs
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com,
        muroya@ksk.co.jp, Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-10-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <49012496-1a6e-d62c-2882-45ed8aeb88f7@ideasonboard.com>
Date:   Wed, 11 Sep 2019 19:16:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-10-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 06/09/2019 14:54, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car Gen3 SoC that support it, and reference them
> from the Display Unit they are connected to.
> 
> Sort the 'vsps' and 'renesas,cmm' entries in the DU unit consistently
> in all the involved DTS.

I think if you chose the ordering in the r8a7795, then you only have to
adjust/correct the ordering in the r8a7796 and r8a77965 ...

Especially as you haven't changed the ordering of r8a77970, and r8a77980
which have the status after the vsps entry.


> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 40 ++++++++++++++++++++++-
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 28 ++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 28 ++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 22 ++++++++++++-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 22 ++++++++++++-
>  5 files changed, 137 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 6675462f7585..67c242a447bc 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -2939,6 +2939,42 @@
>  			iommus = <&ipmmu_vi1 10>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,r8a7795-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,r8a7795-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm2: cmm@fea60000 {
> +			compatible = "renesas,r8a7795-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea60000 0 0x1000>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 709>;
> +			resets = <&cpg 709>;
> +		};
> +
> +		cmm3: cmm@fea70000 {
> +			compatible = "renesas,r8a7795-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea70000 0 0x1000>;
> +			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 708>;
> +			resets = <&cpg 708>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			compatible = "renesas,r8a7795-csi2";
>  			reg = <0 0xfea80000 0 0x10000>;
> @@ -3142,9 +3178,11 @@
>  				 <&cpg CPG_MOD 722>,
>  				 <&cpg CPG_MOD 721>;
>  			clock-names = "du.0", "du.1", "du.2", "du.3";
> -			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
>  			status = "disabled";

I'm not sure the vsps should be below the status = disabled line.

I'd have this as:

	clock-names...
	vsps...
	renesas,cmms...
		<blank line>
	status...
		<blank line>
	ports...

>  
> +			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> +			renesas,cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;

I think these should be separated by comma's to show they are separate
references, or references to separate phandles or such.

The only precedence I could find was in pmu_a53:

          interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;


> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 822c96601d3c..837c3b2da773 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -2641,6 +2641,33 @@
>  			renesas,fcp = <&fcpvi0>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,r8a7796-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,r8a7796-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm2: cmm@fea60000 {
> +			compatible = "renesas,r8a7796-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea60000 0 0x1000>;
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 709>;
> +			resets = <&cpg 709>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			compatible = "renesas,r8a7796-csi2";
>  			reg = <0 0xfea80000 0 0x10000>;
> @@ -2794,6 +2821,7 @@
>  			status = "disabled";
>  
>  			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> +			renesas,cmms = <&cmm0 &cmm1 &cmm2>;

Aha, yes, I'd move this vsps rather than the one at r8a7795, which I'd
consider to be more 'correct'.


>  
>  			ports {
>  				#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 4ae163220f60..c7635e8b261c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> @@ -2320,6 +2320,33 @@
>  			resets = <&cpg 611>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,r8a77965-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,r8a77965-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			resets = <&cpg 710>;
> +		};
> +
> +		cmm3: cmm@fea70000 {
> +			compatible = "renesas,r8a77965-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea70000 0 0x1000>;
> +			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 708>;
> +			resets = <&cpg 708>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			compatible = "renesas,r8a77965-csi2";
>  			reg = <0 0xfea80000 0 0x10000>;
> @@ -2470,6 +2497,7 @@
>  			status = "disabled";
>  
>  			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> +			renesas,cmms = <&cmm0 &cmm1 &cmm3>;

Again, I'd consider this the wrong sort order, due to the status'
importance. I wouldn't hide it in the middle.

>  
>  			ports {
>  				#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 455954c3d98e..5e3d758a033f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1727,6 +1727,24 @@
>  			iommus = <&ipmmu_vi0 9>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,r8a77990-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,r8a77990-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			resets = <&cpg 710>;
> +		};
> +
>  		csi40: csi2@feaa0000 {
>  			compatible = "renesas,r8a77990-csi2";
>  			reg = <0 0xfeaa0000 0 0x10000>;
> @@ -1768,9 +1786,11 @@
>  			clock-names = "du.0", "du.1";
>  			resets = <&cpg 724>;
>  			reset-names = "du.0";
> -			vsps = <&vspd0 0>, <&vspd1 0>;
>  			status = "disabled";
>  
> +			vsps = <&vspd0 0>, <&vspd1 0>;
> +			renesas,cmms = <&cmm0 &cmm1>;


Same ... :D

> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 183fef86cf7c..6838a81f5caa 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -993,6 +993,24 @@
>  			iommus = <&ipmmu_vi0 9>;
>  		};
>  
> +		cmm0: cmm@fea40000 {
> +			compatible = "renesas,r8a77995-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea40000 0 0x1000>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 711>;
> +			resets = <&cpg 711>;
> +		};
> +
> +		cmm1: cmm@fea50000 {
> +			compatible = "renesas,r8a77995-cmm",
> +				     "renesas,rcar-gen3-cmm";
> +			reg = <0 0xfea50000 0 0x1000>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 710>;
> +			resets = <&cpg 710>;
> +		};
> +
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a77995";
>  			reg = <0 0xfeb00000 0 0x40000>;
> @@ -1003,9 +1021,11 @@
>  			clock-names = "du.0", "du.1";
>  			resets = <&cpg 724>;
>  			reset-names = "du.0";
> -			vsps = <&vspd0 0>, <&vspd1 0>;
>  			status = "disabled";
>  
> +			vsps = <&vspd0 0>, <&vspd1 0>;
> +			renesas,cmms = <&cmm0 &cmm1>;
> +

Same.

>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> 

