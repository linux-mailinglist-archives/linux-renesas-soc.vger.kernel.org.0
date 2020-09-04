Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3FA25D65B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 12:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgIDKeN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 06:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730042AbgIDKdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 06:33:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3F4C061244;
        Fri,  4 Sep 2020 03:33:44 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6E37A24;
        Fri,  4 Sep 2020 12:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599215616;
        bh=bt95Qj44KyOsIJV11JMf+paM9HfBORST8xfc/9iLuXs=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=GmsILKUhMWNxUaE58sPbO90uV80gQgfKXAGWRLa0YuP2OwZzx/c8zeSoT7GpHoUzR
         clT1LL1DGDeB/nDCQC1gc79Uv3SWhsvEyj/w/wv+HDnVRaiS/SXcO4rzgjNMbkpVPP
         2C1AtsnsxVXrsqyahJMU5aW5wf88B2szJ3GhUNoE=
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774e1: Add FDP1 device nodes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20200827145315.26261-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200827145315.26261-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <788a9adf-3f40-face-5c8b-bf40692ad9ac@ideasonboard.com>
Date:   Fri, 4 Sep 2020 11:33:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827145315.26261-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/08/2020 15:53, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Add FDP1 device nodes to R8A774E1 (RZ/G2H) SoC dtsi.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

I'd really love to know if people are using this FDP1 with the driver I
added ;-)



> ---
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> index f5909ced7679..34fdb9a0c325 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2504,6 +2504,26 @@
>  			renesas,fcp = <&fcpvi1>;
>  		};
>  
> +		fdp1@fe940000 {
> +			compatible = "renesas,fdp1";
> +			reg = <0 0xfe940000 0 0x2400>;
> +			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 119>;
> +			power-domains = <&sysc R8A774E1_PD_A3VP>;
> +			resets = <&cpg 119>;
> +			renesas,fcp = <&fcpf0>;
> +		};
> +
> +		fdp1@fe944000 {
> +			compatible = "renesas,fdp1";
> +			reg = <0 0xfe944000 0 0x2400>;
> +			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 118>;
> +			power-domains = <&sysc R8A774E1_PD_A3VP>;
> +			resets = <&cpg 118>;
> +			renesas,fcp = <&fcpf1>;
> +		};
> +
>  		fcpf0: fcp@fe950000 {
>  			compatible = "renesas,fcpf";
>  			reg = <0 0xfe950000 0 0x200>;
> 

