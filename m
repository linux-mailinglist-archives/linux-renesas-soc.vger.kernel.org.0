Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C66B0D24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 12:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730680AbfILKrO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 06:47:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54042 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfILKrN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 06:47:13 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D37C533A;
        Thu, 12 Sep 2019 12:47:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568285231;
        bh=rSz144yLxWVFEHuAbXPhKzAdSZdSvmJNoG8O5RAVPE4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RO2jxlJxbvIQvLvZ+dxpD+j6ke4S5Z26aG8EkHMOgglqQwd4OK9+xwEEM1Q5vDve2
         SIu3UcyLDWcn8YnucvgaB/27tyGefGL14I/ea2t1j9/U5QIl6jkWP2zbggxV0hZA0F
         02vBRA8kCK4f4GBHMGVd5sQBbmY95JdJln5wfSgM=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Fix PWM3
To:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190912103143.985-1-kieran.bingham+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <db2f85e5-3ada-9deb-b62d-9f50d4176b5a@ideasonboard.com>
Date:   Thu, 12 Sep 2019 11:47:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912103143.985-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/09/2019 11:31, Kieran Bingham wrote:
> The pwm3 was incorrectly added with a compatible reference to the
> renesas,pwm-r8a7790 (H2) due to a single characther ommision.

Ugh, my apologies :

 s/characther/character/
 s/ommision/omission/

Please fix up when applying if there's no need to send a v2.

--
Kieran


> 
> Fix the compatible string.
> 
> Fixes: de625477c632 ("arm64: dts: renesas: r8a779{7|8}0: add PWM support")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
> 

