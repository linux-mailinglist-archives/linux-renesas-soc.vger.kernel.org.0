Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE7D2B1989
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Sep 2019 10:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387427AbfIMIXm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Sep 2019 04:23:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42782 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387424AbfIMIXl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Sep 2019 04:23:41 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5D16C25AEB1;
        Fri, 13 Sep 2019 18:23:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2DA15940513; Fri, 13 Sep 2019 10:23:37 +0200 (CEST)
Date:   Fri, 13 Sep 2019 10:23:37 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Fix PWM3
Message-ID: <20190913082336.266xwzvigpggnt3z@verge.net.au>
References: <20190912103143.985-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912103143.985-1-kieran.bingham+renesas@ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 12, 2019 at 11:31:43AM +0100, Kieran Bingham wrote:
> The pwm3 was incorrectly added with a compatible reference to the
> renesas,pwm-r8a7790 (H2) due to a single characther ommision.
> 
> Fix the compatible string.
> 
> Fixes: de625477c632 ("arm64: dts: renesas: r8a779{7|8}0: add PWM support")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 2c4ab70e2a39..74c2c0024e45 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -652,7 +652,7 @@
>  		};
>  
>  		pwm3: pwm@e6e33000 {
> -			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
> +			compatible = "renesas,pwm-r8a77970", "renesas,pwm-rcar";
>  			reg = <0 0xe6e33000 0 8>;
>  			#pwm-cells = <2>;
>  			clocks = <&cpg CPG_MOD 523>;
> -- 
> 2.20.1
> 
