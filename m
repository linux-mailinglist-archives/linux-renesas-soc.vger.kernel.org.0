Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529CF1AE3C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 19:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbgDQRYc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 13:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728088AbgDQRYc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 13:24:32 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9742C061A0F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2020 10:14:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id u13so3939913wrp.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2020 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SedhEjANQErpwU77RpqCFpguAIDMZbPe2/zGk7oJ1uE=;
        b=ZvkkLCyLbItWJ+r8xwdr0TIdfARZWvC6KCFlwZzze9dBY8bOQfP/SrCP87ujgmmRZK
         EtJEh2IrbkYF4isZPTuQNK1ECWqK1S0/f69O2eXEqLNgEiiqgKjCVKuT1hegksyBITI3
         LX0kGHgWiSyKwpsRmhmnc26WVVb8IUIgeZc9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SedhEjANQErpwU77RpqCFpguAIDMZbPe2/zGk7oJ1uE=;
        b=cYztxfnI+I3NkgdDppTxDORzZsRm+2tbXdnsXWAeDwRRj5sbgbEykGOhzB+f1yubPh
         1lzPuT6wdU+ZQgRS0GZMMaXyfXZBxo6TPYtiKuNRARrn03IYGe3nscFc8/jvTln9Hr06
         dFwPxwHVEM2cRrfWo6g8ERSCVrtZosGU00JbQPnVe7UxQnWTEIOM1JvVWlBkS9Jo63cR
         Z6KeX2AUmcWZ+HERJDmNbhdSMiJyvHs4RM1HmbSNdU396R5nxEsZMWDXRaVikAX7P8xg
         U8oMVqTB67grQx8PjZ22aWG2KzCp7+PCNI+70DJPS2BKJT/28erpM9QMwyAqdsc+qws1
         Nhcw==
X-Gm-Message-State: AGi0PuZ4MhasijT5JbYjtXsPs6aPfCLVLIQSUxS24T8iKlQln54YHtRz
        JTzA5VvxbSjWYMEalEbGOxouBg==
X-Google-Smtp-Source: APiQypL2gS2a9dwMkf4Ijkq+tJDqXlCksrQZL+nL7t7odPzjDuw6TG9icwc5UUeeP/E3vPoVbkhjzQ==
X-Received: by 2002:adf:aa9d:: with SMTP id h29mr5031902wrc.356.1587143696366;
        Fri, 17 Apr 2020 10:14:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a205sm8371357wmh.29.2020.04.17.10.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:14:55 -0700 (PDT)
Date:   Fri, 17 Apr 2020 19:14:53 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     dri-devel@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-fbdev@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Saeed Mahameed <saeedm@mellanox.com>, masahiroy@kernel.org,
        Laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@zonque.org, haojian.zhuang@gmail.com,
        robert.jarzmik@free.fr, daniel@ffwll.ch, marex@denx.de,
        stefan@agner.ch, linux-graphics-maintainer@vmware.com,
        thellstrom@vmware.com, jfrederich@gmail.com, dsd@laptop.org,
        geert@linux-m68k.org
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
Message-ID: <20200417171453.GS3456981@phenom.ffwll.local>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
> I tried to fix up some dependencies after the sii8620 "imply EXTCON"
> statementn broke, trying a few things but in the backing out a
> change that would completely reverse the LEDS_CLASS selects into
> a 'depends on'. 
> 
> However, what I got now are multiple changes that remove gratious
> "selects" that lead to circular dependencies for sii8620 and others:
> 
> - Anything doing "select FB" is now gone, or becomes "depends on FB",
> 
> - DDC support depends on I2C instead of selecting it
> 
> - backlight class device support is never selected by framebuffer
>   drivers but has proper dependencies
> 
> I have done thousands of randconfig build tests on this, but no
> runtime tests.
> 
> Some of the 'depends on FOO || !FOO' statements could be simplified
> into a new 'uses FOO' syntax based on a patch from Saeed Mahameed,
> but I would for the moment treat that as a cleanup that can be done
> later.
> 
> If we can agree on these changes, maybe someone can merge them
> through the drm-misc tree.
> 
> Please review

Biggest concern I have is that usability of make menuconfig is horrible,
and it's very hard to find options that are hidden by depends on. You can
use the search interface, if you happen to know the option.

Once you've surmounted that bar, the next one is trying to find what
exactly you need to enable. Which again means endless of recursive
screaming at Kconfig files, since make menuconfig doesn't help you at all.

That's pretty much why we've never pushed this in, and instead done the
selects. I'm vary applying all this, since after after there'll be all the
screaming again and we have to back it out.

I think to embrace this without regrets what we need is:
- some way to list the hidden options
- some way to browse the depedencies of those hidden options

menuconfig cant do that, gconfig I cant build here (it's some old gtk2
thing, where do you even get the deps for that). xconfig also cant do
this easily, dependencies aren't linked.

So yeah not sure this is a good idea at all, until at least menuconfig can
cope.
-Daniel

> 
>        Arnd
> 
> Arnd Bergmann (8):
>   fbdev: w100fb: clean up mach-pxa compile-time dependency
>   fbdev/ARM: pxa: avoid selecting CONFIG_FB
>   fbdev: rework FB_DDC dependencies
>   drm/rcar: stop using 'imply' for dependencies
>   drm/vmwgfx: make framebuffer support optional
>   drm: decouple from CONFIG_FB
>   fbdev: rework backlight dependencies
>   drm/bridge/sii8620: fix extcon dependency
> 
>  arch/arm/configs/pxa_defconfig      |  3 ++
>  arch/arm/mach-pxa/Kconfig           |  7 ---
>  arch/arm/mach-pxa/eseries.c         | 14 +----
>  arch/arm/mach-pxa/saar.c            |  2 +-
>  arch/arm/mach-pxa/tavorevb.c        |  2 +-
>  drivers/auxdisplay/Kconfig          |  1 +
>  drivers/gpu/drm/Kconfig             |  5 +-
>  drivers/gpu/drm/bridge/Kconfig      |  2 +-
>  drivers/gpu/drm/mxsfb/Kconfig       |  1 -
>  drivers/gpu/drm/rcar-du/Kconfig     | 23 +++++---
>  drivers/gpu/drm/vmwgfx/Kconfig      | 17 +++---
>  drivers/gpu/drm/vmwgfx/Makefile     |  4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 35 +++++++-----
>  drivers/gpu/drm/zte/Kconfig         |  1 -
>  drivers/macintosh/Kconfig           |  1 +
>  drivers/staging/fbtft/Kconfig       |  1 +
>  drivers/staging/olpc_dcon/Kconfig   |  2 +-
>  drivers/video/fbdev/Kconfig         | 31 ++++++++---
>  drivers/video/fbdev/w100fb.c        | 84 +++++------------------------
>  include/video/w100fb.h              |  6 +--
>  20 files changed, 101 insertions(+), 141 deletions(-)
> 
> -- 
> 2.26.0
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Nicolas Pitre <nico@fluxnic.net>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Saeed Mahameed <saeedm@mellanox.com>
> Cc: <masahiroy@kernel.org>
> Cc: <Laurent.pinchart@ideasonboard.com>
> Cc: <linux-renesas-soc@vger.kernel.org>,
> Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
> Cc: <kieran.bingham+renesas@ideasonboard.com>,
> Cc: <airlied@linux.ie>
> Cc: daniel@zonque.org
> Cc: haojian.zhuang@gmail.com
> Cc: robert.jarzmik@free.fr
> Cc: daniel@ffwll.ch
> Cc: marex@denx.de
> Cc: stefan@agner.ch
> Cc: linux-graphics-maintainer@vmware.com
> Cc: thellstrom@vmware.com
> Cc: jfrederich@gmail.com
> Cc: dsd@laptop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: geert@linux-m68k.org

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
