Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F93D76DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 14:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfJOMwi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 08:52:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55110 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfJOMwi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 08:52:38 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC79C324;
        Tue, 15 Oct 2019 14:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571143953;
        bh=1aKucOk2h/oCtJg0twcZEVkJejTDtUaSm4RIl8SFyhY=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=phbd9OHrGyuMR+WYkIeQn53m/2Vrx7R77hYqQYrQjf5shQgFMf4HwA4pY/1VOAMVt
         aH1bEEJ5cSWtU04qj/rgneEUg59HZaJlSuRX6ICd2TpwO1oA8kf/CIn+IyKz/cl2yp
         GITrapsoaHJ9DVuYDOFbWSFTIYjMiaMkgssMnJ34=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v5 7/8] arm64: dts: renesas: Add CMM units to Gen3 SoCs
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com,
        muroya@ksk.co.jp, Harsha.ManjulaMallikarjun@in.bosch.com,
        ezequiel@collabora.com, seanpaul@chromium.org,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20191015104621.62514-8-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <84f7b344-6a3a-edcc-3f3d-588825516bc2@ideasonboard.com>
Date:   Tue, 15 Oct 2019 13:52:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015104621.62514-8-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 15/10/2019 11:46, Jacopo Mondi wrote:
> Add CMM units to Renesas R-Car Gen3 SoC that support it, and reference them
> from the Display Unit they are connected to.
> 
> Sort the 'vsps', 'renesas,cmm' and 'status' properties in the DU unit
> consistently in all the involved DTS.
> 

Going through this, I think I'm happy, except for a 'future' gotcha
detailed below.

The H3-N is possibly going to cause some issues (not
supporting/connecting/using the CMM2) ... but as we don't really have
that yet ... I'm going to say "la la la " ... and put this here:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 39 +++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 31 +++++++++++++++++-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 31 +++++++++++++++++-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 21 ++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 21 ++++++++++++
>  5 files changed, 141 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 6675462f7585..e16757af8c27 100644
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

Yeouch. CMM2 is not available on the H3-N - but as far as I can tell the
H3-N is an R8A7795 ...

Geert, How will we differentiate this, or perhaps it just won't matter.

The key part here will be handling it in the DU perhaps anyway.


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
> @@ -3142,7 +3178,10 @@
>  				 <&cpg CPG_MOD 722>,
>  				 <&cpg CPG_MOD 721>;
>  			clock-names = "du.0", "du.1", "du.2", "du.3";
> +
> +			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
>  			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> +
>  			status = "disabled";
> 
>  			ports {
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 822c96601d3c..597c47f3f994 100644
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
> @@ -2791,10 +2818,12 @@
>  				 <&cpg CPG_MOD 723>,
>  				 <&cpg CPG_MOD 722>;
>  			clock-names = "du.0", "du.1", "du.2";
> -			status = "disabled";
> 
> +			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>;
>  			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> 
> +			status = "disabled";
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> index 4ae163220f60..c3da8d26ccba 100644
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
> @@ -2467,10 +2494,12 @@
>  				 <&cpg CPG_MOD 723>,
>  				 <&cpg CPG_MOD 721>;
>  			clock-names = "du.0", "du.1", "du.3";
> -			status = "disabled";
> 
> +			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm3>;
>  			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> 
> +			status = "disabled";
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 455954c3d98e..bab9b7f96c72 100644
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
> @@ -1768,7 +1786,10 @@
>  			clock-names = "du.0", "du.1";
>  			resets = <&cpg 724>;
>  			reset-names = "du.0";
> +
> +			renesas,cmms = <&cmm0>, <&cmm1>;
>  			vsps = <&vspd0 0>, <&vspd1 0>;
> +
>  			status = "disabled";
> 
>  			ports {
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 183fef86cf7c..871c70cc2d2e 100644
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
> @@ -1003,7 +1021,10 @@
>  			clock-names = "du.0", "du.1";
>  			resets = <&cpg 724>;
>  			reset-names = "du.0";
> +
> +			renesas,cmms = <&cmm0>, <&cmm1>;
>  			vsps = <&vspd0 0>, <&vspd1 0>;
> +
>  			status = "disabled";
> 
>  			ports {
> --
> 2.23.0
> 

