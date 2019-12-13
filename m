Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C2211E4AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 14:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfLMNbI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 08:31:08 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40700 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727296AbfLMNbI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 08:31:08 -0500
Received: by mail-lj1-f193.google.com with SMTP id s22so2637022ljs.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2019 05:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HrvoDck5eY5GK0w6K4AhLmPPIWL1Xrc1xH4Up/JEjjk=;
        b=Cbhnm/ox1I54nuH9njXHzccQrQot6KLJxrMb3XxyvsplUdUL3Q5Rul7FpZFaw6qIui
         KYp2hTrI1d6g+6A/dt3EeK/jyydFWmrzksF0s5cf6LxX401J1UfovmCKuRKzXFovXU5C
         QsI8OLd61zJoOK06uURda9yi4bsvTHAi28Tnrv3Y2WUQG8yz9MVsYlfxzXPwO2QT9YRG
         RsAyEYz1F5CKeLy89t5OQs+1Sn+GSZS1npqdvVHKIH8gmwGE2/La+4ljJz3l0hoayrrz
         IPjK34H/OTvJKUlP1UABm4Vzd9dvTCGe00klnysMonCEbsx3CWRH5rIYuP+ptTWBx8JB
         NZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HrvoDck5eY5GK0w6K4AhLmPPIWL1Xrc1xH4Up/JEjjk=;
        b=n5tpGYfixcl+vIeuPiNK9R72ohJdfUM0iJ1Pv7MVdox2rG8vDCxs5zcgFxAct/0RSu
         PfvviIJ0epxdetPzRiWHsMfpUyTIyWxP0p+5QvFUHPEIixzGPb2pZpmp+74nCc9Uw18y
         3ItqBxlb8kONHgWtKu2awRyIL/sSB/JkOfNAPgKSSsATj7DivnBXTMTAUoSXNTufBHrx
         ZPRpb029u4nzYATNgx6udTbKbIY5Ooqlq0AVPRGSOU9bVk74h1Y+PJdYpuD1+gMa7WCB
         2AaJ9QAV6Nspj5xjmYJGpuBcff6nvudZeh19g2yosCDYtvg/8QZZ2L8rJcGLaCcx7hyO
         M7YQ==
X-Gm-Message-State: APjAAAW5cBdd4kxku1kLFx6lpE+V5GEaPeRvO6PI5DE6mt2RQW645k+t
        vjYAAx6tgLhm9/seb1I1nwK1Dt1NKx1vlkEtuzb0Ug==
X-Google-Smtp-Source: APXvYqwMLtHFJLKb/OsUbyLvQlBeLa8EouQdhXkxY6ssHTmFd/qwkZ2hUZ7P2vEvqVVUtgkdycvnaAaf3SbpBeZBuMg=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr9207930ljh.42.1576243865608;
 Fri, 13 Dec 2019 05:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20191207140353.23967-1-sam@ravnborg.org> <20191207140353.23967-3-sam@ravnborg.org>
In-Reply-To: <20191207140353.23967-3-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 14:30:54 +0100
Message-ID: <CACRpkdaVYeJme0O8CW-heTmf3-0EHowFwcOAyy3jx13gjfj4zA@mail.gmail.com>
Subject: Re: [PATCH v2 02/25] drm/panel: add backlight support
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
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Dec 7, 2019 at 3:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Panels often supports backlight as specified in a device tree.
> Update the drm_panel infrastructure to support this to
> simplify the drivers.
>
> With this the panel driver just needs to add the following to the
> probe() function:
>
>     err = drm_panel_of_backlight(panel);
>     if (err)
>             return err;
>
> Then drm_panel will handle all the rest.
>
> There is one caveat with the backlight support.
> If drm_panel_(enable|disable) are called multiple times
> in row then backlight_(enable|disable) will be called multiple times.
>
> The above will happen when a panel drivers unconditionally
> calls drm_panel_disable() in their shutdown() function,
> whan the panel is already disabled and then shutdown() is called.
>
> Reading the backlight code it seems safe to call
> the backlight_(enable|disable) several times.
>
> v3:

v3 looks good to me +/- Laurent's comments:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
