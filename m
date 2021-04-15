Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB96360212
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 07:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhDOF45 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 01:56:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230204AbhDOF4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 01:56:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CE7161438;
        Thu, 15 Apr 2021 05:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618466193;
        bh=3fzthbp7nuGaPQSsU6zvqYA3EtaWh+VRhxhMhMglxdM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dMnupegfHy0DR72uTufXhuZye7H3L7plOsVcp9ZnYnL1NiZN15O3TnZ+mDIjaGXaM
         kE4V7+7Ss4T91maqR/TfI+6ehBfik0EGETXz2fG6Zow/CJuHz83YpjHj2vZ7wk4UP7
         vuEG5NNFZ0Qv7OFnt+RaHtWZK6hokFLkQcNETZ4rOCjLwxL1uOI7CWXLlLrzSZWHWS
         LWlxTUHlEEHgJUf6tQ4WAcQt78JztFGIjdJW1oiCZOLXLO5h7IqcHH+mHU+FO8aARu
         sNjQIyR3pqLCvVtwJ41gVSAiMG3RumNCgHzo6FroPtE0JYnuGnf2XEAjCIFI0t96Mm
         dMuz5X0pRd9QA==
Subject: Re: [PATCH] drm/bridge: Centralize error message when bridge attach
 fails
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jingoo Han <jingoohan1@gmail.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Stephen Boyd <swboyd@chromium.org>
References: <20210415014710.4033-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Tomi Valkeinen <tomba@kernel.org>
Message-ID: <0aafd2a9-d4e9-0684-f26d-a478f9e59105@kernel.org>
Date:   Thu, 15 Apr 2021 08:56:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415014710.4033-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15/04/2021 04:47, Laurent Pinchart wrote:
> Being informed of a failure to attach a bridge is useful, and many
> drivers prints an error message in that case. Move the message to
> drm_bridge_attach() to avoid code duplication.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  9 +--------
>   drivers/gpu/drm/bridge/analogix/anx7625.c          |  5 +----
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  1 -
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 10 +---------
>   drivers/gpu/drm/drm_bridge.c                       | 10 ++++++++++
>   drivers/gpu/drm/exynos/exynos_dp.c                 |  5 +----
>   drivers/gpu/drm/exynos/exynos_hdmi.c               |  5 +----
>   drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  9 +--------
>   drivers/gpu/drm/imx/dcss/dcss-kms.c                |  5 +----
>   drivers/gpu/drm/imx/imx-ldb.c                      |  4 +---
>   drivers/gpu/drm/imx/parallel-display.c             |  5 +----
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  4 +---
>   drivers/gpu/drm/kmb/kmb_dsi.c                      |  1 -
>   drivers/gpu/drm/mcde/mcde_dsi.c                    |  9 +--------
>   drivers/gpu/drm/mediatek/mtk_dpi.c                 |  4 +---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c                |  5 +----
>   drivers/gpu/drm/omapdrm/omap_drv.c                 |  6 +-----
>   drivers/gpu/drm/rockchip/rockchip_lvds.c           |  5 +----
>   drivers/gpu/drm/rockchip/rockchip_rgb.c            |  5 +----
>   drivers/gpu/drm/sti/sti_dvo.c                      |  4 +---
>   drivers/gpu/drm/sun4i/sun4i_lvds.c                 |  4 +---
>   drivers/gpu/drm/sun4i/sun4i_rgb.c                  |  4 +---
>   drivers/gpu/drm/tegra/rgb.c                        |  5 +----
>   drivers/gpu/drm/tidss/tidss_kms.c                  |  4 +---
>   drivers/gpu/drm/tilcdc/tilcdc_external.c           |  4 +---
>   drivers/gpu/drm/vc4/vc4_dsi.c                      |  4 +---
>   26 files changed, 33 insertions(+), 103 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

