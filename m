Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A48C7EF49
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 10:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfHBI34 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:29:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45918 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfHBI34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:29:56 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC902CC;
        Fri,  2 Aug 2019 10:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564734594;
        bh=bXKRQogQmmeETX3D+uxc/1dEmFHlcEZ0DErWtMIWSjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a7y3RjIOouopDKUtt11qNlomuSfbfiEiyT81vX5J9HOTG13htPrnWbTPjVpVA65VT
         ErNfkd7CS6onYFo9N99Tuzg1xp25NSUCOqQdvM4wqLO947YtDw0RngznlZujOmhRuH
         14jDQkVMIfmkhD82XQXAe7x5nExHzDJkjHXfG/Zo=
Date:   Fri, 2 Aug 2019 11:29:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition
 for 12V regulator
Message-ID: <20190802082952.GL5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-12-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-12-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:08AM +0100, Fabrizio Castro wrote:
> Power rail "D12.0V" comes straight from the power barrel connector,
> and it's used in both main board and sub board.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I don't plan to take this in my tree without patch 12/12, so if you
think the rest of the series won't be ready in time for v5.4, feel free
to get this patch merged through Simon or Geert already.

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index 46a77ee..651383c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -65,6 +65,15 @@
>  		reg = <0x0 0x48000000 0x0 0x78000000>;
>  	};
>  
> +	reg_12p0v: regulator-12p0v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "D12.0V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	sound: sound {
>  		compatible = "simple-audio-card";
>  

-- 
Regards,

Laurent Pinchart
