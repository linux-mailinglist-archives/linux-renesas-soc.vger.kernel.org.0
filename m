Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9EB10FEC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 14:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfLCN1s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 08:27:48 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38538 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfLCN1s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 08:27:48 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so2957729lfm.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2019 05:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w5kvvsNqTWUYowCw16IbU3x1YCmaOiYf5tGr6DU/4Oo=;
        b=Kf2TrLzoeW7GPO93jICax9H7npFli7nKkPrAa/7pensbMPErLdSyO5cAPXKjgJ5SwW
         dQrNoMOKIZ0oZKLp96BDVuif4EmGi5MgCrhh0N20691gPfYKiIWpucl1bpxPv8HyWwEO
         sV/o0T5vo3zUWjf4mn/5JFm4iQ9eVy7Qwu71lDN9Y0jhqghCBoOVDyB/uDoKZVeoM5qE
         lirCwRmMcZeJCvVkm4a8hz6Ijs6Aw/lR6XRBXo/Au/eoIX7M/1cljIRGuyDeppCzGaRX
         SiP6V0C53L9KztUCT76fN77bWsENOXX1T2+wgpTdxmhUZRMwMYpW+0PGCrTHVh2H+JbJ
         2ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w5kvvsNqTWUYowCw16IbU3x1YCmaOiYf5tGr6DU/4Oo=;
        b=AFN65yEZb1SZN2KZhZ271WHct35xBD1zFz8Ei0IE/5iB736oWMQ5FBN0tMtK/mzMg7
         a291ynrhifS34XBLyeymjBJecrx7pnG3HYeaA2Cx37pPGRx2Pe1FNmoRU7gKSrQ3wk3J
         hBpyVcWIbMT1lkcTr+NA36bQ3C/OleIGYWpvF0Sfxz4CvMRuDJZiy6x97mKkOvATCvW5
         jmmdd1BvfgVQIysb/vPwMcQVUYNMCCT5Y+IgkmKjvPYicg0z+NG7u3b7NTcH7VroWtfr
         c1uDwS4Ap3byXRT5J9UwEIajwI5HqVxnVQB+a4hjQLTkejHobn0oQYkF9Iwdnq0IS63h
         3BXw==
X-Gm-Message-State: APjAAAXuWw5J7ygJEobem4lsg8g0pNmJhU8wY3ruK6T9O6CB38VdmYvt
        siTDxpfknM3o+u64YsFBIY6+hZm2LezFIOMKYYrz5Q==
X-Google-Smtp-Source: APXvYqyofMBPFWLLzB1STopamPLWqp8a6SLsme2LKB0JzU+G9blqUgnpYL5l6F2TBybbdU6uzjI0Yo9WQ+oH5mP/T40=
X-Received: by 2002:a19:f701:: with SMTP id z1mr2657953lfe.133.1575379666036;
 Tue, 03 Dec 2019 05:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-9-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-9-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Dec 2019 14:27:34 +0100
Message-ID: <CACRpkdbiyVcUDrxuCK_wgsB6Vn+XZptsc9H3zB0cXxjeOtw+Ug@mail.gmail.com>
Subject: Re: [PATCH v1 08/26] drm/panel: drop drm_device from drm_panel
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

> The panel drivers used drm_panel.drm for two purposes:
> 1) Argument to drm_mode_duplicate()
> 2) drm->dev was used in error messages
>
> The first usage is replaced with drm_connector.dev
> - drm_connector is already connected to a drm_device
>   and we have a valid connector
>
> The second usage is replaced with drm_panel.dev
> - this makes drivers more consistent in their dev argument
>   used for dev_err() and friends
>
> With these replacements there are no more uses of drm_panel.drm,
> so it is removed from struct drm_panel.
> With this change drm_panel_attach() and drm_panel_detach()
> no logner has any use as they are empty functions.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
