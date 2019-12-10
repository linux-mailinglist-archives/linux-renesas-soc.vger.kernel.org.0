Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01DAA11990E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2019 22:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLJVmW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Dec 2019 16:42:22 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35190 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729898AbfLJVeB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Dec 2019 16:34:01 -0500
Received: by mail-lj1-f193.google.com with SMTP id j6so21604522lja.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2019 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sfwPNW+0w7SYOVN5vzqnBaCzSrm1enkZiO9HCQzgqjc=;
        b=ELDYffyPwLTppPAGsVU3YxNSQOLOcATsg+IC8f7KpshW1lI8HVOS/LPhBAsT3ufSID
         fT8v7xNJc4kv0wTGrieBMQqsRE05FMAqAlQlWeqPYjlA6ow0ox6lVlQeD3a0gHQCNpvO
         UQuarskxChn5qju4s1+DdsIwkp9B7GHuVeF6VYnrRLMyisteUJaHFhFjU/S8KbDGs+wP
         PxqBkBxPJ4ttyp+Sef34gOKwQPC9beuKUBnoGOn5XjUWMEO9A2EEJEl1u9PnSr5O44Lx
         VMiuT+azPKHva2915rPrbzbWb1+RwsYjjYQJPUWnIZz+Df5kMzfE10XKxc8RFFUbhxa5
         icmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sfwPNW+0w7SYOVN5vzqnBaCzSrm1enkZiO9HCQzgqjc=;
        b=ALnvx7uQIgut7EecdGxT4ATASsm6CbGuLUXpP8PEig8+GLXKNdsq+SxI/IzPSMIivU
         9wE4pIsJXIo1zB9NGrNSbwbf/JHnppobaDkLS59lQuSVPBxs0u0bbmeAEbsT1FwbjhPg
         2TmFehnFO2sJM4hOf8aqqGgfhZCLF+tpIqVjThWwKuFvWMl6M3IncILlq7uzDJAKxuFq
         0N4sQILc76NI1H4f5dFhgB6ovU6gNzz81qpFSLPaLv68t9h+nn4z6uBlhLOnEkGkPYVf
         SN2ljAqYjh2WrFQGaCHINMArwMNkqU5dFw2Rkyek1VC6JhKR65YdAwwB5jHpTRY++26+
         CfNA==
X-Gm-Message-State: APjAAAUw2zV6jxCFCk8DYHRaLU0hBaEVwL6+hBumHgiB3bAR2tT/slJj
        m+MvEU3bU8UPnDT+CQ5LeRiKZJDIX0YZOHEntGyMcQ==
X-Google-Smtp-Source: APXvYqxlNtTXCGGpW9eRPgRQxUIXYH1CqIcL6wpo3KqsA4rHt7y1htGJhYXnIDuRbtBsJbNT4EJP7YmxbMU5QzD97u0=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr21298405ljh.42.1576013639357;
 Tue, 10 Dec 2019 13:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan> <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
 <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
In-Reply-To: <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Dec 2019 22:33:48 +0100
Message-ID: <CACRpkdZ7jg7JwNk12m9pGXOVBxHRta8nBWmpdqFvfQHB=8LptA@mail.gmail.com>
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

On Wed, Dec 4, 2019 at 9:16 AM Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Dec 03, 2019 at 04:20:24PM +0100, Linus Walleij wrote:

> > On the DSI displays in video mode there is also this EOL area
> > which seems to be where the logic is normally just idling for a
> > while, that can be adjusted on some hardware as well, but
> > I don't quite understand it admittedly. Sometimes I wonder if
> > anyone really understands DSI... :/
>
> I'm not aware of any EOL area in MIPI-DSI that would make the hardware
> idle, don't you mean LP-11?

I think in the spec the bubble used for this is tagged "BLLP"
Blanking-Line-Low-Power or something.

IIUC it is possible for displays to either receive continuous NULL
packets or blanking packets or go to LP mode in this area.

And since that is not there for e.g. DPI displays I feel it adds
another layer of confusion to timings.

Yours,
Linus Walleij
