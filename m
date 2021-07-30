Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1998F3DB85F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 14:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238698AbhG3MLJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 08:11:09 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:35396 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhG3MLJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 08:11:09 -0400
Received: by mail-ua1-f43.google.com with SMTP id d6so3902651uav.2;
        Fri, 30 Jul 2021 05:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d1AP8LPdt5gLRcNBYwMWgjeQ1bzCQMAmgWKrYpeBe5c=;
        b=UfxTxMXQK7WuExWzdCOv+fELfr0/9t5//TG9O4L25q+0zV+nWOqtlro0jWy11IJZ5A
         VruVnie8oYKnb68TBpsil+kH38ZzHHWw+WCpdxh55AFY32DCHq4z21xZC7cXC+CeJPGl
         3txjAqDDcy2MfE770p7nvaNcpNLtpvgQKNI5UDdQGxCQ8dGfbH2C/6XFyJV1AOYVm1Qu
         lhalp8EhDxXcliVce2DtYjNtRE0ms0YVPEGgRoTZQ9B8Xn/IRgKuhv/U0EFsm0u4W120
         nDL/6xaNZ1tffpgmX0dB6eICX3xpFLNu/7aP3BOjawDUvLAPPvf1khFG/Ibo4/0ZNnDZ
         JAxg==
X-Gm-Message-State: AOAM5334GB2EcI3HrTFEfYCHXUG0nJR1IUNHP6eGpcQ1b49Jn2RzQqpZ
        bZc9FHyBgpzYCKxe5UhZJ039R9T57RYkpCmgNxM=
X-Google-Smtp-Source: ABdhPJyJIDGhorRsiTqEzT0ML14O7jJqLNtZ9KfHFwW349DtL2Ol7UsTGiP4f+Vce5YzoGm5XXEPffA4L4axFg+WdnE=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr1321715uam.106.1627647063191;
 Fri, 30 Jul 2021 05:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com> <20210728153736.15240-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210728153736.15240-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Jul 2021 14:10:52 +0200
Message-ID: <CAMuHMdWGf2rh2qF3WapeRcTo6nPfs06oLUq7aX+2d_g=6275uA@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/imx/dcss: Enable COMPILE_TEST on all ARM64 platforms
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Jul 28, 2021 at 5:37 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> To extend test coverage, relax the dependency on ARCH_MXC to also enable
> compilation when COMPILE_TEST is selected.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/imx/dcss/Kconfig
> +++ b/drivers/gpu/drm/imx/dcss/Kconfig
> @@ -3,7 +3,8 @@ config DRM_IMX_DCSS
>         select IMX_IRQSTEER
>         select DRM_KMS_CMA_HELPER
>         select VIDEOMODE_HELPERS
> -       depends on DRM && ARCH_MXC && ARM64
> +       depends on DRM
> +       depends on ARM64 && (ARCH_MXC || COMPILE_TEST)

As you now have two depends statements, I think this would be easier
to read by maintaining a strict separation between "hard" and "soft"
dependencies:

    depends on DRM && ARM64
    depends on ARCH_MXC || COMPILE_TEST

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
