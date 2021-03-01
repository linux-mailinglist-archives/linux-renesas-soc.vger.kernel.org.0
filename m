Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4505A3288D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 18:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238446AbhCARpu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 12:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbhCARmb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 12:42:31 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F94C061794
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 09:41:38 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id lr13so29757700ejb.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Mar 2021 09:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=fmHYggjF6Jt5DNFcsFSXOplHqC900eWwjViJfxnrUOQ=;
        b=Ph1JJjuOqS4RxbqS5YT9VFHcNI4IsMz6yueacxoRJOBEhFCZmrQlo4o8hTpMGQg0g8
         yGfirBtjYWTm3xk6zvuiwfoOQigcl0HGdhkD+nmMAvEfzfgd5dLF83Og2lb1imAVxogv
         y4mNixTDxFJLhVO8tR+3vw0+RzC1RDcW/pYxE4QKHiFdKAyEoWaFxG2NMf+5gnPeuWst
         bHxUSUFHOmTB0v8nmtUQiSZJ4vk9G2nvuKdV54l8KbFHM1iiOABIWrG2cG04IMNDBMvp
         dETm8q8Ir5t+J6IDRu7GCrqLOC+ULWe9Tcxxuw0N9VNu9P2Ma9JZgR2SVhVZJsi3oLWp
         OB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=fmHYggjF6Jt5DNFcsFSXOplHqC900eWwjViJfxnrUOQ=;
        b=Fc9bpy4wBnYj/UXKNoJo7f/OmzdCk7Z0eta4Onw87Ryda7DE8DJYHVzepkb41/4oC7
         Tzvtk6l1nT+/RyHCRo3vvxm/pCaJQ5VZ2pOpJ7Bf/WMyYm1pE1tVHyw7c+dHeMxHqPb7
         IIqUmLF5/JiIUd1pTycXLjqbQubKx7UXTC3RU24OZsXB+ITv4k+SzzmWyUkihnwqNgjU
         WgEdUePwqMu8+fQgSI57xWQoL7vf0D9WqIrhcBm5DmPXjPc3DGuQx6USaPPS09Dgvh47
         5y7RS4Ep0jdueN/atZ6t1sfCMPotfLMHbABjJEvleiu5y0bElwAgOl7E71F0z+TjveFN
         0ibQ==
X-Gm-Message-State: AOAM533JTfz/1FjsTECxk9z9e3YIb0F14Bk3dGhM8XxjIrQddr3+ymEj
        ssG6+/2oRz0J0J0YoFiZRGBfDKmDNNzbDL9ddQnaPg==
X-Google-Smtp-Source: ABdhPJxoABcMaR5kEmZSB4acbSvWKHsyI5hA+pRpVuNgxn2ziEZdCLJsXUnLoSJMlehoTnOmuiGIuHuaGsNwmQBFxUQ=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr16916646eju.375.1614620497482;
 Mon, 01 Mar 2021 09:41:37 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 1 Mar 2021 23:11:26 +0530
Message-ID: <CA+G9fYvApAT=vx_XxhbMZ=rS8ShhYkSKa0JsHC8k0dFn5xwU=Q@mail.gmail.com>
Subject: rcar_du_kms.c:781:24: error: passing argument 1 of
 '__drmm_add_action' from incompatible pointer type
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Cc:     linux-stable <stable@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On stable rc 5.11 the x86_64 build failed due to below errors/warnings.

drivers/gpu/drm/rcar-du/rcar_du_kms.c: In function 'rcar_du_modeset_cleanup':
drivers/gpu/drm/rcar-du/rcar_du_kms.c:754:32: error: implicit
declaration of function 'to_rcar_du_device'; did you mean
'to_rtc_device'? [-Werror=implicit-function-declaration]
  struct rcar_du_device *rcdu = to_rcar_du_device(dev);
                                ^~~~~~~~~~~~~~~~~
                                to_rtc_device
drivers/gpu/drm/rcar-du/rcar_du_kms.c:754:32: warning: initialization
makes pointer from integer without a cast [-Wint-conversion]
In file included from drivers/gpu/drm/rcar-du/rcar_du_kms.c:17:0:
drivers/gpu/drm/rcar-du/rcar_du_kms.c: In function 'rcar_du_modeset_init':
drivers/gpu/drm/rcar-du/rcar_du_kms.c:781:24: error: passing argument
1 of '__drmm_add_action' from incompatible pointer type
[-Werror=incompatible-pointer-types]
  ret = drmm_add_action(&rcdu->ddev, rcar_du_modeset_cleanup, NULL);
                        ^
include/drm/drm_managed.h:25:20: note: in definition of macro 'drmm_add_action'
  __drmm_add_action(dev, action, data, #action)
                    ^~~
include/drm/drm_managed.h:27:18: note: expected 'struct drm_device *'
but argument is of type 'struct drm_device **'
 int __must_check __drmm_add_action(struct drm_device *dev,
                  ^~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Build link,
https://ci.linaro.org/job/openembedded-lkft-linux-stable-rc-5.11/DISTRO=lkft,MACHINE=ls2088ardb,label=docker-buster-lkft/8/consoleText

-- 
Linaro LKFT
https://lkft.linaro.org
