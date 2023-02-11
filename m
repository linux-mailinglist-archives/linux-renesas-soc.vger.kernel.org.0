Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3D069340A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 22:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjBKVh0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 16:37:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjBKVhZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 16:37:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9875B13507;
        Sat, 11 Feb 2023 13:37:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A8156CF;
        Sat, 11 Feb 2023 22:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676151441;
        bh=E3bT0YbxJalZObxsC5r7YDqg+FtHfQT0lEJdH2IlaFk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VmT2aCEmY66aUaEIA79CSgQL6TopZgMfNODb4zLQCc97gp67xryM0T4Lay1ZEpTbV
         jPpY95jFnl+j3rloJpMKxWInE8q3BHLsIN2aQ3DpAzwBww/fR08VScX5OG1+tXHObn
         6qNEwAndfqKhHPxr2ZXzw4aaSwTy1tNLa+YfBFpU=
Date:   Sat, 11 Feb 2023 23:37:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: draak: Add overlay for CVBS
 input
Message-ID: <Y+gKj7vp+C/gPUPO@pendragon.ideasonboard.com>
References: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
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

On Sat, Feb 11, 2023 at 05:57:15PM +0100, Niklas Söderlund wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
> both connected to the same VIN input. DIP switches are used to select
> one of the two devices, with the HDMI decoder being the default. Add an
> overlay that selects the CVBS decoder.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> [Niklas: Inverted it from HDMI to CVBS]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/Makefile          |  1 +
>  .../boot/dts/renesas/draak-cvbs-input.dtso    | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 0699b51c1247..f5df37253184 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -87,5 +87,6 @@ dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
>  
>  dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
>  
> +dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-cvbs-input.dtbo
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
> diff --git a/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> new file mode 100644
> index 000000000000..b833c58c2029
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2023 Ideas on Board Oy
> + *
> + * Device tree overlay for the Draak board, to enable CVBS input. This requires
> + * setting DIP switches SW49, SW50, SW51 and SW52 to OFF, and SW53 and SW54 to
> + * ON.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&adv7180_out {
> +	remote-endpoint = <&vin4_in>;
> +};
> +
> +&i2c0 {
> +	hdmi-decoder@4c {
> +		ports {
> +			port@2 {
> +				/delete-node/ endpoint;
> +			};
> +		};
> +	};
> +};
> +
> +&vin4_in {
> +	remote-endpoint = <&adv7180_out>;
> +};
> +
> +&vin4_pins {
> +	groups = "vin4_data8", "vin4_sync", "vin4_clk";
> +};

-- 
Regards,

Laurent Pinchart
