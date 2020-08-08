Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3258023F8D6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 22:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgHHU4A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Aug 2020 16:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHU4A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 16:56:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1846C061756;
        Sat,  8 Aug 2020 13:55:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4760F9;
        Sat,  8 Aug 2020 22:55:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596920156;
        bh=7AzBW6y7AohK848k4WmKInfvCXQ963jNC9GWH4yAtvo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gvVEBFS/9RlgkpwmVx4e22Eft0jGK4pKGXo5ziC06KmbGbbEc4SWuLFdyU14gDTeR
         fiLx1sIfp/mKBcu2fqvEHYxHbGnPR78OXnIlEFAe7Yg7/QD5+xO5B1uEIzoLqY23nA
         daRCBWP3hBNzIxJq1dIjpncO6uQAzdUvh3LyltcU=
Date:   Sat, 8 Aug 2020 23:55:43 +0300
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
Subject: Re: [PATCH 0/7] r8a7742: Enable DU and LVDS
Message-ID: <20200808205543.GL6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patches.

On Fri, Aug 07, 2020 at 06:49:47PM +0100, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series adds support for DU and LVDS to r8a7742
> SoC and enables LCD support on r8a7742-iwg21d-q7 board.
> 
> This patch series applies on top of [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
>     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10

The driver changes will need to go through the DRM/KMS tree, and I'd
recommend the DT binding changes to go the same route as well. I can
handle the rebase when applying, and once the bindings get accept, you
can ask Geert to upstream the last 3 patchs. Would that work for you ?

> Lad Prabhakar (7):
>   dt-bindings: display: renesas,du: Document the r8a7742 bindings
>   drm: rcar-du: Add r8a7742 support
>   dt-bindings: display: renesas,lvds: Document r8a7742 bindings
>   drm: rcar-du: lvds: Add r8a7742 support
>   ARM: dts: r8a7742: Add DU support
>   ARM: dts: r8a7742: Add LVDS support
>   ARM: dts: r8a7742-iwg21d-q7: Add LCD support
> 
>  .../bindings/display/bridge/renesas,lvds.txt  |  1 +
>  .../bindings/display/renesas,du.txt           |  2 +
>  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts       | 84 +++++++++++++++++
>  arch/arm/boot/dts/r8a7742.dtsi                | 89 +++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  5 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
>  6 files changed, 180 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart
