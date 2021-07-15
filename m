Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6F83C9C8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jul 2021 12:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236686AbhGOKTe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jul 2021 06:19:34 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:38767 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241243AbhGOKTc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 06:19:32 -0400
Received: by mail-ua1-f54.google.com with SMTP id g4so1872042uap.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jul 2021 03:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57u7P8v+u127RtK4lZDe0W51lZfZfemDqVdEqGuF7Vg=;
        b=WodNFhiMnksbpWc0CPPEeoNfH5/zdTe6uM7GzLpuxPku4UaOSICxwdoTMlJJwWAq1+
         nO8HgOi1k7UNJCWd42vyEme2xQyqXDMmgJ4U11ILOulohgxyoWjcPapf+zlonOJ2RwIn
         U2Vo+k4QMVt+PpLKhlL8QdC+jCJEw96whU1zPD6miruwfpX6N4Hd5Ndg/JxdweGBkRfk
         U+T/ia1ZfgU5jYCrYEauDVv8bmD7zEqTWGxBBKJoepFucbqMBpPPHQN2aPBxYIKYrX5W
         tDBuHzQW1ABzuv3wn7gbgluWkTjtSxctEHCbgYoKkOlGukLY1diwIKRaXArCy5JBjSRv
         ik9g==
X-Gm-Message-State: AOAM530GGIQfOpOPQmRIBtixFcHpN9UzGz5rqtnYp0Yn0DpHj5tPiXLD
        G0wIbKDAKlR7OH2/5Ry5jjlqx2upOaAZt7qR5T8=
X-Google-Smtp-Source: ABdhPJxjTV1yUegSkNBAVPxuxkmpSjdkXYvDWabQOQAYXTeQC3b3UTa4Z5nrk0TOCVB5wW0rcD0twd/Gd7cnAvejqaw=
X-Received: by 2002:ab0:2554:: with SMTP id l20mr5831250uan.58.1626344198292;
 Thu, 15 Jul 2021 03:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210715095729.6510-1-tzimmermann@suse.de>
In-Reply-To: <20210715095729.6510-1-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Jul 2021 12:16:27 +0200
Message-ID: <CAMuHMdU6Dxod3pGo3pCjRsXu0O5YTJWTcTFnAzg4F_8kD7bdxg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/shmobile: Convert to Linux IRQ interfaces
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

On Thu, Jul 15, 2021 at 11:57 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>
> v2:
>         * handle errors in platform_get_irq() (Geert, Sergei)
>         * store IRQ number in struct shmob_drm_device (Laurent)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the update!

> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -258,7 +256,15 @@ static int shmob_drm_probe(struct platform_device *pdev)
>                 goto err_modeset_cleanup;
>         }
>
> -       ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +       ret = platform_get_irq(pdev, 0);
> +       if (ret) {

if (ret < 0) {

> +               dev_err(&pdev->dev, "failed to get IRQ number\n");

platform_get_irq() already prints an error message, so no need to
repeat it.

> +               goto err_modeset_cleanup;
> +       }
> +       sdev->irq = ret;
> +
> +       ret = request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
> +                         ddev);
>         if (ret < 0) {
>                 dev_err(&pdev->dev, "failed to install IRQ handler\n");
>                 goto err_modeset_cleanup;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
