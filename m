Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1066F73B85C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 15:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjFWNDt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 09:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjFWNDs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 09:03:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0F71FF5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 06:03:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 864B1838;
        Fri, 23 Jun 2023 15:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687525388;
        bh=yyu4cKsmjnizvOowR8T7jV9OPV5JJ1COSC0zm1teWZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VLl1SVoVXW9tu0W+hvekMqSpqH3a1u9Y/nQC7LbsVyqMr3Sa2yaOpy8kqzhl1WbWM
         2GDDApMwVnu8hohRpZQzAUqgLi/HumUMKAnFeoISAzFLAfNzIgIllG1wvK1vnc0zmt
         cjuCAqbJl+9k27mJAxFEVgqgNZBPZLLcfAk/DWsM=
Date:   Fri, 23 Jun 2023 16:03:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: armadillo800eva: Add LCD panel
Message-ID: <20230623130344.GA23353@pendragon.ideasonboard.com>
References: <cover.1687417585.git.geert+renesas@glider.be>
 <c9ad0ea19b3de104f92abb49ebc94907d4812d3f.1687417585.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9ad0ea19b3de104f92abb49ebc94907d4812d3f.1687417585.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:23:15AM +0200, Geert Uytterhoeven wrote:
> Describe the 5" WVGA TFT LCD panel on the Armadillo-800-EVA development
> board, and enable the LCD controller that drives it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 28 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> index 101413d5164913c5..fb6b432c4df2d948 100644
> --- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> +++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
> @@ -132,7 +132,7 @@ i2c2: i2c-2 {
>  		i2c-gpio,delay-us = <5>;
>  	};
>  
> -	backlight {
> +	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&tpu 2 33333 PWM_POLARITY_INVERTED>;
>  		brightness-levels = <0 1 2 4 8 16 32 64 128 255>;
> @@ -143,6 +143,18 @@ backlight {
>  		enable-gpios = <&pfc 61 GPIO_ACTIVE_HIGH>;
>  	};
>  
> +	panel {
> +		compatible = "ampire,am-800480l1tmqw-t00h";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_5p0v>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lcdc0_rgb>;
> +			};
> +		};
> +	};
> +
>  	sound {
>  		compatible = "simple-audio-card";
>  
> @@ -228,10 +240,22 @@ rtc@30 {
>  	};
>  };
>  
> -&pfc {
> +&lcdc0 {
>  	pinctrl-0 = <&lcd0_pins>;
>  	pinctrl-names = "default";
>  
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			endpoint {
> +				remote-endpoint = <&panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&pfc {
>  	ether_pins: ether {
>  		groups = "gether_mii", "gether_int";
>  		function = "gether";

-- 
Regards,

Laurent Pinchart
