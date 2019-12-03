Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0003F11010F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 16:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfLCPUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 10:20:38 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38589 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfLCPUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 10:20:38 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so4275321ljh.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2019 07:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m3zQ0bKSvISFi+1fBMi3jNVJYg+1MoT8ThtuF+2ovSQ=;
        b=AWHhNjjjjGYoZzrFZIUydXTE8P04GoVEj/nkxXov5Xl+m6KVTmezfYzIS189Xbp2d9
         AoBT8kGo9Ilce7YjmHJ3BR2nLuZhHz+3UDJ/UUeou1iPTqwGwNddK1xb8tuMlXbwtqUv
         IvCc9hkMqkDp2pZ1+fqZfUoFvFdi6r9t/BjcweQbftCQDIBBsX3LPi/p1NolQb2re4oG
         PcRRUdNQdc96SBz0HlnkEujZ0AHARIftTj2fcd6E527NVp6lJFODir0h6yiz4ltMi1q/
         ex1vgLswTSItO9QwCbjS0LEF/qs2+n2yDsn1fJAg1JwWMO95Ffh1DJlmg/hRr4/s9Iog
         mqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m3zQ0bKSvISFi+1fBMi3jNVJYg+1MoT8ThtuF+2ovSQ=;
        b=D+p9P3Qd1B0sOv4i2WsfaDa74DAKmCzr1HmJK34gzYST/lMMo1JsOhvTcc+CctHeX/
         gnsX8dhe6McdRGXmPI/pX7x22SB+y9NHSz1VnCP89VCNHjYrMbcwBq9BMLBdhwwESo/V
         9ZPos9ue/mg8XbLFzW4hIr0cZ9ehZmCs0R0a6zM5k1S68mnkGR+os/TXDc9zZKtkYeIY
         bj4Ij4k8lb1Q5j87IWp7iz8DefkP4FAFKcmrvLJOA8yLkd/COyM6259uVuSsIVhZEwQk
         O/3JytFv/ELMVQlLCpyEehxmYaqLHQ/l6Na6/Oavgzoi/7tg7HDxkYQ+LJ5MOAFek6Pq
         DgOQ==
X-Gm-Message-State: APjAAAVDj5KVEARJwFzXoKk9MJMAtKf5RAEJh/loBL2rREGVCVEbAB2R
        KGC+2u+Ba9Doi4Ahb3SCxTq4hBeEWzlzPx8TDfb5MQ==
X-Google-Smtp-Source: APXvYqzeswPvfb4bN8LEsJSRL/PyxST5l5bJCtG71jQQSWLOGmPl2rs5haGp6u2c8kSn123mUXgOro1vUhgVEbncNNQ=
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr2954959ljk.77.1575386436713;
 Tue, 03 Dec 2019 07:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
In-Reply-To: <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Dec 2019 16:20:24 +0100
Message-ID: <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
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

Hi Maxime,

On Tue, Dec 3, 2019 at 8:47 AM Maxime Ripard <mripard@kernel.org> wrote:

> Using only the mode as we do currently has a bunch of shortcomings as
> almost no encoder will be able to provide the typical pixel clock, and
> that situation leads to multiple things:
>
>   - If someone working on one encoder wants to upstream a panel they
>     have tested, chances are this will not be the typical pixel clock
>     / timings being used but rather the one that will match what that
>     SoC is capable of. Trouble comes when a second user comes in with
>     a different encoder and different capabilities, and then we have a
>     maintainance fight over which timing is the true timing (with a
>     significant chance that none of them are).
>
>   - If we can't match the pixel clock, we currently have no easy way
>     to make the usual measures of reducing / growing the porches and
>     blankings areas to match the pixel clock we can provide, since we
>     don't have an easy way to get the tolerance on those timings for a
>     given panel. There's some ad hoc solutions on some drivers (I
>     think vc4 has that?) to ignore the panel and just play around with
>     the timings, but I think this should be generalised.

I've been confused with these things as they look today and it seems
the whole struct drm_display_mode could need some improvement?

If .clock is supposed to be htotal * vtotal * vrefresh, what is the
.clock doing there anyway.

Sadly I am too inexperienced to realize where the tolerances should
be stated, but I guess just stating that hsync_start etc are typical,
then specify some tolerance for each would help a bit?

On the DSI displays in video mode there is also this EOL area
which seems to be where the logic is normally just idling for a
while, that can be adjusted on some hardware as well, but
I don't quite understand it admittedly. Sometimes I wonder if
anyone really understands DSI... :/

Yours,
Linus Walleij
