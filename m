Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1723D261FF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 22:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730210AbgIHUIP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 16:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730204AbgIHPTw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:19:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9C1C0619EC;
        Tue,  8 Sep 2020 08:13:32 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BC423B;
        Tue,  8 Sep 2020 17:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599577883;
        bh=h9mUakxYmdFqKjR3d2mncvxhU+lwjQr60pkqM2gFibI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KY4ff04dUI1/a/22sWx/eaKjlTgAeMmU46HECBs9/Ko+/zAdYDc2yGS+VwEPugUuB
         boRoFcG0uUrlLjXGa53CibXvrcJwl4QGIbDST8fy0iMEpYjv9eP2dkVZ5IvwuAKJL/
         KvRDIIWi0e9VDzIkjLJeOtdgl/+/XwyJZbtj6n8o=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 07/10] arm64: dts: renesas: r8a77961: Add DU device
 nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2e44fb1d-9eaf-ce6a-04d0-8c64f8b9bb5d@ideasonboard.com>
Date:   Tue, 8 Sep 2020 16:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On 08/09/2020 01:35, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds DU device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 423808b6cd58..c7fabd9e875b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2165,8 +2165,19 @@ port@2 {
>  		};
>  
>  		du: display@feb00000 {
> +			compatible = "renesas,du-r8a77961";
>  			reg = <0 0xfeb00000 0 0x70000>;
> -			/* placeholder */
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> +				 <&cpg CPG_MOD 722>;
> +			clock-names = "du.0", "du.1", "du.2";
> +			resets = <&cpg 724>, <&cpg 722>;
> +			reset-names = "du.0", "du.2";
> +
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> +			status = "disabled";
>  
>  			ports {
>  				#address-cells = <1>;
> 

