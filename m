Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BAC23F8E8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 23:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgHHVDk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Aug 2020 17:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHVDk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 17:03:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CDEC061756;
        Sat,  8 Aug 2020 14:03:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E6BDF9;
        Sat,  8 Aug 2020 23:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596920618;
        bh=FQwXSD8vmook7FUcG1VOK4PYwRSibL4+WM3N1bwMvaE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VBOMQ/VY9oLLe9tUvGnRN/Phlb9W1kUYpHIAttlAKi8bJyueLm5nqUK2Y5p0jL0+a
         HWs5HeJ1N+RbULwEw40aRBOYpLVpiCBt6TVwLidXbkJnSG2j43Em/rBt4micYwwPSH
         t/yQauHprV4bURI8MZMYoY7/Mg/PFMOq+KNPU2aw=
Date:   Sun, 9 Aug 2020 00:03:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: display: renesas,lvds: Document r8a7742
 bindings
Message-ID: <20200808210321.GO6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Aug 07, 2020 at 06:49:50PM +0100, Lad Prabhakar wrote:
> Document the RZ/G1H (R8A7742) LVDS bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/bridge/renesas,lvds.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index c62ce2494ed9..40aa809f41cd 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -7,6 +7,7 @@ Gen2, R-Car Gen3 and RZ/G SoCs.
>  Required properties:
>  
>  - compatible : Shall contain one of
> +  - "renesas,r8a7742-lvds" for R8A7742 (RZ/G1H) compatible LVDS encoders
>    - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
>    - "renesas,r8a7744-lvds" for R8A7744 (RZ/G1N) compatible LVDS encoders
>    - "renesas,r8a774a1-lvds" for R8A774A1 (RZ/G2M) compatible LVDS encoders

-- 
Regards,

Laurent Pinchart
