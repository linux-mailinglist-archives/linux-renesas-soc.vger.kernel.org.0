Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB79B7BB3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2019 10:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfGaIMZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Jul 2019 04:12:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46144 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbfGaIMZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jul 2019 04:12:25 -0400
Received: from pendragon.ideasonboard.com (unknown [38.98.37.141])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C5C6CC;
        Wed, 31 Jul 2019 10:12:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564560743;
        bh=H/uPA4ZlVMkzj5l4yx9FTdj0RSpGn/s0K3dOVUpsTQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oDiA8FD1lCpQyskVId/r2Pj6m2K5SeSp0X+okXzhcdxBVayhZDrG/layeH0ikHMSu
         cEpceHxnE8Qs2AS8bvG3jVlzE5FvUTO0DY67VnDKee8S38DtSES3RfpZ2tLsZelHxP
         VYuxxtSCtDN3UPLwYdSTURr2gnVkPn1RC4pKx4Pw=
Date:   Wed, 31 Jul 2019 11:12:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
Message-ID: <20190731081209.GA5080@pendragon.ideasonboard.com>
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190731074801.5706-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

(CC'ing the device tree mailing list)

Thank you for the patch.

On Wed, Jul 31, 2019 at 09:48:01AM +0200, Geert Uytterhoeven wrote:
> Currently there are two nodes named "regulator1" in the Draak DTS: a
> 3.3V regulator for the eMMC and the LVDS decoder, and a 12V regulator
> for the backlight.  This causes the former to be overwritten by the
> latter.
> 
> Fix this by renaming all regulators with numerical suffixes to use named
> suffixes, which are less likely to conflict.

Aren't DT node names supposed to describe the device type, not a
particular instance of the device ? This is something that has bothered
me too, but I believe the naming scheme should be decided globally, not
per board. Is there precedent for using this scheme that has been
explicitly approved by the DT maintainers ?

> Fixes: 4fbd4158fe8967e9 ("arm64: dts: renesas: r8a77995: draak: Add backlight")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I guess this is a fix for v5.3?
> 
> This fix takes a slightly different approach than commit
> 12105cec654cf906 ("arm64: dts: renesas: r8a77990: ebisu: Fix backlight
> regulator numbering"), which just fixed the conflicting numerical
> suffix.
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 0711170b26b1fe1c..3aa2564dfdc25fff 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -97,7 +97,7 @@
>  		reg = <0x0 0x48000000 0x0 0x18000000>;
>  	};
>  
> -	reg_1p8v: regulator0 {
> +	reg_1p8v: regulator-1p8v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.8V";
>  		regulator-min-microvolt = <1800000>;
> @@ -106,7 +106,7 @@
>  		regulator-always-on;
>  	};
>  
> -	reg_3p3v: regulator1 {
> +	reg_3p3v: regulator-3p3v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-3.3V";
>  		regulator-min-microvolt = <3300000>;
> @@ -115,7 +115,7 @@
>  		regulator-always-on;
>  	};
>  
> -	reg_12p0v: regulator1 {
> +	reg_12p0v: regulator-12p0v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "D12.0V";
>  		regulator-min-microvolt = <12000000>;

-- 
Regards,

Laurent Pinchart
