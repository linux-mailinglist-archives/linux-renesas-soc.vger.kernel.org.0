Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96A523F8DA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 22:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgHHU7a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Aug 2020 16:59:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38192 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHU73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 16:59:29 -0400
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D2F4F9;
        Sat,  8 Aug 2020 22:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596920367;
        bh=1cB/pP1jARUtsxomS+jZNhztWdWhNRAjAwHIioho3Iw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=huPpA5SZvk4brR/qr6lQVFw7SPapiwUSPED83jHTzr/G5x2NAMzFIeDgzTCpdjWP/
         /Op+gszQBh1U7nk5IF8Sis1NMgHx4Wf2OdWokeH9FlDBva1BdisjE4+3HZJCQ0pVMC
         b3utTeirTeIAWY+cYCfQ0tjZzOxklu32qNONJXrw=
Date:   Sat, 8 Aug 2020 23:59:12 +0300
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
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document the
 r8a7742 bindings
Message-ID: <20200808205912.GM6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Aug 07, 2020 at 06:49:48PM +0100, Lad Prabhakar wrote:
> Document the RZ/G1H (R8A7742) SoC in the R-Car DU bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index 51cd4d162770..3f1e3ca4bea9 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -3,6 +3,7 @@
>  Required Properties:
>  
>    - compatible: must be one of the following.
> +    - "renesas,du-r8a7742" for R8A7742 (RZ/G1H) compatible DU
>      - "renesas,du-r8a7743" for R8A7743 (RZ/G1M) compatible DU
>      - "renesas,du-r8a7744" for R8A7744 (RZ/G1N) compatible DU
>      - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
> @@ -68,6 +69,7 @@ corresponding to each DU output.
>  
>                          Port0          Port1          Port2          Port3
>  -----------------------------------------------------------------------------
> + R8A7742 (RZ/G1H)       DPAD 0         LVDS 0         LVDS 1         -
>   R8A7743 (RZ/G1M)       DPAD 0         LVDS 0         -              -
>   R8A7744 (RZ/G1N)       DPAD 0         LVDS 0         -              -
>   R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -

-- 
Regards,

Laurent Pinchart
