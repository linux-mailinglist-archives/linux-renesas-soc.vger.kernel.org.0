Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CC725AA4C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Sep 2020 13:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgIBLaN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Sep 2020 07:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgIBL3o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Sep 2020 07:29:44 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE1AC061244
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2020 04:29:42 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so4830406wrl.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2020 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DRdg4lDZzKfGv+sVCvvFW5qNZj4PdeMoeoXDHIqu9+Q=;
        b=Vtbq+LTVNo68gOj/uCEqTpS7m6mQ9vEi+Oonu3JkUaFWQ9sFxuUY0oNita+QhdKEL5
         NvqxqZIinPMbg28rNDfln5qP8DEyHOMTcITWgIfdwsGCfQl12VXtVGIHHEcizLslisaQ
         kAmuha4b0PUsQLgh31JP+Jnqa0nF0Iw4lmkTOedjHsVg4C+nkSm8W6+Z3ylNnJLu9usG
         6TjuI1igFN2Zh6fOnYMB5wzeMsSjgQPi5aU7QkdKniNN6FSZPHZinrU/L8UYGhSHetxb
         D/umW6TzVj87kCeCWqe8v5K4pxpm103n/fGF+VL+7Cr4r2PTH0VePzXEv77KJvSFMZd9
         NBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DRdg4lDZzKfGv+sVCvvFW5qNZj4PdeMoeoXDHIqu9+Q=;
        b=MZ6hYEIbMtOILfOjdUa8ZMYl+kugUIM/5To2FfCxjYlV//UsiG+uuQcDMuqnjXh1VU
         +sZlt6gokre/5Tf+LlPUopWSL9+WjYvTc6v+5GfF5Bb/lfILcRl960B6MFbt0gKGD9da
         hjJ9kVOeAjwUrmIwladxODGj0QYTsjwIE4JJobq54GJyJRHlgAuGyMqVBzY+TEHQUXB0
         iVHoIVZah6uRzDOtrYujqKjkE0cVMD6q59VNDGBEDdXRohlcF87JkJakVZYmK+6bqPnT
         pQqtu+Nhc4P/HKhUEVRQIlcMQnNY+LDyhYddD3aNQMeHXX88PkNaC2ge+nRa4dSPygLn
         luaQ==
X-Gm-Message-State: AOAM5322olSI6HTM8ZasayoYQylGVxDCz25PBqKmnILI1AZ11IBjo5UN
        r3lFaLaDTQwU1VzV2s6qkzQShA==
X-Google-Smtp-Source: ABdhPJxpR43l7DicQVi3TBCBkSijmT/uTZDoOFSaDV0lH6CI8svVBIKpdjWvqT0V1L0zUsnU9WARIw==
X-Received: by 2002:a5d:6404:: with SMTP id z4mr4585153wru.423.1599046180907;
        Wed, 02 Sep 2020 04:29:40 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id g143sm5858835wme.0.2020.09.02.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 04:29:40 -0700 (PDT)
Date:   Wed, 2 Sep 2020 12:29:37 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Rob Clark <robdclark@gmail.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Zheng Bin <zhengbin13@huawei.com>
Subject: Re: [PATCH v2 0/24] backlight: add init macros and accessors
Message-ID: <20200902112937.u6spv5rgjqcaiaex@holly.lan>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <CACRpkdaQ9bYrvVdBtz_7=juG175G+WRXbebfkt61tGqtGGoH5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaQ9bYrvVdBtz_7=juG175G+WRXbebfkt61tGqtGGoH5Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 28, 2020 at 11:40:28AM +0200, Linus Walleij wrote:
> On Sun, Aug 23, 2020 at 12:45 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > The first patch trims backlight_update_status() so it can be called with a NULL
> > backlight_device. Then the caller do not need to add this check just to avoid
> > a NULL reference.
> >
> > The backlight drivers uses several different patterns when registering
> > a backlight:
> >
> > - Register backlight and assign properties later
> > - Define a local backlight_properties variable and use memset
> > - Define a const backlight_properties and assign relevant properties
> >
> > On top of this there was differences in what members was assigned.
> >
> > To align how backlight drivers are initialized introduce following helper macros:
> > - DECLARE_BACKLIGHT_INIT_FIRMWARE()
> > - DECLARE_BACKLIGHT_INIT_PLATFORM()
> > - DECLARE_BACKLIGHT_INIT_RAW()
> >
> > The macros are introduced in patch 2.
> >
> > The backlight drivers used direct access to backlight_properties.
> > Encapsulate these in get/set access operations resulting in following benefits:
> > - The access methods can be called with a NULL pointer so logic around the
> >   access can be made simpler.
> > - The update_brightness and enable_brightness simplifies the users
> > - The code is in most cases more readable with the access operations.
> > - When everyone uses the access methods refactoring in the backlight core is simpler.
> >
> > The get/set operations are introduced in patch 3.
> >
> > The gpio backlight driver received a small overhaul in a set of three patches.
> > The result is a smaller and more readable driver.
> >
> > The remaining patches updates all backlight users in drivers/gpu/drm/*
> > With this patch set all of drivers/gpu/drm/:
> > - All backlight references to FB_BLANK* are gone from drm/*
> > - All direct references to backlight properties are gone
> > - All panel drivers uses the devm_ variant for registering backlight
> >   Daniel Vetter had some concerns with this for future updates,
> >   but we are aligned now and can update if refoctoring demands it
> > - All panel drivers uses the backlight support in drm_panel
> >
> > Individual patches are only sent to the people listed in the patch + a few more.
> > Please check https://lore.kernel.org/dri-devel/ for the full series.
> >
> > v2:
> >   - Documented BACKLIGHT_PROPS as it may be used by drivers
> >   - Dropped backlight_set_power_{on,off}, they were a mistake (Daniel)
> >   - Added backlight_update_brightness() and use it (Daniel)
> >   - Added backlight_enable_brightness() and use it
> >   - Moved remaining drm_panel driver to use backlight support in drm_panel
> >   - gpio backlight driver overhaul
> >
> > The patches are made on top of the for-backlight-next branch at
> > https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git
> > The branch needs v5.8-rc1 backported to build as dev_err_probe()
> > is used.
> >
> > The first 6 patches are candidates for the backlight tree.
> > If they are applied then this should preferably be to an immutable
> > branch we can merge to drm-misc-next where the drm patches shall go.
> >
> > The drm patches has known conflics and shall *not* be applied to the
> > backlight tree, they are included in this patchset to show how the
> > new functions are used.
> >
> > Diffstat for the drm bits alone looks nice:
> >  25 files changed, 243 insertions(+), 460 deletions(-)
> >
> > Feedback welcome!
> 
> Thank you for trying to make backlight easier for developers.
> I am a big supporter of this type of simplifications and
> generalizations, it is what makes DRM great.

+1!

I've reviewed and sent out patch by patch replies for the backlight
patches.

I've eyeballed the drm patches but not reviewed at same depth
and FWIW for all the patches whose subject *doesn't* start with
backlight then:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
