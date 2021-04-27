Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E937336BC97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Apr 2021 02:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhD0AVd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Apr 2021 20:21:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40210 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhD0AVd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 20:21:33 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2F3CE9;
        Tue, 27 Apr 2021 02:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619482850;
        bh=SsYng8p4/DWVJHPXxOwhEBr9lEqOetHERd1YMFTQf+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qn4cohmgWFEyqpxXFYEz+0RHjjioig5/KGEyDUP0PfFQiGZdGm4MqrPaUdeaaMolC
         IdQci2BZpbom49I9umBnS32WryLFDeGf17Lhrf7QFq4NmB7NHKizJ1luRyohCs51Xf
         HcGfLjWOTfJxRvSV5LeA5cwvnssui4zivwcgvWpA=
Date:   Tue, 27 Apr 2021 03:20:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: aistarvision-mipi-adapter-2.1:
 Fix CSI40 ports
Message-ID: <YIdY2jGGO7Ghwmn7@pendragon.ideasonboard.com>
References: <20210421150221.3202955-1-niklas.soderlund+renesas@ragnatech.se>
 <20210421150221.3202955-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210421150221.3202955-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Apr 21, 2021 at 05:02:20PM +0200, Niklas Söderlund wrote:
> Fix the DTS schema by explicitly stating that the input is port@0. This
> fixes a schema validation error but have no runtime effect as the
> default port number is 0 if not specified.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> index e7b4a929bb174840..2e3d1981cac48144 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
> @@ -33,7 +33,7 @@ &csi40 {
>  	status = "okay";
>  
>  	ports {
> -		port {
> +		port@0 {
>  			csi40_in: endpoint {
>  				clock-lanes = <0>;
>  				data-lanes = <1 2>;

-- 
Regards,

Laurent Pinchart
