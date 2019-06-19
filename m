Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C71D94B8DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731646AbfFSMlv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:41:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40126 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbfFSMlu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:41:50 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96900333;
        Wed, 19 Jun 2019 14:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560948108;
        bh=/dEXpi1xLQ09x5mFPIohBIlM8PvkddORBA1J5lDxgvw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=baunCIxyrdjt8Np7Lz8tRHad9eiwKRB19Cb0f1EY3KGNDkOEl8ZO8mOv9Y6rLDXyU
         gVZJOSprz/JTgFZbFV+OwMYmAVvZS1fMGsVg10XY/vjrlaYX+9Q2BRy3ZRpNjYfgD5
         0MIin47Wp5/5HzrcMvI8PeR72ik8K4OJ7bFR4gfg=
Date:   Wed, 19 Jun 2019 15:41:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Message-ID: <20190619124131.GB21753@pendragon.ideasonboard.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Jun 18, 2019 at 04:18:39PM +0100, Fabrizio Castro wrote:
> Add HDMI support to the HiHope RZ/G2[MN] mother board common
> dtsi.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> ---
> Please note that this patch was tested with a 4K monitor and cma=96M
> 
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 62 ++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> index 625c3aa..e7568e1 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -17,6 +17,18 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi0-out {
> +		compatible = "hdmi-connector";
> +		label = "HDMI0 OUT";

Is the label physically present on the device (printed on the board or
the case) ?

Apart from that, without access to the schematics I can't really tell if
the DT is correct, but nothing strikes me as really wrong, so

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		type = "a";
> +
> +		port {
> +			hdmi0_con: endpoint {
> +				remote-endpoint = <&rcar_dw_hdmi0_out>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -82,6 +94,30 @@
>  		states = <3300000 1
>  			  1800000 0>;
>  	};
> +
> +	x302_clk: x302-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <33000000>;
> +	};
> +
> +	x304_clk: x304-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +	};
> +};
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 722>,
> +		 <&versaclock5 1>,
> +		 <&x302_clk>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.2",
> +		      "dclkin.0", "dclkin.1", "dclkin.2";
> +	status = "okay";
>  };
>  
>  &ehci0 {
> @@ -109,11 +145,37 @@
>  	};
>  };
>  
> +&hdmi0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			rcar_dw_hdmi0_out: endpoint {
> +				remote-endpoint = <&hdmi0_con>;
> +			};
> +		};
> +	};
> +};
> +
>  &hsusb {
>  	dr_mode = "otg";
>  	status = "okay";
>  };
>  
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	versaclock5: clock-generator@6a {
> +		compatible = "idt,5p49v5923";
> +		reg = <0x6a>;
> +		#clock-cells = <1>;
> +		clocks = <&x304_clk>;
> +		clock-names = "xin";
> +	};
> +};
> +
>  &ohci0 {
>  	status = "okay";
>  };

-- 
Regards,

Laurent Pinchart
