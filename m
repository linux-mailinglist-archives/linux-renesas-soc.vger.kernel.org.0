Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82D1693414
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 22:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjBKVq2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 16:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjBKVq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 16:46:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C62F196BC;
        Sat, 11 Feb 2023 13:46:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC4CC6CF;
        Sat, 11 Feb 2023 22:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676151983;
        bh=Frqc/jloOE2B8ZOlenDaykqeDLjVteoRjD7sSILoOkI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hKMkNe5S3nwi4k2DzzgokvS8qg6FHSgQd8pKR0HtUesPazXEKjkcrBtzGZ/H0dhJ1
         8GH9MvafQyud76XWpGPOcENWsgiOZHPSTqmgsHXq1vnjftU04nqwmZ+b/aMKUgqDOk
         pQ6bI1hoAoLriapeyDzUGIYNVWCT7Kz/ulNBH0Kg=
Date:   Sat, 11 Feb 2023 23:46:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: draak: Make HDMI the default
 video input
Message-ID: <Y+gMrZX59YaDeSV/@pendragon.ideasonboard.com>
References: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211165715.4024992-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211165715.4024992-2-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Sat, Feb 11, 2023 at 05:57:14PM +0100, Niklas Söderlund wrote:
> Most Gen3 R-Car devices have HDMI as the default video input source,
> align Draak with them and make HDMI the default. While at it move the
> bus properties to the VIN node where they can be consumed correctly by
> the driver.

I'm fine with the idea, but I'm wondering if this matches the default
DIP switches configuration that boards are shipped with. This being
said, when I check the switches on my board to test HDMI input a few
days ago, I realized they were set to a hybrid configuration, so maybe
we should just roll our eyes and merge this :-)

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/draak.dtsi | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
> index ef3bb835d5c0..e248866c7871 100644
> --- a/arch/arm64/boot/dts/renesas/draak.dtsi
> +++ b/arch/arm64/boot/dts/renesas/draak.dtsi
> @@ -356,11 +356,10 @@ port@3 {
>  				 * CVBS and HDMI inputs through SW[49-53]
>  				 * switches.
>  				 *
> -				 * CVBS is the default selection, link it to
> -				 * VIN4 here.
> +				 * HDMI is the default selection, leave CVBS
> +				 * not connected here.
>  				 */
>  				adv7180_out: endpoint {
> -					remote-endpoint = <&vin4_in>;
>  				};

Endpoints are required to have a remote-endpoint property, so you should
drop the endpoint completely. This will require a change in patch 2/2 as
you'll have to create the endpoint there.

>  			};
>  		};
> @@ -423,13 +422,11 @@ port@2 {
>  				 * CVBS and HDMI inputs through SW[49-53]
>  				 * switches.
>  				 *
> -				 * CVBS is the default selection, leave HDMI
> -				 * not connected here.
> +				 * HDMI is the default selection, link it to
> +				 * VIN4 here.
>  				 */
>  				adv7612_out: endpoint {
> -					pclk-sample = <0>;
> -					hsync-active = <0>;
> -					vsync-active = <0>;

This will cause the bus type to change from parallel to BT656. Is that
desired ? If not, I'd set the bus-type property explicitly. Actually,
I'd set it explicitly in any case.

This change is worth being split to a separate patch.

> +					remote-endpoint = <&vin4_in>;
>  				};
>  			};
>  		};
> @@ -580,8 +577,8 @@ usb0_pins: usb0 {
>  		function = "usb0";
>  	};
>  
> -	vin4_pins_cvbs: vin4 {
> -		groups = "vin4_data8", "vin4_sync", "vin4_clk";
> +	vin4_pins: vin4 {
> +		groups = "vin4_data24", "vin4_sync", "vin4_clk";
>  		function = "vin4";
>  	};
>  };
> @@ -729,7 +726,7 @@ &usb2_phy0 {
>  };
>  
>  &vin4 {
> -	pinctrl-0 = <&vin4_pins_cvbs>;
> +	pinctrl-0 = <&vin4_pins>;
>  	pinctrl-names = "default";
>  
>  	status = "okay";
> @@ -737,7 +734,10 @@ &vin4 {
>  	ports {
>  		port {
>  			vin4_in: endpoint {
> -				remote-endpoint = <&adv7180_out>;
> +				pclk-sample = <0>;
> +				hsync-active = <0>;
> +				vsync-active = <0>;
> +				remote-endpoint = <&adv7612_out>;
>  			};
>  		};
>  	};

-- 
Regards,

Laurent Pinchart
