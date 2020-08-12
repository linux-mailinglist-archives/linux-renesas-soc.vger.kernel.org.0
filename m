Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C778242D75
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 18:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHLQjM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 12:39:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54498 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgHLQjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 12:39:11 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06A9E9E7;
        Wed, 12 Aug 2020 18:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597250349;
        bh=BUEpf8IPUOi1xqH7MfxxBW7gupcUexVqoMDyhBP/Scs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qLETwNYmT9e8TQTUrUuKOKOTil8N+h+o5NF9AEnv3bTzcy5yntoEv/GnSgK+Gu+FC
         4aMYgGfGNqamCHC/Pgz+z8GXLt4TCeJXJmY58yyrsOk2Q9xEa9mY0cXGoX1S2JSsnT
         ORHOZW2jht6/LzxB9aBdSI1A1B5Loh5QbMFbmVGQ=
Date:   Wed, 12 Aug 2020 19:38:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 0/9] r8a774e1 add support for DU, HDMI and LVDS
Message-ID: <20200812163855.GU6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patches.

On Wed, Aug 12, 2020 at 03:02:08PM +0100, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series adds support for DU, HDMI and LVDS to RZ/G2H SoC.

I have added patches 1/9, 2/9, 4/9, 5/9 and 7/9 to my tree. I expect
Geert to handle the rest.

> Lad Prabhakar (1):
>   arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU clocks
> 
> Marian-Cristian Rotariu (8):
>   dt-bindings: display: renesas,du: Document r8a774e1 bindings
>   drm: rcar-du: Add support for R8A774E1 SoC
>   arm64: dts: renesas: r8a774e1: Populate DU device node
>   dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
>   dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
>   arm64: dts: renesas: r8a774e1: Populate HDMI encoder node
>   drm: rcar-du: lvds: Add support for R8A774E1 SoC
>   arm64: dts: renesas: r8a774e1: Add LVDS device node
> 
>  .../display/bridge/renesas,dw-hdmi.txt        |  1 +
>  .../bindings/display/bridge/renesas,lvds.txt  |  1 +
>  .../bindings/display/renesas,du.txt           |  2 +
>  .../dts/renesas/r8a774e1-hihope-rzg2h.dts     | 11 ++++
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 61 ++++++++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 30 +++++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
>  7 files changed, 104 insertions(+), 3 deletions(-)

-- 
Regards,

Laurent Pinchart
