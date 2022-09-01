Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D815A9616
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 13:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiIALyz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 07:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbiIALyy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 07:54:54 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA0F10C7
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Sep 2022 04:54:51 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id fy31so33742666ejc.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2022 04:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7ku7vR7HRNgBC+9TdlBkQp34+lUKYAH7n6Kb36qLREg=;
        b=mFg/401Il4EWtSKxLHLFaMntDzh3V/kCkipAWgIdX5r5y+IpMeAgamZcOeCpWR9JAG
         20gvy8kn6Fx5QFhhWx02eL/xWl7XbJGcVqpqKUhFO+r4mzU/wQcxGprpuFTjdZ4kGKM0
         tuNfeIK2/VazUrAOYZC+dO6WGui2J8WqmorDBqyHqNCBC0BiJmtYmuqhZWaK6fSXyY+y
         blMQn85wmZC2aveQaxo9iLSBNUiN7fsCp75liTSpkpEPmm2D7bir4vXLKR2Z8k6xQgXf
         OG+ekiOORCIMLIvyl2jLXhiVBz7mliKSbmEp1AdlVLCKEkTWfcF4XFxPH8qSglz7lS6y
         yHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7ku7vR7HRNgBC+9TdlBkQp34+lUKYAH7n6Kb36qLREg=;
        b=vQtA/UUhzoKfKW0HC3sfQpcBCR7JAVW2Ywmanrk9Xr7GRsBJYej98YquHUQJzVBLM4
         dmVCiKcwncIiJrWcACfNIm2hXb2NW6DpCQto9xy5WEVmP+boPnpfn9dIfhIKqNGXDp/T
         HwxZ+7d/TcoX5EksdfQQJ2L1kYQ3PiuQcBDQyddMmFKOBvc68iz7+l5XWqLVzimYzK5k
         XO6rV5RpsXiB+c8v8Zylro1cxXEPJDnrAt0OKTqJtrcX1ut4FylGoPJtGnPSEJUeK1iC
         u0FHz7UL2kKAj00WHvDegq89sKEIo+KVDlQRm7GPFVq1hSJI/dXWJad9yL8laa61eXZ+
         NzSg==
X-Gm-Message-State: ACgBeo2p0Cq8DrBsDb8Moz9oBfIeUboqMFWoyhcOJUFmobL4dt5TMpFG
        etrD2KBPgIScrQVCFX/m+E0bTdS25cIRjCGhYJ0zQQ==
X-Google-Smtp-Source: AA6agR7wDik4CQise327pDeJlSfRwkRjJnhYhNOYWSu1XYgxyFCA3Jot/9HirJteZ2P5zLLPnDvENBe/YCm2zVWZnoE=
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id
 xc3-20020a170907074300b00740ef932ffcmr19687953ejb.514.1662033290331; Thu, 01
 Sep 2022 04:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com> <20220831082653.20449-2-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220831082653.20449-2-tomi.valkeinen@ideasonboard.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 1 Sep 2022 13:54:39 +0200
Message-ID: <CAG3jFyt0xh4S629WfTa-dy=TsaL-K9R0Gaw_Djrwhrsktrw2_Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm/bridge: ti-sn65dsi86: Reject modes with too
 large blanking
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 31 Aug 2022 at 10:27, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> The front and back porch registers are 8 bits, and pulse width registers
> are 15 bits, so reject any modes with larger periods.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 90bbabde1595..09d3c65fa2ba 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -747,6 +747,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>         if (mode->clock > 594000)
>                 return MODE_CLOCK_HIGH;
>
> +       /*
> +        * The front and back porch registers are 8 bits, and pulse width
> +        * registers are 15 bits, so reject any modes with larger periods.
> +        */
> +
> +       if ((mode->hsync_start - mode->hdisplay) > 0xff)
> +               return MODE_HBLANK_WIDE;
> +
> +       if ((mode->vsync_start - mode->vdisplay) > 0xff)
> +               return MODE_VBLANK_WIDE;
> +
> +       if ((mode->hsync_end - mode->hsync_start) > 0x7fff)
> +               return MODE_HSYNC_WIDE;
> +
> +       if ((mode->vsync_end - mode->vsync_start) > 0x7fff)
> +               return MODE_VSYNC_WIDE;
> +
> +       if ((mode->htotal - mode->hsync_end) > 0xff)
> +               return MODE_HBLANK_WIDE;
> +
> +       if ((mode->vtotal - mode->vsync_end) > 0xff)
> +               return MODE_VBLANK_WIDE;
> +
>         return MODE_OK;
>  }
>
> --
> 2.34.1
>


Reviewed-by: Robert Foss <robert.foss@linaro.org>
