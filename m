Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31551B0396
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 10:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgDTIAN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 04:00:13 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:38778 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgDTIAM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 04:00:12 -0400
Received: by mail-oo1-f65.google.com with SMTP id i9so1926346ool.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2020 01:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L9g4AhkR3JwqVlvWzeZ5xr0LO3a2RpWbbv6vUZyv4P8=;
        b=JxJaDuVM6SXnazLhkhnpDNxv17wylAaH1YzbhD0WHgedshSRFUm81AIH0fbR9wDvzP
         q7IubtNx8sqDBY+iDvGXZKraf/2OcNB2je4TIBmwd/8X18rFoiPQS888+EggoU3uNu7X
         MBaEEzni0GxJIk4t0NjmUA3Zh171A31M0+3ncGguti7EKwZwA7V7H+rJS9prngRwIXZc
         h2hap/gNQMnrC+SJNKcTzlbsucNEqLDU8VIEL3sKw+eFx1A6F1A4YWPDL88ppf7Iv8Yq
         XAc80GxqjgIqqoyzk7WZ0k1aG1yxD/x6IPk+YDqGwtaS3A+FDOmZEmJAfbbl3rztQJP+
         tT5g==
X-Gm-Message-State: AGi0PuYGchxZPYS5djUPYsCVvJFnxCLPj07OyqWsH5arS63vsE5jj0oH
        j02clT37S/MV8fgKLMsmQ3sE7HI6N7tlDf+6Ttw=
X-Google-Smtp-Source: APiQypJ7ZmuO7XxEHm2YprX8BbvP5Mh+b0yixyzgiEjnieh/jH/MF3PTui1Uv25flfuAKmypj7f5vO+ha+5Lon7wJ3g=
X-Received: by 2002:a4a:e8db:: with SMTP id h27mr3930938ooe.40.1587369612407;
 Mon, 20 Apr 2020 01:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200415124923.2510-1-geert+renesas@glider.be>
In-Reply-To: <20200415124923.2510-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Apr 2020 10:00:00 +0200
Message-ID: <CAMuHMdXLu2C1qM7kkhc20jhKF3RZaj2YA9mh4H4jRRjp6vWe=A@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh for v5.7-rc1
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 15, 2020 at 2:49 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Update the defconfig for Renesas ARM boards:
>   - Enable CONFIG_DRM_DISPLAY_CONNECTOR (for HDMI, VGA, and composite
>     display connectors on various R-Car H1, Gen2, and RZ/G1 boards,
>     since commit 0c275c30176b2e78 ("drm/bridge: Add bridge driver for
>     display connectors")),
>   - Disable CONFIG_VIRTIO_MENU and CONFIG_VHOST_MENU (should not default
>     to yes).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v5.8.

> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig

> @@ -170,6 +171,8 @@ CONFIG_RTC_DRV_DA9063=y
>  CONFIG_DMADEVICES=y
>  CONFIG_RCAR_DMAC=y
>  CONFIG_RENESAS_USB_DMAC=y
> +# CONFIG_VIRTIO_MENU is not set
> +# CONFIG_VHOST_MENU is not set
>  CONFIG_STAGING=y
>  CONFIG_STAGING_BOARD=y
>  # CONFIG_IOMMU_SUPPORT is not set

I'm dropping this hunk, as it does not affect code generation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
