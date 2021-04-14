Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F4B35FE9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 01:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhDNXuw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Apr 2021 19:50:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39030 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhDNXuv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Apr 2021 19:50:51 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FD1751E;
        Thu, 15 Apr 2021 01:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618444228;
        bh=gzdv7RFtTP+niMA8X4CVpgspHawRxrCAUzVuR8hZfjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ph8SV2WZjDhSGXKIwE7VqRWwUKiKVyYNUgF7ZYUY8uT5ADZGuzZPofpjTd7DI9bau
         Erk3vl89VwTzQbu0wVxATZPdcBPOlh82X3BTxDhDtTcVjbp2FXjtUmgFyb3Qj7zwgg
         Nyel8n6jdSai7yU4tXG9bMXUUiI9dTzoQXGWdYqI=
Date:   Thu, 15 Apr 2021 02:50:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: eagle: Include eagle-gmsl
Message-ID: <YHd/w6cda5kr2Y0N@pendragon.ideasonboard.com>
References: <20210414135128.180980-1-jacopo+renesas@jmondi.org>
 <20210414135128.180980-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210414135128.180980-6-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Apr 14, 2021 at 03:51:28PM +0200, Jacopo Mondi wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Include the eagle-gmsl.dtsi to enable GMSL camera support on the
> Eagle-V3M platform.

This is useful for quick testing, but as I don't expect everybody to
have cameras connected to the Eagle board, it should really be handled
as an overlay.

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index d2b6368d1e72..9b8dfb5132fb 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -391,3 +391,6 @@ &scif0 {
>  
>  	status = "okay";
>  };
> +
> +/* FAKRA Overlay */
> +#include "eagle-gmsl.dtsi"

-- 
Regards,

Laurent Pinchart
