Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD7D2419F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 12:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgHKKxS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 06:53:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56856 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbgHKKxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 06:53:18 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F39E9A8;
        Tue, 11 Aug 2020 12:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597143196;
        bh=w++u0EgZYHWY6Bk9yifmavALtsPJvRS3bTusp6m37kI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ft/gfjBiopxG8zXdsarmUnraDB3a9l113on/dbDrlEnl764IX3igpR5kr4iTZaLOr
         VZe+vpAssiEGbN4B8HDSROMCJ1LRc0yiqBKBfOmUVotzknpcpGcATdSVYvbvBPdklc
         y1YEG6utUT3IWqBrSPFAZtaFoZoeuURz3ITUhTtE=
Date:   Tue, 11 Aug 2020 13:53:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: bridge: lvds-codec:
 Document vcc-supply property
Message-ID: <20200811105303.GD6054@pendragon.ideasonboard.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200810152219.6254-2-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Aug 10, 2020 at 04:22:17PM +0100, Biju Das wrote:
> Document optional vcc-supply property that may be used as VCC source.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> New patch Ref: Ref:https://patchwork.kernel.org/patch/11705819/
> ---
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 68951d56ebba..3248be31eceb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -79,6 +79,9 @@ properties:
>        The GPIO used to control the power down line of this device.
>      maxItems: 1
>  
> +  vcc-supply:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - ports

-- 
Regards,

Laurent Pinchart
