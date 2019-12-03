Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF2210FEB8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 14:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfLCNZT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 08:25:19 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44519 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLCNZT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 08:25:19 -0500
Received: by mail-lf1-f68.google.com with SMTP id v201so2904651lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2019 05:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9a1hL+PexI1M8Jq7K439+8ni7/mVSuwFTy8tepPE5ag=;
        b=xvis201gXI3TiO7rQvoI1mKBfSgzASqAd5iNB/gKNTcG/vn4Yqzhacn1uV/53tfqU8
         kD2NRTag5a/3oe4AJYonE/5qZUY9d/e3gtDw1PcpmJ/wbepHuPFpAO2vAYkoiRl+EaUf
         eNzFxpDgdSJ7gWNidrFThpe2xiov+axfIBro+R28+EWkRF0w07eNS6dozJjhFBRBpmMt
         usXLfgmME3MTm5zAC5CIERmWX1iAN+xefTx1Q2ApRqbMrUAp3Ylf9AiZA9HwCUstvsYg
         6tssUWKZp25YEHHE3kRX0wSoNqFps0sLQNBE4276+BCka+7PILtOjKGV7mxPqc5LGtcR
         hgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9a1hL+PexI1M8Jq7K439+8ni7/mVSuwFTy8tepPE5ag=;
        b=lTi/SSUGPpqFuDKTQZSHLQuC3FBY4QXAq06MgxEpqqDvRJGfnEqeLLRMX5ocfhukVH
         KqJLh1OUnS+Ivjk8Qi+lEVnjHss621Y63/LCddHV/FPKcVSn6lnsKw+9H5ZDBFyWLQ1b
         nXYrDk5zlvMDg9/fFd4uO8Lpfi2atZsEm5XTQfuPamY2dDB+JFKpw+g6KEIOb50R5CJ5
         tene8vZ5AeAR50lyir4yy4f6gwa3MUDzz4TzGQruGqonb6BvxPC71VGfBur8ppuOTahP
         nooVJ7ZCpetFKTrWWvzhK2pA+B8kB3fEpXk9NESxWWG5j1evgRFHw8VrJv/iIiixtTRf
         S30w==
X-Gm-Message-State: APjAAAVio8oPTu/KwvcKQpWsONZYdA6K8jV4TUnAlnJfuPMnkDZdEdy2
        GYPQIHEa0m3FYuf1ul1KMbltQf3dy0XxnGEeA8i3Rw==
X-Google-Smtp-Source: APXvYqxTXADDPAMH7cAkcCdHzl2vjK+aV5Roq/rNhp0U0HmtoXe1KfDsidebtQJoYG7+XHWaVda6PVL/JLS+4QQ0S+k=
X-Received: by 2002:a19:7611:: with SMTP id c17mr2569127lff.86.1575379516980;
 Tue, 03 Dec 2019 05:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-6-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-6-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Dec 2019 14:25:04 +0100
Message-ID: <CACRpkdb9c__FUBWE6j6g9uFwYRE6CrX8gu2gbHZ-xPpZ+YkF6Q@mail.gmail.com>
Subject: Re: [PATCH v1 05/26] drm/panel: add drm_connector argument to get_modes()
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 2, 2019 at 8:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Today the bridge creates the drm_connector, but that is planned
> to be moved to the display drivers.
> To facilitate this, update drm_panel_funcs.get_modes() to
> take drm_connector as an argument.
> All panel drivers implementing get_modes() are updated.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Stefan Mavrodiev <stefan@olimex.com>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: "Guido G=C3=BCnther" <agx@sigxcpu.org>
> Cc: Purism Kernel Team <kernel@puri.sm>

This looks reasonable to me.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
