Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDCE010FE9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 14:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfLCNXE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 08:23:04 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40829 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfLCNXD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 08:23:03 -0500
Received: by mail-lf1-f67.google.com with SMTP id y5so2938750lfy.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2019 05:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lefF5BM/gcR+So8Ygs7RCzWIIBhGl0bonM5D7lIAz2M=;
        b=ZwcHFup3L1FGPGk2xtvdRZFPmqpjl+1VvQLCjzq0rimrVIVqaG32x7PCDfBwRBdhIo
         wfFVMCzt/nwBpmmu726MfJIBszKsNjFvMWKcURMFeYoJFnyFPvGbWfNUAkjmA0arprAH
         xxbwDWIJo9nDwD2K3RFDnub+OayDe800qVEItuex48rNok6smlLWT62Pp3P8wxG/YbWQ
         q5dde7mJTd61eoUyIeQ0PMpdo8DxM6TZOnmuYEYlu4eIbFMQ/aYRNjWF4Qj24lP7V1JO
         X4rGteLiKCtTpowk5xUuEB1HkwUeJ5Mr5SgOtJornUUaf2Dz/nR/O6sc39dTBk+hVW6X
         1kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lefF5BM/gcR+So8Ygs7RCzWIIBhGl0bonM5D7lIAz2M=;
        b=YRzZcnz18DCK1fWVwu1ryzVBgavUrwhLjoIvwxMnL79gQmH/CzBF0Acoc9NTru1WsF
         EE50qxa430Av6UgpwYVB4pxu9Q6FAQrqHdrLApR5JoOJuBN8y8HW2JlICEd4446RfA5E
         Wi4PCEV3s+ciHv4PFCS+4vg81d1oqVjFk0RaROhf8Az2rO8jANDA+QVPFPpq2eLE3Yul
         k7oK7WA561MVvaydeL1P3gSoCFNq7I8CfDzUqvLZUxbI/KVGGUnYI3yQGAW4R0bAz5Qk
         9iJwdsw+AAfiPot43/DhB6H3HnYw6mvfgrl2wq2i+QVTda7YuobzNvocxyqJ02TWMUgo
         3lVA==
X-Gm-Message-State: APjAAAUs65JJykpVop1GXIN4m4CnNuE+zyQ1RPGaPNWQwtSJr7F1/ZGZ
        dgqozHnstH+fphfoee3luMMrilGmyvjwHq1KVwzH6Q==
X-Google-Smtp-Source: APXvYqx22ebZnmuYdNzG9TrFSZg4isgk95/zsKEGLemAt431mQBCED4F4+fJ5lhPiKhrPXI40LsyMbi9cYOMTmUUeRQ=
X-Received: by 2002:ac2:5083:: with SMTP id f3mr1970416lfm.135.1575379381560;
 Tue, 03 Dec 2019 05:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-5-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-5-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Dec 2019 14:22:50 +0100
Message-ID: <CACRpkdYT8u2Liq60xtTWeLc2q-R16XWtE1YstGp2WTgM2Cc6CA@mail.gmail.com>
Subject: Re: [PATCH v1 04/26] drm: get drm_bridge_panel connector via helper
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
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Eric Anholt <eric@anholt.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 2, 2019 at 8:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> The drm_connector created by drm_panel_bridge was accessed
> via drm_panel.connector.
> Avoid the detour around drm_panel by providing a simple get method.
> This avoids direct access to the connector field in drm_panel in
> the two users.
>
> Update pl111 and tve200 to use the new helper.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

With the little issues found by Laurent fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
