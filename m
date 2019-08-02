Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB317EDF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 09:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390308AbfHBHsG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 03:48:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42026 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388476AbfHBHsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 03:48:05 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63D42CC;
        Fri,  2 Aug 2019 09:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564732083;
        bh=F7EcIwTg1zH6A0iHD8dIESp+yC+C8KwvQYvH/TMKvCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qafg1dFY6VNomX3BebAW8Cgx9jVO+s6K8GumORKuV+5S1fFcJRv6oruyq25WiTajx
         tIfKzilrXLQHtpUSbbUZ8sMtXOudTG8CHBVcPskpzoW1vVnnsYlLyu8ITL+Qq9R5Ek
         Jj+g3vR/dUYSj54df2P6Av2Y2xd/Eklmd8zhr0d0=
Date:   Fri, 2 Aug 2019 10:48:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH/RFC 01/12] dt-bindings: display: renesas: lvds: RZ/G2E
 needs renesas,companion too
Message-ID: <20190802074801.GC5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1564731249-22671-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:33:58AM +0100, Fabrizio Castro wrote:
> Document RZ/G2E support for property renesas,companion.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index c6a196d..dece79e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -49,9 +49,9 @@ Each port shall have a single endpoint.
>  Optional properties:
>  
>  - renesas,companion : phandle to the companion LVDS encoder. This property is
> -  mandatory for the first LVDS encoder on D3 and E3 SoCs, and shall point to
> -  the second encoder to be used as a companion in dual-link mode. It shall not
> -  be set for any other LVDS encoder.
> +  mandatory for the first LVDS encoder on R-Car D3, R-Car E3, and RZ/G2E SoCs,
> +  and shall point to the second encoder to be used as a companion in dual-link
> +  mode. It shall not be set for any other LVDS encoder.
>  
>  
>  Example:

-- 
Regards,

Laurent Pinchart
