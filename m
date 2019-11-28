Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B78610C498
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2019 08:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfK1H40 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Nov 2019 02:56:26 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40286 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfK1H40 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Nov 2019 02:56:26 -0500
Received: by mail-ot1-f67.google.com with SMTP id m15so21495833otq.7;
        Wed, 27 Nov 2019 23:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o3hCFZ6+p7EcgiW/0t4v3r/wkobHJ7w7wfnwP0j/QsY=;
        b=oFOuDCf2DUITMvlZdmvI0Dt0LDxmt7sY5Auey8e+wkABYGATVCM74L79XbF9R9gyj+
         njFrpiUB2ZDF1cL26lSAhJFD13Zl8+vDp8WqDPUYqN0P8Q4+wO4veaEH239ZPoZ/tx8k
         BbAtU1X4hJwqOhWfC5TypkFE8IJV9EGcEbHLybNmS7jdPsa0g1TmLMqQxPvmhfmLqVeA
         khpbYuftCRBWJK7b5GAVlI0qnlV6doCxCZFYDnp4/MuAKLB7MBRn8IvMOlyJMNRxFPc6
         EwSbsDYfRKUe6I30zKijDZbM+i2s+Z0/4qDmE7wnOVdl4yA3IWUaYCT1zW3kC4Qe1ZnF
         bc1Q==
X-Gm-Message-State: APjAAAWhoESBL8JdtBRJNeaeN2Ojj0UI/2dSUefqjBbgAzoabZSgsQ4M
        aZu2v9k+yZn+UoQH7uVzxxn6GQMQYnD6W1hvvT69mA==
X-Google-Smtp-Source: APXvYqwqkh/+m7CvwkKLpgmQVtVdyb2UFLRo1oNsNbjJ4rhfL6gGn9lIs/GN0Fr5g34/udViAXGDfuOsZi8Slv5+ukw=
X-Received: by 2002:a9d:5d10:: with SMTP id b16mr1438412oti.250.1574927785474;
 Wed, 27 Nov 2019 23:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org> <20191113100556.15616-4-jacopo+renesas@jmondi.org>
In-Reply-To: <20191113100556.15616-4-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Nov 2019 08:56:14 +0100
Message-ID: <CAMuHMdWS2bv=RhQ3y5gNzZFT6CeH-a+h7xc6KYvcv0Anht6zGw@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] drm: rcar-du: Add support for CMM
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Wed, Nov 13, 2019 at 11:04 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add a driver for the R-Car Display Unit Color Correction Module.
> In most of Gen3 SoCs, each DU output channel is provided with a CMM unit
> to perform image enhancement and color correction.
>
> Add support for CMM through a driver that supports configuration of
> the 1-dimensional LUT table. More advanced CMM features will be
> implemented on top of this initial one.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -5,6 +5,7 @@ config DRM_RCAR_DU
>         depends on ARM || ARM64
>         depends on ARCH_RENESAS || COMPILE_TEST
>         imply DRM_RCAR_LVDS
> +       imply DRM_RCAR_CMM
>         select DRM_KMS_HELPER
>         select DRM_KMS_CMA_HELPER
>         select DRM_GEM_CMA_HELPER
> @@ -13,6 +14,13 @@ config DRM_RCAR_DU
>           Choose this option if you have an R-Car chipset.
>           If M is selected the module will be called rcar-du-drm.
>
> +config DRM_RCAR_CMM
> +       tristate "R-Car DU Color Management Module (CMM) Support"
> +       depends on DRM && OF
> +       depends on DRM_RCAR_DU

DRM_RCAR_DU already depends on DRM && OF, so the line above
can be removed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
