Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83FEE123A93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 00:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfLQXNk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 18:13:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfLQXNk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 18:13:40 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30CFF9BF;
        Wed, 18 Dec 2019 00:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576624417;
        bh=loGlm2GALdXkOP7aBKcUxaV4CZCsrT/O78e9GgH3Fbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m74aC3VpDStlxe4k7vlEhV8fmJzy7FKpyxdq71JexpbnciQhui4m2BiVDxmN30UiT
         Igf/piW79jze0Z/hcNWc0zmZm4VmLF5B0u9JFGw3FO8bhCVU4/JLNpbCQTVvqeTHEl
         P/LIgmJjRHryaX1dldKgyLGNOGMudqcASE7+Rs2c=
Date:   Wed, 18 Dec 2019 01:13:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v6 0/6] Add dual-LVDS panel support to EK874
Message-ID: <20191217231326.GG4874@pendragon.ideasonboard.com>
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Dec 17, 2019 at 01:45:55PM +0000, Fabrizio Castro wrote:
> Dear All,
> 
> this series adds support for dual-LVDS panel IDK-2121WR
> from Advantech:
> https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> 
> V6 reworks patch "drm: rcar-du: lvds: Allow for even and odd pixels swap",
> and rebases the series on top of patch:
> https://patchwork.kernel.org/patch/11295991/

I've taken patch 1/6 to 4/6 in my tree. I expect Geert to take 6/6. For
5/6, I'll give Rob a chance to review the patch. Sam, could you handle
it afterwards ?

> Fabrizio Castro (6):
>   drm: of: Add drm_of_lvds_get_dual_link_pixel_order
>   drm: rcar-du: lvds: Improve identification of panels
>   drm: rcar-du: lvds: Get dual link configuration from DT
>   drm: rcar-du: lvds: Allow for even and odd pixels swap
>   dt-bindings: display: Add idk-2121wr binding
>   arm64: dts: renesas: Add EK874 board with idk-2121wr display support
> 
>  .../display/panel/advantech,idk-2121wr.yaml        | 128 +++++++++++++++
>  arch/arm64/boot/dts/renesas/Makefile               |   3 +-
>  .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 +++++++++++++
>  drivers/gpu/drm/drm_of.c                           | 116 +++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                | 180 ++++++++++++---------
>  include/drm/drm_of.h                               |  20 +++
>  6 files changed, 483 insertions(+), 80 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

-- 
Regards,

Laurent Pinchart
