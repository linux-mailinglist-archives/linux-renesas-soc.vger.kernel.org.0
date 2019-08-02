Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 997FB7EF3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 10:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390851AbfHBI16 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:27:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45624 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfHBI16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:27:58 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D3AECC;
        Fri,  2 Aug 2019 10:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564734476;
        bh=fa3kQgCjjo6aEj23PwMdoXcdg20E1anPC4myyE4YL8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DTeZ+Dnn+3ObPQ4ocRWZstsnQFwzIrDairZf5YrfmdLdi2p8xaYglFl+Bf9ktiUtr
         ADktYYIOmrCSe8rTmMbi0T/OLkph81OGyjI2PT3vbUvkwgT9zsrmoajtjzFDT3BjoC
         yLZTpjQfSNHy25jGRAaEyvqPsQeIVGfwBmr2+WsI=
Date:   Fri, 2 Aug 2019 11:27:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH/RFC 10/12] arm64: dts: renesas: r8a774c0: Point LVDS0 to
 its companion LVDS1
Message-ID: <20190802082754.GK5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-11-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-11-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:07AM +0100, Fabrizio Castro wrote:
> Add the new renesas,companion property to the LVDS0 node to point to the
> companion LVDS encoder LVDS1.
> Based on similar work from Laurent Pinchart for the r8a7799[05].
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index e7b5bf2..b36d3b08 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1844,6 +1844,8 @@
>  			resets = <&cpg 727>;
>  			status = "disabled";
>  
> +			renesas,companion = <&lvds1>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;

-- 
Regards,

Laurent Pinchart
