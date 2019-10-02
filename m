Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0143FC8B2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 16:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfJBO2P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 10:28:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34932 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBO2P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:28:15 -0400
Received: from pendragon.ideasonboard.com (unknown [132.205.230.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79B8B2BB;
        Wed,  2 Oct 2019 16:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570026493;
        bh=tLqwhaTsZPxX2OPpvaaAKVFYPXon/aCKFzl/2Q5MN00=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dJQxWzVdU1hC9WtpyEF5PUagE0xY31yfeW8q/qgCGw6hIC81hehk87r4WBJw2Nl3R
         y+/dSPlXAEKHfKp4KHAG0Wy1mPCObRgpxc5cSpGR/zruyEOiujbRetGhqALuCMbH1J
         UaUMwIgmz6+T/mG8HT9FrEyiI0SRMhjaM5NSHrZI=
Date:   Wed, 2 Oct 2019 17:27:59 +0300
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
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: hihope-rzg2-ex: Add LVDS
 support
Message-ID: <20191002142759.GD5262@pendragon.ideasonboard.com>
References: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
 <1570010906-47486-9-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1570010906-47486-9-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wed, Oct 02, 2019 at 11:08:25AM +0100, Biju Das wrote:
> This patch adds LVDS support for RZ/G2[MN] boards.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V1-->V2
>    * Incorporated Laurent's review comments
> ---
>  arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 29 +++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> index 70f9a2a..1c7ef69 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -51,6 +51,34 @@
>  	status = "okay";
>  };
>  
> +&gpio1 {
> +	/*
> +	 * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
> +	 * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
> +	 */
> +	lvds-connector-en-gpio {
> +		gpio-hog;
> +		gpios = <20 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "lvds-connector-en-gpio";
> +	};
> +};
> +
> +&lvds0 {
> +	/* Please include the lvds panel dtsi file and uncomment the below line

/* should be on a line of its own.

> +	 * to enable lvds panel connected to RZ/G2[MN] boards.

Maybe s/lvds/LVDS/ and s/dtsi/.dtsi/ ? Up to you.

> +	 */
> +
> +	/* status = "okay"; */
> +
> +	ports {
> +		port@1 {
> +			lvds_connector: endpoint {
> +			};
> +		};
> +	};
> +};
> +
>  &pciec0 {
>  	status = "okay";
>  };
> @@ -103,3 +131,4 @@
>  
>  	status = "okay";
>  };
> +

And this seems unrelated. With those little issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
