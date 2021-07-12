Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C193C5B90
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 13:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhGLLqP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 07:46:15 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:37704 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhGLLqP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 07:46:15 -0400
Received: by mail-vs1-f51.google.com with SMTP id bf5so2686066vsb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 04:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4gVdUzsvCBO+uy38/AuYXBfTD6da6FYmfmBT+VVRDgs=;
        b=fyOYNLslThHDGBt7SQsw1r35wRFUEAIorDEtsArxhL/6BJmUjr3ly9Myr6KI/m4LIW
         2TGH5Cq9eMg8WuAnE2s9zlQZJeqJpzO5pLCmMtxpBBVtRQau9ITR9tBl6KcRLNAtao9g
         0vOtbv2VhKaXLUjUFvtZt33sIu+fI5GDWsv6eHP3brA2InPv4P/kITdXZSuYNE2FQKZ4
         VBWaUF6z63e3BIxchdH3EjdFRpX5ayVuKj2VAbfxhcEKx4NaJzzjEW57OTEnADiybUav
         2cZb/wG6vpH2oDFSPVWuLcWnMP8OSzEcdKJtIxI8ardJL1+2fn9sjoyojtY1zWR2cIZJ
         fmBg==
X-Gm-Message-State: AOAM530OWzFmUqMt0pVDoGoOGf9F7U9Ww+1Ps8RRBFjXfXhieUZKW/LK
        aO9We1sSsUu3DYewwobEGGfLEfhGX7LkA59dC4Y=
X-Google-Smtp-Source: ABdhPJwJQAPTAIJQf4G2QW+cJxL5bTSdWGqIsTGkTTheH6TLEQ70SPVAYofFH6maGhMdK36QCwx17SkJ2OywBchdzEI=
X-Received: by 2002:a67:f98c:: with SMTP id b12mr47467736vsq.40.1626090207058;
 Mon, 12 Jul 2021 04:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210706074900.8928-1-tzimmermann@suse.de>
In-Reply-To: <20210706074900.8928-1-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jul 2021 13:43:15 +0200
Message-ID: <CAMuHMdUkq8dwhmdaV-MZM23T5XepAdDE4CFUs3Mk0LBQPpQpBA@mail.gmail.com>
Subject: Re: [PATCH] drm/shmobile: Convert to Linux IRQ interfaces
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

On Tue, Jul 6, 2021 at 9:49 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -258,7 +256,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>                 goto err_modeset_cleanup;
>         }
>
> -       ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +       ret = request_irq(platform_get_irq(pdev, 0), shmob_drm_irq, 0, ddev->driver->name, ddev);

platform_get_irq() can return a negative error code.
While drm_irq_install() took a signed irq parameter (and only
considered zero an error, oops), request_irq() takes an unsigned irq.
So you better check for errors before calling request_irq().

>         if (ret < 0) {
>                 dev_err(&pdev->dev, "failed to install IRQ handler\n");
>                 goto err_modeset_cleanup;
> @@ -275,7 +273,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>         return 0;
>
>  err_irq_uninstall:
> -       drm_irq_uninstall(ddev);
> +       free_irq(platform_get_irq(pdev, 0), ddev);

Similar issue here.

>  err_modeset_cleanup:
>         drm_kms_helper_poll_fini(ddev);
>  err_free_drm_dev:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
