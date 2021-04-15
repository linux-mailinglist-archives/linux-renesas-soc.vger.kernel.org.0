Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B11D360C21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 16:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbhDOOrv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 10:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbhDOOrv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 10:47:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B97C061574;
        Thu, 15 Apr 2021 07:47:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9D5C89A;
        Thu, 15 Apr 2021 16:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618498046;
        bh=Qt+bhzs/93o6wBx0emPldtNgrinS8ZG6nYZ/56Vl7tE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IYjUec1OtrBoWVfShOjB/r32/1dvQkO2pyFJ82DU12t0qCfL100+yQEypc8qgzK1L
         dHN18CE6vSNmvo0ZGq7q1XKkOiB9vuMdfOgQZVC7DP+1ViY43NPpaRtRtT+/LVEXK/
         bUEr+dqGJp2awIpW+CjXR24/gGJ03d9im915Url0=
Date:   Thu, 15 Apr 2021 17:47:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] arm64: dts: renesas: r8a77970: Add csi40 port@0
Message-ID: <YHhR/YR6Ecp6yU4D@pendragon.ideasonboard.com>
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
 <20210415122602.87697-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210415122602.87697-5-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Apr 15, 2021 at 02:25:59PM +0200, Jacopo Mondi wrote:
> Declare port@0 in the csi40 device node and leave it un-connected.
> Each board .dts file will connect the port as it requires.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

The port exists at the hardware level, so including it here sounds good.
The DT binding even makes the port mandatory :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 5a5d5649332a..e8f6352c3665 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -1106,6 +1106,10 @@ ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> +				port@0 {
> +					reg = <0>;
> +				};
> +
>  				port@1 {
>  					#address-cells = <1>;
>  					#size-cells = <0>;

-- 
Regards,

Laurent Pinchart
