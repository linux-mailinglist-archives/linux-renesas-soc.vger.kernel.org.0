Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1A23B18C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 13:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhFWL0D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 07:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhFWL0D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 07:26:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0996C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 04:23:45 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B5029AA;
        Wed, 23 Jun 2021 13:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624447423;
        bh=9eLbGKdS6PdjaA77NsUB7VY8FflATFbHmnc+zWnlMyI=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=D7UM+jxvPpsNOWXaZxqo+WE79Zi/QImH7cjINaHHl5QZBLA5h4kKLj0YVKn7JF4SS
         oY+sEP2avl1W4JWcHO3/CO3Bs2Zm+CzqdjwM8FX8/0KDhiuZUJRzd/rDNAWb+48l5Y
         EJbAH4xUI1HT+b1eY6Jkevqr5UPRag9XghnDx/Ek=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC PATCH 00/15] R-Car V3U: DSI encoder driver
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
Message-ID: <189c7a07-29cd-39f4-1dec-56aa94c11fba@ideasonboard.com>
Date:   Wed, 23 Jun 2021 12:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

These all look fine to me independently, so for the set:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

and of course as I've been using them

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com

As you've seen, I've posted an update to simplify the DSI startup so
that it doesn't need to be called directly from the crtc, which also
removes the header addition change I had in this series ;-)

Squashing these down, I still see a few checkpatch issues, but I think
they can be tackled as part of squashing so they don't need discussing here.

--
Kieran


On 23/06/2021 04:46, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds a driver for the DSI encoder found in the R-Car
> V3U SoC, which is the first SoC in the family that supports DSI.
> 
> The driver is based on an implementation from the BSP written by Luu
> Hoai, taken as-is in patch 02/15. The subsequent patches are cleanups.
> I'm posting this version as an RFC to allow Luu to review the cleanups,
> if desired. I've thus restricted the audience to the linux-renesas-soc
> mailing list. The next, non-RFC version will squash all driver patches
> into one and will be posted to dri-devel.
> 
> There's one open question related to whether the DSI encoder clock needs
> to be controlled explicitly by the DU or not. Depending on the outcome
> of the tests, the driver could be further simplified.
> 
> Kieran Bingham (2):
>   drm: rcar-du: dsi: Use the correct compatible
>   drm: rcar-du: dsi: Include the DSI header
> 
> LUU HOAI (1):
>   drm: rcar-du: Add R-Car DSI driver
> 
> Laurent Pinchart (12):
>   dt-bindings: display: bridge: Add binding for R-Car MIPI DSI/CSI-2 TX
>   drm: rcar-du: dsi: Reorganize probe function
>   drm: rcar-du: dsi: Use dev_err_probe()
>   drm: rcar-du: dsi: Shorten mipi_dsi variable name to dsi
>   drm: rcar-du: dsi: Use dsi->dev consistently in probe()
>   drm: rcar-du: dsi: Get next bridge in probe()
>   drm: rcar-du: dsi: Simplify DT parsing
>   drm: rcar-du: dsi: Add error handling in rcar_mipi_dsi_clk_enable()
>   drm: rcar-du: dsi: Simplify error handling in rcar_mipi_dsi_enable()
>   drm: rcar-du: dsi: Turn container_of() wrappers to inline functions
>   drm: rcar-du: dsi: Various style and typo fixes
>   drm: rcar-du: dsi: Use read_poll_timeout()
> 
>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 +++
>  drivers/gpu/drm/rcar-du/Kconfig               |   6 +
>  drivers/gpu/drm/rcar-du/Makefile              |   1 +
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c       | 813 ++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h       |  26 +
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h  | 172 ++++
>  6 files changed, 1136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h
> 
