Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A379752D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfHUIlH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:41:07 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40618 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfHUIlG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:41:06 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CFAE325B7C3;
        Wed, 21 Aug 2019 18:41:04 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BCFCF9405AE; Wed, 21 Aug 2019 10:41:02 +0200 (CEST)
Date:   Wed, 21 Aug 2019 10:41:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0-cat874: sort nodes
Message-ID: <20190821084101.evn6xeiqcqv772um@verge.net.au>
References: <1566219341-23048-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566219341-23048-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 09:55:41PM +0900, Yoshihiro Kaneko wrote:
> Sort nodes.
> 
> If node address is present
>    * Sort by node address, grouping all nodes with the same compat string
>      and sorting the group alphabetically.
> Else
>    * Sort alphabetically
> 
> This should not have any run-time effect.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks Kaneko-san,

I think that the i2c1_pins and hscif2_pins nodes
are also out of order.

I'm not sure if Geert would prefer you to respin or fix that himself.

In any case, with that problem resolved:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> 
> This patch is based on the master branch of Geert Uytterhoeven's renesas-devel
> tree.
> 
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index 651383c..aaa37158 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -82,13 +82,13 @@
>  		simple-audio-card,bitclock-master = <&sndcpu>;
>  		simple-audio-card,frame-master = <&sndcpu>;
>  
> -		sndcpu: simple-audio-card,cpu {
> -			sound-dai = <&rcar_sound>;
> -		};
> -
>  		sndcodec: simple-audio-card,codec {
>  			sound-dai = <&tda19988>;
>  		};
> +
> +		sndcpu: simple-audio-card,cpu {
> +			sound-dai = <&rcar_sound>;
> +		};
>  	};
>  
>  	vcc_sdhi0: regulator-vcc-sdhi0 {
> @@ -313,16 +313,16 @@
>  		power-source = <1800>;
>  	};
>  
> -	sound_pins: sound {
> -		groups = "ssi01239_ctrl", "ssi0_data";
> -		function = "ssi";
> -	};
> -
>  	sound_clk_pins: sound_clk {
>  		groups = "audio_clkout1_a";
>  		function = "audio_clk";
>  	};
>  
> +	sound_pins: sound {
> +		groups = "ssi01239_ctrl", "ssi0_data";
> +		function = "ssi";
> +	};
> +
>  	usb30_pins: usb30 {
>  		groups = "usb30", "usb30_id";
>  		function = "usb30";
> -- 
> 1.9.1
> 
