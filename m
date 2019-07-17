Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A616BCF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jul 2019 15:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfGQNY5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Jul 2019 09:24:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39812 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfGQNY5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Jul 2019 09:24:57 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C955533C;
        Wed, 17 Jul 2019 15:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1563369895;
        bh=DdgjDJoPwjp9kpyXsHGQjTFqs6XaGIWGUgdg5XcEieQ=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=jAedL8l6jBq3cTHxzsgbAS2UNhXSAo+hwnvzoQ9W0uCjkXvlNZiSfVV09uHiR2XBS
         AWoq+xAPt9o0XQj8albr71kkevByHUjwJAV/+NY2WIYFHYfu0R6vcLaphRTELlt23p
         e+wuw/lUtSuYLRb2MUepLjfx0keJpY0HianbTSdA=
Subject: Re: [PATCH/RFC repost] arm64: dts: renesas: ebisu, draak: Limit
 EtherAVB to 100Mbps
To:     Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Wolfram Sang <wsa@the-dreams.de>
References: <20190717125739.21450-1-horms+renesas@verge.net.au>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e9a5dbab-16cf-5927-6959-fbe2f3a952f2@ideasonboard.com>
Date:   Wed, 17 Jul 2019 14:24:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717125739.21450-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On 17/07/2019 13:57, Simon Horman wrote:
> * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
>   August 24, 2018, the TX clock internal delay mode isn't supported
>   on R-Car E3 (r8a77990) and D3 (r8a77995).
> 
> * TX clock internal delay mode is required for reliable 1Gbps communication
>   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
> 
> Thus, the E3 based Ebisu and D3 based Draak boards reliably use 1Gbps and
> the speed should be limited to 100Mbps.

I believe you might mean 'can not' reliable use 1Gbps here :-)

Regards

Kieran


> 
> Based on work by Kazuya Mizuguchi.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> ---
> 
> This is a repost of this change.
> 
> In earlier review Andrew Lunn suggested that we may be able to take a
> different approach to this problem by using delays provided by the
> KSZ9031RNX PHY. In particular MMD address 2h, Register 8h -
> RGMII Clock Pad Skew.
> 
> I have consulted with Renesas regarding this suggestion, however,
> unfortunately it appears that the delays provided by this solution
> would be insufficient to allow for reliable 1Gbps communication.
> 
> At this point I believe the safest option is to apply this patch.
> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 +
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 83fc13ac3fa1..3d3d6d438a05 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -271,6 +271,7 @@
>  		interrupt-parent = <&gpio2>;
>  		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
>  		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> +		max-speed = <100>;
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 0711170b26b1..eb153323ed13 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -175,6 +175,7 @@
>  		reg = <0>;
>  		interrupt-parent = <&gpio5>;
>  		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +		max-speed = <100>;
>  	};
>  };
>  
> 

