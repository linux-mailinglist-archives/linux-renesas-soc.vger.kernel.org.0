Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0FE100F96
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 00:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKRX6J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 18:58:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60518 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKRX6J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 18:58:09 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2CBA563;
        Tue, 19 Nov 2019 00:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574121487;
        bh=Mxk6rk2xF2thaig3R3p3Gkx/6h3F0FLe6+BRnlHkuvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NTexvwR44K59XOTHnJRxJQvxBcwFnXbk3AfI2NBTZi6Rq+VAuiQ+0UR4zoN58y8oH
         Ji1ZOecBBRIinFjIGawGntKHcFhbjCX+4W/c5GKv1mA4KDnW34UCdB0oLORRcecfTk
         6k8R2ibCJdXr2pUM5YttJEg3QiL9gHVi6N+wmkAs=
Date:   Tue, 19 Nov 2019 01:57:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 04/13] dt-bindings: display: bridge: lvds-transmitter:
 Document "ti,sn75lvds83"
Message-ID: <20191118235755.GD5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-5-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:23PM +0000, Fabrizio Castro wrote:
> Compatible string "ti,sn75lvds83" is being used by device tree
> rk3188-bqedison2qc.dts, but it's not documented anywhere, therefore
> document it within lvds-transmitter.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3->v4:
> * New patch
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> index a8326ce..27de616 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> @@ -37,6 +37,7 @@ properties:
>        - enum:
>          - ti,ds90c185       # For the TI DS90C185 FPD-Link Serializer
>          - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
> +        - ti,sn75lvds83     # For the TI SN75LVDS83 FlatLink transmitter
>        - const: lvds-encoder # Generic LVDS encoder compatible fallback
>  
>    ports:

-- 
Regards,

Laurent Pinchart
