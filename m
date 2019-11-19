Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E281F100FB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 01:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbfKSAJT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 19:09:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60788 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKSAJT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 19:09:19 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BE54563;
        Tue, 19 Nov 2019 01:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574122157;
        bh=WFDh7Jt24vKBHqEMGj5iIObfGc2t6wMRVwF9YoiLCe0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zzvrcf0wY9PR/c+3JtciKxelAYq1PYTWMGTVOmKqY5WSVBx3h8olJozdVXB8Jt2Gm
         cFcGowLlLcOz4Tp94xs4vYZBKTC/YbLm7pPkdUZSGbjppr2e7Ws+q6KEWAZ/LGWBuR
         4MJN50z5ddhpuwIvjTYKZeQv9yzlo59nOddB0On0=
Date:   Tue, 19 Nov 2019 02:09:05 +0200
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
Subject: Re: [PATCH v4 09/13] dt-bindings: display: bridge: lvds-codec:
 Document ti,ds90cf384a
Message-ID: <20191119000905.GI5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:28PM +0000, Fabrizio Castro wrote:
> The DS90CF384A from TI is a transparent LVDS receiver (decoder),
> and therefore it is compatible with the lvds-codec driver and
> bindings.
> 
> Document the ti,ds90cf384a compatible string with the dt-bindings.
> No driver change required.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3->v4:
> * New patch
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 0ecc8a4..21f8c6e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -40,7 +40,10 @@ properties:
>            - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
>            - ti,sn75lvds83     # For the TI SN75LVDS83 FlatLink transmitter
>          - const: lvds-encoder # Generic LVDS encoder compatible fallback
> -      - const: lvds-decoder   # Generic LVDS decoders compatible fallback
> +      - items:
> +        - enum:
> +          - ti,ds90cf384a     # For the DS90CF384A FPD-Link LVDS Receiver
> +        - const: lvds-decoder # Generic LVDS decoders compatible fallback
>  
>    ports:
>      type: object
> @@ -102,7 +105,7 @@ examples:
>  
>    - |
>      lvds-decoder {
> -      compatible = "lvds-decoder";
> +      compatible = "ti,ds90cf384a", "lvds-decoder";
>  
>        ports {
>          #address-cells = <1>;

-- 
Regards,

Laurent Pinchart
