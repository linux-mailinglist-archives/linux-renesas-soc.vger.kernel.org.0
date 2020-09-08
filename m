Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265C7260A61
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 07:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgIHFxx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 01:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbgIHFxx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 01:53:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7F9C061573;
        Mon,  7 Sep 2020 22:53:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 461BE35;
        Tue,  8 Sep 2020 07:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599544431;
        bh=CoHqnNcD4UelLduRYf10ta4D8OvDE9yAXLVTgMbAa40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W4V9cV6S8CokchWx9/jnWuUw1HqBJgTHEGfEfea4SgkIqFk3jioUjy9Mc0QFS3JlR
         QEXsOyM50wwnTcYIS5XYggByNX+54crYlJq3DC9aJx7Pw0G7uoPbJdAqzDFECk5b0D
         FXdYVKAqRp8uaxx0oHv9mlcGVu1JcD9jyu12wG6o=
Date:   Tue, 8 Sep 2020 08:53:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 01/10] dt-bindings: display: renesas: du: Document the
 r8a77961 bindings
Message-ID: <20200908055326.GL6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch.

On Tue, Sep 08, 2020 at 09:34:04AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Document the R-Car M3-W+ (R8A77961) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index 51cd4d162770..317c9dd2d57c 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -18,6 +18,7 @@ Required Properties:
>      - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
>      - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
>      - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
> +    - "renesas,du-r8a77961" for R8A77961 (R-Car M3-W+) compatible DU
>      - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
>      - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
>      - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
> @@ -83,6 +84,7 @@ corresponding to each DU output.
>   R8A7794 (R-Car E2)     DPAD 0         DPAD 1         -              -
>   R8A7795 (R-Car H3)     DPAD 0         HDMI 0         HDMI 1         LVDS 0
>   R8A7796 (R-Car M3-W)   DPAD 0         HDMI 0         LVDS 0         -
> + R8A77961 (R-Car M3-W+) DPAD 0         HDMI 0         LVDS 0         -
>   R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0         -
>   R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -              -
>   R8A77980 (R-Car V3H)   DPAD 0         LVDS 0         -              -

-- 
Regards,

Laurent Pinchart
