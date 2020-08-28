Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511232557E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 11:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgH1Jkm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 05:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbgH1Jkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 05:40:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6F4C061264
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2020 02:40:41 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t6so570374ljk.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2020 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUip6H2+jjLmhsYJSfGTRg7Ifd0FUyC3bIqJ6snuBqc=;
        b=ZK+v2bmQLBjTkyTKleZ4cfX+TpXVVDGN80D4Cqhya1JdXh0uk4uzMDHh2YlIQSpubL
         Z10w4VCoiKA/QgWuuZ5KY2SSF/NdAfsZ8Z7nPX9LBb/JyULoZ5s1U1uF9CiBp4+Wkz87
         UVyBls0s8KH5oRJgVt7FdhME4Vx55DOD4UbsTASNmspQx/J3yK4b0UHT8fabcBfERM7O
         66e2Tt7LkEfbLu/tG5Z8CwjGrynpQGPYK1M6cFDHBJI9/2UsJ6JIxk2cLkqBUoKGZpo3
         HRM3wL3Z+XZD/kWUuGbHjv9zynSMwTgAPsurI1JevBX9DJAIZHRJewlsm5WQYkde7sIN
         Jojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUip6H2+jjLmhsYJSfGTRg7Ifd0FUyC3bIqJ6snuBqc=;
        b=HVz04zz0mEI0H+tQUYJX96wiRsb1HmgZjOePskm03MoZwMy2a2vunps/JRc3YUI1wB
         f3XOi8VfxyhXCKkAgcnZUBzSC79zkGQcJvrK75QaryXBomYm8zrN5tHbEC5hizqgOcud
         8VeU3dTNF6xYZssrsSdFz/NeTHCDDYHxHfvmQQn6eF+j7QLA087AyE936YaZi3sEH1iX
         N7XCumQiOLzfL6alVlyO/jmwFQT7g2fNibSp/KtCEXZz6YV5EkKyflbZhBiyxcHvo0NT
         Q3jzSEnzJbyYBbQ9O8urXpUlz7XE7zAX6zVFeaL9x4/JWjZYX6VdqKSR+El9q5JFM4al
         +yWg==
X-Gm-Message-State: AOAM532dmGsOMCNu2GJg8NOlmqdNNTpsQ7xJvLiHCbD1qW+Bd3t91ccR
        OGRr39BeGO1FnxLV+iFAH2+qJGnGmDcZUXAN7+Wn6w==
X-Google-Smtp-Source: ABdhPJyobFr8wlwoGMVpjT4BBlaiB53c0xbtwloUtEybXVxTnB6o94g4sI9w40AbLQ+tg744duwQYVnD0klCkIcxAA4=
X-Received: by 2002:a2e:9dd0:: with SMTP id x16mr472930ljj.144.1598607638931;
 Fri, 28 Aug 2020 02:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200823104532.1024798-1-sam@ravnborg.org>
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 11:40:28 +0200
Message-ID: <CACRpkdaQ9bYrvVdBtz_7=juG175G+WRXbebfkt61tGqtGGoH5Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/24] backlight: add init macros and accessors
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans de Goede <hdegoede@redhat.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Jyri Sarha <jsarha@ti.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Rob Clark <robdclark@gmail.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Zheng Bin <zhengbin13@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 23, 2020 at 12:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> The first patch trims backlight_update_status() so it can be called with a NULL
> backlight_device. Then the caller do not need to add this check just to avoid
> a NULL reference.
>
> The backlight drivers uses several different patterns when registering
> a backlight:
>
> - Register backlight and assign properties later
> - Define a local backlight_properties variable and use memset
> - Define a const backlight_properties and assign relevant properties
>
> On top of this there was differences in what members was assigned.
>
> To align how backlight drivers are initialized introduce following helper macros:
> - DECLARE_BACKLIGHT_INIT_FIRMWARE()
> - DECLARE_BACKLIGHT_INIT_PLATFORM()
> - DECLARE_BACKLIGHT_INIT_RAW()
>
> The macros are introduced in patch 2.
>
> The backlight drivers used direct access to backlight_properties.
> Encapsulate these in get/set access operations resulting in following benefits:
> - The access methods can be called with a NULL pointer so logic around the
>   access can be made simpler.
> - The update_brightness and enable_brightness simplifies the users
> - The code is in most cases more readable with the access operations.
> - When everyone uses the access methods refactoring in the backlight core is simpler.
>
> The get/set operations are introduced in patch 3.
>
> The gpio backlight driver received a small overhaul in a set of three patches.
> The result is a smaller and more readable driver.
>
> The remaining patches updates all backlight users in drivers/gpu/drm/*
> With this patch set all of drivers/gpu/drm/:
> - All backlight references to FB_BLANK* are gone from drm/*
> - All direct references to backlight properties are gone
> - All panel drivers uses the devm_ variant for registering backlight
>   Daniel Vetter had some concerns with this for future updates,
>   but we are aligned now and can update if refoctoring demands it
> - All panel drivers uses the backlight support in drm_panel
>
> Individual patches are only sent to the people listed in the patch + a few more.
> Please check https://lore.kernel.org/dri-devel/ for the full series.
>
> v2:
>   - Documented BACKLIGHT_PROPS as it may be used by drivers
>   - Dropped backlight_set_power_{on,off}, they were a mistake (Daniel)
>   - Added backlight_update_brightness() and use it (Daniel)
>   - Added backlight_enable_brightness() and use it
>   - Moved remaining drm_panel driver to use backlight support in drm_panel
>   - gpio backlight driver overhaul
>
> The patches are made on top of the for-backlight-next branch at
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git
> The branch needs v5.8-rc1 backported to build as dev_err_probe()
> is used.
>
> The first 6 patches are candidates for the backlight tree.
> If they are applied then this should preferably be to an immutable
> branch we can merge to drm-misc-next where the drm patches shall go.
>
> The drm patches has known conflics and shall *not* be applied to the
> backlight tree, they are included in this patchset to show how the
> new functions are used.
>
> Diffstat for the drm bits alone looks nice:
>  25 files changed, 243 insertions(+), 460 deletions(-)
>
> Feedback welcome!

Thank you for trying to make backlight easier for developers.
I am a big supporter of this type of simplifications and
generalizations, it is what makes DRM great.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
