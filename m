Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FA31DA28B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 22:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgESUZh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 16:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgESUZh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 16:25:37 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9B1C08C5C0;
        Tue, 19 May 2020 13:25:37 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id j28so173588vkn.8;
        Tue, 19 May 2020 13:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cysi0CoNBsu9DhP/dMMLTlA0RNEElv2ZCbOSz0zvm1U=;
        b=uI4Z4CVhMiPZX6sByzDWE7ZFzcwaR+6wPM7HAlZLpc4hLaQ4012RvTFwesTownI+Bs
         j8kpFgg17yYeJhbuR+n9lnpXEr8tBTkj6xaVlmRt/vnllgXmZMEjSgfPTKetO2FaQWKV
         VpfnSqfteyu+lbYGOp0/zHd858vbvRHaXBwBj0zjkFWzpLd1kJUasVZITFtoF5ZCrWQM
         WWkmAvZbjeIvNQB/KpaTxpaJXWL8dLZnVrjus730ZRNma+mRrjL9fIc4Ch7v9O6ajCkz
         yf9hFXaO3YJoSejYY1qxdHiVuQc5W+IPxTYlsl+SjH65eJW13lwqZY7bAgRVnGWDjtf/
         5x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cysi0CoNBsu9DhP/dMMLTlA0RNEElv2ZCbOSz0zvm1U=;
        b=ab2+91xpj3nZ59SsWj4bmsxfBP/OHDP8F7+67ePZJG4zVUaQlBwlEeqDkIwW8VVv6F
         5Yo0O9ETTXqhldrWTkkR6oB8JVZegMU741iUwnEAXKR83PDEIYBaIOwBPaIeQz4rL3lL
         7x6ogRK5hpyyDZ1uTzz4e4VUeE4vhBsT+O6XqPBJWwtH4+X9RlcL8032JYnLwxebGju2
         RBWVLqJuYzSkk2vbTIymUjFPaEtcxEbcAiKxEFTU0IlrE1J/DGimuW5cHxTSKyjj3rA1
         nI2FwqEuvl0j/N3gObAENqyMF2Cpd9uR4+BLH7AnmXTB/pt6jK7OODMRSnBqYLJTs1+T
         NaZQ==
X-Gm-Message-State: AOAM532kwnDaqKJc4kI+oBGOnRjdhOJVZn07ZnLtJRVNfKV7rfzyZ1vM
        v395q+Z/wyMIC4DlHSYszZM8wLZms2SnpJfIPZ4=
X-Google-Smtp-Source: ABdhPJxzr/wYHStcp2W7Yr/aP7XG19XGEIQOjr8Kxa0FejuJCLcwi9VSK/A8W46CT4JeGy/ZYWZ/uyU4spAYVziWDD8=
X-Received: by 2002:a1f:bd96:: with SMTP id n144mr1516532vkf.6.1589919936532;
 Tue, 19 May 2020 13:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200518201646.48312-1-dagmcr@gmail.com>
In-Reply-To: <20200518201646.48312-1-dagmcr@gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Tue, 19 May 2020 21:22:42 +0100
Message-ID: <CACvgo50w90k18K8pEtiAv5foesEcJ9LuOyUzegY8Z9aidscwGw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix build error
To:     Daniel Gomez <dagmcr@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 May 2020 at 08:01, Daniel Gomez <dagmcr@gmail.com> wrote:
>
> Select DRM_KMS_HELPER dependency.
>
> Build error when DRM_KMS_HELPER is not selected:
>
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd48): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd50): undefined reference to `drm_atomic_helper_bridge_destroy_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd70): undefined reference to `drm_atomic_helper_bridge_reset'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xdc8): undefined reference to `drm_atomic_helper_connector_reset'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xde0): undefined reference to `drm_helper_probe_single_connector_modes'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe08): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe10): undefined reference to `drm_atomic_helper_connector_destroy_state'
>
> Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
Nicely spotted.
AFAICT the only way this ever worked is if people had
DRM_FBDEV_EMULATION, which is unset in your case.

Cc: <stable@vger.kernel.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

I suspect Laurent will pick this in due time.
-Emil
