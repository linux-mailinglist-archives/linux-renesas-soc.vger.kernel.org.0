Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0CFF10FE88
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 14:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfLCNUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 08:20:38 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34725 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCNUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 08:20:38 -0500
Received: by mail-lj1-f194.google.com with SMTP id m6so3810517ljc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2019 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dM7DxIKsuRuWaeq1kSkAx5tZP4LQ1yRPP8TIc6mxOpk=;
        b=ZrU6IFrNs/v9Z2rJ1KSkzGUV8fZWcRdhMKoXG6DN0M3+iAn1ApiRmE3ZgJ94Uo+9wZ
         DzuzeCNox0Z3xZRWRhWq9NS7Kq69iqJ360qMic+xi3WSoWvVfcJIHPlubUEr1YqjPC6n
         SXn0dfovwrRDvRAR6nMb9zlsIw6BuH674zeFIB8i/F1/gIumJJ3bD7wOLIyyAD+Ch5OE
         m/5UDp46mghUjs7ZT/ryJZOV8cAlXyc2Lu2UOO2gh5yc7puCj66NVcdtTPnHrWtBY2u6
         W3zW+ts6HbCNkFX+sFqM/OCNNJVzIuEg+uhrXbWD/7147S61i6ovPikcw7eFS0ik9JEC
         sNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dM7DxIKsuRuWaeq1kSkAx5tZP4LQ1yRPP8TIc6mxOpk=;
        b=luipj+NUOnbol84AQhD1Wawb4FcFYlC1J4GZpxpEp5TcIi57Epjbkj6jmKRVm+wrx3
         c7zqXR8ue7b0Dr0pV3bn7ljsTMZbCledmxIkl4gDJubj1HE3Y6mmxE2U8uIAqtOpdg/Z
         lzK7YgMPgcIXz9XkIpgm1NMOfkHeUWPrGjW5ANe1n0HOo/r+kSjdSlBknSZOVus43apt
         TDnlzKqYC552U7I3edBFFHD8xCL+9JRFZ9707cF4AygwJIiVQiah/9XWLVYPnlDEJ3Pl
         JEbrAzBW0PlJQ4tBRSwHWSY6+USUqxk1gFpDNxPHU+iDk3/oZPMKtezeHa4EnhVZz/Qg
         uZKQ==
X-Gm-Message-State: APjAAAWttG8gtGH5haMs66YwJbuGB3nOj72WkVl3WWNGzcMWd2ywq0gj
        LJxbkBQxpHgSgIwHOMFUWqQEOVspsA/6E10zszBB5Q==
X-Google-Smtp-Source: APXvYqzTzhKdgwJ8WJIcY2A5WR+ez0+zwm8p5MUMtgC+M9HuNmXbczoLdnQOw0NdPlAjvpjtAI7gsHbZmOicQtBst1Q=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr2556134ljg.251.1575379236563;
 Tue, 03 Dec 2019 05:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-27-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-27-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Dec 2019 14:20:25 +0100
Message-ID: <CACRpkdZcLeJuOiPPa81qj17ifi3T0YxPq0zPP0oqNv-8pvzeKg@mail.gmail.com>
Subject: Re: [PATCH v1 26/26] drm/panel: tpo-tpg110: use drm_panel backlight support
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
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 2, 2019 at 8:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Use the backlight support in drm_panel to simplify the driver
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for cleaning all of this up!

Linus Walleij
