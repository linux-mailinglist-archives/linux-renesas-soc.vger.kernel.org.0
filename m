Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C80FC3FAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 20:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732013AbfJASR7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 14:17:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52842 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfJASR6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:17:58 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1D5423F;
        Tue,  1 Oct 2019 20:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569953877;
        bh=XKdpGD/9x9H3wSEq4hbel/f5cCtdQEB9yHg6FKb2t58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=apEhSWPOMPMDyGQWgqyiOdC7JKmKDPgEYKkPJosuBR0a9p4YJVwWxHrDGojNU5cHD
         EhqHXPdYxnTYYvkHW5DhDXB3f9BQSV8oFbc0thr3ENMVYUUe/ZzDrCYaEuiWBk1Zye
         0onmfhab4+lmY9kV7zsy/kfyhVjCnJSD0sX9j+0U=
Date:   Tue, 1 Oct 2019 21:17:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: r8a774b1: Add PWM device nodes
Message-ID: <20191001181742.GH4735@pendragon.ideasonboard.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
 <1569932124-32010-7-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569932124-32010-7-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Oct 01, 2019 at 01:15:22PM +0100, Biju Das wrote:
> This patch adds PWM device nodes to r8a774b1 SoC DT.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 70 +++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index 93b2e88..538e9ce 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -940,6 +940,76 @@
>  			/* placeholder */
>  		};
>  
> +		pwm0: pwm@e6e30000 {
> +			compatible = "renesas,pwm-r8a774b1", "renesas,pwm-rcar";
> +			reg = <0 0xe6e30000 0 0x8>;
> +			#pwm-cells = <2>;
> +			clocks = <&cpg CPG_MOD 523>;
> +			resets = <&cpg 523>;
> +			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		pwm1: pwm@e6e31000 {
> +			compatible = "renesas,pwm-r8a774b1", "renesas,pwm-rcar";
> +			reg = <0 0xe6e31000 0 0x8>;
> +			#pwm-cells = <2>;
> +			clocks = <&cpg CPG_MOD 523>;
> +			resets = <&cpg 523>;
> +			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		pwm2: pwm@e6e32000 {
> +			compatible = "renesas,pwm-r8a774b1", "renesas,pwm-rcar";
> +			reg = <0 0xe6e32000 0 0x8>;
> +			#pwm-cells = <2>;
> +			clocks = <&cpg CPG_MOD 523>;
> +			resets = <&cpg 523>;
> +			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		pwm3: pwm@e6e33000 {
> +			compatible = "renesas,pwm-r8a774b1", "renesas,pwm-rcar";
> +			reg = <0 0xe6e33000 0 0x8>;
> +			#pwm-cells = <2>;
> +			clocks = <&cpg CPG_MOD 523>;
> +			resets = <&cpg 523>;
> +			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		pwm4: pwm@e6e34000 {
> +			compatible = "renesas,pwm-r8a774b1", "renesas,pwm-rcar";
> +			reg = <0 0xe6e34000 0 0x8>;
> +			#pwm-cells = <2>;
> +			clocks = <&cpg CPG_MOD 523>;
> +			resets = <&cpg 523>;
> +			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		pwm5: pwm@e6e35000 {
> +			compatible = "renesas,pwm-r8a774b1", "renesas,pwm-rcar";
> +			reg = <0 0xe6e35000 0 0x8>;
> +			#pwm-cells = <2>;
> +			clocks = <&cpg CPG_MOD 523>;
> +			resets = <&cpg 523>;
> +			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
> +		pwm6: pwm@e6e36000 {
> +			compatible = "renesas,pwm-r8a774b1", "renesas,pwm-rcar";
> +			reg = <0 0xe6e36000 0 0x8>;
> +			#pwm-cells = <2>;
> +			clocks = <&cpg CPG_MOD 523>;
> +			resets = <&cpg 523>;
> +			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};
> +
>  		scif0: serial@e6e60000 {
>  			compatible = "renesas,scif-r8a774b1",
>  				     "renesas,rcar-gen3-scif", "renesas,scif";

-- 
Regards,

Laurent Pinchart
