Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E30145EF76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 14:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350788AbhKZN4v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 08:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348251AbhKZNyv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 08:54:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE34C0619D9;
        Fri, 26 Nov 2021 05:08:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78966E2C;
        Fri, 26 Nov 2021 14:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637932130;
        bh=lBWps+1UEJGn3hJNoN8UqjEY0CiXCLE4uMcvm/nlteo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S77t3JagQVvjHOR4kU+6boeJuaylh/JISbFxXS+ktWFfKgtr2vjDVE1QPoQXX1tyD
         IBM0JODRhafFXAYyjPZMDINu2sLrXEg5LF/OqZDtuucAC4ZdpVSDyRWvpJOVsTEBas
         C/fxuKQ6Bv8+79JHXLrHIbZksHB0sq/5jnA0cNo4=
Date:   Fri, 26 Nov 2021 15:08:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: r8a779a0: Provide default
 DSI data-lanes
Message-ID: <YaDcS8BQd9rrMLHh@pendragon.ideasonboard.com>
References: <20211126095445.932930-1-kieran.bingham+renesas@ideasonboard.com>
 <20211126095445.932930-5-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211126095445.932930-5-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, Nov 26, 2021 at 09:54:45AM +0000, Kieran Bingham wrote:
> The data-lanes is a mandatory property for the endpoints.
> Provide a default when not connected that represents the maximum
> lanes supported by the device.
> 
> A connected device should override the data-lanes if it uses a lower
> number of lanes.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> 
> This patch is split from 2/4 to keep it's change for distinct review.
> The data-lanes is marked as a mandatory property in the DSI bindings
> (which are out of tree, most recent posting at [0])
> 
> [0] https://lore.kernel.org/all/YQGFP%2FcFoSksPyn+@pendragon.ideasonboard.com/
> 
> The data-lanes property is marked as mandatory, which means it needs to
> be provided even when supplying the port templates which get overridden
> later. Is this expected behaviour?
> 
> Does this have sufficient meaning? Or will it always have to be
> specified by any node overriding anyway...?

Isn't the remote-endpoint also mandatory ?

Given that there's no real good default value for data-lanes that is
significantly more likely than others, I'd prefer dropping the endpoints
from r8a779a0.dtsi and adding them in board files.

>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index fdad8bc4a069..7322c4628e2b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -2661,6 +2661,7 @@ dsi0_in: endpoint {
>  				port@1 {
>  					reg = <1>;
>  					dsi0_out: endpoint {
> +						data-lanes = <1 2 3 4>;
>  					};
>  				};
>  			};
> @@ -2691,7 +2692,9 @@ dsi1_in: endpoint {
>  
>  				port@1 {
>  					reg = <1>;
> +
>  					dsi1_out: endpoint {
> +						data-lanes = <1 2 3 4>;
>  					};
>  				};
>  			};

-- 
Regards,

Laurent Pinchart
