Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB2137328C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 May 2021 00:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbhEDWu6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 18:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbhEDWu6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 18:50:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E5FC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 15:50:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C52B6547;
        Wed,  5 May 2021 00:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620168599;
        bh=GIPHEBRIqki5oQp9DUwT7jymxyOfDGp5qTJ6QvgbZWM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k72uZVPvXvGiHdi8A6CRgoEftmwb8pmKIE0DDUgBCWuwblboJToGBkYz+mOzIcKwZ
         NSZthh8zrLPa6xq8xjMe8bJ56SnO5O03knA942l7OR5spHidIR0Li9uULbTynv461y
         gx6VJVQi/76lspQO2nskxoRX5GwxuCCixj59gj3Q=
Date:   Wed, 5 May 2021 01:49:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Valentine Barshak <valentine.barshak@cogentembedded.com>
Subject: Re: [PATCH] arm64: dts: renesas: eagle: Add x1 clock
Message-ID: <YJHPku7cS++j9Rw1@pendragon.ideasonboard.com>
References: <75a66bae21937da1c69e8024ce61b35aad4ac9b8.1620119570.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <75a66bae21937da1c69e8024ce61b35aad4ac9b8.1620119570.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert and Valentine,

Thank you for the patch.

On Tue, May 04, 2021 at 11:14:34AM +0200, Geert Uytterhoeven wrote:
> From: Valentine Barshak <valentine.barshak@cogentembedded.com>
> 
> This adds X1 clock which supplies a frequency of 148.5 MHz.
> This clock is connected to the external dot clock input signal.
> 
> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> [geert: Verified schematics]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Untested due to lack of hardware
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 874a7fc2730b00db..5c84681703edad2e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -73,6 +73,12 @@ memory@48000000 {
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	x1_clk: x1-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <148500000>;
> +	};
>  };
>  
>  &avb {
> @@ -104,6 +110,8 @@ channel0 {
>  };
>  
>  &du {
> +	clocks = <&cpg CPG_MOD 724>, <&x1_clk>;
> +	clock-names = "du.0", "dclkin.0";
>  	status = "okay";
>  };
>  

-- 
Regards,

Laurent Pinchart
