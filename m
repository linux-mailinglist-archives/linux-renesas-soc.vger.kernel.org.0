Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEE810F1C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 21:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfLBUwF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 15:52:05 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:38961 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfLBUwF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 15:52:05 -0500
Received: by mail-io1-f68.google.com with SMTP id c16so997187ioh.6;
        Mon, 02 Dec 2019 12:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yKoJSkDsfIMrRW3jw85HKe2BQZ9NViBue+DgpdqXPJk=;
        b=jn5nPOdzEW+w5jzVGwuZ5oFeYEJf8WBlojzcbzo0FpQpz8lU3xlwetOymXe33RV0vU
         rZIUB8uzWSed5dAOZ1mQV8JCVBog+b8KG4/DzRaXJXK6jqkoWbOhqSlwP5HgyP7tpA1F
         sZOxbnADrE1RzNLnPdosncLvIUYhSNdiY5DzW7oxY59mP20Eg/u0Prwm4gBh32Q/n4J9
         GV8x5s3ajEkkySKLDzpqU3t0idoZb/hk/zqyucuqOWZLmopIcohvyGZ0mCdu/5Fjm4V6
         91n5ODv3rGa/fc60puo1AB0cc1S+Tf15xJgp0UInowtD9CGErLbGPkAFEeLQiB55Jmxs
         HKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKoJSkDsfIMrRW3jw85HKe2BQZ9NViBue+DgpdqXPJk=;
        b=AmquD3I4bvJbCR5Va332FrKtDiV//Ww56MuwU/LF1jUeBwR9yc92K5mfyQASUGlZVq
         ++NhBTuygW6XIYbz1zvi9dsk3DncvBTtbvPncOtJoKm5xGAsaMtMda71gaOmPVMCWPcI
         3HPIwFTE5km3ej6LBrKIYX0UBecQy2n/bG1dl5X5VTCgUv6FCHtVenp8U2mc1xw7yo60
         B+flhekH2HhqA/mfrafYdk+gHUwcd1AWvkV+GjspjD6DbARB7oHNHlfL1b53qxBvcnEx
         QTPUi+HuCHEGj6NqiuZdyub6/jV1ee3TSl3Nkazdy8COd2DdoQMSIk09gZLE+q1xGh9c
         eBng==
X-Gm-Message-State: APjAAAWp7HgjrATtvIfmTZrJQ6KAa8FHCkxPeZFGrZvoAL6R7hMhHbhv
        H0YAa1nVhdcZuUa71LDT2nfHP7nAi6EM+CrtHvQ=
X-Google-Smtp-Source: APXvYqzWJF+0Ki7M75FXoNw5UEUbhPWmgMVsemvAdnlzFn4gnf/vkOuGYX8u/xhrshBT2ODP7R8nZZfzmzkVwC/iQMQ=
X-Received: by 2002:a6b:5914:: with SMTP id n20mr744400iob.42.1575319924442;
 Mon, 02 Dec 2019 12:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <CAOCk7NoKPoxcETLYQ4CyAtYGnPwvYapdSavZM=aRdswDydTLEA@mail.gmail.com>
 <20191202204802.GA23600@ravnborg.org>
In-Reply-To: <20191202204802.GA23600@ravnborg.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 2 Dec 2019 13:51:53 -0700
Message-ID: <CAOCk7NogV39X2QMabv1naso4r7T_EkdzajcbtoPzQnJQ5T7WoQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Purism Kernel Team <kernel@puri.sm>,
        linux-renesas-soc@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 2, 2019 at 1:48 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jeffrey.
>
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   2 +-
> >
> > How come the diff stat in the cover letter here indicates a change to
> > this file, yet I cannot find a change to this file in any of the
> > patches?  What am I missing?
>
> This file is patched in "[PATCH v1 06/26] drm/panel: decouple connector
> from drm_panel"
>
> See: https://lists.freedesktop.org/archives/dri-devel/2019-December/247186.html
>
> The above patch touches a lot of files/drivers so it was cc: to
> a lot of people. Maybe is was considered as spam?

Interesting.  I missed that I didn't have patch 6 in the series in my
inbox.  Its also not in my spam box.  I wonder where it went.

Thanks for the direct link to the patch.  I saw no concerns.
